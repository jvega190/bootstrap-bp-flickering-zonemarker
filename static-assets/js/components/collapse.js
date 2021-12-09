(function() {
  const toggleButtons = document.querySelectorAll('.btn[data-bs-toggle="collapse"]');
  const utils = iceBootstrap.utils;
  iceBootstrap.register('collapse', {
    onEditModeOn: () => utils.nodeListRemoveAttribute(toggleButtons, 'data-bs-toggle'),
    onEditModeOff: () => utils.nodeListSetAttribute(toggleButtons, 'data-bs-toggle', 'collapse')
  });
})();