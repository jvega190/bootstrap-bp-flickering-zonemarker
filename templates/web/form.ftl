<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.tag
  $tag="form"
  id="form-${contentModel.objectId}"
  action=""
  method="post"
  class="ice-form"
>
  <@crafter.tag class="${crafter.emptyFieldClass(contentModel.title_s)}" $tag="legend" $field="title_s">
    ${contentModel.title_s}
  </@crafter.tag>

  <@crafter.renderRepeatGroup
    $field="fields_o"
    $itemAttributes={ "class": "mb-3" };
    item, index
  >
    <#if item.type_s == 'checkbox'>
      <input
        type="checkbox"
        id="form-${contentModel.objectId}-${item.fieldName_s}"
        name="${item.fieldName_s}"
        <#if item.required_b?? && item.required_b>required</#if>
      />
      <@crafter.tag
        $tag="label"
        $field="fields_o.fieldLabel_s"
        $index=index
        for="form-${contentModel.objectId}-${item.fieldName_s}"
        class="form-check-label ${crafter.emptyFieldClass(item.fieldLabel_s)}"
      >
        ${item.fieldLabel_s}
        <#if item.required_b>
          <span class="form-field-required-indicator" />
        </#if>
      </@crafter.tag>
    <#else>
      <@crafter.tag
        $tag="label"
        $field="fields_o.fieldLabel_s"
        $index=index
        for="form-${contentModel.objectId}-${item.fieldName_s}"
        class="form-label ${crafter.emptyFieldClass(item.fieldLabel_s)}"
        style="width: 100%"
      >
        ${item.fieldLabel_s}
        <#if item.required_b>
          <span class="form-field-required-indicator" />
        </#if>
      </@crafter.tag>

      <#if item.type_s == 'textarea'>
        <textarea
          class="form-control"
          name="${item.fieldName_s}"
          id="form-${contentModel.objectId}-${item.fieldName_s}"
          rows="3"
          <#if item.required_b?? && item.required_b>required</#if>
        ></textarea>
      <#else>
        <input
          type="${item.type_s}"
          id="form-${contentModel.objectId}-${item.fieldName_s}"
          name="${item.fieldName_s}"
          class="${(item.type_s != 'checkbox')?then('form-control', '')}"
          <#if item.required_b?? && item.required_b>required</#if>
        />
      </#if>
    </#if>

    <div id="form-${contentModel.objectId}-${item.fieldName_s}Help" class="form-text">${item.helpBlock_s!''}</div>
  </@crafter.renderRepeatGroup>

  <@crafter.tag
    $tag="button"
    $field="submitLabel_s"
    id="form-${contentModel.objectId}-submit" <#-- ID used by ice to disable it when edit mode is on -->
    type="submit"
    class="ice-btn ice-submit btn btn-primary ${crafter.emptyFieldClass(contentModel.submitLabel_s)}"
  >
    ${contentModel.submitLabel_s}
  </@crafter.tag>
</@crafter.tag>