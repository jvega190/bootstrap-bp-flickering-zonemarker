(function() {
  const dropdownToggles = document.querySelectorAll('.ice-dropdown .dropdown-toggle');
  const utils = iceBootstrap.utils;

  iceBootstrap.register('dropdown', {
    iceBypassOn: () => utils.nodeListSetAttribute(dropdownToggles, 'data-bs-toggle', 'dropdown'),
    iceBypassOff: () => utils.nodeListRemoveAttribute(dropdownToggles, 'data-bs-toggle'),
    onEditModeOn: () => utils.nodeListRemoveAttribute(dropdownToggles,'data-bs-toggle'),
    onEditModeOff: () => utils.nodeListSetAttribute(dropdownToggles, 'data-bs-toggle', 'dropdown')
  });
})();