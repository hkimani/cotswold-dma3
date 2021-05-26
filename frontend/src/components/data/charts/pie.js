import { useMediaQuery, useTheme } from "@material-ui/core";
import { useFetchChoices } from "api/useFetch";
import React from "react";
import { useSelector } from "react-redux";
import {
  PieChart,
  Pie,
  Tooltip,
  ResponsiveContainer,
  Cell,
  Legend,
} from "recharts";
import ResponseDialogHandler from "../common/dialogHandler";
import StateHandler from "../common/stateHandler";
import useResponseFilter from "../utils/useResponseFilter";

const COLORS = [
  "#2196f3",
  "#e91e63",
  "#4caf50",
  "#ff9800",
  "#9c27b0",
  "#607d8b",
  "#795548",
  "#ffff00",
];

export default function DpieChart() {
  const question = useSelector((state) => state.survey.selectedQuestion);
  const {
    data: survey,
    isPending,
    error,
  } = useFetchChoices(question ? question.qid : "9000");

  // Process the survey data
  const { data, comments } = useResponseFilter(survey);

  // Styling for responsivity
  const theme = useTheme();
  const smallScreen = useMediaQuery(theme.breakpoints.down("sm"));
  const mdAndUp = useMediaQuery(theme.breakpoints.up("md"));
  const smAndUp = useMediaQuery(theme.breakpoints.up("sm"));
  const xsAndUp = useMediaQuery(theme.breakpoints.up("xs"));
  const dimensions = () => {
    if (smAndUp) {
      return { width: 400, height: 350 };
    } else if (xsAndUp) {
      return { width: 300, height: 350 };
    }
  };
  const circleSize = () => {
    if (mdAndUp) {
      return 150;
    } else if (smAndUp) {
      return 120;
    } else if (xsAndUp) {
      return 90;
    }
  };
  // Styling for responsivity end

  return (
    <div style={{ width: "100%", height: "70%" }}>
      {/* Common state handlers to be shared across the different charts */}
      <StateHandler question={question} isPending={isPending} error={error} />

      {/* Chart display */}
      {comments.length < 1 && question && !isPending && !error && (
        <ResponsiveContainer {...(smallScreen ? dimensions() : [])}>
          <PieChart>
            <Pie
              dataKey="percentage"
              isAnimationActive={false}
              data={data}
              cx="50%"
              cy="50%"
              outerRadius={circleSize()}
              fill="#8884d7"
              label
            >
              {data.map((entry, index) => (
                <Cell
                  key={`cell-${index}`}
                  fill={COLORS[index % COLORS.length]}
                />
              ))}
            </Pie>
            <Legend />
            <Tooltip />
          </PieChart>
        </ResponsiveContainer>
      )}

      {/* Responses dialog handler */}
      <ResponseDialogHandler question={question} comments={comments} />
    </div>
  );
}
