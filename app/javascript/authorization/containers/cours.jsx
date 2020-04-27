import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// Actions
import { setCours } from '../actions';
import { createUserCours } from '../actions';

class Cours extends Component {

  createUserCours() {
    const cours_selector = document.querySelector('.cours-link');
    const cours_id = cours_selector.attributes.value.value;

    const user_selector = document.querySelector('.user-selector');
    const user_id = JSON.parse(user_selector.options[user_selector.options.selectedIndex].value).id;

    const body = { user_id: user_id, cour_id: parseInt(cours_id) };

    createUserCours(body);
  }

  render() {
    return(
      <div>
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
    )
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators(
    {
      setCours: setCours,
      createUserCours: createUserCours
    },
    dispatch
  );
}

function mapStateToProps(state) {
  return {
    cours: state.cours
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(Cours);
