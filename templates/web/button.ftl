<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.tag
  $tag="button"
  type="button"
  class="btn btn-${contentModel.outlined_b?then('outline-', '')}${contentModel.color_s} ${contentModel.size_s!''}"
>
  <@crafter.span $field="text_s">
    ${contentModel.text_s!'Button'}
  </@crafter.span>
</@crafter.tag>