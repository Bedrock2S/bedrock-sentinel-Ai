"""
trim_mrds.py

Filters MRDS_CO.gpkg down to prospector-relevant categories.
Output remains a GeoPackage.

Usage:
    python trim_mrds.py --input MRDS_CO.gpkg --output MRDS_CO_trimmed.gpkg
"""

import argparse
import geopandas as gpd

KEEP_CATEGORIES = {
    "Tier 1 — High-Value Prospect",
    "Tier 1 — Active Mine",
    "Tier 2 — Past Producer",
    "Tier 3",
    "Gemstone",
    "Tailings",
    "Critical Mineral",
}


def trim(input_path: str, output_path: str, layer: str = None) -> None:
    print(f"Reading {input_path} ...")
    gdf = gpd.read_file(input_path, layer=layer) if layer else gpd.read_file(input_path)
    print(f"  Total features before filter: {len(gdf)}")

    gdf = gdf[gdf["category"].isin(KEEP_CATEGORIES)].copy()
    print(f"  Features after filter: {len(gdf)}")

    gdf.to_file(output_path, driver="GPKG")
    print(f"  Saved → {output_path}")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Trim MRDS_CO to prospector-relevant categories.")
    parser.add_argument("--input",  required=True,  help="Path to source GeoPackage")
    parser.add_argument("--output", required=True,  help="Output GeoPackage path")
    parser.add_argument("--layer",  default=None,   help="Layer name if source has multiple layers")
    args = parser.parse_args()

    trim(args.input, args.output, args.layer)
