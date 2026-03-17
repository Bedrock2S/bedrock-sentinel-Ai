#!/usr/bin/env python3
"""
generate_field_guide.py
Bedrock Sentinel — Portable Visual Field Guide Generator

Generates FIELD_GUIDE.html — a self-contained, offline-ready HTML file
with rendered SVG symbols for every map layer. No external dependencies.

Usage:
    python3 generate_field_guide.py
Output:
    FIELD_GUIDE.html (same directory)
"""

import os
import math

# ---------------------------------------------------------------------------
# SVG SYMBOL BUILDERS
# ---------------------------------------------------------------------------

def svg_wrap(content, w=64, h=32):
    return (
        f'<svg xmlns="http://www.w3.org/2000/svg" width="{w}" height="{h}" '
        f'viewBox="0 0 {w} {h}" style="display:block;margin:auto">'
        f'{content}</svg>'
    )

def sym_line(color, width=2, dash="none", w=64, h=32):
    """Horizontal line symbol."""
    y = h / 2
    dash_attr = ""
    if dash == "dashed":
        dash_attr = 'stroke-dasharray="8,4"'
    elif dash == "dotted":
        dash_attr = 'stroke-dasharray="2,4"'
    line = (
        f'<line x1="4" y1="{y}" x2="{w-4}" y2="{y}" '
        f'stroke="{color}" stroke-width="{width}" '
        f'stroke-linecap="round" {dash_attr}/>'
    )
    return svg_wrap(line, w, h)

def sym_line_cased(color, casing, width=3, w=64, h=32):
    """Road line with casing (outline)."""
    y = h / 2
    casing_line = (
        f'<line x1="4" y1="{y}" x2="{w-4}" y2="{y}" '
        f'stroke="{casing}" stroke-width="{width+2}" stroke-linecap="round"/>'
    )
    fill_line = (
        f'<line x1="4" y1="{y}" x2="{w-4}" y2="{y}" '
        f'stroke="{color}" stroke-width="{width}" stroke-linecap="round"/>'
    )
    return svg_wrap(casing_line + fill_line, w, h)

def sym_circle(color, size=12, outline="#1E1E1E", w=64, h=32):
    cx, cy = w / 2, h / 2
    shape = (
        f'<circle cx="{cx}" cy="{cy}" r="{size/2}" '
        f'fill="{color}" stroke="{outline}" stroke-width="1.5"/>'
    )
    return svg_wrap(shape, w, h)

def sym_square(color, size=12, outline="#1E1E1E", w=64, h=32):
    cx, cy = w / 2, h / 2
    x, y = cx - size/2, cy - size/2
    shape = (
        f'<rect x="{x}" y="{y}" width="{size}" height="{size}" '
        f'fill="{color}" stroke="{outline}" stroke-width="1.5"/>'
    )
    return svg_wrap(shape, w, h)

def sym_diamond(color, size=14, outline="#1E1E1E", w=64, h=32):
    cx, cy = w / 2, h / 2
    half = size / 2
    pts = f"{cx},{cy-half} {cx+half},{cy} {cx},{cy+half} {cx-half},{cy}"
    shape = (
        f'<polygon points="{pts}" '
        f'fill="{color}" stroke="{outline}" stroke-width="1.5"/>'
    )
    return svg_wrap(shape, w, h)

def sym_triangle(color, size=14, outline="#1E1E1E", w=64, h=32):
    cx, cy = w / 2, h / 2
    half = size / 2
    h_tri = size * math.sqrt(3) / 2
    pts = (
        f"{cx},{cy - h_tri*0.6} "
        f"{cx+half},{cy + h_tri*0.4} "
        f"{cx-half},{cy + h_tri*0.4}"
    )
    shape = (
        f'<polygon points="{pts}" '
        f'fill="{color}" stroke="{outline}" stroke-width="1.5"/>'
    )
    return svg_wrap(shape, w, h)

def sym_star(color, size=16, outline="#1E1E1E", w=64, h=32):
    """5-point star."""
    cx, cy = w / 2, h / 2
    outer = size / 2
    inner = outer * 0.4
    pts = []
    for i in range(10):
        angle = math.pi * i / 5 - math.pi / 2
        r = outer if i % 2 == 0 else inner
        pts.append(f"{cx + r * math.cos(angle):.2f},{cy + r * math.sin(angle):.2f}")
    pts_str = " ".join(pts)
    shape = (
        f'<polygon points="{pts_str}" '
        f'fill="{color}" stroke="{outline}" stroke-width="1.5"/>'
    )
    return svg_wrap(shape, w, h)

