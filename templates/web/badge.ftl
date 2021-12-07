<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.span>
  <@crafter.span $field="content_s" class="badge ${contentModel.backgroundColor_s} ${(contentModel.pillBadge_b?then('rounded-pill', ''))}">
    ${contentModel.content_s!''}
  </@crafter.span>
</@crafter.span>