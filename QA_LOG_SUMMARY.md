# QA LOG — SUMMARY FEED
This file contains condensed confirmed production changes.

FORMAT

DATE  
CHANGE  
VISUAL RESULT  
PRIVATE COMMIT REF  
STATUS  

---

INITIAL STATE  
Road hierarchy rendering fix in progress  
No confirmed changes yet  

## 2026-03-15 — Export reset + hydro hierarchy finalized

- Previous exports archived to `04_Exports/_Archive/2026-03-15_pre_reexport/` because post-export cartographic changes made all earlier outputs obsolete for release use.
- Added explicit export-reset / cartographic-lock state documentation and a final cartographic lock checklist to project docs.
- Hydro line hierarchy finalized:
  - Perennial: `RGB 30,100,200`, `0.7 mm`, solid, visible from `1:100,000`
  - Intermittent: `RGB 90,150,220`, `0.5 mm`, dash `2 / 1`, visible from `1:35,000`
  - Historical: `RGB 135,170,205`, `0.50 mm`, dash `0.8 / 1.2`, visible from `1:35,000`
- Hydro labels finalized:
  - Perennial streams only
  - Field = `GNIS_NAME`
  - Parallel/curved on-line placement
  - Repeat distance `1500`
  - Priority `~40%`
  - Text `7 pt`, `RGB 60,90,130`
  - Buffer `0.6 pt`, light grey-white, `~70%`
  - Labels render from `~1:100,000`
- Visual QA outcome:
  - Perennial remains dominant navigation hydro
  - Intermittent no longer clutters mid-scale views
  - Historical now functions as close-scale prospecting / paleo-channel interpretation layer
- Known follow-up:
  - Historical stream distribution appears spatially fragmented/incomplete in some areas and needs later data continuity audit
- Current state:
  - Data complete
  - Cartographic tuning still active
  - Re-export required after final lock
## 2026-03-15 — Hydro Labeling & Visibility Refinement

Hydro line temporal hierarchy styling finalized:
- Perennial streams dominant solid blue
- Intermittent streams medium blue short-dash pattern
- Historical streams blue-grey micro-dash pattern
- Historical stream visibility limited to ~1:35k and closer to support paleochannel interpretation

Perennial stream labeling system finalized:
- Curved line placement following channel geometry
- Repeat distance reduced for improved long-river readability
- Subtle halo added for terrain overlay legibility
- Label priority tuned below transport layers
- Labels begin rendering ~1:100k with optimal readability at field scales

Hydro point labeling behavior refined:
- Spring labels restricted to close navigation scale (~1:15k)
- Symbols remain visible at broader field scales (~35k)
- Duplicate suppression enabled
- Placement offset tuned for topo readability

Result:
Hydrology now reads as a clear temporal and functional hierarchy while maintaining base-map transport dominance and field-navigation usability.

Status:
Cartographic tuning continues toward final export lock.

2026-03-15 — Hydro Point System Stabilization

Hydro point labeling behavior refined to improve close-range navigation readability while reducing mid-zoom clutter.
Spring labels now render only at detailed field scales while symbols remain visible at broader navigation scales.

Investigation confirmed current hydro point dataset is a simplified derivative of original source data and does not contain sufficient attribute detail to properly represent historic mining disturbance features such as tailings piles.

Hydro point symbology and label behavior considered stable for current cartographic lock phase.
Future project phase planned to rebuild mining intelligence datasets and restore detailed historic mining feature classification.

Current work focus remains on cartographic stabilization and export readiness validation.

## 2026-03-16 — MRDS_CO Classification Script + Style Confirmed

**Script — classify_mrds.py**
- Python script classifies MRDS_CO deposit points by commodity, deposit type, and development status
- Outputs a `category` field written back to `MRDS_CO.gpkg`
- Classification tiers: Tailings, Industrial/Noise, Uranium, Gemstone, Tier 1 Active/Prospect, Tier 2 Past Producer, Base Metal, Critical Mineral, Unclassified
- Dependencies: `geopandas`, `fiona`
- Script run confirmed — category field populated successfully
- Full script detail in private repo

**Style — MRDS_CO_category.qml**
- QGIS category style applied to classified deposit layer
- Downloaded from repo via GitHub Raw view, loaded into QGIS via Layer Properties > Symbology > Load Style
- Visual QA confirmed — all categories rendering correctly at field navigation scales