def sym_fill(fill, border, w=64, h=32):
    """Filled rectangle (ownership/geology/region)."""
    pad = 4
    shape = (
        f'<rect x="{pad}" y="{pad}" '
        f'width="{w-pad*2}" height="{h-pad*2}" '
        f'fill="{fill}" stroke="{border}" stroke-width="1.5"/>'
    )
    return svg_wrap(shape, w, h)

def sym_fill_semi(fill, border, alpha=0.55, w=64, h=32):
    """Semi-transparent fill (overlays)."""
    pad = 4
    shape = (
        f'<rect x="{pad}" y="{pad}" '
        f'width="{w-pad*2}" height="{h-pad*2}" '
        f'fill="{fill}" fill-opacity="{alpha}" '
        f'stroke="{border}" stroke-width="1.5"/>'
    )
    return svg_wrap(shape, w, h)

def sym_contour(color, weight=1, w=64, h=32):
    """Wavy contour line."""
    y = h / 2
    # Simple sine-wave path
    points = []
    steps = 20
    for i in range(steps + 1):
        x = 4 + (w - 8) * i / steps
        yy = y + 3 * math.sin(i * math.pi * 2 / 6)
        points.append(f"{x:.1f},{yy:.1f}")
    d = "M " + " L ".join(points)
    shape = (
        f'<path d="{d}" fill="none" '
        f'stroke="{color}" stroke-width="{weight}" stroke-linecap="round"/>'
    )
    return svg_wrap(shape, w, h)

def sym_gate(color="#E5B636", w=64, h=32):
    """Gate symbol — vertical bar with tick marks."""
    cx, cy = w / 2, h / 2
    shape = (
        f'<line x1="{cx}" y1="4" x2="{cx}" y2="{h-4}" '
        f'stroke="{color}" stroke-width="3" stroke-linecap="round"/>'
        f'<line x1="{cx-8}" y1="8" x2="{cx+8}" y2="{h-8}" '
        f'stroke="{color}" stroke-width="2"/>'
        f'<line x1="{cx+8}" y1="8" x2="{cx-8}" y2="{h-8}" '
        f'stroke="{color}" stroke-width="2"/>'
    )
    return svg_wrap(shape, w, h)

def sym_hotzone(w=64, h=32):
    """Hot zone — dashed orange polygon outline."""
    pad = 5
    shape = (
        f'<rect x="{pad}" y="{pad}" '
        f'width="{w-pad*2}" height="{h-pad*2}" '
        f'fill="#FF6400" fill-opacity="0.25" '
        f'stroke="#FF6400" stroke-width="2" stroke-dasharray="5,3"/>'
    )
    return svg_wrap(shape, w, h)

def sym_hillshade(w=64, h=32):
    """Hillshade — grey gradient swatch."""
    grad_id = "hs_grad"
    content = (
        f'<defs>'
        f'<linearGradient id="{grad_id}" x1="0" y1="0" x2="1" y2="1">'
        f'<stop offset="0%" stop-color="#F0F0F0"/>'
        f'<stop offset="50%" stop-color="#A0A0A0"/>'
        f'<stop offset="100%" stop-color="#404040"/>'
        f'</linearGradient>'
        f'</defs>'
        f'<rect x="4" y="4" width="{w-8}" height="{h-8}" '
        f'fill="url(#{grad_id})" stroke="#888" stroke-width="1"/>'
    )
    return svg_wrap(content, w, h)

def sym_nlcd(w=64, h=32):
    """NLCD — multi-color swatch showing land cover classes."""
    colors = ["#5475A8","#70A33F","#CEBB8B","#DBD83D","#476BA1","#BAD8EA","#D2CDC0"]
    strip_w = (w - 8) / len(colors)
    strips = ""
    for i, c in enumerate(colors):
        x = 4 + i * strip_w
        strips += f'<rect x="{x:.1f}" y="4" width="{strip_w:.1f}" height="{h-8}" fill="{c}"/>'
    content = strips + f'<rect x="4" y="4" width="{w-8}" height="{h-8}" fill="none" stroke="#888" stroke-width="1"/>'
    return svg_wrap(content, w, h)

