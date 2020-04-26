import React from 'react';
import ReactDOM from 'react-dom';

import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import { logger } from 'redux-logger';
import reduxPromise from 'redux-promise';

// components
import Authorization from './components/authorization';

// reducers
import coursReducer from './reducers/cours_reducer';
import usersReducer from './reducers/users_reducer';

const reducers = combineReducers({
  cours: coursReducer,
  users: usersReducer
});

const middlewares = applyMiddleware(reduxPromise, logger);

ReactDOM.render(
  <Provider store={createStore(reducers, {}, middlewares)}>
    <Authorization />
  </Provider>,
  document.getElementById('react-autho')
);
