<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign modalAttributes = {
  'aria-labelledby': 'label-${contentModel.objectId}',
  'aria-hidden': 'true'
} />

<#if contentModel.staticBackdrop_b>
    <#assign modalAttributes = modalAttributes + {
      'data-bs-backdrop': 'static',
      'data-bs-keyboard': 'false'
    } />
</#if>

<@crafter.div
  class="modal ice-modal fade"
  id="${contentModel.id_s!''}"
  tabindex="-1"
  $attributes=modalAttributes
>
  <div
    class="modal-dialog modal-dialog-scrollable ${contentModel.size_s!''} ${contentModel.verticallyCentered_b?then('modal-dialog-centered', '')} ${contentModel.fullscreen_b?then('modal-fullscreen', '')}"
  >
    <div class="modal-content">
      <div class="modal-header">
        <@crafter.h5 class="modal-title ${crafter.emptyFieldClass(contentModel.title_s)}" id="label-${contentModel.objectId}">
          ${contentModel.title_s}
        </@crafter.h5>
        <button type="button" class="btn-close ice-btn" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <@crafter.renderComponentCollection $field="content_o" />
      </div>
      <#assign isFooterEmpty = !contentModel.showCloseButton_b || crafter.isEmptyCollection(contentModel.buttons_o) />

      <#if modePreview || !isFooterEmpty>
        <div class="modal-footer">
          <#if contentModel.showCloseButton_b>
            <@crafter.tag
              $tag="button"
              type="button"
              class="btn btn-secondary ice-btn"
              $attributes={ "data-bs-dismiss": "modal" }
            >
              <@crafter.span $field="closeButtonText_s">
                ${contentModel.closeButtonText_s!''}
              </@crafter.span>
            </@crafter.tag>
          </#if>
          <@crafter.renderComponentCollection $containerTag="span" $field="buttons_o" />
        </div>
      </#if>
    </div>
  </div>
</@crafter.div>