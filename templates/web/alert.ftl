<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div
  class="alert ${contentModel.type_s!'alert-primary'} ${(contentModel.showCloseButton_b?then('alert-dismissible', ''))}"
  role="alert"
  id="alert-${contentModel.objectId}"
>
  <@crafter.span $field="content_html">
    ${contentModel.content_html!''}
  </@crafter.span>

  <#if contentModel.showCloseButton_b>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </#if>
</@crafter.div>