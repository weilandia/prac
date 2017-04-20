import React from "react";
import { shallow } from "enzyme";

import AddTodo from "apps/main/components/AddTodo";

describe("apps/main/components/AddTodo", () => {
  it("renders without an issue", () => {
    const subject = <AddTodo />;
    const wrapper = shallow(subject);
    expect(wrapper).toBeDefined();
  });
});
