import {
  Button,
  Grid,
  makeStyles,
  useMediaQuery,
  useTheme,
} from "@material-ui/core";
import { useFetch } from "api/useFetch";
import {
  CdataGrid,
  BarGraph,
  Selector,
  DareaChart,
  DpieChart,
  HelpTooltip,
} from "components";
import { ShowAlertLarge } from "components/alert/alert";
import { GraphSkeleton, TableSkeleton } from "components/skeletons/skeletons";
import { useState } from "react";
import { useDispatch, useSelector } from "react-redux";
import { toggleBubbleState } from "store/comments/comments";

const useStyles = makeStyles((theme) => ({
  root: {
    flexGrow: 1,
  },
  row: {
    display: "flex",
    flexDirection: "row",
    marginBottom: 16,
  },
  dataGridSmall: {
    marginBottom: 20,
  },
  leftPanelHeader: {
    display: "flex",
    flexDirection: "row",
  },
  rightPanel: {
    paddingLeft: 16,
  },
}));

function Dashboard() {
  const dispatch = useDispatch();
  const classes = useStyles();
  const theme = useTheme();
  const smallScreen = useMediaQuery(theme.breakpoints.down("sm"));
  const [chart, setChart] = useState("Bar");
  const [persona, setPersona] = useState("All");
  const commentsActive = useSelector((state) => state.comments.commentsActive);
  const showBubbles = useSelector((state) => state.comments.showBubbleChart);
  const selectedQuestion = useSelector(
    (state) => state.survey.selectedQuestion
  );
  const charts = ["Bar", "Pie", "Area"];
  const personas = ["All", "Sexual Harassment", "Disability", "Common"];
  const staticQuestion = { col1: "Age distribution in %", qid: 1 };
  var questions;

  // Fetch questions
  const { data, isPending, error } = useFetch("questions");

  if (data) {
    // Filter questions based on personas
    questions = data.result.filter((question) => {
      if (persona === personas[0]) {
        return true;
      } else if (persona === personas[1]) {
        return question.persona === 22;
      } else if (persona === personas[2]) {
        return question.persona === 23;
      } else if (persona === personas[3]) {
        return question.persona === 21;
      } else {
        return true;
      }
    });
  }

  // Toggler click
  const handleToggler = () => {
    dispatch(toggleBubbleState());
  };

  return (
    <div className={classes.root}>
      {/* Error state */}
      {!isPending && !data && error && (
        <ShowAlertLarge
          severity={"error"}
          title={"Data error"}
          message={`${error}`}
        />
      )}

      {/* main container */}
      <Grid container>
        {/* Table display for smaller screens */}
        {smallScreen && (
          <Grid item xs={12} className={classes.dataGridSmall}>
            {/* Chart selector */}
            <Selector
              options={personas}
              option={persona}
              setOption={setPersona}
              label="Questions"
            />
            {isPending && !data && !error && <TableSkeleton />}
            {data && !isPending && !error && (
              <CdataGrid questions={questions} />
            )}
          </Grid>
        )}

        {/* Left panel: Table display */}
        {!smallScreen && (
          <Grid item sm={5}>
            {/* Chart selector */}
            {data && !isPending && !error && (
              <div
                style={{
                  display: "flex",
                  flexDirection: "row",
                  alignContent: "center",
                }}
              >
                <Selector
                  options={personas}
                  option={persona}
                  setOption={setPersona}
                  label="Questions"
                />
                <HelpTooltip
                  marginLeft={8}
                  header={"Question categories"}
                  body={
                    "The questions can be filtered by category. Select category to perform filter"
                  }
                />
              </div>
            )}
            {isPending && !data && !error && <TableSkeleton />}
            {data && !isPending && !error && (
              <CdataGrid questions={questions} />
            )}
          </Grid>
        )}

        {/* right panel: Graph display */}
        <Grid item sm={12} md={7} className={classes.rightPanel}>
          {/* Inputs */}
          <div className={classes.leftPanelHeader}>
            {/* Chart selector */}
            {data && !isPending && !error && (
              <Selector
                options={charts}
                option={chart}
                setOption={setChart}
                label="Chart"
              />
            )}

            {/* Conditional button */}
            {commentsActive && (
              <div
                style={{
                  display: "flex",
                  marginLeft: "auto",
                  marginRight: 0,
                  alignItems: "center",
                }}
              >
                <Button
                  onClick={handleToggler}
                  size="medium"
                  variant="outlined"
                  color="secondary"
                >
                  View {showBubbles ? "raw feedback" : "sentiment analysis"}
                </Button>
              </div>
            )}
          </div>

          {/* Data display area */}
          {isPending && !data && !error && <GraphSkeleton />}
          {data && !isPending && !error && chart === "Bar" && (
            <BarGraph
              staticQuestion={selectedQuestion ? null : staticQuestion}
            />
          )}
          {data && !isPending && !error && chart === "Area" && <DareaChart />}
          {data && !isPending && !error && chart === "Pie" && <DpieChart />}
        </Grid>
      </Grid>
    </div>
  );
}

export default Dashboard;