# ---------------------------------------------------------------------------
# LEGEND DATA
# ---------------------------------------------------------------------------
# Each entry: (symbol_html, layer_name, description)

SECTIONS = [

    ("SECTION 1 — TRANSPORT", "transport", "#3C3C3C", [

        (sym_line_cased("#3C3C3C", "#232323", 4),
         "Highway",
         "Paved state & US highways. Always visible at all scales. "
         "Darkest, thickest road line on the map."),

        (sym_line("#505050", 3),
         "Major Road / Principal Arterial",
         "Paved state routes & county arterials. Visible at area planning scale "
         "and closer (1:75,000 and in). Width 0.55mm."),

        (sym_line("#646464", 2),
         "Minor Arterial",
         "Secondary paved roads. Visible 1:50,000 and in."),

        (sym_line("#787878", 2),
         "Collector Road",
         "Maintained county routes. Visible 1:50,000 and in."),

        (sym_line("#A0A0A0", 1.5),
         "Local Road",
         "Residential streets & rural county roads. "
         "Thinnest road line. Visible 1:50,000 and in."),

        (sym_line("#C80000", 2, "dashed"),
         "Backcountry Road — CLOSED (OML 1)",
         "Closed to public vehicle use. Do not attempt."),

        (sym_line("#B45014", 2),
         "Backcountry Road — High Clearance 4WD (OML 2)",
         "Rocky or rutted. High clearance 4-wheel drive required."),

        (sym_line("#8C6428", 2),
         "Backcountry Road — Passenger Car OK (OML 3)",
         "Graded dirt. Passable in a standard passenger vehicle."),

        (sym_line("#648C3C", 1.5),
         "Backcountry Road — Moderate Comfort (OML 4)",
         "Maintained gravel road. Moderate driving comfort."),

        (sym_line("#648C3C", 1.5),
         "Backcountry Road — High Comfort (OML 5)",
         "Fully maintained road. High comfort, often paved."),

        (sym_line("#B4A028", 1.5, "dotted"),
         "BLM Trail — Shared Non-Motorized",
         "Open to all non-motorized users. Olive/yellow-green."),

        (sym_line("#DC8C00", 1.5, "dotted"),
         "BLM / USFS Trail — Hiker + Bike",
         "Foot traffic and bicycles permitted. Amber color."),

        (sym_line("#64B428", 1.5, "dotted"),
         "BLM / USFS Trail — Bike Only",
         "Bicycle use only — no hiking."),

        (sym_line("#C85014", 1.5, "dotted"),
         "USFS Trail — Hiker Only",
         "Foot traffic only. Burnt orange."),

        (sym_line("#FF9E17", 1.5, "dotted"),
         "Trail — Other / Unclassified",
         "Other non-motorized designations. Bright orange."),

    ]),

    ("SECTION 2 — HYDROLOGY", "hydro", "#0064C8", [

        (sym_line("#0064C8", 2.5),
         "Perennial Stream (fcode 46006)",
         "Permanently flowing water. Solid blue. Highest hydro priority. "
         "Visible to 1:100,000."),

        (sym_line("#4096DC", 2, "dashed"),
         "Intermittent Stream (fcode 46003 / 46007)",
         "Flows seasonally — dry in late summer. Dashed blue. "
         "Visible at field scale only (1:35,000 and in). "
         "May still show substrate moisture for prospecting."),

        (sym_line("#2060A0", 1.5, "dashed"),
         "NHD Historical Stream",
         "Historic channel — may be dry, diverted, or buried. "
         "Micro-dash, very faint. Field scale only."),

        (sym_line("#3070B0", 1.5),
         "Canal / Ditch / DWR Ditch",
         "Man-made irrigation or conveyance channel. "
         "DWR data is more locally accurate than NHD canals."),

        (sym_line("#4080C0", 1),
         "Pipeline / Artificial Path",
         "Water pipeline or reservoir centerline. "
         "Used for network connectivity."),

        (sym_fill("#A8D0F0", "#0064C8"),
         "Lake / Reservoir / Pond",
         "NHD waterbody polygons. Filled blue area feature."),

        (sym_circle("#0064C8", 10),
         "Spring / Seep",
         "DWR structure point. Labeled at close field scale (~1:15,000). "
         "Key water source for field navigation."),

        (sym_circle("#4080B0", 8),
         "Hydro Mine Point",
         "Temporary placeholder — simplified DWR mine derivative. "
         "See MRDS_CO layer for primary mining intelligence."),

    ]),

    ("SECTION 3 — MINING & PROSPECTING", "mining", "#B8860B", [

        (sym_star("#FFC800", 16),
         "TIER 1 — Active Mine / High-Value Prospect",
         "Active producing mine OR high-confidence prospect with known "
         "gold, silver, or multi-metal mineralization. "
         "Gold star, 4mm. Priority target. Visible 1:75,000 and in."),

        (sym_circle("#FF7800", 12),
         "TIER 2 — Past Producer",
         "Historic producing mine — ceased operations but confirms "
         "mineralization. High prospecting value. Orange circle, 3mm."),

        (sym_square("#8C5A28", 11),
         "Tailings",
         "Mine waste pile from past processing. Indicates nearby workings. "
         "Brown square, 2.5mm. Do not disturb (EPA regulations apply)."),

        (sym_circle("#00C8B4", 11),
         "Base Metal (Pb, Zn, Cu)",
         "Lead, zinc, copper, or other base metal occurrence. "
         "Teal circle, 2.5mm."),

        (sym_diamond("#B400FF", 13),
         "Critical Mineral",
         "Lithium, cobalt, rare earth elements, or other federally "
         "designated critical minerals. Purple diamond, 2.5mm."),

        (sym_diamond("#E60078", 13),
         "Gemstone",
         "Aquamarine, topaz, rhodochrosite, turquoise, or other "
         "collectible minerals. Magenta diamond, 2.5mm."),

        (sym_triangle("#50C800", 13),
         "Uranium",
         "Uranium occurrence — Colorado Plateau / sedimentary hosted. "
         "Lime green triangle, 2.5mm. Informational only."),

        (sym_circle("#8C8C8C", 9),
         "Unclassified Prospect / Mine",
         "Commodity or classification not determined from MRDS data. "
         "Grey circle, 1.5mm. Lowest priority."),

    ]),

    ("SECTION 4 — LAND OWNERSHIP / ACCESS", "ownership", "#8B0000", [

        (sym_fill("#C84646", "#8C1E1E"),
         "PROHIBITED — No Collecting / No Entry",
         "National Parks (NPS), designated Wilderness Areas, WSAs, Private land. "
         "Prospecting strictly prohibited. Fines and criminal penalties apply. "
         "Red fill."),

        (sym_fill("#DCB43C", "#A07814"),
         "VERIFY — Check Rules Before Entry",
         "State land (SLB), Colorado Parks & Wildlife (CPW), ACEC. "
         "Entry and collecting may be restricted or require permit. "
         "Always verify with managing agency. Gold/amber fill."),

        (sym_fill("#64B464", "#3C783C"),
         "OPEN — Prospecting Generally Permitted",
         "BLM General Use, USFS General Forest. Recreational prospecting "
         "generally allowed (personal use, no mechanized excavation without "
         "permit, no sale). Verify no special closures. Green fill."),

        (sym_fill("#B4A0C8", "#786496"),
         "UNKNOWN — Verify Before Entry",
         "Ownership not determined or data gap. Do not assume access is "
         "permitted. Verify parcel ownership before entering. Lavender fill."),

    ]),

    ("SECTION 5 — GEOLOGY", "geology", "#556B2F", [

        (sym_fill("#50D0C7", "#3C3C3C"),
         "Precambrian (Archean-Proterozoic)",
         "Ancient basement rocks — metamorphic and igneous. "
         "Colorado Front Range core. Host for many lode deposits. Teal/aqua."),

        (sym_fill("#E9E25D", "#3C3C3C"),
         "Paleozoic",
         "Sedimentary sequence — limestones, sandstones, shales. "
         "Carbonate-hosted mineralization possible (skarn, MVT). Yellow."),

        (sym_fill("#CF5157", "#3C3C3C"),
         "Mesozoic",
         "Jurassic/Cretaceous sediments — Morrison Fm, Dakota Sandstone. "
         "Uranium-vanadium host in Colorado Plateau. Muted red."),

        (sym_fill("#4CE544", "#3C3C3C"),
         "Cenozoic",
         "Tertiary volcanics, intrusions, and valley fill. San Juan volcanic "
         "field — epithermal gold/silver. Oligocene porphyry systems. Lime green."),

        (sym_fill_semi("#FF4040", "#8B0000", 0.5),
         "Volcanic Extrusive",
         "Lava flows, tuffs, ash deposits, caldera fill. "
         "Epithermal gold/silver systems hosted in volcanic sequence. "
         "San Juan volcanic field — primary epithermal target zone."),

        (sym_fill_semi("#9040C0", "#4B0082", 0.5),
         "Volcanic Intrusive",
         "Stocks, dikes, sills, laccoliths, plutons. Porphyry copper/gold, "
         "skarn, and contact metasomatic systems. High-value target when "
         "intersecting fault/fracture zones."),

    ]),

    ("SECTION 6 — MINERAL REGIONS & INDICATORS", "minerals", "#8B6914", [

        (sym_fill("#FFC800", "#8D5A99"),
         "Mineral Region — HIGH (Class 3)",
         "Core of historic and active district. Gold, silver, multi-metal "
         "expected. Gold fill with purple border."),

        (sym_fill("#E6B400", "#8D5A99"),
         "Mineral Region — MODERATE (Class 2)",
         "District fringe or secondary belt. Worth investigating in "
         "combination with MRDS sites. Muted gold fill."),

        (sym_fill("#F0D878", "#8D5A99"),
         "Mineral Region — LOW (Class 1)",
         "Low to peripheral mineral potential. Background context only — "
         "do not rely as primary targeting layer. Pale gold fill."),

        (sym_circle("#FF2800", 11),
         "Volcanic System Indicator",
         "Volcanic-hosted mineralization indicator — epithermal gold/silver "
         "systems, volcanic caldera margins. Bright red."),

        (sym_circle("#00D2BE", 11),
         "Placer System Indicator",
         "Placer system indicator — alluvial/fluvial gold concentration zones. "
         "Stream placer prospecting context. Teal."),

        (sym_circle("#C800FF", 11),
         "Intrusive System Indicator",
         "Intrusive-hosted mineralization — porphyry copper/gold, skarn, "
         "or contact metasomatic systems. Purple."),

    ]),

    ("SECTION 7 — TERRAIN & BASE LAYERS", "terrain", "#556B2F", [

        (sym_hillshade(),
         "Hillshade",
         "Shaded relief — terrain context for ridgelines, drainages, canyon "
         "walls, slope aspect. Blended beneath all feature layers. All scales."),

        (sym_contour("#C8A064", 1),
         "Contours — 50m interval",
         "Fine-scale terrain reading. Khaki/tan lines, 0.2mm. "
         "Visible at field and close scales."),

        (sym_contour("#B48C50", 1.5),
         "Contours — 100m interval (Index)",
         "Regional terrain reading — ridges, valleys, slope patterns. "
         "Slightly heavier than 50m. Visible at regional and planning scales."),

        (sym_nlcd(),
         "NLCD 2021 — Land Cover",
         "USGS National Land Cover Database. Developed (blue), Forest (green), "
         "Shrubland/Grassland (tan/yellow), Water (blue), Barren (grey). "
         "Barren ground is a prospecting access indicator."),

    ]),

    ("SECTION 8 — POINT FEATURES", "points", "#4B0082", [

        (sym_gate("#E5B636"),
         "BLM Gate / Road Barrier",
         "BLM road gate that may be locked seasonally. Critical for route "
         "planning — a locked gate prevents vehicle access even on open BLM "
         "land. Tan/gold. Field and close scales only."),

        (sym_hotzone(),
         "Hot Zone",
         "Custom-defined high-interest prospecting area based on multi-layer "
         "convergence: MRDS density, Mineral Region class, geology type, "
         "and access. Dashed orange outline with semi-transparent fill. "
         "Site-specific name labels shown."),

    ]),
]

