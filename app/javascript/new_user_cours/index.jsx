import React from 'react';
import ReactDOM from 'react-dom';

import { Provider } from 'react-redux';
import { createStore, combineReducers, applyMiddleware } from 'redux';
import { logger } from 'redux-logger';
import reduxPromise from 'redux-promise';
import { BrowserRouter, Route, Switch } from 'react-router-dom';

// components
import NewUserCours from './components/new_user_cours';

// reducers
import coursReducer from './reducers/cours_reducer';
import usersReducer from './reducers/users_reducer';
import userCoursReducer from './reducers/user_cours_reducer';


const reducers = combineReducers({
  cours: coursReducer,
  users: usersReducer,
  user_cours: userCoursReducer
});

const middlewares = applyMiddleware(reduxPromise, logger);

ReactDOM.render(
  <Provider store={createStore(reducers, {}, middlewares)}>
   <BrowserRouter>
      <Switch>
        <Route path="/cours_users/new" exact component={NewUserCours} />
      </Switch>
    </BrowserRouter>
  </Provider>,
  document.getElementById('react-autho')
);
