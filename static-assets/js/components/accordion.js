(function() {
  const accordionsState = {};
  const accordions = document.querySelectorAll('.ice-accordion');
  const utils = iceBootstrap.utils;

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

  iceBootstrap.register('accordion', {
    iceBypassOn: () => {
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        utils.nodeListSetAttribute(buttons, 'data-bs-toggle', 'collapse');
      });
    },
    iceBypassOff: () => {
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        utils.nodeListRemoveAttribute(buttons, 'data-bs-toggle');
      });
    },
    onEditModeOn: () => disableAccordionsToggle(),
    onEditModeOff: () => enableAccordionsToggle()
  });
})();