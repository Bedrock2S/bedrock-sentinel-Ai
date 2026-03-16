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
