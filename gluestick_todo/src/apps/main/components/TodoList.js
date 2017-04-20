/* @flow */

import React, { Component } from "react";
import AddTodo from "./AddTodo";

export default class TodoList extends Component {
  render () {
    const todos = this.renderTodos();
    return (
      <div>
        <AddTodo addTodo={this.props.addTodo} />
        {todos}
      </div>
    );
  }

  renderTodos() {
    if (!this.props.todos) return;
    return this.props.todos.map((todo, index) => {
      return <div key={index}>{todo}</div>;
    });
  }
}
