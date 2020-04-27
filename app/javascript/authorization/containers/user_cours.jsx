import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// Action
import { setUserCours } from '../actions';

class UserCours extends Component {
  render() {
    return(
        <div>
          <ul>
            { this.props.user_cours.map((user_cour) => {
              return(
                <li key={user_cour.id}>{user_cour.name}</li>
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
      setUserCours: setUserCours
    },
    dispatch
  );
}

function mapStateToProps(state) {
  return {
    user_cours: state.user_cours
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(UserCours);
