function setAuthorization() {
  const selected_user = document.querySelector('#user-select');
  selected_user.addEventListener('change', (event) => {
    console.log(event.originalTarget.selectedOptions[0].value);
  })
}

setAuthorization();

export { setAuthorization };