# ---------------------------------------------------------------------------
# SCALE REFERENCE TABLE
# ---------------------------------------------------------------------------

SCALE_REF = [
    ("1:500,000+ (Statewide)",
     "Highways, Mineral Regions, Geology Bedrock, Hillshade, Ownership, "
     "System Indicators, NLCD"),
    ("1:200,000 (Regional Overview)",
     "+ Major Road and Arterial labels, Hydro Lines (perennial)"),
    ("1:100,000 (Regional)",
     "+ Hydro Lines (all classes), Hydro Point labels, Contours 100m"),
    ("1:75,000 (Area Planning)",
     "+ MRDS_CO Prospecting Sites appear, Major Roads visible"),
    ("1:50,000",
     "+ Minor Arterials, Collectors, Local Roads, BLM/USFS Trails, "
     "Contours 50m"),
    ("1:35,000",
     "+ Backcountry Roads (most classes), Intermittent & Historical streams"),
    ("1:25,000 (Field Nav)",
     "+ USFS Native/Dirt roads, Not Maintained roads"),
    ("1:15,000 (Close Scale)",
     "+ Spring/Seep labels on Hydro Points"),
    ("1:1,000 (Site Detail)",
     "All active layers at full detail"),
]

# ---------------------------------------------------------------------------
# LAYER RENDER ORDER
# ---------------------------------------------------------------------------

