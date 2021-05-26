import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import List from "@material-ui/core/List";
import ListItem from "@material-ui/core/ListItem";
import Divider from "@material-ui/core/Divider";
import ListItemText from "@material-ui/core/ListItemText";
import "styles/responses.css";

const useStyles = makeStyles((theme) => ({
  root: {
    backgroundColor: theme.palette.background.paper,
    marginRight: "20px",
    height: "60vh",
    overflowY: "auto",
  },
  inline: {
    display: "inline",
  },
  text: {
    fontSize: 16,
  },
}));

export default function ResponsesList({ question, customResponses }) {
  const classes = useStyles();

  return (
    <List className={`${classes.root} customBar`}>
      {customResponses.map((response, idx) => (
        <div key={idx}>
          {/* List item */}
          <ListItem alignItems="flex-start">
            <ListItemText
              secondary={
                <React.Fragment>
                  <span className={classes.text}>{response}</span>
                </React.Fragment>
              }
            />
          </ListItem>
          <Divider variant="inset" component="li" />
        </div>
      ))}
    </List>
  );
}
