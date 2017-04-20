/* @flow */

import React, { Component } from "react";

export default class AddTodo extends Component {
  render () {
    return (
      <div>
        <form onSubmit={this.didSubmit}>
          <input type="text" ref={(input) => this.input = input} />
        </form>
      </div>
    );
  }

  didSubmit = (e) => {
    e.preventDefault();
    const newItem = this.input.value;
    this.input.value = "";
    this.props.addTodo(newItem);
  }
}
