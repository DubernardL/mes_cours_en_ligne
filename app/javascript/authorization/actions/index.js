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
