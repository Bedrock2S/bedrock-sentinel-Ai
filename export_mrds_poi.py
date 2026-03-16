"""
export_mrds_poi.py

Strips MRDS_CO down to a clean POI layer for field use.
Keeps only prospector-relevant categories, exports as GeoJSON.

Usage:
    python export_mrds_poi.py --input MRDS_CO.gpkg --output mrds_poi.geojson

Requirements:
    pip install geopandas
"""

import argparse
import geopandas as gpd

# Categories worth keeping for a self-guided prospector.
# Everything else (Base Metals, Uranium, Industrial, Noise, Unclassified) is dropped.
KEEP_CATEGORIES = {
    "Tier 1 — High-Value Prospect",
    "Tier 1 — Active Mine",
    "Tier 2 — Past Producer",
    "Tier 3",                       # include if present in your data
    "Gemstone",
    "Tailings",
    "Critical Mineral",
}

# Only these fields survive into the output — name + category + geometry.
KEEP_FIELDS = ["name", "category"]


def export_poi(input_path: str, output_path: str, layer: str = None) -> None:
    print(f"Reading {input_path} ...")
    gdf = gpd.read_file(input_path, layer=layer) if layer else gpd.read_file(input_path)

    print(f"  Total features before filter: {len(gdf)}")

    # Filter to keeper categories only
    gdf = gdf[gdf["category"].isin(KEEP_CATEGORIES)].copy()
    print(f"  Features after category filter: {len(gdf)}")

    # Drop every field except the ones we need
    drop_cols = [c for c in gdf.columns if c not in KEEP_FIELDS + ["geometry"]]
    gdf = gdf.drop(columns=drop_cols)

    # Ensure WGS84 — required for GeoJSON spec and all mobile apps
    if gdf.crs and gdf.crs.to_epsg() != 4326:
        gdf = gdf.to_crs(epsg=4326)

    gdf.to_file(output_path, driver="GeoJSON")
    print(f"  Saved {len(gdf)} POIs → {output_path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Export MRDS_CO as a stripped POI GeoJSON.")
    parser.add_argument("--input",  required=True,  help="Path to source file (GeoPackage or Shapefile)")
    parser.add_argument("--output", required=True,  help="Output GeoJSON path")
    parser.add_argument("--layer",  default=None,   help="Layer name if input is a GeoPackage with multiple layers")
    args = parser.parse_args()

    export_poi(args.input, args.output, args.layer)
