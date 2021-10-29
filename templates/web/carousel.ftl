<#import "/templates/system/common/crafter.ftl" as crafter />

<#assign elementId = "addUniqueIdHere"/>

<@crafter.componentRootTag $tag="div" id=elementId class="carousel slide" data-bs-ride="carousel">
    <#-- Insert your head markup here -->
    <div class="carousel-indicators">
        <#list contentModel.slides_o.item as slide>
            <button type="button" data-bs-target="#${elementId}" data-bs-slide-to="${slide?index}" aria-label="Slide ${slide?index}"></button>
        </#list>
    </div>

    <#-- Macro docs @ https://docs.craftercms.org/en/4.0/search.html?q=renderRepeatCollection&check_keywords=yes&area=default -->
    <@crafter.renderRepeatCollection
      $field="slides_o"
      $containerAttributes={'class': 'carousel-inner'}
      $itemAttributes={'class': 'carousel-item'};
      item, index
    >
      <@crafter.img $field="slides_o.image_s" $index=index src="${item.image_s}" class="d-block w-100" alt="" />
      <div class="carousel-caption d-none d-md-block">
        <@crafter.div $field="slides_o.caption_html" $index=index>${item.caption_html}</@crafter.h5>
      </div>
    </@crafter.renderRepeatCollection>

  <button class="carousel-control-prev" type="button" data-bs-target="#${elementId}" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#${elementId}" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>

</@crafter.componentRootTag>