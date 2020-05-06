export function setUsers() {
  const promise = fetch('/api/v1/users')
    .then(response => response.json())
    .then((data) => {
      return data;
    })

  return {
    type: "SET_USERS",
    payload: promise
  }
}

export async function setCours(user_level) {

  let cours = [];

  const response = await fetch('/api/v1/cours');
  const data = await response.json();

  for (const c of data) {
    if(c.level === user_level) {
      cours.push(c);
    }
  }

  return {
    type: "SET_COURS",
    payload: cours
  }
}

// export async function setUserCours(user_id) {

//   let arr_id = [];
//   const response = await fetch('/api/v1/cours_users');
//   const data = await response.json();

//   for (const c of data) {
//     if(c.user_id === user_id) {
//       arr_id.push(c.cour_id);
//     }
//   }
//   return {
//     type: "SET_USER_COURS",
//     payload: getCoursFromUserCours(arr_id)
//   }
// }


// export async function getCoursFromUserCours(arr_id) {

//   let user_cours = [];
//   const response = await fetch('/api/v1/cours');
//   const data = await response.json();

//   for (const c of data) {
//     arr_id.forEach((id) => {
//       if(c.id === id) {
//         user_cours.push(c);
//       }
//     })
//   }
//   return user_cours;
// }


export async function createUserCours(user_cours) {
  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(user_cours)
  };

  const response = await fetch('/api/v1/cours_users', options);
  console.log(response);
  const data = await response.json();

  return {
    type: 'USER_COURS_CREATED',
    payload: data
  }
}
