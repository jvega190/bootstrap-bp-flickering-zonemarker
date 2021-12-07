window.addEventListener('DOMContentLoaded', () => {
  const closeButtons = document.querySelectorAll('.alert .btn-close');

  const onKeyup = (e) => {
    if (e.key === 'z') {
      buttonsSetAttribute('data-bs-dismiss', '');
    }
  };
  const onKeydown = (e) => {
    if (e.key === 'z') {
      buttonsSetAttribute('data-bs-dismiss', 'alert');
    }
  };

  const buttonsSetAttribute = (attribute, value) => {
    closeButtons.forEach((button) => {
      button.setAttribute(attribute, value);
    })
  };

  document.addEventListener('craftercms.editMode', (e) => {
    const isEditMode = e.detail;

    if (isEditMode) {
      document.addEventListener('keydown', onKeydown, false);
      document.addEventListener('keyup', onKeyup, false);
      buttonsSetAttribute('data-bs-dismiss', '');
    } else {
      document.removeEventListener('keydown', onKeydown, false);
      document.removeEventListener('keyup', onKeyup, false);
      buttonsSetAttribute('data-bs-dismiss', 'alert');
    }
  });
});