Status:
- Script + style pipeline complete and confirmed production-ready
- MRDS_CO layer fully classified and styled in project
- Full QA detail logged in private repo

## 2026-03-16 — DRMS Integration Cancelled

DRMS (Colorado Division of Reclamation, Mining and Safety) not added.
Dataset assessed as predominantly coal and construction pit data — outside project scope.
MRDS_CO confirmed as sole mineral intelligence source going forward.

## 2026-03-17 — Arterials Major Roads Scale + Width Tuning

- Major Roads rule (`funcclassi` 2/3) scale restricted to `1:1,000–1:75,000` (was unbounded — visible at statewide zoom)
- Line width reduced from `0.9mm` → `0.55mm` to render thinner than Highways (which peak at `1.2mm`)
- Minor Arterial and Collectors rules unchanged

## 2026-03-17 — MRDS_CO_category.qml Rebuilt for Prospecting

- New `MRDS_CO_category.qml` created in public repo (previously existed only outside repo)
- Renderer: RuleRenderer with 8 rules, all restricted to `1:1,000–1:75,000`
- Industrial / Noise category dropped entirely — not relevant to self-guided prospecting
- Filter expressions use exact original category values from `classify_mrds.py` (em-dash encoded)
- Symbol hierarchy (Garmin-appropriate — high contrast, simple shapes):
  - Tier 1 Active/Prospect: gold star, 4.0mm
  - Tier 2 Past Producer: orange circle, 3.0mm
  - Tailings: brown square, 2.5mm
  - Base Metal: teal circle, 2.5mm
  - Critical Mineral: purple diamond, 2.5mm
  - Gemstone: magenta diamond, 2.5mm
  - Uranium: lime green triangle, 2.5mm
  - Unclassified: grey circle, 1.5mm

## 2026-03-17 — MRDS_CO Tier 1 Labels Configured

- `MRDS_CO_category.qml` updated — `labelsEnabled` enabled, `styleCategories` includes `Labeling`
- Rule-based labeling added — Tier 1 features only (Active Mine + High-Value Prospect)
- Label field: `site_name`
- Scale: 1:1,000 – 1:15,000 (close field only — prevents clutter at area planning scale)
- Font: Arial Bold, 7pt, dark charcoal (RGB 30,30,30)
- Buffer: white (RGB 250,250,250), 0.8mm — terrain legibility on topo base
- Placement: over point, quadrant offset, `PreventOverlap` enabled, duplicate suppression on
- All other 7 categories: symbol only, no labels
- MAP_LEGEND updated — Tier 1 label spec documented, scale reference updated

## 2026-03-17 — Backcountry Roads Style Rebuilt — 10 Rules → 6

- `Backcountry_Roads_Style.qml` consolidated from 10 rules to 6
- Previous style mixed two classifiers (OML and JURISDICTION+SURFACE_TYPE) causing
  render ambiguity; OML 4 and OML 5 were visually identical; widths/colors unspecified
  on several rules. Rebuilt around surface type as single organizing principle.
- Rule 0 (Closed Road) — **zero changes** — red 200,0,0, 0.8mm, 1:35k
- New rules — dark to light color ramp by surface quality, tiered scale visibility:
  - Paved Road: dark brown 80,50,20, 0.6mm, **1:50k**
    Filter: OML 5 OR (FS jurisdiction AND surface AC)
  - Gravel / Improved: tan 140,100,40, 0.55mm, **1:50k**
    Filter: OML 3 OR OML 4 OR (FS AND surface AGG)
  - Dirt / Native: light tan 190,150,90, 0.5mm, **1:30k**
    Filter: OML 2 OR (FS AND surface NAT)
  - Primitive / Unmaintained: grey 160,160,160, 0.4mm, dashed, **1:30k**
    Filter: OML 0
  - All Others: pale tan 200,170,120, 0.35mm, **1:30k**
    Filter: ELSE
- Scale tier logic: Paved+Gravel at 1:50k (area planning); Dirt/Primitive/Other at 1:30k (field nav only)
- Labels: unchanged — NAME field, Arial Bold 6pt, 1:1k–1:25k
- All widths and colors fully specified — no "variable" or undefined entries remain
