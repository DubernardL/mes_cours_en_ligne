async function fetchCoursUser() {
  const response = await fetch('/api/v1/cours_users');
  const data = await response.json();
  return data;
}

async function fetchCours() {
  const response = await fetch('/api/v1/cours');
  const data = await response.json();
  return data;
}

function userSelection() {
  const selector = document.getElementById("cours_user_user_id");

  selector.addEventListener('change', (event) => {

    const user_id = parseInt(event.target.options[event.target.selectedIndex].value);

    let cours_user_id = [];
    let cours = [];

    fetchCoursUser()
      .then((data) => {
        data.forEach((d) => {
          if(d.user_id === user_id) {
            cours_user_id.push(d.user_id);
          }
        })
      });

    fetchCours()
      .then((data) => {
        data.forEach((d) => {
          cours.push(d);
        })
      });

    console.log(cours);

    let cours_user = [];
    let cours_dispo = [];

    cours.forEach((c) => {
      cours_user_id.forEach((id) => {
        if(c.id === id) {
          cours_user.push(c);
        }
      })
    })

    cours.forEach((c) => {
      if(c.level === cours_user[0].level) {
        cours_dispo.push(c);
      }
    })

  })
}

userSelection()

export { userSelection };
