import axios from "axios";
import { useEffect, useState } from "react";
import { useDispatch } from "react-redux";
import { updateSurveyData, updateChoiceData } from "store/survey/data";

import config from "./config/config";

function useFetch(resource, url) {
  const [isPending, setIsPending] = useState(true);
  const [error, setError] = useState(null);
  const [data, setData] = useState(null);
  const dispatch = useDispatch();

  if (!url) {
    url = `${config().endpoint}/api/v1/survey/${resource}/`; // Note, trailing slash is mandatory for request to work in django
  }

  useEffect(() => {
    // To handle failed hydration of unmounted DOM
    const abortCont = new AbortController();

    axios({
      method: "GET",
      withCredentials: true,
      url,
      headers: {},
      data: {},
    })
      .then((res) => {
        dispatch(updateSurveyData({ state: resource, data: res.data }));
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
  }, [resource, url, dispatch]);

  return { data, isPending, error };
}

function useFetchChoices(qid) {
  const [isPending, setIsPending] = useState(true);
  const [error, setError] = useState(null);
  const [data, setData] = useState(null);
  const dispatch = useDispatch();

  useEffect(() => {
    setIsPending(true);

    // To handle failed hydration of unmounted DOM
    const abortCont = new AbortController();

    axios({
      method: "GET",
      withCredentials: true,
      url: `${config().endpoint}/api/v1/survey/related/choices/?qid=${qid}`,
      headers: {},
      data: {},
    })
      .then((res) => {
        dispatch(
          updateChoiceData({ choice: { qid: res.data.id, data: res.data } })
        );
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
          setError("An error occurred. Please refresh and try again");
          console.log(err.message);
        }
      });

    // Cleanup function that runs when the Component is unmounted
    return () => {
      abortCont.abort();
    };
  }, [dispatch, qid]);

  return { data, isPending, error };
}

export { useFetch, useFetchChoices };
