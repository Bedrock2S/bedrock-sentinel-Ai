# ACTIVE STATE — Bedrock Sentinel

Last Updated: 2026-03-17 (backcountry roads rebuilt — 10 rules → 6, surface-type organizer)
DRMS: DROPPED — predominantly coal and construction pit data, not relevant to prospecting

BUILD PHASE
Cartographic stabilization — approaching lock

CURRENT REALITY
Cartographic lock is not yet active.
All project layers standardized to EPSG:26913.
Virtual fields (Length_mi, Area_acres) active on all line and polygon layers.
Transport hierarchy tuned and stable. Hydro hierarchy tuned and stable.
MRDS_CO classification and symbology complete. Scale visibility and labels remain pending.

COMPLETED THIS SESSION — 2026-03-17
- Major Roads (funcclassi 2/3) scale restricted to 1:1,000–1:75,000
  Was unbounded — rendered at all zoom levels including statewide overview
- Major Roads line width reduced from 0.9mm to 0.55mm
  Now correctly subordinate to Highways in visual hierarchy
- MRDS_CO_category.qml rebuilt and added to public repo
  Previous version existed only outside version control
  Rebuilt as prospecting-focused RuleRenderer — 8 rules, all at 1:1,000–1:75,000
  Industrial / Noise category dropped — not relevant to self-guided prospecting
  Symbols redesigned for Garmin readability: high contrast, simple shapes, size hierarchy
  Filter expressions corrected to exact category values from classification script
- BLM Trails simplified — 4 rules → 1 (Hiking Trail only)
  Filter: NON_MOTO_SHARED OR BIKE_HIK_ONLY
  Bike-only and all-others rules dropped — not relevant to foot-based prospecting
  Color unified to amber (RGB 220,140,0)
- USFS Trails simplified — 5 rules → 1 (Hiking Trail only)
  Filter: HIKER_PEDESTRIAN_ACCPT IS NOT NULL
  Bike-only, equestrian, and all-others rules dropped
  Color unified to amber (RGB 220,140,0)
- Backcountry Roads style rebuilt — 10 rules → 6, surface-type organizer
  Dual-classifier ambiguity resolved (OML vs JURISDICTION+SURFACE_TYPE)
  Identical rules (OML 4+5) merged; 3 USFS jurisdiction rules folded into surface-type rules
  Tiered scale visibility: Paved+Gravel at 1:50k, Dirt/Primitive/Others at 1:30k
  CLOSED road unchanged — red 200,0,0, 0.8mm, 1:35k
  All widths and colors fully specified — no undefined entries remain

LAYER STATUS — TRANSPORT
Highways:        Complete — dynamic width scaling, all zoom levels
Major Roads:     Complete — 0.55mm, scale 1:75,000 and closer
Minor Arterial:  Complete — 0.7mm, scale 1:50,000 and closer
Collectors:      Complete — 0.6mm, scale 1:35,000 and closer
Backcountry:     Complete — 6 rules, surface-type organizer, tiered scale (1:50k paved/gravel, 1:30k dirt/primitive)
Local Roads:     Complete
Trails (BLM):    Complete — hiking only, amber (RGB 220,140,0), 1 rule, scale 1:1,000–1:50,000
Trails (USFS):   Complete — hiking only, amber (RGB 220,140,0), 1 rule, scale 1:1,000–1:50,000

LAYER STATUS — HYDRO
Perennial streams:    Complete — dominant blue, 0.7mm, visible from 1:100,000, labeled
Intermittent streams: Complete — medium blue dash, 0.5mm, visible from 1:35,000
Historical streams:   Complete — blue-grey micro-dash, 0.5mm, visible from 1:35,000
Hydro points:         Stable — springs labeled at ~1:15k, symbols from ~1:35k

LAYER STATUS — MRDS_CO
Classification:   Complete — category field written to dataset
Style:            Complete — Garmin-ready, 8 prospecting rules, version-controlled
CRS:              Standardized — EPSG:26913
Scale visibility: Complete — all rules 1:1,000–1:75,000
Labels:           NOT configured — Tier 1 site names at close scale, still pending
Validation:       NOT complete — MRDS_CO_trimmed dataset needs feature/CRS/field QA

LAYER STATUS — OVERLAYS
Mineral Regions:          Complete
Mineral System Indicators: Complete
Ownership:                Complete — pending final overlay usability pass
Geology (Bedrock):        Complete — pending final overlay usability pass
Geology (Volcanic):       Complete — pending final overlay usability pass

KNOWN LIMITATION
Hydro point mining-related data is a simplified derivative and does not adequately
represent historic tailings piles or full mining disturbance classes.
MRDS_CO is the primary mining intelligence layer.
Hydro point mine features remain as temporary context pending MRDS_CO final validation.

EXPORT STATUS
All prior exports archived.
New exports intentionally paused pending final cartographic lock.

REMAINING BEFORE CARTOGRAPHIC LOCK
- MRDS_CO labels — Tier 1 at close field scale
- MRDS_CO_trimmed dataset validation
- Ownership / Geology final overlay usability pass
- Hillshade blend balance verification
- Full multi-zoom readability pass (statewide → regional → field → close)
- Performance redraw test

NEXT STATE TRANSITION
MRDS labels → dataset validation → final overlay pass
→ declare CARTOGRAPHIC LOCK → resume export pipeline
