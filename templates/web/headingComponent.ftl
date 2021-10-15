<#import "/templates/system/common/crafter.ftl" as crafter />

<@crafter.componentRootTag
    $tag=(contentModel.headingLevel_s!'h2')
    class=crafter.printIfPreview('heading-component-root')
>
    <@crafter.span $field"text_s">${contentModel.text_s}</@crafter.span>
</@crafter.componentRootTag>