RENDER_ORDER = [
    (1,  "Hillshade (terrain base)"),
    (2,  "NLCD 2021 Land Cover (semi-transparent)"),
    (3,  "Geology — Bedrock (semi-transparent overlay)"),
    (4,  "Geology — Volcanic Extrusive"),
    (5,  "Geology — Volcanic Intrusive"),
    (6,  "Contours 100m"),
    (7,  "Contours 50m"),
    (8,  "Hydro Polygons (lakes, reservoirs)"),
    (9,  "Ownership (semi-transparent fill)"),
    (10, "Mineral Regions"),
    (11, "Mineral System Indicators"),
    (12, "Hot Zones"),
    (13, "Hydro Lines (streams, ditches, canals)"),
    (14, "Local Roads"),
    (15, "Collectors"),
    (16, "Minor Arterials"),
    (17, "Major Roads"),
    (18, "Backcountry Roads"),
    (19, "BLM Trails"),
    (20, "USFS Trails"),
    (21, "Highways (top transport layer)"),
    (22, "Hydro Points (springs, seeps, mine points)"),
    (23, "BLM Gates"),
    (24, "MRDS_CO Prospecting Sites (topmost feature layer)"),
]

# ---------------------------------------------------------------------------
# HTML GENERATION
# ---------------------------------------------------------------------------

