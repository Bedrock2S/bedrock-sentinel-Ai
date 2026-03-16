# CURRENT TASK — Mining / Prospecting Layer Rebuild

## Objective
Build a clean, field-ready mineral intelligence layer from MRDS_CO.
DRMS dropped — dataset is predominantly coal and construction pit data,
not relevant to self-guided prospecting.

## Source Datasets
1. MRDS_CO_Edited.gpkg — Colorado-clipped USGS MRDS, category field written, styled
   Path: ~/Geospatial/03_Processed_Data/Mineral_Intelligence/System_Indicators/MRDS_CO_Edited.gpkg
2. MRDS raw national — unclipped backup if needed
   Path: /Volumes/External_Storage/Geospatial/01_Raw_Data/USGS/

## Build Steps
- [ ] Reproject MRDS_CO to project CRS
- [ ] Set scale visibility (suppress noise at statewide zoom)
- [ ] Configure labels — Tier 1 site names at close field scale only
- [ ] Export stripped POI GeoJSON via export_mrds_poi.py
- [ ] Visual QA and validation
- [ ] Confirm new layer replaces old — delete old hydro point mining layer

## Rule
Existing QGIS layers remain untouched until new layer passes full validation.

---

# CURRENT TASK — Bedrock Sentinel Cartographic Lock Phase

Project state: FINAL CARTOGRAPHIC TUNING

Data engineering phase: COMPLETE  
Layer architecture: LOCKED  
Export pipeline: PAUSED  

Recent confirmed fixes:
- Arterial hierarchy scale tuning completed
- Arterial width reduction completed
- Backcountry road priority scale tuning completed
- Hydro temporal hierarchy styling finalized
- Historical stream visibility restricted to field scale
- Perennial stream labeling system finalized (curved placement + halo + priority tuning)
- Hydro point label placement and scale behavior finalized (spring labels ~1:15k)

Current objective:

Achieve full **Cartographic Lock** before any new exports.

Active work focus:
- Hydro point symbol refinement (visual hierarchy / mine vs spring readability)
- Intermittent stream rendering performance review
- Hillshade blend balance verification
- Multi-zoom transport dominance validation
- Overlay usability confirmation (Ownership / Geology / Mineral layers)
- Convert all transport and hydro distance interpretation to miles / acres (remove km-based context)
- Complete full trails symbology and rendering review / fine-tuning

Required validation steps before export restart:
1. Statewide readability pass
2. Regional hierarchy transition pass
3. Field navigation clarity pass
4. Close-scale clutter and label behavior pass
5. Identify tool attribute verification
6. Performance redraw test

Export rule:
No MBTiles / GeoPDF / Garmin builds until visual lock is confirmed.

Next milestone:
Declare **CARTOGRAPHIC LOCK → restart export generation pipeline**
