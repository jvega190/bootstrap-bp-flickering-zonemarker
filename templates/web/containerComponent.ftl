<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="container${contentModel.isFluid_b?then('-fluid', '')}">
  <@crafter.renderComponentCollection $field="components_o" />
</@crafter.div>
