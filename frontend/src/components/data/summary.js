import {
  Card,
  CardContent,
  Typography,
  makeStyles,
  Paper,
  Divider,
} from "@material-ui/core";

// Summary Card for the dashboard
function SummaryCard({ children, color, title, description, data, width }) {
  const useStyles = makeStyles({
    root: {
      maxWidth: 280,
      overflow: "visible",
      marginTop: 24,
    },
    paper: {
      display: "flex",
      justifyContent: "center",
      alignItems: "center",
      height: 80,
      width: 80,
      marginBottom: 16,
      backgroundColor: color,
      marginTop: -30,
    },
    row: {
      display: "flex",
      flexDirection: "row",
    },
    column: {
      display: "flex",
      flexDirection: "column",
      textAlign: "end",
      marginLeft: "auto",
    },
  });

  const classes = useStyles();

  return (
    <Card className={classes.root} style={{ maxWidth: width ? width : null }}>
      <CardContent>
        {/* Row */}
        <div className={classes.row}>
          <Paper className={classes.paper} elevation={3}>
            {children}
          </Paper>

          <div className={classes.column}>
            <Typography variant="body1" color="textSecondary" component="div">
              {title}
            </Typography>
            <Typography gutterBottom variant="h4" component="h2">
              {data}
            </Typography>
          </div>
        </div>

        <Divider />

        <Typography
          style={{ marginTop: 16 }}
          variant="body2"
          color="textSecondary"
          component="div"
        >
          {description}
        </Typography>
      </CardContent>
      {/* <CardActions>
        <Button size="small" color="primary">
          Share
        </Button>
        <Button size="small" color="primary">
          Learn More
        </Button>
      </CardActions> */}
    </Card>
  );
}

export default SummaryCard;
