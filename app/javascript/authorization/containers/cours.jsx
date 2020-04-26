import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// Actions
import { setUsers } from '../actions';
import { setCours } from '../actions';
import { setUserCours } from '../actions';
import { createUserCours } from '../actions';

class Cours extends Component {

  componentDidMount() {
    this.props.setUsers();
  }

  changeUser = (event) => {
    const list_users = document.getElementById('list-user');
    const options = list_users[list_users.selectedIndex].value;
    const user_id = JSON.parse(options).id;
    const level = JSON.parse(options).level;
    this.props.setCours(level);
    this.props.setUserCours(user_id);
  }

  createUserCours = (event) => {
    const list_users = document.getElementById('list-user');
    const options = list_users[list_users.selectedIndex].value;
    const user_id = JSON.parse(options).id;

    const cours = parseInt(event.currentTarget.attributes.value.value);
    let body = {user_id: user_id, cour_id: cours};
    createUserCours(body);
  }

  render() {
    return(
      <div>
        <label htmlFor="list-user">Modifier les droits </label>
        <select className="user-selector" id="list-user" onChange={this.changeUser}>
          <option value="">--Choisir un utilisateur--</option>
          { this.props.users.map((user) => {
              return(
                  <option value={JSON.stringify(user)} key={user.id}>{user.username}</option>
                );
            })
          }
        </select>

        <div className="d-flex">
          <div className="cours-side">
            <ul>
              { this.props.cours.map((c) => {
                return(
                  <div key={c.id}>
                    <li>{c.name}</li>
                    <a className="cours-link" value={c.id} href="#" onClick={this.createUserCours}>-----></a>
                  </div>
                  );
                })
              }
            </ul>
          </div>

          <div className="cours-side">
            <ul>
              { this.props.user_cours.map((user_cour) => {
                return(
                  <li key={user_cour.name}>{user_cour.name}</li>
                  );
                })
              }
            </ul>
          </div>
        </div>


      </div>
    )
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      setUsers: setUsers,
      setCours: setCours,
      setUserCours: setUserCours
    },
    dispatch
  );
}

function mapStateToProps(state) {
  return {
    users: state.users,
    cours: state.cours,
    user_cours: state.user_cours
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Cours);
