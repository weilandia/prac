import React from "react";
import { shallow } from "enzyme";

import TodoList from "apps/main/components/TodoList";

describe("apps/main/components/TodoList", () => {
  it("renders without an issue", () => {
    const subject = <TodoList />;
    const wrapper = shallow(subject);
    expect(wrapper).toBeDefined();
  });
});
