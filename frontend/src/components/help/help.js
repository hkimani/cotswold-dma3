import React from "react";
import { withStyles } from "@material-ui/core/styles";
import Tooltip from "@material-ui/core/Tooltip";
import Typography from "@material-ui/core/Typography";
import { IconButton } from "@material-ui/core";
import { HelpOutlineOutlined } from "@material-ui/icons";

const HtmlTooltip = withStyles((theme) => ({
  tooltip: {
    backgroundColor: "#f5f5f9",
    color: "rgba(0, 0, 0, 0.87)",
    maxWidth: 220,
    fontSize: theme.typography.pxToRem(12),
    border: "1px solid #dadde9",
  },
}))(Tooltip);

export default function HelpTooltip({ header, body, marginLeft }) {
  return (
    <div style={{ marginLeft: marginLeft }}>
      <HtmlTooltip
        title={
          <React.Fragment>
            <Typography color="inherit">{header}</Typography>
            {body}
          </React.Fragment>
        }
      >
        <IconButton aria-label="delete">
          <HelpOutlineOutlined />
        </IconButton>
      </HtmlTooltip>
    </div>
  );
}
