<#import "/templates/system/common/crafter.ftl" as crafter />

<#if !crafter.isEmptyCollection(contentModel.items_o)>
  <#assign containerClasses="${(contentModel.flush_b)?then('accordion accordion-flush', 'accordion')}" />

  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "${containerClasses}", "id": "accordion-${contentModel.objectId}" }
    $itemAttributes={ "class": "accordion-item" };
    item, index
  >
    <h2 class="accordion-header" id="heading-${contentModel.objectId}-${index}">
      <button
        class="accordion-button ${(index == 0)?then('', 'collapsed')}"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#collapse-${contentModel.objectId}-${index}"
        ${(index == 0)?then('expanded="true"', '')}
        aria-controls="collapse-${contentModel.objectId}-${index}"
      >
        <@crafter.span $field="items_o.header_s" $index="${index}">${item.header_s!''}</@crafter.span>
      </button>
    </h2>
    <div
      id="collapse-${contentModel.objectId}-${index}"
      class="accordion-collapse collapse ${(index == 0)?then('show', '')}"
      aria-labelledby="heading-${contentModel.objectId}-${index}"
      ${(contentModel.alwaysOpen_b)?then('', 'data-bs-parent="#accordion-${contentModel.objectId}"')}
    >
      <@crafter.div $field="items_o.body_html" $index="${index}" class="accordion-body">
        ${item.body_html!''}
      </@crafter.div>
    </div>
  </@crafter.renderRepeatGroup>

  <#if modePreview>
    <script>
      window.addEventListener('DOMContentLoaded', () => {
        const accordionState = [];
        const accordion = document.querySelector('#accordion-${contentModel.objectId}');
        const buttons = accordion.querySelectorAll('.accordion-button');
        const collapseItems = accordion.querySelectorAll('.accordion-collapse');

        const onKeyup = (e) => {
          if (e.key === 'z') {
            buttons.forEach((button) => {
              button.setAttribute('data-bs-toggle', '');
            });
          }
        };
        const onKeydown = (e) => {
          if (e.key === 'z') {
            buttons.forEach((button) => {
              button.setAttribute('data-bs-toggle', 'collapse');
            });
          }
        };

        // Store the actual state of the accordion (open/closed items).
        buttons.forEach((button) => {
          accordionState.push(!button.classList.contains('collapsed'));
        });

        document.addEventListener('craftercms.editMode', (e) => {
          const isEditMode = e.detail;

          // When on edit mode, open all accordion items, and disable the toggle functionality.
          if (isEditMode) {
            buttons.forEach((button, index) => {
              button.classList.remove('collapsed');
              button.setAttribute('data-bs-toggle', '');

              const collapse = collapseItems[index];
              collapse.classList.add('show');
            });

            document.addEventListener('keydown', onKeydown, false);
            document.addEventListener('keyup', onKeyup, false);
          // When not on edit mode, restore accordion state (open/closed items).
          } else {
            buttons.forEach((button, index) => {
              if (!accordionState[index]) {
                button.classList.add('collapsed');

                const collapse = collapseItems[index];
                collapse.classList.remove('show');
              }
              button.setAttribute('data-bs-toggle', 'collapse');
            });

            document.removeEventListener('keydown', onKeydown, false);
            document.removeEventListener('keyup', onKeyup, false);
          }
        });
      });
    </script>
  </#if>
<#elseif modePreview>
  <style>
    .crafter-accordion-no-items {
      display: none;
    }
    .craftercms-ice-on .crafter-accordion-no-items {
      display: flex;
      justify-content: center;
      align-items: center;
      background: #808080;
      color: #fff;
      font-weight: bold;
      width: 100%;
      height: 200px;
    }
  </style>
    <@crafter.div class="crafter-accordion-no-items">
      No items have been added to the accordion.
    </@crafter.div>
</#if>