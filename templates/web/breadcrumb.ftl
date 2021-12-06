<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign divider = contentModel.divider_s!'>'/>
<@crafter.breadcrumb
  url=contentModel.storeUrl
  containerElementClass="breadcrumb"
  itemWrapperClass="breadcrumb-item"
  navElementAttributes={'style': '--bs-breadcrumb-divider: \'' + divider + '\''}
/>