CSS = """
* { box-sizing: border-box; margin: 0; padding: 0; }
body {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", sans-serif;
    font-size: 15px;
    color: #1a1a1a;
    background: #f8f8f6;
    line-height: 1.45;
}
header {
    background: #1a1a1a;
    color: #fff;
    padding: 18px 20px 14px;
}
header h1 { font-size: 1.35em; font-weight: 700; letter-spacing: 0.02em; }
header p  { font-size: 0.8em; color: #b0b0b0; margin-top: 4px; }
nav {
    background: #2c2c2c;
    padding: 8px 16px;
    display: flex;
    flex-wrap: wrap;
    gap: 6px 14px;
}
nav a {
    color: #d4c87a;
    text-decoration: none;
    font-size: 0.78em;
    font-weight: 600;
    letter-spacing: 0.03em;
    white-space: nowrap;
}
nav a:hover { color: #fff; }
.section-block {
    margin: 20px 12px 0;
    border-radius: 6px;
    overflow: hidden;
    box-shadow: 0 1px 4px rgba(0,0,0,0.10);
}
.section-header {
    padding: 9px 14px;
    font-size: 0.85em;
    font-weight: 700;
    letter-spacing: 0.06em;
    text-transform: uppercase;
    color: #fff;
}
table.legend {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
}
table.legend tr {
    border-bottom: 1px solid #ececec;
}
table.legend tr:last-child { border-bottom: none; }
table.legend tr:hover { background: #f5f3ee; }
td.sym-cell {
    width: 72px;
    min-width: 72px;
    padding: 8px 4px;
    text-align: center;
    vertical-align: middle;
    border-right: 1px solid #ececec;
}
td.info-cell {
    padding: 8px 12px 8px 10px;
    vertical-align: middle;
}
.layer-name {
    font-weight: 600;
    font-size: 0.88em;
    color: #1a1a1a;
}
.layer-desc {
    font-size: 0.78em;
    color: #666;
    margin-top: 2px;
}
/* Scale ref & render order */
.ref-block {
    margin: 20px 12px 0;
    border-radius: 6px;
    overflow: hidden;
    box-shadow: 0 1px 4px rgba(0,0,0,0.10);
    background: #fff;
}
.ref-header {
    background: #2c2c2c;
    color: #d4c87a;
    padding: 9px 14px;
    font-size: 0.85em;
    font-weight: 700;
    letter-spacing: 0.06em;
    text-transform: uppercase;
}
table.ref-table {
    width: 100%;
    border-collapse: collapse;
}
table.ref-table tr { border-bottom: 1px solid #ececec; }
table.ref-table tr:last-child { border-bottom: none; }
table.ref-table td {
    padding: 6px 12px;
    font-size: 0.8em;
    vertical-align: top;
}
table.ref-table td:first-child {
    font-weight: 600;
    color: #2c2c2c;
    width: 38%;
    white-space: nowrap;
}
table.ref-table td:last-child { color: #555; }
.render-num {
    display: inline-block;
    background: #2c2c2c;
    color: #d4c87a;
    border-radius: 3px;
    font-size: 0.72em;
    font-weight: 700;
    width: 22px;
    text-align: center;
    margin-right: 6px;
    padding: 1px 0;
}
/* Access decision tree */
.decision-block {
    margin: 20px 12px 24px;
    background: #fff;
    border-radius: 6px;
    box-shadow: 0 1px 4px rgba(0,0,0,0.10);
    overflow: hidden;
}
.decision-header {
    background: #8B0000;
    color: #fff;
    padding: 9px 14px;
    font-size: 0.85em;
    font-weight: 700;
    letter-spacing: 0.06em;
    text-transform: uppercase;
}
.decision-body { padding: 12px 14px; font-size: 0.83em; }
.step {
    display: flex;
    gap: 10px;
    margin-bottom: 10px;
    align-items: flex-start;
}
.step-num {
    background: #8B0000;
    color: #fff;
    border-radius: 50%;
    min-width: 22px;
    height: 22px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.8em;
    font-weight: 700;
    flex-shrink: 0;
    margin-top: 1px;
}
.step-text strong { display: block; margin-bottom: 3px; }
.pill {
    display: inline-block;
    border-radius: 3px;
    padding: 1px 7px;
    font-size: 0.85em;
    font-weight: 700;
    color: #fff;
    margin: 2px 3px 2px 0;
}
.pill-red    { background: #C84646; }
.pill-gold   { background: #B8860B; }
.pill-green  { background: #3C783C; }
.pill-grey   { background: #786496; }
footer {
    background: #1a1a1a;
    color: #888;
    text-align: center;
    font-size: 0.74em;
    padding: 12px;
    margin-top: 24px;
}

@media print {
    body { background: #fff; font-size: 12px; }
    header, footer { background: #000 !important; -webkit-print-color-adjust: exact; print-color-adjust: exact; }
    nav { display: none; }
    .section-block, .ref-block, .decision-block {
        margin: 10px 0 0;
        box-shadow: none;
        break-inside: avoid;
    }
    .section-header { -webkit-print-color-adjust: exact; print-color-adjust: exact; }
    .ref-header      { -webkit-print-color-adjust: exact; print-color-adjust: exact; }
    .decision-header { -webkit-print-color-adjust: exact; print-color-adjust: exact; }
    table.legend tr:hover { background: none; }
    svg { -webkit-print-color-adjust: exact; print-color-adjust: exact; }
    td.sym-cell svg { -webkit-print-color-adjust: exact; print-color-adjust: exact; }
}
"""

