import { Typography } from "@material-ui/core";
import { Loader, ShowAlert } from "components";

function StateHandler({ question, isPending, error }) {
  return (
    <div>
      {/* Welcome message */}
      {!question && (
        <Typography variant="h5" gutterBottom style={{ marginBottom: 24 }}>
          Select a survey question to get started
        </Typography>
      )}

      {/* Question text */}
      {question && (
        <Typography variant="body1" gutterBottom style={{ marginBottom: 10 }}>
          {question.col1}
        </Typography>
      )}

      {/* Loader */}
      {isPending && <Loader />}

      {/* Error message alert */}
      {!isPending && error && (
        <div style={{ marginRight: 20, marginTop: 30 }}>
          <ShowAlert severity="error" message={error} />
        </div>
      )}

      {/* Info alert */}
      {!isPending && !error && !question && (
        <div style={{ marginRight: 20, marginTop: 30 }}>
          <ShowAlert
            severity="info"
            message="Select a question to view the visualization"
          />
        </div>
      )}
    </div>
  );
}

export default StateHandler;
