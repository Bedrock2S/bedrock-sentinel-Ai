Layer: Colorado State Boundary 
Source: US Census Bureau - TIGER/Line
Shapefiles 
Dataset: 2025 TIGER State Boundary 
URL:https://www.census.gov/geographies/mapping-files/time-series/geo/tiger-line-file.html
Date Retrieved: Feb,19,2026
Stored At:01_Raw_Data/USGS/tl_2025_us_state/
License: Public Domain (US Government)
Notes: National state boundary dataset.
Colorado will be extracted in processing phase.

Layer: Colorado Roads (OSM Raw Extract)
Source: OpenStreetMap via Geofabrik
Dataset: colorado-latest.osm.pbf (timestamped file)
URL: https://download.geofabrik.de/north-america/us/colorado.html
Date Retrieved: (Feb,19,2026)
Stored At: 01_Raw_Data/OSM/
License: ODbL (Open Database License)
Notes: Full Colorado OSM extract. Roads, trails, hydro, and all OSM features included. Filtering occurs in Phase 3.

Layer: Colorado Ownership (PAD-US Raw Intake)
Source: USGS GAP Analysis Project – PAD-US
Dataset: PAD-US 4.1 State Download (Colorado)
URL: https://www.usgs.gov/programs/gap-analysis-project/science/pad-us-data-download
Date Retrieved: Feb 19, 2026
Stored At: 01_Raw_Data/PADUS/PADUS4_1_State_-CO_GDB_KMZ.zip
License: Public Domain (US Government)
Notes: State-clipped PAD-US geodatabase. Combined Fee, Designation, Easement, and Proclamation classes included. Filtering and structuring occur in Phase 3.

PAD-US (CO State GDB + KMZ)
Layer: PAD-US CO (State Download)
Source: USGS PAD-US
Dataset: PADUS 4.1 State – Colorado (GDB + KMZ)
File: PADUS4_1_State_-CO_GDB_KMZ.zip
Stored At: 01_Raw_Data/PADUS/
Date Retrieved: Feb 19, 2026
License: Public Domain (US Government)
Notes: State-clipped PAD-US package (ownership core for overlays).

USGS 3DEP DEM (Colorado tiles)
Layer: Elevation DEM (3DEP 1/3 arc-second)
Source: USGS National Map (TNM Download v2)
Dataset: USGS 3DEP 1/3 arc-second DEM (GeoTIFF tiles)
Stored At: 01_Raw_Data/DEM/USGS_3DEP_1-3arc_CO/
URL List: USGS_3DEP_1-3arc_CO_urls.txt
Date Retrieved: Feb 19, 2026
License: Public Domain (US Government)
Notes: 50 GeoTIFF tiles for Colorado; will be mosaicked/processed in Phase 3.

Processing Log – DEM Contour Generation

Phase: DEM Mosaic & Reprojection
Created VRT mosaic from 50 Colorado 3DEP tiles
Reprojected to NAD83 / UTM Zone 13N (EPSG:26913)
Output: colorado_3dep_utm13.tif
Size: ~17 GB

Phase: Contour Generation
Generated 20m intermediate contours
Generated 100m index contours
CRS: NAD83 / UTM Zone 13N
20m GPKG size: ~7.4 GB
100m GPKG size: ~1 GB

Phase: OSM Conversion
Converted 20m contours to OSM XML
Output: colorado_contours_intermediate_20m.osm
Size: ~4.7 GB
Processing time: ~1 hour

Contours 100m – Status
Source: DEM derived contours
Sorted using: osmium sort
Final sorted file:
03_Processed_Data/Contours/100m/colorado_contours_100m_sorted.pbf
Split using:
splitter r654
Split output:
07_Split/Contours_100m/
Tile count: 6
Status: VALID – no node sorting errors

Next stage: mkgmap compile as transparent overlay

2026-02-25 10:39 PM — BASE_TRAVEL Planning Phase

