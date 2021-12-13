<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.span>
  <@crafter.navigation
    showNavElement=false
    url="${contentModel.url_s!'/site/website'}"
    containerElementClass="nav justify-content-${contentModel.horizontalAlignment_s} ${contentModel.vertical_b?then('flex-column', '')} ${contentModel.pills_b?then('nav-pills', '')} ${contentModel.fill_b?then('nav-fill', '')}"
    itemWrapperClass="nav-item"
    itemClass="nav-link"
    subItemClass="dropdown-item"
    subItemContainerClass="dropdown-menu"
    hasSubItemItemClass="nav-link dropdown-toggle"
    hasSubItemWrapperClass="dropdown"
    hasSubItemItemAttributes={ 'role': 'button', 'data-bs-toggle': 'dropdown', 'aria-expanded': 'false' }
    depth=contentModel.depth_i
  />
</@crafter.span>