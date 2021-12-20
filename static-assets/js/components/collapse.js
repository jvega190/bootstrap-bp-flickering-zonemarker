(function() {
  const collapseEls = document.querySelectorAll('.ice-collapse');
  const toggleButtons = document.querySelectorAll('.btn[data-bs-toggle="collapse"]');
  const utils = iceBootstrap.utils;

  // Open all collapse components
  collapseEls.forEach((collapse) => {
    const collapseInstance = bootstrap.Collapse.getOrCreateInstance(collapse);
    collapseInstance.show();
  });

  iceBootstrap.register('collapse', {
    onEditModeOn: () => utils.nodeListRemoveAttribute(toggleButtons, 'data-bs-toggle'),
    onEditModeOff: () => utils.nodeListSetAttribute(toggleButtons, 'data-bs-toggle', 'collapse')
  });
})();