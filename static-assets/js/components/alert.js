(function() {
  const closeButtons = document.querySelectorAll('.ice-alert .btn-close');
  const utils = iceBootstrap.utils;

  iceBootstrap.register('alert', {
    iceBypassOn: () => utils.nodeListSetAttribute(closeButtons, 'data-bs-dismiss', 'alert'),
    iceBypassOff: () => utils.nodeListRemoveAttribute(closeButtons, 'data-bs-dismiss'),
    onEditModeOn: () => utils.nodeListRemoveAttribute(closeButtons, 'data-bs-dismiss'),
    onEditModeOff: () => utils.nodeListSetAttribute(closeButtons, 'data-bs-dismiss', 'alert')
  });
})();