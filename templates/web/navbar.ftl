<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.nav class="navbar navbar-expand-lg navbar-${contentModel.textColor_s} bg-${contentModel.backgroundColor_s} ${contentModel.placement_s}">
  <div class="container-fluid">
    <a class="ice-btn navbar-brand" <#if contentModel.brand_link_s?has_content>href="${contentModel.brand_link_s}"</#if>>
      <#if contentModel.brandImage_s?has_content>
        <@crafter.img
          $field="brandImage_s"
          src="${contentModel.brandImage_s}" alt="${contentModel.brandText_s!''}" width="30" height="24"
        />
      </#if>
      <#if contentModel.brandText_s?has_content>
        <@crafter.span $field="brandText_s">${contentModel.brandText_s}</@crafter.span>
      </#if>
    </a>
    <button
      class="ice-btn navbar-toggler"
      type="button"
      data-bs-toggle="collapse"
      data-bs-target="#navbar-${contentModel.objectId}"
      aria-controls="navbar-${contentModel.objectId}"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbar-${contentModel.objectId}">
      <@crafter.navigation
        showNavElement=false
        url="${contentModel.url_s!'/site/website'}"
        containerElementClass="navbar-nav"
        itemWrapperClass="nav-item"
        itemClass="nav-link"
        subItemClass="dropdown-item"
        subItemContainerClass="dropdown-menu"
        hasSubItemItemClass="nav-link dropdown-toggle"
        hasSubItemWrapperClass="dropdown"
        hasSubItemItemAttributes={ 'role': 'button', 'data-bs-toggle': 'dropdown', 'aria-expanded': 'false' }
        depth=contentModel.depth_i
      />
    </div>
  </div>
</@crafter.nav>