def section_color(color):
    return f'background:{color};'

def build_nav(sections):
    links = []
    for title, anchor, _, _ in sections:
        short = title.split("—")[-1].strip()
        links.append(f'<a href="#{anchor}">{short}</a>')
    links.append('<a href="#scale-ref">Scale Ref</a>')
    links.append('<a href="#render-order">Render Order</a>')
    links.append('<a href="#access">Access</a>')
    return '<nav>' + ''.join(links) + '</nav>'

def build_section(title, anchor, color, entries):
    rows = []
    for sym, name, desc in entries:
        rows.append(
            f'<tr>'
            f'<td class="sym-cell">{sym}</td>'
            f'<td class="info-cell">'
            f'<div class="layer-name">{name}</div>'
            f'<div class="layer-desc">{desc}</div>'
            f'</td>'
            f'</tr>'
        )
    return (
        f'<div class="section-block" id="{anchor}">'
        f'<div class="section-header" style="{section_color(color)}">{title}</div>'
        f'<table class="legend">{"".join(rows)}</table>'
        f'</div>'
    )

def build_scale_ref():
    rows = []
    for scale, layers in SCALE_REF:
        rows.append(f'<tr><td>{scale}</td><td>{layers}</td></tr>')
    return (
        f'<div class="ref-block" id="scale-ref">'
        f'<div class="ref-header">Scale Visibility Quick Reference</div>'
        f'<table class="ref-table">{"".join(rows)}</table>'
        f'</div>'
    )

