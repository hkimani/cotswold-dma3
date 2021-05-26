import { useState } from "react";
import clsx from "clsx";
import {
  AppBar,
  makeStyles,
  IconButton,
  Toolbar,
  Typography,
  useTheme,
  Drawer,
  Divider,
  List,
  ListItem,
  ListItemIcon,
  ListItemText,
} from "@material-ui/core";
import {
  Apps,
  ChevronLeft,
  ChevronRight,
  Flare,
  HomeOutlined,
  Map,
  Menu as MenuIcon,
  NightsStay,
  SettingsOutlined,
} from "@material-ui/icons";
import { Link } from "react-router-dom";
import { useDispatch, useSelector } from "react-redux";
import { changeTheme } from "../../store/ui/theme";

const drawerWidth = 260;

const useStyles = makeStyles((theme) => ({
  toolbar: {
    display: "flex",
    alignItems: "center",
    justifyContent: "flex-end",
    padding: theme.spacing(0, 1),
    // necessary for content to be below app bar
    ...theme.mixins.toolbar,
  },
  appBar: {
    zIndex: theme.zIndex.drawer + 1,
    transition: theme.transitions.create(["width", "margin"], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
  },
  appBarShift: {
    marginLeft: drawerWidth,
    width: `calc(100% - ${drawerWidth}px)`,
    transition: theme.transitions.create(["width", "margin"], {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen,
    }),
  },
  menuButton: {
    marginRight: 36,
  },
  hide: {
    display: "none",
  },
  drawer: {
    width: drawerWidth,
    flexShrink: 0,
    whiteSpace: "nowrap",
  },
  drawerOpen: {
    width: drawerWidth,
    transition: theme.transitions.create("width", {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.enteringScreen,
    }),
  },
  drawerClose: {
    transition: theme.transitions.create("width", {
      easing: theme.transitions.easing.sharp,
      duration: theme.transitions.duration.leavingScreen,
    }),
    overflowX: "hidden",
    [theme.breakpoints.down("sm")]: {
      width: 0,
    },
    [theme.breakpoints.up("sm")]: {
      width: theme.spacing(8) + 1,
    },
  },
  link: {
    textDecoration: "none",
  },
  title: {
    flexGrow: 1,
  },
}));
// Change theme
function ChangeThemeButton() {
  // Theme mode: dark || light;
  const mode = useSelector((state) => state.theme.mode);
  const dispatch = useDispatch();

  // Changes theme when clicked
  return (
    <IconButton
      style={{ marginRight: 15 }}
      onClick={() => dispatch(changeTheme())}
      aria-label="switch theme"
    >
      {mode === "dark" && <Flare></Flare>}
      {mode === "light" && <NightsStay></NightsStay>}
    </IconButton>
  );
}

function Nav() {
  const classes = useStyles();
  const theme = useTheme();
  const [open, setOpen] = useState(false);

  // Pages
  const pages = [
    { name: "Home", icon: <HomeOutlined />, route: "/" },
    { name: "Dashboard", icon: <Apps />, route: "/dashboard" },
    { name: "Map", icon: <Map />, route: "/map" },
  ];

  // other links
  const otherPages = [
    { name: "Settings", icon: <SettingsOutlined />, route: "/settings" },
  ];

  const handleDrawerOpen = () => {
    setOpen(true);
  };

  const handleDrawerClose = () => {
    setOpen(false);
  };

  return (
    <div>
      {/* clsx: classes will only be applied if a given condition evaluates to true */}
      <AppBar
        color="inherit"
        position="fixed"
        className={clsx(classes.appBar, {
          [classes.appBarShift]: open,
        })}
      >
        <Toolbar>
          {/* Menu Icon */}
          <IconButton
            color="inherit"
            aria-label="open drawer"
            onClick={handleDrawerOpen}
            edge="start"
            className={clsx(classes.menuButton, {
              [classes.hide]: open,
            })}
          >
            <MenuIcon />
          </IconButton>

          {/* Title */}
          <Typography variant="h6" className={classes.title}>
            Digital Matatus Cotswold
          </Typography>

          {/* Dark mode button */}
          <ChangeThemeButton />
        </Toolbar>
      </AppBar>

      <Drawer
        variant="permanent"
        className={clsx(classes.drawer, {
          [classes.drawerOpen]: open,
          [classes.drawerClose]: !open,
        })}
        classes={{
          paper: clsx({
            [classes.drawerOpen]: open,
            [classes.drawerClose]: !open,
          }),
        }}
      >
        {/* Chevron button to control opening and closing */}
        <div className={classes.toolbar}>
          <IconButton onClick={handleDrawerClose}>
            {theme.direction === "rtl" ? <ChevronRight /> : <ChevronLeft />}
          </IconButton>
        </div>

        <Divider />

        {/* Main Links */}
        <List>
          {pages.map((page) => (
            // Link button
            <ListItem
              button
              key={page.name}
              className={classes.link}
              component={Link}
              to={page.route}
            >
              {/* Icon */}
              <ListItemIcon> {page.icon} </ListItemIcon>
              {/* Text*/}
              <ListItemText primary={page.name} />
            </ListItem>
          ))}
        </List>

        <Divider />

        {/* Other links */}
        <List>
          {otherPages.map((page) => (
            <ListItem
              button
              key={page.name}
              className={classes.link}
              to={page.route}
              component={Link}
            >
              {/* Icon */}
              <ListItemIcon> {page.icon} </ListItemIcon>
              {/* Text */}
              <ListItemText primary={page.name} />
            </ListItem>
          ))}
        </List>
      </Drawer>
    </div>
  );
}

export default Nav;
