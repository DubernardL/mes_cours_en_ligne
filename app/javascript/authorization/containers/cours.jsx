import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

// Actions
import { setCours } from '../actions';

class Cours extends Component {

  render() {
    return(
      <div>
        { this.props.cours.map((c) => {
          return(
            <div key={c.id}>
              <label>
                <input
                  type="radio"
                  name="react-tips"
                  value={c.id}
                  className="form-check-input"
                />
                {c.name}
              </label>
            </div>
            );
          })
        }
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
