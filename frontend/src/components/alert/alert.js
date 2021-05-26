import { makeStyles } from "@material-ui/core";
import { Alert, AlertTitle } from "@material-ui/lab";

const useStyles = makeStyles({
  errorContainer: {
    display: "flex",
    height: "70vh",
    width: "100%",
    justifyContent: "center",
    alignItems: "center",
  },
});

function ShowAlert({ message, severity }) {
  return <Alert severity={severity}>{message}</Alert>;
}

function ShowAlertLarge({ title, message, severity }) {
  const classes = useStyles();

  return (
    <div className={classes.errorContainer}>
      <Alert variant="outlined" severity={severity}>
        <AlertTitle>{title}</AlertTitle>
        {message}
      </Alert>
    </div>
  );
}

export { ShowAlertLarge };
export default ShowAlert;
