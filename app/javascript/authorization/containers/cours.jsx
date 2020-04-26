import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// Actions
import { setUsers } from '../actions';
import { setCours } from '../actions';

class Cours extends Component {

  componentDidMount() {
    this.props.setUsers();
  }

  changeUser = (event) => {
    const list_users = document.getElementById('list-user');
    const options = list_users[list_users.selectedIndex].value;
    const level = JSON.parse(options).level;
    this.props.setCours(level);
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

        <div className="cours-side">
          <ul>
            { this.props.cours.map((c) => {
              return(
                <li key={c.id}>{c.name}</li>
                );
              })
            }
          </ul>
        </div>
      </div>
    )
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      setUsers: setUsers,
      setCours: setCours
    },
    dispatch
  );
}

function mapStateToProps(state) {
  return {
    users: state.users,
    cours: state.cours
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Cours);
