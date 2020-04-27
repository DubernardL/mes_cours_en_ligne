import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// Actions
import { setCours } from '../actions';

class Cours extends Component {

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
      setCours: setCours
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
