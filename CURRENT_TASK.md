# CURRENT TASK — DRMS Integration

## Objective
Acquire and integrate Colorado DRMS (Division of Reclamation, Mining and Safety)
dataset as a second source layer to complement MRDS_CO.
DRMS is the state-level authoritative source for permitted mines, tailings impoundments,
and reclamation sites — fills gaps in MRDS coverage, especially for tailings piles.

## Why Both Layers
MRDS_CO is federal — historic mines, prospects, occurrences, gem fields, old workings
going back decades. DRMS is state — current permitted operations, active tailings
impoundments, reclamation bonds. Neither alone is complete.

Both layers will remain in the final project as separate permanent layers.
They are not merged. They cover different things.

  MRDS_CO  — historic and federal record
  DRMS     — current state-permitted and reclamation record

Together they give the most complete mineral intelligence picture for prospecting
and field navigation use.

## Steps
- [ ] Locate and download Colorado DRMS dataset
      Source: Colorado Division of Reclamation, Mining and Safety
      URL: https://drms.colorado.gov (check GIS/data downloads section)
      Look for: permitted mine locations, tailings impoundments, bond/reclamation sites
- [ ] Review attribute schema — identify fields for name, status, commodity, site type
- [ ] Clip to Colorado extent if not already state-only
- [ ] Reproject to match project CRS (match MRDS_CO reprojection step)
- [ ] Build classify_drms.py — separate classification script for DRMS attributes
- [ ] Build DRMS_category.qml — matching style, consistent visual language with MRDS
- [ ] Visual QA both layers together at field navigation scales
- [ ] Set scale visibility on both layers
- [ ] Configure labels on both layers (site name, Tier 1 features at close scale)

## Dependency
MRDS_CO CRS reproject must be done before or alongside this work so both
layers are in the same CRS.

## Rule
MRDS_CO stays. DRMS adds to it. Neither replaces the other.

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
