<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.div class="px-4 py-5 my-5 text-center">
	<@crafter.img
    $field="image_s"
    class="d-block mx-auto mb-4"
    src="${contentModel.image_s!''}"
    alt=""
    width="${contentModel.imageWidth_i}"
    height="${contentModel.imageHeight_i}"
  />
	<@crafter.h1 class="display-5 fw-bold ${crafter.emptyFieldClass(contentModel.title_s)}" $field="title_s">${contentModel.title_s!''}</@crafter.h1>
	<div class="col-lg-6 mx-auto">
		<@crafter.p class="lead mb-4 ${crafter.emptyFieldClass(contentModel.copy_t)}" $field="copy_t">${contentModel.copy_t!''}</@crafter.p>
    <@crafter.renderComponentCollection
      $field="buttons_o"
      $containerAttributes={ "class": "d-grid gap-2 d-sm-flex justify-content-sm-center" }
      $itemTag="span"
    />
	</div>
</@crafter.div>
