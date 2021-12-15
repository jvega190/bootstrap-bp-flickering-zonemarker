(function() {
  const forms = document.querySelectorAll('.ice-form'); // TODO: should I add the 'needs validation' option?

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
})();