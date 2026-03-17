<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.44.7-Solothurn" styleCategories="LayerConfiguration|Symbology|Labeling|Rendering" hasScaleBasedVisibilityFlag="0" minScale="100000000" maxScale="0" simplifyLocal="1" simplifyAlgorithm="0" simplifyDrawingTol="1" simplifyDrawingHints="1" simplifyMaxScale="1" autoRefreshMode="Disabled" autoRefreshTime="0" readOnly="0" labelsEnabled="1" symbologyReferenceScale="-1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
    <Private>0</Private>
  </flags>
  <renderer-v2 type="RuleRenderer" referencescale="-1" enableorderby="0" forceraster="0" symbollevels="0">
    <rules key="{mrds-root-rule}">
      <!-- Tier 1: High-Value Prospect + Active Mine — gold star, dominant, 4.0mm -->
      <rule symbol="0" scalemindenom="1000" scalemaxdenom="75000"
            label="Tier 1 Active/Prospect"
            key="{mrds-tier1}"
            filter="&quot;category&quot; = 'Tier 1 &#x2014; High-Value Prospect' OR &quot;category&quot; = 'Tier 1 &#x2014; Active Mine'"/>
      <!-- Tier 2 Past Producer — orange circle, 3.0mm -->
      <rule symbol="1" scalemindenom="1000" scalemaxdenom="75000"
            label="Tier 2 Past Producer"
            key="{mrds-tier2}"
            filter="&quot;category&quot; = 'Tier 2 &#x2014; Past Producer'"/>
      <!-- Tailings — brown square, 2.5mm -->
      <rule symbol="2" scalemindenom="1000" scalemaxdenom="75000"
            label="Tailings"
            key="{mrds-tailings}"
            filter="&quot;category&quot; = 'Tailings'"/>
      <!-- Base Metal: Prospect + Active + Other — teal circle, 2.5mm -->
      <rule symbol="3" scalemindenom="1000" scalemaxdenom="75000"
            label="Base Metal"
            key="{mrds-basemetal}"
            filter="&quot;category&quot; = 'Base Metal Prospect' OR &quot;category&quot; = 'Base Metal &#x2014; Active' OR &quot;category&quot; = 'Base Metal &#x2014; Other'"/>
      <!-- Critical Mineral — purple diamond, 2.5mm -->
      <rule symbol="4" scalemindenom="1000" scalemaxdenom="75000"
            label="Critical Mineral"
            key="{mrds-critical}"
            filter="&quot;category&quot; = 'Critical Mineral'"/>
      <!-- Gemstone — magenta diamond, 2.5mm -->
      <rule symbol="5" scalemindenom="1000" scalemaxdenom="75000"
            label="Gemstone"
            key="{mrds-gemstone}"
            filter="&quot;category&quot; = 'Gemstone'"/>
      <!-- Uranium — lime green triangle, 2.5mm -->
      <rule symbol="6" scalemindenom="1000" scalemaxdenom="75000"
            label="Uranium"
            key="{mrds-uranium}"
            filter="&quot;category&quot; = 'Uranium'"/>
      <!-- Unclassified: all variants — grey small circle, 1.5mm -->
      <rule symbol="7" scalemindenom="1000" scalemaxdenom="75000"
            label="Unclassified"
            key="{mrds-unclassified}"
            filter="&quot;category&quot; = 'Prospect &#x2014; Unclassified' OR &quot;category&quot; = 'Past Producer &#x2014; Unclassified' OR &quot;category&quot; = 'Active &#x2014; Unclassified' OR &quot;category&quot; = 'Unclassified'"/>
      <!-- Industrial / Noise — INTENTIONALLY OMITTED -->
    </rules>
    <symbols>
      <!-- Symbol 0: Tier 1 Active/Prospect — gold star 4.0mm -->
      <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" is_animated="0" name="0" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{mrds-sym0}" class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="255,200,0,255,rgb:1,0.7843137,0,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="star" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="30,30,30,255,rgb:0.1176471,0.1176471,0.1176471,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="4.0" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <!-- Symbol 1: Tier 2 Past Producer — orange circle 3.0mm -->
      <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" is_animated="0" name="1" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{mrds-sym1}" class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="255,120,0,255,rgb:1,0.4705882,0,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="30,30,30,255,rgb:0.1176471,0.1176471,0.1176471,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="3.0" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <!-- Symbol 2: Tailings — brown square 2.5mm -->
      <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" is_animated="0" name="2" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{mrds-sym2}" class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="140,90,40,255,rgb:0.5490196,0.3529412,0.1568627,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="square" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="30,30,30,255,rgb:0.1176471,0.1176471,0.1176471,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="2.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <!-- Symbol 3: Base Metal — teal circle 2.5mm -->
      <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" is_animated="0" name="3" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{mrds-sym3}" class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="0,200,180,255,rgb:0,0.7843137,0.7058824,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="30,30,30,255,rgb:0.1176471,0.1176471,0.1176471,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="2.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <!-- Symbol 4: Critical Mineral — purple diamond 2.5mm -->
      <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" is_animated="0" name="4" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{mrds-sym4}" class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="180,0,255,255,rgb:0.7058824,0,1,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="diamond" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="30,30,30,255,rgb:0.1176471,0.1176471,0.1176471,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="2.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <!-- Symbol 5: Gemstone — magenta diamond 2.5mm -->
      <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" is_animated="0" name="5" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{mrds-sym5}" class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="230,0,120,255,rgb:0.9019608,0,0.4705882,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="diamond" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="30,30,30,255,rgb:0.1176471,0.1176471,0.1176471,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="2.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <!-- Symbol 6: Uranium — lime green triangle 2.5mm -->
      <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" is_animated="0" name="6" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{mrds-sym6}" class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="80,200,0,255,rgb:0.3137255,0.7843137,0,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="triangle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="30,30,30,255,rgb:0.1176471,0.1176471,0.1176471,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="2.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <!-- Symbol 7: Unclassified — grey small circle 1.5mm -->
      <symbol force_rhr="0" type="marker" frame_rate="10" clip_to_extent="1" is_animated="0" name="7" alpha="1">
        <data_defined_properties>
          <Option type="Map">
            <Option type="QString" value="" name="name"/>
            <Option name="properties"/>
            <Option type="QString" value="collection" name="type"/>
          </Option>
        </data_defined_properties>
        <layer id="{mrds-sym7}" class="SimpleMarker" pass="0" enabled="1" locked="0">
          <Option type="Map">
            <Option type="QString" value="0" name="angle"/>
            <Option type="QString" value="square" name="cap_style"/>
            <Option type="QString" value="140,140,140,255,rgb:0.5490196,0.5490196,0.5490196,1" name="color"/>
            <Option type="QString" value="1" name="horizontal_anchor_point"/>
            <Option type="QString" value="bevel" name="joinstyle"/>
            <Option type="QString" value="circle" name="name"/>
            <Option type="QString" value="0,0" name="offset"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="offset_map_unit_scale"/>
            <Option type="QString" value="MM" name="offset_unit"/>
            <Option type="QString" value="100,100,100,255,rgb:0.3921569,0.3921569,0.3921569,1" name="outline_color"/>
            <Option type="QString" value="solid" name="outline_style"/>
            <Option type="QString" value="0.1" name="outline_width"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="outline_width_map_unit_scale"/>
            <Option type="QString" value="MM" name="outline_width_unit"/>
            <Option type="QString" value="diameter" name="scale_method"/>
            <Option type="QString" value="1.5" name="size"/>
            <Option type="QString" value="3x:0,0,0,0,0,0" name="size_map_unit_scale"/>
            <Option type="QString" value="MM" name="size_unit"/>
            <Option type="QString" value="1" name="vertical_anchor_point"/>
          </Option>
          <data_defined_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
    <data-defined-properties>
      <Option type="Map">
        <Option type="QString" value="" name="name"/>
        <Option name="properties"/>
        <Option type="QString" value="collection" name="type"/>
      </Option>
    </data-defined-properties>
  </renderer-v2>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <customproperties>
    <Option type="Map">
      <Option type="int" value="0" name="embeddedWidgets/count"/>
      <Option name="variableNames"/>
      <Option name="variableValues"/>
    </Option>
  </customproperties>
  <layerGeometryType>0</layerGeometryType>
  <!-- Rule-based labels: Tier 1 site names at close field scale only (1:1k–1:15k) -->
  <labeling type="rule-based">
    <rules key="{mrds-label-root}">
      <rule
        key="{mrds-label-tier1}"
        description="Tier 1 Site Name"
        filter="&quot;category&quot; = 'Tier 1 &#x2014; High-Value Prospect' OR &quot;category&quot; = 'Tier 1 &#x2014; Active Mine'"
        scalemindenom="1000"
        scalemaxdenom="15000">
        <settings calloutType="simple">
          <text-style
            fontFamily="Arial"
            fontWeight="75"
            fontSize="7"
            fontSizeUnit="Point"
            textColor="30,30,30,255"
            namedStyle="Bold"
            fieldName="site_name"
            isExpression="0"
            textOpacity="1"
            allowHtml="0"
            fontItalic="0"
            fontUnderline="0"
            fontStrikeout="0"
            fontKerning="1"
            fontLetterSpacing="0"
            fontWordSpacing="0"
            fontSizeMapUnitScale="3x:0,0,0,0,0,0"
            blendMode="0"
            multilineHeight="1"
            textOrientation="horizontal"
            previewBkgrdColor="255,255,255,255"
            capitalization="0"
            legendString="Aa"
            useSubstitutions="0">
            <text-buffer
              bufferDraw="1"
              bufferSize="0.8"
              bufferSizeUnits="MM"
              bufferColor="250,250,250,255"
              bufferOpacity="1"
              bufferNoFill="0"
              bufferBlendMode="0"
              bufferJoinStyle="128"
              bufferSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <text-mask
              maskEnabled="0"
              maskOpacity="1"
              maskSize="0"
              maskSizeUnits="MM"
              maskType="0"
              maskJoinStyle="128"
              maskSizeMapUnitScale="3x:0,0,0,0,0,0"/>
            <background shapeDraw="0" shapeType="0"/>
            <shadow shadowDraw="0"/>
            <dd_properties>
              <Option type="Map">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
            </dd_properties>
            <substitutions/>
          </text-style>
          <text-format
            placeDirectionSymbol="0"
            wrapChar=""
            rightDirectionSymbol=">"
            formatNumbers="0"
            addDirectionSymbol="0"
            reverseDirectionSymbol="0"
            leftDirectionSymbol="&lt;"
            plussign="0"
            decimals="3"
            multilineAlign="3"
            autoWrapLength="0"
            useMaxLineLengthForAutoWrap="1"/>
          <placement
            placement="0"
            placementFlags="10"
            centroidWhole="0"
            centroidInside="0"
            offsetType="0"
            xOffset="0"
            yOffset="0"
            offsetUnits="MM"
            dist="0"
            distUnits="MM"
            distMapUnitScale="3x:0,0,0,0,0,0"
            fitInPolygonOnly="0"
            rotationAngle="0"
            repeatDistance="0"
            repeatDistanceUnits="MM"
            repeatDistanceMapUnitScale="3x:0,0,0,0,0,0"
            overrunDistance="0"
            overrunDistanceUnit="MM"
            overrunDistanceMapUnitScale="3x:0,0,0,0,0,0"
            layerType="PointGeometry"
            quadOffset="4"
            priority="10"
            predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR"
            lineAnchorPercent="0.5"
            lineAnchorType="0"
            lineAnchorClipping="0"
            maxCurvedCharAngleIn="25"
            maxCurvedCharAngleOut="-25"
            polygonPlacementFlags="2"
            allowDegraded="0"
            geometryGenerator=""
            geometryGeneratorEnabled="0"
            geometryGeneratorType="PointGeometry"
            labelOffsetMapUnitScale="3x:0,0,0,0,0,0"
            overlapHandling="PreventOverlap"/>
          <rendering
            fontMinPixelSize="3"
            fontMaxPixelSize="10000"
            scaleVisibility="1"
            scaleMin="1000"
            scaleMax="15000"
            limitNumLabels="0"
            maxNumLabels="2000"
            minFeatureSize="0"
            obstacle="1"
            obstacleFactor="1"
            obstacleType="1"
            drawLabels="1"
            upsidedownLabels="0"
            labelPerPart="0"
            mergeLines="0"
            displayAll="0"
            zIndex="0"
            unplacedVisibility="0"/>
          <dd_properties>
            <Option type="Map">
              <Option type="QString" value="" name="name"/>
              <Option name="properties"/>
              <Option type="QString" value="collection" name="type"/>
            </Option>
          </dd_properties>
          <callout type="simple">
            <Option type="Map">
              <Option type="QString" value="pole_of_inaccessibility" name="anchorPoint"/>
              <Option type="int" value="0" name="blendMode"/>
              <Option type="Map" name="ddProperties">
                <Option type="QString" value="" name="name"/>
                <Option name="properties"/>
                <Option type="QString" value="collection" name="type"/>
              </Option>
              <Option type="bool" value="false" name="drawToAllParts"/>
              <Option type="QString" value="0" name="enabled"/>
              <Option type="QString" value="point_on_exterior" name="labelAnchorPoint"/>
              <Option type="QString" value="&lt;symbol alpha=&quot;1&quot; type=&quot;line&quot; name=&quot;&quot; clip_to_extent=&quot;1&quot; force_rhr=&quot;0&quot; frame_rate=&quot;10&quot; is_animated=&quot;0&quot;>&lt;data_defined_properties>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;&quot; name=&quot;name&quot;/>&lt;Option name=&quot;properties&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;collection&quot; name=&quot;type&quot;/>&lt;/Option>&lt;/data_defined_properties>&lt;layer class=&quot;SimpleLine&quot; pass=&quot;0&quot; enabled=&quot;1&quot; locked=&quot;0&quot;>&lt;Option type=&quot;Map&quot;>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;align_dash_pattern&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;square&quot; name=&quot;capstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;5;2&quot; name=&quot;customdash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;customdash_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;customdash_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;dash_pattern_offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;dash_pattern_offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;dash_pattern_offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;draw_inside_polygon&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;bevel&quot; name=&quot;joinstyle&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;60,60,60,255&quot; name=&quot;line_color&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;solid&quot; name=&quot;line_style&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0.3&quot; name=&quot;line_width&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;line_width_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;offset&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;offset_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;offset_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;ring_filter&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_end&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_end_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_end_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;trim_distance_start&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;trim_distance_start_map_unit_scale&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;MM&quot; name=&quot;trim_distance_start_unit&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;tweak_dash_pattern_on_corners&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;0&quot; name=&quot;use_custom_dash&quot;/>&lt;Option type=&quot;QString&quot; value=&quot;3x:0,0,0,0,0,0&quot; name=&quot;width_map_unit_scale&quot;/>&lt;/Option>&lt;/layer>&lt;/symbol>" name="lineSymbol"/>
              <Option type="double" value="0" name="minLength"/>
              <Option type="QString" value="MM" name="minLengthUnit"/>
              <Option type="QString" value="3x:0,0,0,0,0,0" name="minLengthMapUnitScale"/>
            </Option>
          </callout>
        </settings>
      </rule>
    </rules>
  </labeling>
</qgis>
