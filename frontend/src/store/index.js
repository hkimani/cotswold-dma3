import themeReducer from "store/ui/theme";
import surveyReducer from "store/survey/data";
import commentsReducer from "store/comments/comments";
import { configureStore } from "@reduxjs/toolkit";

const store = configureStore({
  // Combine reducers
  reducer: {
    theme: themeReducer,
    survey: surveyReducer,
    comments: commentsReducer,
  },
});

export default store;
