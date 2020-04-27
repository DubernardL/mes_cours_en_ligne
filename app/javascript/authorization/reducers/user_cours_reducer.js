export default function(state, action) {
  if (state === undefined) {
    return [];
  }

  if (action.type === 'SET_USER_COURS') {
    return action.payload;
  } else {
    return state;
  }

  // if (action.type === 'USER_COURS_CREATED') {
  //   return action.payload;
  // } else {
  //   return state;
  // }
}
