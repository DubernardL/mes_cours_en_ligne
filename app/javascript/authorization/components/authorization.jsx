import React, { Component } from 'react';
import UserSelection from '../containers/user_selection';
import Cours from '../containers/cours';
import UserCours from '../containers/user_cours';

const Authorization = (props) => {
  return (
    <div>
      <UserSelection />
      <div className="d-flex">
        <Cours />
        <UserCours />
      </div>
    </div>
  );
};

export default Authorization;
