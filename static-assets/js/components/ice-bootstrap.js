(function() {
  const registeredComponents = {};
  let isEditMode = false;

  const onKeyup = (e) => {
    if (e.key === 'z') {
      Object.values(registeredComponents).forEach((component) => {
        component.iceBypassOff?.();
      });
    }
  };

  const onKeydown = (e) => {
    if (e.key === 'z') {
      Object.values(registeredComponents).forEach((component) => {
        component.iceBypassOn?.();
      });
    }
  };

  const register = (name, data) => {
    editModeAction();
    registeredComponents[name] = data;
  };

  const deRegister = (name)=> {
    if (registeredComponents[name]) {
      delete registeredComponents[name];
    } else {
      console.log(`'${name}' is not registered`);
    }
  };

  const nodeListSetAttribute = (nodeList, attribute, value) => {
    nodeList.forEach((item) => {
      item.setAttribute(attribute, value);
    });
  };
  const nodeListRemoveAttribute = (nodeList, attribute) => {
    nodeList.forEach((item) => {
      item.removeAttribute(attribute);
    });
  };
  const nodeListAddClass = (nodeList, className) => {
    nodeList.forEach((item) => {
      item.classList.add(className);
    });
  };
  const nodeListRemoveClass = (nodeList, className) => {
    nodeList.forEach((item) => {
      item.classList.remove(className);
    });
  };

  const editModeAction = () => {
    Object.values(registeredComponents).forEach((component) => {
      if (isEditMode) {
        component.onEditModeOn?.();
      } else {
        component.onEditModeOff?.();
      }
    });
  };

  document.addEventListener('craftercms.editMode', (e) => {
    isEditMode = e.detail;
    editModeAction();
    if (isEditMode) {
      document.addEventListener('keydown', onKeydown, false);
      document.addEventListener('keyup', onKeyup, false);
    } else {
      document.removeEventListener('keydown', onKeydown, false);
      document.removeEventListener('keyup', onKeyup, false);
    }
  });

  window.iceBootstrap = {
    isEditMode,
    register,
    deRegister,
    utils: {
      nodeListSetAttribute,
      nodeListRemoveAttribute,
      nodeListAddClass,
      nodeListRemoveClass
    }
  }
})();