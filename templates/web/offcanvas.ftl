<#import "/templates/system/common/crafter.ftl" as crafter />

<button class="ice-btn btn btn-primary" id="thisisatest" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasExample" aria-controls="offcanvasExample">
  Button with data-bs-target
</button>

<@crafter.div
  class="offcanvas offcanvas-${contentModel.placement_s}"
  tabindex="-1"
  id="offcanvasExample"
  $attributes={
    "aria-labelledby": "offcanvasExampleLabel",
    "data-bs-scroll": "${contentModel.enableScroll_b?then('true', 'false')}",
    "data-bs-backdrop": "${contentModel.showBackdrop_b?then('true', 'false')}"
  }
>
  <div class="offcanvas-header">
    <@crafter.h5
      class="offcanvas-title ${crafter.emptyFieldClass(contentModel.title_s)}"
      id="offcanvasExampleLabel"
    >
        ${contentModel.title_s!''}
    </@crafter.h5>
    <button type="button" class="ice-btn btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    <div>
      <@crafter.renderComponentCollection $field="content_o" />
    </div>
  </div>
</@crafter.div>