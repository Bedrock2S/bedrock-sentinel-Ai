<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.44.7-Solothurn" styleCategories="Symbology">
  <renderer-v2 type="categorizedSymbol" attr="category" enableorderby="0" forceraster="0" referencescale="-1" symbollevels="0" usingSymbolLevels="0">
    <categories>
      <category value="Tier 1 &#x2014; High-Value Prospect" render="true" label="Tier 1 &#x2014; High-Value Prospect" symbol="0"/>
      <category value="Tier 1 &#x2014; Active Mine"          render="true" label="Tier 1 &#x2014; Active Mine"          symbol="1"/>
      <category value="Tier 2 &#x2014; Past Producer"        render="true" label="Tier 2 &#x2014; Past Producer"        symbol="2"/>
      <category value="Gemstone"                             render="true" label="Gemstone"                             symbol="3"/>
      <category value="Uranium"                              render="true" label="Uranium"                              symbol="4"/>
      <category value="Tailings"                             render="true" label="Tailings"                             symbol="5"/>
      <category value="Base Metal Prospect"                  render="true" label="Base Metal Prospect"                  symbol="6"/>
      <category value="Base Metal &#x2014; Active"           render="true" label="Base Metal &#x2014; Active"           symbol="7"/>
      <category value="Base Metal &#x2014; Other"            render="true" label="Base Metal &#x2014; Other"            symbol="8"/>
      <category value="Critical Mineral"                     render="true" label="Critical Mineral"                     symbol="9"/>
      <category value="Industrial / Noise"                   render="true" label="Industrial / Noise"                   symbol="10"/>
      <category value="Prospect &#x2014; Unclassified"       render="true" label="Prospect &#x2014; Unclassified"       symbol="11"/>
      <category value="Past Producer &#x2014; Unclassified"  render="true" label="Past Producer &#x2014; Unclassified"  symbol="12"/>
      <category value="Active &#x2014; Unclassified"         render="true" label="Active &#x2014; Unclassified"         symbol="13"/>
      <category value="Unclassified"                         render="true" label="Unclassified"                         symbol="14"/>
    </categories>
    <symbols>

      <!-- 0: Tier 1 High-Value Prospect — gold star -->
      <symbol name="0" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="255,215,0,255"   type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="star"            type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="180,150,0,255"   type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.2"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="4"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 1: Tier 1 Active Mine — bright orange star -->
      <symbol name="1" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="255,102,0,255"   type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="star"            type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="180,60,0,255"    type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.2"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="4"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 2: Tier 2 Past Producer — bronze circle -->
      <symbol name="2" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="205,127,50,255"  type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="circle"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="140,85,20,255"   type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.2"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="3"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 3: Gemstone — purple diamond -->
      <symbol name="3" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="204,68,255,255"  type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="diamond"         type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="140,0,200,255"   type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.2"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="3.5"             type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 4: Uranium — lime triangle -->
      <symbol name="4" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="0,220,0,255"     type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="triangle"        type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="0,140,0,255"     type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.2"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="3"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 5: Tailings — dark red square -->
      <symbol name="5" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="139,0,0,255"     type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="square"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="80,0,0,255"      type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.2"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="3"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 6: Base Metal Prospect — royal blue circle -->
      <symbol name="6" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="65,105,225,255"  type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="circle"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="30,60,160,255"   type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.2"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="2.5"             type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 7: Base Metal Active — sky blue circle -->
      <symbol name="7" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="0,191,255,255"   type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="circle"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="0,130,180,255"   type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.2"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="2.5"             type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 8: Base Metal Other — light steel blue circle -->
      <symbol name="8" type="marker" alpha="0.8" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="135,206,235,255" type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="circle"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="80,140,180,255"  type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.15"            type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="2"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 9: Critical Mineral — teal circle -->
      <symbol name="9" type="marker" alpha="1" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="0,206,209,255"   type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="circle"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="0,140,145,255"   type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.2"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="3"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 10: Industrial / Noise — gray cross -->
      <symbol name="10" type="marker" alpha="0.5" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="128,128,128,255" type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="cross"           type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="80,80,80,255"    type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.4"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="2"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 11: Prospect Unclassified — pale yellow circle -->
      <symbol name="11" type="marker" alpha="0.7" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="255,255,153,255" type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="circle"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="180,180,80,255"  type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.15"            type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="2"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 12: Past Producer Unclassified — tan circle -->
      <symbol name="12" type="marker" alpha="0.7" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="210,180,140,255" type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="circle"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="150,120,90,255"  type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.15"            type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="2"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 13: Active Unclassified — amber circle -->
      <symbol name="13" type="marker" alpha="0.7" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="255,165,0,255"   type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="circle"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="180,110,0,255"   type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.15"            type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="2"               type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

      <!-- 14: Unclassified — silver circle -->
      <symbol name="14" type="marker" alpha="0.4" clip_to_extent="1" force_rhr="0">
        <data_defined_properties><Option type="Map"><Option name="name" value="" type="QString"/><Option name="properties"/><Option name="type" value="collection" type="QString"/></Option></data_defined_properties>
        <layer class="SimpleMarker" enabled="1" pass="0" locked="0">
          <Option type="Map">
            <Option name="angle"          value="0"               type="QString"/>
            <Option name="color"          value="192,192,192,255" type="QString"/>
            <Option name="joinstyle"      value="miter"           type="QString"/>
            <Option name="name"           value="circle"          type="QString"/>
            <Option name="offset"         value="0,0"             type="QString"/>
            <Option name="offset_unit"    value="MM"              type="QString"/>
            <Option name="outline_color"  value="120,120,120,255" type="QString"/>
            <Option name="outline_style"  value="solid"           type="QString"/>
            <Option name="outline_width"  value="0.1"             type="QString"/>
            <Option name="outline_width_unit" value="MM"          type="QString"/>
            <Option name="size"           value="1.5"             type="QString"/>
            <Option name="size_unit"      value="MM"              type="QString"/>
          </Option>
        </layer>
      </symbol>

    </symbols>
    <rotation/>
    <sizescale/>
  </renderer-v2>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
</qgis>
