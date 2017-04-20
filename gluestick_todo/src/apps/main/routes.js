/* @flow */

import React from "react";
import { Route, IndexRoute } from "react-router";
import { ROUTE_NAME_404_NOT_FOUND } from "compiled/gluestick";

import MasterLayout from "./components/MasterLayout";
import HomeApp from "./containers/HomeApp";
import NoMatchApp from "./containers/NoMatchApp";
import Todos from "./containers/Todos";

export default function routes (/*store: Object, httpClient: Object*/) {
  return (
    <Route name="app" component={MasterLayout} path="/">
      <IndexRoute name="home" component={HomeApp} />
      <Route name="todos" component={Todos} path="/todos" />
      <Route name={ROUTE_NAME_404_NOT_FOUND} path="*" component={NoMatchApp} />
    </Route>
  );
}
