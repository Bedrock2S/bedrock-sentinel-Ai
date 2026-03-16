"""
classify_mrds.py
----------------
Adds a 'category' field to MRDS_CO.gpkg classifying each deposit
into prospecting tiers based on commod1, dep_type, and dev_stat.

Usage:
    python classify_mrds.py

Requires: geopandas, fiona  (pip install geopandas fiona)
"""

import geopandas as gpd
import os

GPKG_PATH = os.path.expanduser(
    "~/Geospatial/03_Processed_Data/Mineral_Intelligence/"
    "System_Indicators/MRDS_CO.gpkg"
)
LAYER = "MRDS_CO"
OUT_FIELD = "category"


# ── helpers ──────────────────────────────────────────────────────────────────

def contains_any(text, keywords):
    """Case-insensitive substring match against a list of keywords."""
    if not text:
        return False
    t = text.lower()
    return any(k.lower() in t for k in keywords)


PRECIOUS   = ["Gold", "Silver"]
BASE       = ["Copper", "Lead", "Zinc", "Molybdenum"]
CRITICAL   = ["REE", "Beryllium", "Niobium", "Tantalum",
               "Lithium", "Vanadium", "Cobalt", "Tungsten"]
URANIUM_KW = ["Uranium"]
GEM_KW     = ["Gemstone"]
NOISE_KW   = ["Sand and Gravel", "Coal", "Clay",
               "Gypsum", "Bentonite", "Stone, Crushed",
               "Peat", "Diatomite", "Perlite"]

TAILINGS_DEP = ["tailings"]

ACTIVE_STAT    = {"Producer", "Plant"}
HIST_STAT      = {"Past Producer"}
PROSPECT_STAT  = {"Prospect", "Occurrence"}


def classify(row):
    commod  = str(row.get("commod1", "") or "")
    dep     = str(row.get("dep_type", "") or "")
    stat    = str(row.get("dev_stat", "") or "").strip()

    # ── Tier 5 — Tailings (check before anything else) ──────────────────────
    if contains_any(dep, TAILINGS_DEP):
        return "Tailings"

    # ── Noise — industrial only, no metallic value ───────────────────────────
    is_noise = contains_any(commod, NOISE_KW)
    has_metal = (contains_any(commod, PRECIOUS) or
                 contains_any(commod, BASE) or
                 contains_any(commod, CRITICAL) or
                 contains_any(commod, URANIUM_KW) or
                 contains_any(commod, GEM_KW))
    if is_noise and not has_metal:
        return "Industrial / Noise"

    # ── Tier 4 — Uranium ─────────────────────────────────────────────────────
    if contains_any(commod, URANIUM_KW):
        return "Uranium"

    # ── Tier 3 — Gemstone fields ─────────────────────────────────────────────
    if contains_any(commod, GEM_KW):
        return "Gemstone"

    # ── Tier 1 — High-value prospects / occurrences ──────────────────────────
    high_value = (contains_any(commod, PRECIOUS) or
                  contains_any(commod, CRITICAL))
    if high_value and stat in PROSPECT_STAT:
        return "Tier 1 — High-Value Prospect"

    # ── Tier 1b — Active precious / critical ─────────────────────────────────
    if high_value and stat in ACTIVE_STAT:
        return "Tier 1 — Active Mine"

    # ── Tier 2 — Historical precious / base metal mines ──────────────────────
    if stat in HIST_STAT and (contains_any(commod, PRECIOUS) or
                               contains_any(commod, BASE)):
        return "Tier 2 — Past Producer"

    # ── Base metals (active or prospect) ─────────────────────────────────────
    if contains_any(commod, BASE):
        if stat in PROSPECT_STAT:
            return "Base Metal Prospect"
        if stat in ACTIVE_STAT:
            return "Base Metal — Active"
        return "Base Metal — Other"

    # ── Critical minerals not already caught ─────────────────────────────────
    if contains_any(commod, CRITICAL):
        return "Critical Mineral"

    # ── Anything remaining with dev_stat data ────────────────────────────────
    if stat in PROSPECT_STAT:
        return "Prospect — Unclassified"
    if stat in HIST_STAT:
        return "Past Producer — Unclassified"
    if stat in ACTIVE_STAT:
        return "Active — Unclassified"

    return "Unclassified"


# ── main ─────────────────────────────────────────────────────────────────────

def main():
    print(f"Reading {GPKG_PATH} ...")
    gdf = gpd.read_file(GPKG_PATH, layer=LAYER)
    print(f"  {len(gdf):,} features loaded")

    gdf[OUT_FIELD] = gdf.apply(classify, axis=1)

    counts = gdf[OUT_FIELD].value_counts()
    print("\nCategory counts:")
    print(counts.to_string())

    print(f"\nWriting back to {GPKG_PATH} ...")
    gdf.to_file(GPKG_PATH, layer=LAYER, driver="GPKG")
    print("Done.")


if __name__ == "__main__":
    main()
