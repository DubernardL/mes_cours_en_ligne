import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// Action
import { setUsers } from '../actions/index';
import { setUserCours } from '../actions/index';
import { setCours } from '../actions/index';
import { createUserCours } from '../actions/index';
import { deleteUserCours } from '../actions/index';

class Form extends Component {

  componentDidMount() {
    this.props.setUsers();
  }

  handleChange = (event) => {
    const selector = document.getElementById('list-user');
    const user_level = selector[selector.selectedIndex].attributes.level.value;
    const user_id = parseInt(selector[selector.selectedIndex].attributes.value.value);

    this.props.setUserCours(user_id);
    this.props.setCours(user_level, user_id);
  }

  changeCheck = (event) => {
    const selector = document.getElementById('checkbox-cours');
    selector.value = event.currentTarget.value;

    const class_selector = document.querySelectorAll(".label-radio");
    class_selector.forEach((c) => {
      c.classList.remove('checked');
    })
    event.currentTarget.parentElement.classList.add('checked');
  }

  handleSubmit = (event) => {
    event.preventDefault();
    const user_selector = document.getElementById('list-user');
    const user = parseInt(user_selector[user_selector.selectedIndex].value);
    const cous_selector = document.getElementById('checkbox-cours');
    const cours = parseInt(cous_selector.value);

    const json = {"user_id": user, "cour_id": cours};

    this.props.createUserCours(json, () => {
      this.props.setUserCours(user);
      const selector = document.getElementById('list-user');
      const user_level = selector[selector.selectedIndex].attributes.level.value;
      const user_id = parseInt(selector[selector.selectedIndex].attributes.value.value);
      this.props.setCours(user_level, user_id);
    });
  }

  deleteCours = (event) => {
    const selector = document.getElementById('list-user');
    const user_id = parseInt(selector[selector.selectedIndex].attributes.value.value);
    const cours_id = parseInt(event.currentTarget.value);
    this.props.deleteUserCours(cours_id, user_id, () => {
      this.props.setUserCours(user_id);
      const selector = document.getElementById('list-user');
      const user_level = selector[selector.selectedIndex].attributes.level.value;
      this.props.setCours(user_level, user_id)
    });
  }

  render() {
    return (
      <div className="general-div row">
        <form onSubmit={this.handleSubmit} className="col-sm">
          <label htmlFor='list-user'>Utilisateur : </label>
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
          <br />

          <div className="cours-btn">
            <div className="list-cours">
              <h5 className="title-aut">Cours disponibles pour ce niveau :</h5>
              {
                this.props.cours.map((c) => {
                  return(
                    <div id="checkbox-cours" value="" key={c.id}>
                      <label className="label-radio " htmlFor={c.id}>
                      {c.name}
                      <input
                        id={c.id}
                        type="radio"
                        name="cours"
                        className="form-control radio-btn"
                        autoComplete="off"
                        value={c.id}
                        onChange={this.changeCheck}
                      />
                      </label>
                    </div>
                  )
                })
              }
            </div>
            <button className="add-btn" type="submit"><i className="far fa-arrow-alt-circle-right"></i></button>
          </div>
        </form>

        <div className="container col-sm div-cours-user">
          <ul className="list-cours-user">
            <h5 className="title-aut">Cours autorisés pour l'utilisateur :</h5>
            {
              this.props.user_cours.map((cours) => {
                return(
                  <div key={cours.id} className="cours-user-item">
                    <li>{cours.name}</li>
                    <button className="delete-btn" value={cours.id} onClick={this.deleteCours}><i className="fas fa-minus-circle"></i></button>
                  </div>
                )
              })
            }
          </ul>
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      setUserCours: setUserCours,
      setUsers: setUsers,
      setCours: setCours,
      createUserCours: createUserCours,
      deleteUserCours: deleteUserCours
    },
    dispatch
  );
}

function mapStateToProps(state) {
  return {
    user_cours: state.user_cours,
    users: state.users,
    cours: state.cours
  }
}


export default connect(mapStateToProps, mapDispatchToProps)(Form);
