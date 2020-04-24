function openCity(evt, options) {
  var i, tabcontent, tablinks;
  tabcontent = document.getElementsByClassName("tabcontent");
  for (i = 0; i < tabcontent.length; i++) {
    tabcontent[i].style.display = "none";
  }
  tablinks = document.getElementsByClassName("tablinks");
  for (i = 0; i < tablinks.length; i++) {
    tablinks[i].className = tablinks[i].className.replace(" active", "");
  }
  document.getElementById(options).style.display = "block";
  evt.currentTarget.className += " active";
}

const tabs = document.querySelectorAll(".tablinks");
tabs.forEach((tab) => {
  tab.addEventListener('click', (e) => {
    openCity(e, e.currentTarget.innerHTML)
  })
})

export { openCity };
