(function() {
  const accordions = document.querySelectorAll('.ice-accordion');
  const utils = iceBootstrap.utils;

  iceBootstrap.register('accordion', {
    onEditModeOn: () => {
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        utils.nodeListRemoveAttribute(buttons, 'data-bs-toggle');
      });
    },
    onEditModeOff: () => {
      accordions.forEach((accordion) => {
        const buttons = accordion.querySelectorAll('.accordion-button');
        utils.nodeListSetAttribute(buttons, 'data-bs-toggle', 'collapse');
      });
    }
  });
})();