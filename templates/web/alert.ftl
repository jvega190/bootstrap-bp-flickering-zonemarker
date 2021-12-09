<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div
  class="alert ice-alert ${contentModel.type_s!'alert-primary'} ${(contentModel.showCloseButton_b?then('alert-dismissible', ''))}"
  role="alert"
>
  <@crafter.span $field="content_html" class="${crafter.emptyFieldClass(contentModel.content_html)}">
    ${contentModel.content_html!''}
  </@crafter.span>

  <#if contentModel.showCloseButton_b>
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
  </#if>
</@crafter.div>