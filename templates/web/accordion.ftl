<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign containerClasses="${(contentModel.flush_b)?then('accordion accordion-flush', 'accordion')}" />

<@crafter.div>
  <@crafter.renderRepeatGroup
    $field="items_o"
    $containerAttributes={ "class": "${containerClasses} ice-accordion", "id": "accordion-${contentModel.objectId}" }
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
        <@crafter.span $field="items_o.header_s" $index="${index}" class="${crafter.emptyFieldClass(item.header_s)}">
          ${item.header_s!''}
        </@crafter.span>
      </button>
    </h2>
    <div
      id="collapse-${contentModel.objectId}-${index}"
      class="accordion-collapse collapse ${(index == 0)?then('show', '')}"
      aria-labelledby="heading-${contentModel.objectId}-${index}"
      ${(contentModel.alwaysOpen_b)?then('', 'data-bs-parent="#accordion-${contentModel.objectId}"')}
    >
      <@crafter.renderComponentCollection
        $field="content_o"
        $fieldCarryover="items_o"
        $indexCarryover="${index}"
        $model=(contentModel + { "content_o": item.content_o })
      />
    </div>
  </@crafter.renderRepeatGroup>
</@crafter.div>