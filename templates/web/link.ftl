<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.span>
  <@crafter.a
    $field="text_s"
    href="${contentModel.link_s!''}"
    class="link-${contentModel.color_s} ${crafter.emptyFieldClass(contentModel.text_s)}"
  >
    ${contentModel.text_s}
  </@crafter.a>
</@crafter.span>