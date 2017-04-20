/* @flow */

import React, { Component, PropTypes } from "react";
import Radium from "radium";

export default class Home extends Component {
  render () {
    return (
      <div style={styles.header}>
        Hello World!
      </div>
    );
  }
}

const styles = {
  header: {
    color: "purple"
  }
};
