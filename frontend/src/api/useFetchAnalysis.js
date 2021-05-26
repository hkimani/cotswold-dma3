import axios from "axios";
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import config from "./config/config";

function useFetchAnalysis(comments) {
  const [isPending, setIsPending] = useState(true);
  const [error, setError] = useState(null);
  const [data, setData] = useState(null);
  const dispatch = useDispatch();

  const url = `${config().endpoint}/api/v1/survey/trivia/analysis/`; // Note, trailing slash is mandatory for request to work in django

  useEffect(() => {
    // To handle failed hydration of unmounted DOM
    const abortCont = new AbortController();

    axios({
      method: "POST",
      withCredentials: true,
      url,
      headers: {},
      data: {
        comments,
      },
    })
      .then((res) => {
        setError(null);
        setData(res.data);
        setIsPending(false);
      })
      .catch((err) => {
        if (err.response) {
          setIsPending(false);
          setError(err.response.data);
        } else {
          setIsPending(false);
          setError("Server may be unavailable, please try again !!");
          console.log(err.message);
        }
      });

    // Cleanup function that runs when the Component is unmounted
    return () => {
      abortCont.abort();
    };
  }, [url, dispatch, comments]);

  return { data, isPending, error };
}

export { useFetchAnalysis };
