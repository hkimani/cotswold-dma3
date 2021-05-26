import { useDispatch } from "react-redux";
import { toggleButtonState } from "store/comments/comments";

const { useEffect, useState } = require("react");

function useResponseFilter(survey) {
  const [comments, setComments] = useState([]);
  const [data, setData] = useState([]);
  const dispatch = useDispatch();

  useEffect(() => {
    // To handle failed hydration of unmounted DOM
    const abortCont = new AbortController();

    // If the survey data has not been fetched
    if (!survey) {
      return;
    }

    // Responses received by the users
    var responses = [];

    // Process the survey data to get only relevant data
    const filteredData = survey.choices.map((choice) => {
      var occurrences;
      const total_responses = survey.trivia.length;

      // If the input was custom from the user
      if (choice.choice_text === "Please specify below") {
        // If the input was predefined
        occurrences = survey.trivia.map((entry) => {
          responses.push(entry.other);
          return entry;
        });
      } else {
        // Frequency
        occurrences = survey.trivia.filter((entry) => {
          return entry.choice_text === choice.choice_text;
        });
      }

      const percentage = Math.round(
        (occurrences.length / total_responses) * 100
      );

      // Chart structure
      return { name: choice.choice_text, percentage: percentage };
    });

    // Update data for use in the chart
    setData(filteredData);
    setComments(responses);

    // update state manager (store)
    if (responses.length > 1) {
      dispatch(toggleButtonState(true));
    } else {
      dispatch(toggleButtonState(false));
    }

    // Cleanup function that runs when the Component is unmounted
    return () => {
      abortCont.abort();
    };
  }, [survey, dispatch]);

  // Return filtered data and comments
  return { data, comments };
}

export default useResponseFilter;
