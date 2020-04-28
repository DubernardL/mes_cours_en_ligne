import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// CONTAINERS
import UserSelection from './user_selection';
import Cours from './cours';
import UserCours from './user_cours';

// ACTION
import { createUserCours } from '../actions';


class Form extends Component {

  handleSubmit = (event) => {
    event.preventDefault();
    console.log(event);

    createUserCours(body);
  }

  render() {
    return(
      <div>
        <form onSubmit={this.handleSubmit}>
          <UserSelection />
          <div className="d-flex">
            <Cours />
            <UserCours />
          </div>
          <button type="submit">Send</button>
        </form>
      </div>
    )
  }
}

export default (Form);
