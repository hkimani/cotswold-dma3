import { makeStyles, Typography } from "@material-ui/core";
import { useFetch } from "api/useFetch";
import { Loader, ShowAlert } from "components";
// import { MapContainer, TileLayer, Marker, Popup, Circle } from "react-leaflet";
import { map, tileLayer, circle } from "leaflet";
import { useEffect } from "react";

const useStyles = makeStyles({
  container: {
    display: "flex",
    width: "100%",
    justifyContent: "center",
    marginBottom: 16,
  },
  pagination: {
    display: "flex",
    justifyContent: "center",
    marginBottom: 20,
  },
  map: {
    display: "flex",
    justifyContent: "center",
  },
  root: {
    width: "100%",
    height: "75vh",
  },
});

const DEFAULT_LATITUDE = -1.286389;
const DEFUALT_LONGITUDE = 36.817223;

function MapPage() {
  const classes = useStyles();
  // Get the Trivia data (t)
  const { data, isPending, error } = useFetch("all/trivia");

  useEffect(() => {
    var trivia = [];
    if (data) {
      trivia = data.results;
    } else {
      return;
    }

    const position = [DEFAULT_LATITUDE, DEFUALT_LONGITUDE];
    const worldMap = map("worldmap", {
      zoom: 12,
      center: position,
    });

    // Title layer
    tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      attribution:
        'Map data © <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery (c) <a href="https://www.mapbox.com/">Mapbox</a>',
      maxZoom: 18,
    }).addTo(worldMap);

    // Add circles
    trivia.forEach((element) => {
      if (parseFloat(element.longitude)) {
        circle([element.latitude, element.longitude], {
          color: "red",
          opacity: "0.1",
          fillColor: "#f03",
          fillOpacity: 0.1,
          radius: 100,
        }).addTo(worldMap);
      }
    });
  }, [data]);

  return (
    <div>
      {/* Heading */}
      {!isPending && !error && (
        <div className={classes.container}>
          <Typography>
            Survey respondents' distribution in Nairobi and Kiambu County (Red
            Dots)
          </Typography>
        </div>
      )}

      {/* Loader */}
      {isPending && (
        <div
          style={{
            display: "flex",
            width: "100%",
            height: "80vh",
            justifyContent: "center",
            alignItems: "center",
          }}
        >
          <Loader />
        </div>
      )}

      {/* Error  */}
      {error && (
        <div style={{ marginRight: 20, marginTop: 30 }}>
          <ShowAlert
            severity="error"
            message="An error occurred while trying to render the map please refresh the page."
          />
        </div>
      )}

      {/* Map */}
      <div style={{ height: "75vh" }} id="worldmap"></div>
    </div>
  );
}

export default MapPage;
