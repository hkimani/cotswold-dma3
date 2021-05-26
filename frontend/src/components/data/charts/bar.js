import { makeStyles, useMediaQuery, useTheme } from "@material-ui/core";
import { useFetchChoices } from "api/useFetch";
import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  Legend,
  ResponsiveContainer,
} from "recharts";
import ResponseDialogHandler from "../common/dialogHandler";
import StateHandler from "../common/stateHandler";
import useResponseFilter from "../utils/useResponseFilter";

function CustomTooltip({ payload, label, active }) {
  const useStyles = makeStyles({
    tooltip: {
      backgroundColor: "#FFFFFFc4",
      padding: 6,
      borderRadius: 5,
      color: "black",
    },
    title: {
      fontWeight: 700,
    },
  });

  const classes = useStyles();

  if (active) {
    return (
      <div className={classes.tooltip}>
        <p className={classes.title}>Percentage</p>
        <p>{`${label} : ${payload[0].value}`}</p>
      </div>
    );
  }

  return null;
}

function BargraphComponent({ staticQuestion }) {
  var question = useSelector((state) => state.survey.selectedQuestion);

  const {
    data: survey,
    isPending,
    error,
  } = useFetchChoices(
    staticQuestion ? staticQuestion.qid : question ? question.qid : "9000"
  );

  // For homepage
  if (staticQuestion) {
    question = staticQuestion;
  }

  // Process the survey data
  const { data, comments } = useResponseFilter(survey);

  // Styling for responsivity
  const theme = useTheme();
  const smallScreen = useMediaQuery(theme.breakpoints.down("sm"));
  const smAndUp = useMediaQuery(theme.breakpoints.up("sm"));
  const xsAndUp = useMediaQuery(theme.breakpoints.up("xs"));
  const dimensions = () => {
    if (smAndUp) {
      return { width: 500, height: 350 };
    } else if (xsAndUp) {
      return { width: 320, height: 350 };
    }
  };
  // Styling for responsivity end

  // Graph font color set
  const [fontColor, setFontColor] = useState("");
  useEffect(() => {
    setFontColor(theme.palette.getContrastText(theme.palette.background.paper));
  }, [theme.palette]);

  return (
    <div style={{ width: "100%", height: "70%" }}>
      {/* Common state handlers to be shared across the different charts */}
      <StateHandler question={question} isPending={isPending} error={error} />

      {/* Chart display */}
      {comments.length < 1 && question && !isPending && !error && (
        <ResponsiveContainer {...(smallScreen ? dimensions() : [])}>
          <BarChart
            data={data}
            margin={{
              top: 20,
              right: 30,
              left: 20,
              bottom: 5,
            }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="name" tick={{ fill: fontColor, fontSize: 16 }} />
            <YAxis width={8} />
            <Tooltip content={<CustomTooltip />} />
            <Legend />
            <Bar
              dataKey="percentage"
              fill="#2196f3"
              label={{
                position: "top",
                fill: fontColor,
                fontSize: 16,
                backgroundColor: fontColor,
              }}
            />
          </BarChart>
        </ResponsiveContainer>
      )}

      {/* Responses dialog handler */}
      <ResponseDialogHandler question={question} comments={comments} />
    </div>
  );
}

export default BargraphComponent;
