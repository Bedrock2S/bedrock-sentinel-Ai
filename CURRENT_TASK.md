# CURRENT TASK — DRMS Integration

## Objective
Acquire and integrate Colorado DRMS (Division of Reclamation, Mining and Safety)
data, validate it alongside MRDS_CO, then merge both into a single unified
mineral intelligence layer for the final project.

End goal: one layer, one style, complete coverage from both federal and state sources.

## Why Both Sources
MRDS_CO is federal — historic mines, prospects, occurrences, gem fields, old workings
going back decades. DRMS is state — current permitted operations, active tailings
impoundments, reclamation bonds. Neither alone is complete. Together they are.

## Build Phases

### Phase 1 — Acquire and prep DRMS
- [ ] Locate and download Colorado DRMS dataset
      Source: Colorado Division of Reclamation, Mining and Safety
      URL: https://drms.colorado.gov (check GIS/data downloads section)
      Look for: permitted mine locations, tailings impoundments, bond/reclamation sites
- [ ] Review attribute schema — identify fields for name, status, commodity, site type
- [ ] Clip to Colorado extent if not already state-only
- [ ] Reproject to match project CRS (match MRDS_CO reprojection step)

### Phase 2 — Classify and QA individually
- [ ] Build classify_drms.py — classification script matched to DRMS attributes
- [ ] QA MRDS_CO and DRMS separately at field navigation scales
- [ ] Confirm both layers are clean and correctly classified before merge

### Phase 3 — Merge into unified layer
- [ ] Merge MRDS_CO + DRMS into single GeoPackage — CO_Mineral_Intelligence.gpkg
- [ ] Run deduplication pass — remove or flag sites that exist in both datasets
- [ ] Build unified classification covering all categories from both sources
- [ ] Build single unified style — CO_Mineral_Intelligence_category.qml
- [ ] Replace both individual layers in QGIS with the single merged layer

### Phase 4 — Final QA and lock
- [ ] Visual QA unified layer at all navigation scales
- [ ] Set scale visibility
- [ ] Configure labels (site name, Tier 1 features at close scale)
- [ ] Confirm layer is export-ready

## Dependency
MRDS_CO CRS reproject must be done before merge phase.

## Rule
Both individual layers run in parallel during build phases.
Neither is removed until the unified merged layer passes full validation.

---

# CURRENT TASK — Mining / Prospecting Layer Rebuild

## Objective
Build a new unified mining and prospecting intelligence layer from raw sources.
Do NOT touch existing QGIS layers until new layer is fully built and validated.
Once validated, delete old hydro point mining layer and replace with new.

## Source Datasets
1. MRDS_CO — Colorado-clipped USGS MRDS, full attributes, untouched
   Path: ~/Geospatial/03_Processed_Data/Mineral_Intelligence/System_Indicators/
2. MRDS raw national — unclipped backup if needed
   Path: /Volumes/External_Storage/Geospatial/01_Raw_Data/USGS/
3. Colorado DRMS — State tailings/reclamation data (not yet acquired)
4. Additional prospecting/gem sources TBD

## Build Steps
- [ ] Open MRDS_CO in QGIS and audit attribute table (identify tailings, mines, prospects, gem fields)
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