def build_render_order():
    rows = []
    for num, name in RENDER_ORDER:
        rows.append(
            f'<tr><td><span class="render-num">{num}</span>{name}</td></tr>'
        )
    return (
        f'<div class="ref-block" id="render-order">'
        f'<div class="ref-header">Layer Rendering Order (bottom ➜ top)</div>'
        f'<table class="ref-table">{"".join(rows)}</table>'
        f'</div>'
    )

def build_access_tree():
    steps = [
        ("Check OWNERSHIP layer color",
         '<span class="pill pill-red">RED</span> Stop — Prohibited. No entry for collecting.<br>'
         '<span class="pill pill-gold">GOLD</span> Verify with agency before going.<br>'
         '<span class="pill pill-green">GREEN</span> Generally open — confirm no special closures.<br>'
         '<span class="pill pill-grey">PURPLE</span> Unknown — verify parcel ownership first.'),
        ("Check MRDS_CO sites in area",
         "Gold star (4mm) = Tier 1 priority — investigate. "
         "Orange circle = Past producer — confirmed mineralization. "
         "Teal/Purple/etc. = Secondary targets by commodity."),
        ("Check MINERAL REGIONS overlay",
         "Gold fill = High/moderate potential zone confirmation. "
         "Pale gold = Low potential — background context only."),
        ("Check GEOLOGY overlay",
         "Cenozoic (green) + Intrusive (purple) = Epithermal/Porphyry context. "
         "Precambrian (teal) = Lode district basement context. "
         "Mesozoic (red) = Uranium-vanadium sedimentary context."),
        ("Plan ROUTE using transport hierarchy",
         "Highway → Major Road → Backcountry Road (OML 3+) → 4WD/Trail. "
         "Avoid Closed (red dashed) roads. Check BLM Gates — may be seasonally locked."),
    ]
    step_html = ""
    for i, (title, body) in enumerate(steps, 1):
        step_html += (
            f'<div class="step">'
            f'<div class="step-num">{i}</div>'
            f'<div class="step-text"><strong>{title}</strong>{body}</div>'
            f'</div>'
        )
    return (
        f'<div class="decision-block" id="access">'
        f'<div class="decision-header">Prospecting Access Decision Tree</div>'
        f'<div class="decision-body">{step_html}</div>'
        f'</div>'
    )

def generate(out_path):
    nav = build_nav(SECTIONS)
    body_parts = []
    for title, anchor, color, entries in SECTIONS:
        body_parts.append(build_section(title, anchor, color, entries))
    body_parts.append(build_scale_ref())
    body_parts.append(build_render_order())
    body_parts.append(build_access_tree())

    html = f"""<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bedrock Sentinel — Field Guide</title>
<style>
{CSS}
</style>
</head>
<body>
<header>
  <h1>Bedrock Sentinel — Portable Field Guide</h1>
  <p>Colorado Prospecting &amp; Field Navigation Map &nbsp;|&nbsp; CRS: EPSG:26913 (NAD83 / UTM Zone 13N) &nbsp;|&nbsp; Last updated: 2026-03-17</p>
</header>
{nav}
{''.join(body_parts)}
<footer>
  Bedrock Sentinel — Colorado Prospecting Navigation Map &nbsp;|&nbsp; Build Status: CARTOGRAPHIC LOCK PENDING &nbsp;|&nbsp; Export Pipeline: PAUSED until lock declared
</footer>
</body>
</html>
"""

    with open(out_path, "w", encoding="utf-8") as f:
        f.write(html)
    print(f"Generated: {out_path}")
    print(f"Size: {os.path.getsize(out_path):,} bytes")


if __name__ == "__main__":
    script_dir = os.path.dirname(os.path.abspath(__file__))
    out = os.path.join(script_dir, "FIELD_GUIDE.html")
    generate(out)
