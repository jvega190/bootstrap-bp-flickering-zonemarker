<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign attributesByIndex = {} />
<@crafter.forEach contentModel.items_o; item, index>
  <#assign itemClasses = "list-group-item ${item.active_b?then('active', '')} ${item.disabled_b?then('disabled', '')} list-group-item-${item.color_s!'default'}" />
  <#assign
    <#-- Used later on the renderRepeatGroup nthItemAttributes. -->
    attributesByIndex = attributesByIndex + { index: { "class": itemClasses } }
  />
</@crafter.forEach>

<@crafter.div>
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "list-group ${contentModel.flush_b?then('list-group-flush', '')} ${contentModel.numbered_b?then('list-group-numbered', '')} ${contentModel.horizontal_b?then('list-group-horizontal', '')}" }
    $nthItemAttributes=attributesByIndex
    $containerTag="ul"
    $itemTag="li";
    item, index
  >
    <@crafter.renderComponentCollection
      $field="content_o"
      $fieldCarryover="items_o"
      $indexCarryover="${index}"
      $containerAttributes={ "class": "d-inline-block" }
      $model=(contentModel + { "content_o": item.content_o })
    />
  </@crafter.renderRepeatGroup>
</@crafter.div>
