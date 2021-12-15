(function() {
  const forms = document.querySelectorAll('.ice-form');
  const formsLabelsAttrs = {};

  forms.forEach((form) => {
    const id = form.getAttribute('id');
    const labels = form.querySelectorAll('label');
    const labelsAttrs = {};
    labels.forEach((label) => {
      const index = label.getAttribute('data-craftercms-index');
      labelsAttrs[index] = label.getAttribute('for');
    });
    formsLabelsAttrs[id] = labelsAttrs;
  });

  const disableForm = () => {
    forms.forEach((form) => {
      const labels = form.querySelectorAll('label');
      labels.forEach((label) => {
        label.removeAttribute('for');
      });
      form.querySelector('.ice-submit').removeAttribute('type');
    });
  };

  const restoreForm = () => {
    forms.forEach((form) => {
      const id = form.getAttribute('id');
      const labelsAttrs = formsLabelsAttrs[id];
      const labels = form.querySelectorAll('label');
      labels.forEach((label) => {
        const index = label.getAttribute('data-craftercms-index');
        label.setAttribute('for', labelsAttrs[index]);
      });
      form.querySelector('.ice-submit').setAttribute('type', 'submit');
    });
  }


  // Forms validation
  forms.forEach((form) => {
    form.addEventListener('submit', function (event) {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }

      form.classList.add('was-validated');
    }, false);

    form.addEventListener('change', function(event) {
      const formField = event.target;
      const valid = formField.checkValidity();
      const fieldLabelValidationIndicator = document.querySelector(`[for="${formField.id}"] .form-field-required-indicator`);

      if (valid) {
        fieldLabelValidationIndicator.classList.add('valid');
      } else {
        fieldLabelValidationIndicator.classList.remove('valid');
      }
    });
  })

  iceBootstrap.register('form', {
    iceBypassOn: () => restoreForm(),
    iceBypassOff: () => disableForm(),
    onEditModeOn: () => disableForm(),
    onEditModeOff: () => restoreForm()
  });
})();