<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign extraAttributes = {} />
<#if contentModel.collapseID_Toggle_s??>
  <#assign extraAttributes = {
    "data-bs-toggle": "collapse",
    "data-bs-target": "#" + contentModel.collapseID_Toggle_s,
    "aria-expanded": "false",
    "aria-controls": contentModel.collapseID_Toggle_s
  } />
</#if>

<@crafter.tag
  $tag="button"
  type="button"
  class="btn btn-${contentModel.outlined_b?then('outline-', '')}${contentModel.color_s} ${contentModel.size_s!''}"
  $attributes=extraAttributes
>
  <@crafter.span $field="text_s" class="${crafter.emptyFieldClass(contentModel.text_s)}">
    ${contentModel.text_s!''}
  </@crafter.span>
</@crafter.tag>