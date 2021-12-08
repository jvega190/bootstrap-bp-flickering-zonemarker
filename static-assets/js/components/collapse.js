window.addEventListener('DOMContentLoaded', () => {
  const toggleButtons = document.querySelectorAll('.btn[data-bs-toggle]');

  const buttonsSetAttribute = (attribute, value) => {
    toggleButtons.forEach((button) => {
      button.setAttribute(attribute, value);
    })
  };

  document.addEventListener('craftercms.editMode', (e) => {
    const isEditMode = e.detail;

    if (isEditMode) {
      buttonsSetAttribute('data-bs-toggle', '');
    } else {
      buttonsSetAttribute('data-bs-toggle', 'collapse');
    }
  });
});