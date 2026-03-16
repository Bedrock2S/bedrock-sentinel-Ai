# CURRENT TASK — Mining / Prospecting Layer Rebuild

## Objective
Build a new unified mining and prospecting intelligence layer from raw sources.
Do NOT touch existing QGIS layers until new layer is fully built and validated.
Once validated, delete old hydro point mining layer and replace with new.

## Source Datasets
1. MRDS.csv + MRDS.met — Raw national USGS MRDS dataset (unclipped, full attributes)
2. Colorado DRMS — State tailings/reclamation data (not yet acquired)
3. Additional prospecting/gem sources TBD

## Build Steps
- [ ] Clip MRDS.csv to Colorado boundary
- [ ] Acquire Colorado DRMS tailings/reclamation data
- [ ] Identify and acquire any additional gem/mineral occurrence sources
- [ ] Merge all sources into single unified GeoPackage layer
- [ ] Filter and classify features: tailings piles / mines / prospects / gem occurrences / other
- [ ] Build symbology and scale visibility in QGIS (parallel to existing layer)
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
