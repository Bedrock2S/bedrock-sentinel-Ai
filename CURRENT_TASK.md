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
- [x] Reproject MRDS_CO to project CRS — MRDS_CO_trimmed_26913.gpkg
- [x] Reproject Ownership_Final_CO to project CRS — Ownership_Final_CO_26913.gpkg
- [x] All layers unified at EPSG:26913
- [x] Virtual fields added — Length_mi (lines), Area_acres (polygons)
- [x] Set scale visibility — all rules restricted to 1:1,000–1:75,000
- [x] MRDS_CO_category.qml added to public repo — Garmin-ready symbology confirmed
- [ ] Configure labels — Tier 1 site names at close field scale only
- [ ] Validate MRDS_CO_trimmed.gpkg — confirm features, CRS, category field
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
- Major Roads scale restricted to 1:75,000 — no longer visible at statewide zoom
- Major Roads width reduced 0.9mm → 0.55mm — subordinate to Highways
- Backcountry road priority scale tuning completed
- Hydro temporal hierarchy styling finalized
- Historical stream visibility restricted to field scale
- Perennial stream labeling system finalized (curved placement + halo + priority tuning)
- Hydro point label placement and scale behavior finalized (spring labels ~1:15k)
- MRDS_CO prospecting symbology rebuilt — Garmin-ready, 8 rules, Industrial/Noise dropped, scale 1:75k

Current objective:

Achieve full **Cartographic Lock** before any new exports.

Active work focus:
- **Trails symbology and rendering review / fine-tuning** ← CURRENT
- Hydro point symbol refinement (visual hierarchy / mine vs spring readability)
- Intermittent stream rendering performance review
- Hillshade blend balance verification
- Multi-zoom transport dominance validation
- Overlay usability confirmation (Ownership / Geology layers — Mineral complete)
- Convert all transport and hydro distance interpretation to miles / acres (remove km-based context)

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
