(function() {
  const buttonsBSProps = {};
  const buttons = document.querySelectorAll('.ice-btn');

  const getButtonBSProps = (button) => {
    return button.getAttributeNames().filter((name) => name.startsWith('data-bs'));
  };

  // Populate buttonsProps
  buttons.forEach((button) => {
    const id = button.getAttribute('id');
    if (Boolean(id)) {
      const bsProps = getButtonBSProps(button);
      const buttonBSProps = {};
      bsProps.forEach((prop) => {
        buttonBSProps[prop] = button.getAttribute(prop);
      });
      buttonsBSProps[id] = buttonBSProps;
    }
  });

  const clearButtonsBSProps = () => {
    buttons.forEach((button) => {
      const buttonBSProps = getButtonBSProps(button);
      buttonBSProps.forEach((prop) => {
        button.removeAttribute(prop);
      });
    });
  }

  const restoreButtonsBSProps = () => {
    buttons.forEach((button) => {
      const id = button.getAttribute('id');
      const buttonBSProps = buttonsBSProps[id];
      Object.entries(buttonBSProps).forEach(([key, value]) => {
        button.setAttribute(key, value);
      });
    });
  }

  iceBootstrap.register('button', {
    iceBypassOn: () => restoreButtonsBSProps(),
    iceBypassOff: () => clearButtonsBSProps(),
    onEditModeOn: () => clearButtonsBSProps(),
    onEditModeOff: () => restoreButtonsBSProps()
  });
})();