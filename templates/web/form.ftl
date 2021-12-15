<#import "/templates/system/common/crafter.ftl" as crafter />

<form
  id="${contentModel.formId_s}" <#-- TODO: can this be the objectId? -->
  action=""
  method="post"
  class=""
>
  <@crafter.tag class="${crafter.emptyFieldClass(contentModel.title_s)}" $tag="legend" $field="title_s">
    ${contentModel.title_s}
  </@crafter.tag>

  <@crafter.renderRepeatGroup
    $field="fields_o"
    $containerTag="span"
    $itemTag="div"
    $itemAttributes={ "class": "mb-3" };
    item, index
  >
    <@crafter.tag
      $tag="label"
      $field="fields_o.fieldLabel_s"
      $index=index
      for="${contentModel.formId_s}-${item.fieldName_s}"
      class="form-label ${crafter.emptyFieldClass(item.fieldLabel_s)}"
      style="width: 100%"
    >
      ${item.fieldLabel_s}
      <#if item.required_b>
        <span class="form-field-required-indicator" />
      </#if>
    </@crafter.tag>
    <input
      type="text"
      id="${contentModel.formId_s}-${item.fieldName_s}"
      name="${item.fieldName_s}"
      class="form-control"
      <#if item.required_b?? && item.required_b>required</#if>
    />
  </@crafter.renderRepeatGroup>

  <button type="submit" class="btn btn-primary ${crafter.emptyFieldClass(contentModel.submitLabel_s)}">
    ${contentModel.submitLabel_s}
  </button>
</form>