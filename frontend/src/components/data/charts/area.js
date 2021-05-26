import { useMediaQuery, useTheme } from "@material-ui/core";
import { useFetchChoices } from "api/useFetch";
import React, { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import {
  AreaChart,
  Area,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
} from "recharts";
import ResponseDialogHandler from "../common/dialogHandler";
import StateHandler from "../common/stateHandler";
import useResponseFilter from "../utils/useResponseFilter";

export default function CareaChart() {
  const question = useSelector((state) => state.survey.selectedQuestion);
  const {
    data: survey,
    isPending,
    error,
  } = useFetchChoices(question ? question.qid : "9000");

  // Process the survey data
  const { data, comments } = useResponseFilter(survey);

  // Graph font color set
  const [fontColor, setFontColor] = useState("");

  // Styling for responsivity
  const theme = useTheme();
  const smallScreen = useMediaQuery(theme.breakpoints.down("sm"));
  const smAndUp = useMediaQuery(theme.breakpoints.up("sm"));
  const xsAndUp = useMediaQuery(theme.breakpoints.up("xs"));
  const dimensions = () => {
    if (smAndUp) {
      return { width: 550, height: 350 };
    } else if (xsAndUp) {
      return { width: 500, height: 350 };
    }
  };
  // Styling for responsivity end

  useEffect(() => {
    setFontColor(theme.palette.getContrastText(theme.palette.background.paper));
  }, [theme.palette, survey]);

  return (
    <div style={{ width: "100%", height: "70%" }}>
      {/* Common state handlers to be shared across the different charts */}
      <StateHandler question={question} isPending={isPending} error={error} />

      {/* Chart display */}
      {comments.length < 1 && question && !isPending && !error && (
        <ResponsiveContainer {...(smallScreen ? dimensions() : [])}>
          <AreaChart
            data={data}
            margin={{
              top: 10,
              right: 30,
              left: 0,
              bottom: 0,
            }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="name" tick={{ fill: fontColor, fontSize: 16 }} />
            <YAxis />
            <Tooltip />
            <Area
              type="monotone"
              dataKey="percentage"
              stroke="#8884d8"
              fill="#76ff03"
            />
          </AreaChart>
        </ResponsiveContainer>
      )}

      {/* Responses dialog handler */}
      <ResponseDialogHandler question={question} comments={comments} />
    </div>
  );
}
