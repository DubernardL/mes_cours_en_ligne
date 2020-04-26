export default function(state, action) {
  if (state === undefined) {
    return [];
  }

  if (action.type === 'SET_COURS') {
    return action.payload;
  } else {
    return state;
  }
}
