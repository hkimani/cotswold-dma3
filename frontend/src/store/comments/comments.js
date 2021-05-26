import { createSlice } from "@reduxjs/toolkit";

const bubbleChartState = createSlice({
  name: "bubbleChartState",
  initialState: {
    showBubbleChart: true,
    commentsActive: false,
  },
  reducers: {
    toggleBubbleState: (state, action) => {
      state.showBubbleChart = !state.showBubbleChart;
    },
    toggleButtonState: (state, action) => {
      state.commentsActive = action.payload;
    },
  },
});

export const { toggleBubbleState, toggleButtonState } =
  bubbleChartState.actions;
export default bubbleChartState.reducer;
