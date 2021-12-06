<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="card" style="width: 18rem;">
  <#if contentModel.topImage_s?has_content>
    <@crafter.img src="${contentModel.topImage_s}" class="card-img-top" />
  </#if>
  <#if contentModel.headerContent_html?has_content>
    <@crafter.div $field="headerContent_html" class="card-header">
      ${contentModel.headerContent_html}
    </@crafter.div>
  </#if>
  <#if contentModel.bodyContent_html?has_content>
    <@crafter.div $field="bodyContent_html" class="card-body">
      ${contentModel.bodyContent_html}
    </@crafter.div>
  </#if>
  <#if contentModel.footerContent_html?has_content>
    <@crafter.div $field="footerContent_html" class="card-footer">
      ${contentModel.footerContent_html}
    </@crafter.div>
  </#if>
</@crafter.div>