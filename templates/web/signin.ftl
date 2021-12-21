<#import "/templates/system/common/crafter.ftl" as crafter />

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>${model.title_t}</title>
    <@crafter.head />
    <link href="/static-assets/css/signin.css" rel="stylesheet">
  </head>
  <body class="text-center">
    <@crafter.body_top />
    <main class="form-signin">
      <form>
        <#if contentModel.logo_s?has_content>
          <@crafter.img
            class="mb-4"
            $field="logo_s"
            src="${contentModel.logo_s!''}"
            width="${contentModel.logoWidth_i!''}"
            height="${contentModel.logoHeight_i!''}"
          />
        </#if>

        <@crafter.h1
          $field="signInLabel_s"
          class="h3 mb-3 fw-normal ${crafter.emptyFieldClass(contentModel.signInLabel_s)}"
        >
          ${contentModel.signInLabel_s!''}
        </@crafter.h1>

        <div class="form-floating">
          <input type="email" class="form-control" name="email" id="floatingInput">
          <label for="floatingInput">${contentModel.emailLabel_s!''}</label>
        </div>
        <div class="form-floating">
          <input type="password" class="form-control" name="password" id="floatingPassword">
          <label for="floatingPassword">${contentModel.passwordLabel_s!''}</label>
        </div>

        <#if contentModel.showRememberMe_b>
          <div class="checkbox mb-3">
            <label>
              <input type="checkbox" value="remember-me" class="${crafter.emptyFieldClass(contentModel.rememberMeLabel_s)}"> ${contentModel.rememberMeLabel_s!''} >
            </label>
          </div>
        </#if>
        <button class="w-100 btn btn-lg btn-primary ${crafter.emptyFieldClass(contentModel.signInButtonLabel_s)}" type="submit">
          <@crafter.span $field="signInButtonLabel_s">${contentModel.signInButtonLabel_s!''}</@crafter.span>
        </button>
      </form>
    </main>
    <#--
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-uWxY/CJNBR+1zjPWmfnSnVxwRheevXITnMqoEIeG1LJrdI0GlVs/9cVSyPYXdcSF" crossorigin="anonymous">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-kQtW33rZJAHjgefvhyyzcGF3C5TFyBQBA13V1RKPf4uH+bwyzQxZ6CmMZHmNBEfJ" crossorigin="anonymous"></script>
      -->
    <link href="/static-assets/css/bootstrap.min.css" rel="stylesheet">
    <script src="/static-assets/js/bootstrap.bundle${crafter.printIfPreview('.min')}.js"></script>
    <@crafter.body_bottom />
  </body>
</html>