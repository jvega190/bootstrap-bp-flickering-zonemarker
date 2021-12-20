(function() {
  const accordions = document.querySelectorAll('.ice-accordion');
  const collapseEls = document.querySelectorAll('.ice-accordion-collapse');
  const utils = iceBootstrap.utils;

  // TODO: on initialization(?)
  // Open all collapse components
  const showAccordionItems = () => {
    collapseEls.forEach((collapse) => {
      collapse.classList.add('show');
    });
  }

  const restoreClosedAccordionItems = () => {
    collapseEls.forEach((collapse, index) => {
      if (index !== 0) {
        collapse.classList.remove('show');
      }
    });
  };

  iceBootstrap.register('accordion', {
    onEditModeOn: () => {
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        utils.nodeListRemoveAttribute(buttons, 'data-bs-toggle');
      });
      showAccordionItems();
    },
    onEditModeOff: () => {
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        utils.nodeListSetAttribute(buttons, 'data-bs-toggle', 'collapse');
      });
      restoreClosedAccordionItems();
    }
  });
})();