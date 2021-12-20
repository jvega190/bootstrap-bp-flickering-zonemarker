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

  iceBootstrap.register('form', {
    iceBypassOn: () => restoreForm(),
    iceBypassOff: () => disableForm(),
    onEditModeOn: () => disableForm(),
    onEditModeOff: () => restoreForm()
  });
})();