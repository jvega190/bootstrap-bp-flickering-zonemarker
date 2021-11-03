<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.componentRootTag
  class="container${contentModel.isFluid_b?then('-fluid', '')} ${crafter.printIfIsEmptyCollection(contentModel.components_o)}"
>
  <@crafter.renderComponentCollection $field="components_o" />
</@crafter.componentRootTag>
