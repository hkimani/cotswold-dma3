import {
  unstable_createMuiStrictModeTheme as createMuiTheme,
  makeStyles,
  ThemeProvider,
  CssBaseline,
} from "@material-ui/core";
import { NavBar } from "components";
import { Dashboard, Home, Map, NoMatch } from "pages";
import { useSelector } from "react-redux";

// Routing
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

const useStyles = makeStyles((theme) => ({
  root: {
    display: "flex",
  },
  toolbar: {
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
  },
  content: {
    flexGrow: 1,
    padding: theme.spacing(3),
  },
}));

function App() {
  const classes = useStyles();
  const mode = useSelector((state) => state.theme.mode);

  return (
    <ThemeProvider
      theme={createMuiTheme({
        palette: {
          type: mode,
        },
      })}
    >
      <Router>
        {/* Root component */}
        <div className={classes.root}>
          {/* Resets CSS to a consistent baseline. Allows for restyling that allows all of the elements to look the same across all browsers. */}
          <CssBaseline />

          {/* Navbar component */}
          <NavBar />

          {/* Main page body */}
          <main className={classes.content}>
            {/* Spacer */}
            <div className={classes.toolbar} />

            {/* Conditional rendering of the matching path */}
            <Switch>
              {/* Home */}
              <Route exact path="/">
                <Home />
              </Route>

              {/* Dashboard */}
              <Route exact path="/dashboard">
                <Dashboard />
              </Route>

              {/* Map */}
              <Route exact path="/map">
                <Map />
              </Route>

              {/* 404 */}
              <Route path="*">
                <NoMatch />
              </Route>
            </Switch>
          </main>
        </div>
      </Router>
    </ThemeProvider>
  );
}

export default App;
