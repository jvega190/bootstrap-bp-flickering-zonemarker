<#import "/templates/system/common/crafter.ftl" as crafter />

<style>
  .crafter-alert span >  p {
    margin-bottom: 0;
  }
</style>

<@crafter.div
  class="alert ${contentModel.type_s!'alert-primary'} crafter-alert ${(contentModel.showCloseButton_b?then('alert-dismissible', ''))}"
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

<#if modePreview>
  <script>
    window.addEventListener('DOMContentLoaded', () => {
      const closeButton = document.querySelector('#alert-${contentModel.objectId} .btn-close');

      const onKeyup = (e) => {
        if (e.key === 'z') {
          closeButton.setAttribute('data-bs-dismiss', '');
        }
      };
      const onKeydown = (e) => {
        if (e.key === 'z') {
          closeButton.setAttribute('data-bs-dismiss', 'alert');
        }
      };

      document.addEventListener('craftercms.editMode', (e) => {
        const isEditMode = e.detail;

        if (isEditMode) {
          document.addEventListener('keydown', onKeydown, false);
          document.addEventListener('keyup', onKeyup, false);
          closeButton.setAttribute('data-bs-dismiss', '');
        } else {
          document.removeEventListener('keydown', onKeydown, false);
          document.removeEventListener('keyup', onKeyup, false);
          closeButton.setAttribute('data-bs-dismiss', 'alert');
        }
      });
    });
  </script>
</#if>