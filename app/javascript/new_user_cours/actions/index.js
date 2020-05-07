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

export async function setUserCours(user_id) {

  let arr_id = [];
  const response = await fetch('/api/v1/cours_users');
  const data = await response.json();

  for (const c of data) {
    if(c.user_id === user_id) {
      arr_id.push(c.cour_id);
    }
  }
  return {
    type: "SET_USER_COURS",
    payload: getCoursFromUserCours(arr_id)
  }
}

export async function getCoursFromUserCours(arr_id) {

  let user_cours = [];
  const response = await fetch('/api/v1/cours');
  const data = await response.json();

  for (const c of data) {
    arr_id.forEach((id) => {
      if(c.id === id) {
        user_cours.push(c);
      }
    })
  }
  return user_cours;
}

export async function setCours(user_level) {

  let cours = [];
  let cours_id_user = [];

  const resp = await fetch('/api/v1/cours_users');
  const d = await resp.json();
  for(const c of d) {
    cours_id_user.push(c.cour_id);
  }
  const response = await fetch('/api/v1/cours');
  const data = await response.json();

  data.forEach((c) => {
    if(c.level === user_level && !cours_id_user.includes(c.id)) {
      cours.push(c);
    }
  })

  return {
    type: "SET_COURS",
    payload: cours
  }
}

export function createUserCours(user_cours, callback) {
  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(user_cours)
  };

  const promise = fetch('/api/v1/cours_users', options).then(r => r.json()).then(callback);

  return {
    type: "USER_COURS_CREATED",
    payload: promise
  }
}

export async function deleteUserCours(cours_id, user_id, callback) {

  let user_cours_id = [];
  const r = await fetch('/api/v1/cours_users');
  const d = await r.json();
  for (const c of d) {
    if(c.cour_id === cours_id && c.user_id === user_id) {
      user_cours_id.push(c.id);
    }
  }

  const promise = fetch('/api/v1/cours_users/' + user_cours_id[0], { method: 'delete' }).then(r => r.json()).then(callback);

  return {
    type: "USER_COURS_DELETED",
    payload: promise
  }
}

