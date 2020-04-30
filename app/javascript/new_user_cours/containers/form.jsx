import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// Action
import { setUsers } from '../actions/index';
import { setCours } from '../actions/index';
import { createUserCours } from '../actions/index';


class Form extends Component {

  componentDidMount() {
    this.props.setUsers();
  }

  handleChange = (event) => {
    const selector = document.getElementById('list-user');
    const user_level= selector[selector.selectedIndex].attributes.level.value;

    this.props.setCours(user_level);
  }

  changeCheck = (event) => {
    const selector = document.getElementById('checkbox-cours');
    selector.value = event.currentTarget.value;
  }

  handleSubmit = (event) => {
    event.preventDefault();
    const user_selector = document.getElementById('list-user');
    const user_id = parseInt(user_selector[user_selector.selectedIndex].value);

    const cous_selector = document.getElementById('checkbox-cours');
    const cours_id = parseInt(cous_selector.value);

    let json = {"user_id":user_id,"cour_id":cours_id};
    json =
    this.props.createUserCours(json);
  }

  render() {
    return (
      <div>
        <form onSubmit={this.handleSubmit}>
          <select id="list-user" onChange={this.handleChange}>
            <option value="">--Choisissez un Utilisateur--</option>
           {
              this.props.users.map((user) => {
                return(
                  <option value={user.id} level={user.level} key={user.id}>{user.username}</option>
                );
              })
            }
          </select>

          {
            this.props.cours.map((c) => {
              return(
                <div id="checkbox-cours" value="" key={c.id}>
                  <label htmlFor={c.id}>{c.name}</label>
                  <input
                    id={c.id}
                    type="radio"
                    name="cours"
                    className="form-control"
                    autoComplete="off"
                    value={c.id}
                    onChange={this.changeCheck}
                  />
                </div>
              )
            })
          }

          <button type="submit">Send</button>
        </form>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      setUsers: setUsers,
      setCours: setCours,
      createUserCours: createUserCours
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


export default connect(mapStateToProps, mapDispatchToProps)(Form);
