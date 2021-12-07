window.addEventListener('DOMContentLoaded', () => {
  const accordionsState = {};
  const accordions = document.querySelectorAll('.accordion');

  const buttonsSetAttribute = (buttons, attribute, value) => {
    buttons.forEach((button) => {
      button.setAttribute(attribute, value);
    })
  };

  const onKeyup = (e) => {
    if (e.key === 'z') {
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        buttonsSetAttribute(buttons, 'data-bs-toggle', '')
      });
    }
  };
  const onKeydown = (e) => {
    if (e.key === 'z') {
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        buttonsSetAttribute(buttons, 'data-bs-toggle', 'collapse')
      });
    }
  };

  // Populate accordionsState
  accordions.forEach((accordion) => {
    const id = accordion.getAttribute('id');
    accordionsState[id] = [];
    const buttons = accordion.querySelectorAll('.accordion-button');
    buttons.forEach((button) => {
      accordionsState[id].push(!button.classList.contains('collapsed'));
    })
  });

  // Disables the toggle functionality and shows every item in the accordion.
  const disableAccordionsToggle = () => {
    accordions.forEach((accordion) => {
      const buttons = accordion.querySelectorAll('.accordion-button');
      const collapseItems = accordion.querySelectorAll('.accordion-collapse');
      buttons.forEach((button, index) => {
        button.classList.remove('collapsed');
        button.setAttribute('data-bs-toggle', '');

        const collapse = collapseItems[index];
        collapse.classList.add('show');
      });
    });
  };
  // Enables the toggle functionality and restores accordions state (open/closed items).
  const enableAccordionsToggle = () =>{
    accordions.forEach((accordion) => {
      const buttons = accordion.querySelectorAll('.accordion-button');
      const collapseItems = accordion.querySelectorAll('.accordion-collapse');
      const accordionId = accordion.getAttribute('id');
      const accordionState = accordionsState[accordionId];
      buttons.forEach((button, index) => {
        if (!accordionState[index]) {
          button.classList.add('collapsed');

          const collapse = collapseItems[index];
          collapse.classList.remove('show');
        }
        button.setAttribute('data-bs-toggle', 'collapse');
      });
    });
  };

  document.addEventListener('craftercms.editMode', (e) => {
    const isEditMode = e.detail;
    if (isEditMode) {
      disableAccordionsToggle();
      document.addEventListener('keydown', onKeydown, false);
      document.addEventListener('keyup', onKeyup, false);
    } else {
      enableAccordionsToggle();
      document.removeEventListener('keydown', onKeydown, false);
      document.removeEventListener('keyup', onKeyup, false);
    }
  });
});