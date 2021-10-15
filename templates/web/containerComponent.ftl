<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.componentRootTag class="container${contentModel.isFluid_b?then('-fluid', '')} ${crafter.printIfPreview('container-component-root')}">
  <@crafter.renderComponentCollection $field="components_o" />
</@crafter.componentRootTag>
