import { createSlice } from "@reduxjs/toolkit";

const surveyData = createSlice({
  name: "surveyData",
  initialState: {
    questions: {},
    choices: {},
    selectedQuestion: null,
  },
  reducers: {
    updateSurveyData: (state, action) => {
      state[action.payload.state] = action.payload.data;
    },
    selectQuestion: (state, action) => {
      state.selectedQuestion = action.payload;
    },
    updateChoiceData: (state, action) => {
      state.choices[action.payload.choice.id] = action.payload.choice.data;
    },
  },
});

export const { updateSurveyData, selectQuestion, updateChoiceData } =
  surveyData.actions;
export default surveyData.reducer;
