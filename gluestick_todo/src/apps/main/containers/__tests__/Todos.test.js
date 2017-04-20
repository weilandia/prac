/* @flow */

import React from "react";
import { shallow } from "enzyme";

import { Todos } from "apps/main/containers/Todos";

describe("apps/main/containers/Todos", () => {
  it("renders without an issue", () => {
    const subject = <Todos />;
    const wrapper = shallow(subject);
    expect(wrapper).toBeDefined();
  });
});