Decision:
Master dataset will be built in QGIS first.
Single GeoPackage structure:
03_Processed_Data/Base/colorado_base_travel.gpkg

Data Sources Confirmed:
OSM Colorado PBF (statewide extract)
PADUS (land ownership outlines)

Overlays Separated:
Hydro (future overlay)
Contours 100m / 40m / 20m (separate)
Hiking layer (FS + trails)
Geology layers

Base Map Scope Locked:
Roads (full hierarchy)
Rail
Airports
Powerlines
Settlements
Light landcover tint
Land ownership outline only
Camp sites + springs only

## 2026-03-06 — Roads NAME Rebuild Sources (v22 completion; recorded under v23 governance)
- Backcountry Roads Final: ~/Geospatial/03_Processed_Data/Roads/Backcountry_Roads_Final.gpkg (RoadCore_FS) — 55,932 features; NAME null/blank = 0; backup: Backcountry_Roads_Final_BACKUP_2026-03-06.gpkg
- USFS RoadCore (processed): ~/Geospatial/03_Processed_Data/Roads/USFS_RoadCore_CO.gpkg — NAME
- BLM Colorado Routes (raw): ~/Geospatial/01_Raw_Data/Roads/BLM_Colorado_Roads/BLM_Colorado_Routes.shp | (processed): ~/Geospatial/03_Processed_Data/Roads/BLM_Routes_CO_4269.gpkg — COALESCE(ROUTE_SCDN, ROUTE_PRMR, FAMS_SEG_N)
- TIGER Roads (processed): ~/Geospatial/03_Processed_Data/Roads/TIGER_CO_Roads_All.gpkg — FULLNAME
- USFS MVUM Roads (raw): ~/Geospatial/01_Raw_Data/Roads/USFS_MVUM_Roads/Trans_MVUM_Road.gdb | (processed CO clip): ~/Geospatial/03_Processed_Data/Roads/USFS_MVUM_Roads_CO.gpkg — COALESCE(NAME, FIELD_ID, MVUM_SYMBOL_NAME) [critical final fill]

## 2026-03-06 — Geology Source Governance (v23)
- Alaska-only SIM series geology ID retired (was incorrectly referenced). Colorado geology source = USGS SGMC Colorado (mrdata.usgs.gov/geology/state/).
- Authoritative Colorado geology source: USGS SGMC Colorado — mrdata.usgs.gov/geology/state/ (download pending into 01_Raw_Data/Geology/)


## 2026-03-07 — NLCD 2021 Land Cover (L48)
- Agency/Program: MRLC / NLCD (authoritative landcover)
- Product: nlcd_2021_land_cover_l48_20230630
- Raw ZIP: 01_Raw_Data/Landcover/NLCD_2021/nlcd_2021_land_cover_l48_20230630.zip
- Raw IMG: 01_Raw_Data/Landcover/NLCD_2021/nlcd_2021_land_cover_l48_20230630.img
- Processed CO raster: 03_Processed_Data/Landcover/NLCD_2021_CO.tif
- Notes: Download required retries; unzip integrity verified before extraction; extraction hit disk limits mid-way earlier but raw archive preserved externally.

# Data Sources

Boundary
US Census TIGER
tl_2025_us_state

Hydro
USGS NHD

Ownership
PADUS
CPW Managed Lands

Geology
USGS SGMC

Landcover
NLCD 2021

Terrain
USGS DEM

Derived datasets
Contours generated from DEM.

## Mineral Intelligence Sources — Added March 2026

| Dataset | File | Source | Features | Notes |
|---|---|---|---|---|
| USGS MRDS | MRDS_CO_5070.gpkg | USGS Mineral Resources Data System | 17,665 | Clipped to Colorado from national dataset of 304,632 points |
| SGMC Geology | Geology_CO_Bedrock — SGMC_Geology | USGS State Geologic Map Compilation | — | Used to derive MineralSystemIndicators_CO |
