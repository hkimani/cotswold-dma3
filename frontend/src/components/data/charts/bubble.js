import { Chip, makeStyles } from "@material-ui/core";
// import { Alarm, Face } from "@material-ui/icons";
import { useFetchAnalysis } from "api/useFetchAnalysis";
import { ShowAlertLarge } from "components/alert/alert";
import { select, pack, hierarchy, scaleOrdinal, schemeCategory10 } from "d3";
import { useEffect, useState } from "react";

// Get frequency of used tokens
function useHandleTokens(data) {
  const [tokenFrequency, setTokenFrequency] = useState(null);
  useEffect(() => {
    if (!data) {
      return;
    }
    var mapping = {};
    var token_frequency = [];

    // Get frequency of tokens
    data.tokens.forEach((token) => {
      if (mapping[token]) {
        mapping[token] += 1;
      } else {
        mapping[token] = 1;
      }
    });

    // Generate iterable from mapping object
    for (const [key, value] of Object.entries(mapping)) {
      token_frequency.push({ name: key, frequency: value });
    }
    setTokenFrequency(token_frequency);
  }, [data]);

  return tokenFrequency;
}

function BubbleChart({ comments }) {
  // Styling classes
  const useStyles = makeStyles({
    chips: {
      display: "flex",
      flexDirection: "row",
      marginBottom: 10,
    },
  });

  const classes = useStyles();

  // Eliminate unnecessary words
  var rawData = comments.filter((comment) => {
    return comment.length > 3;
  });

  // Trim trailling spaces
  rawData = rawData.map((comment) => {
    return comment.trim();
  });

  // Combine raw data.
  rawData = rawData.join(". ");

  // Make lower case
  rawData = rawData.toLowerCase();

  // Send to serverfor analysis
  const { data, isPending, error } = useFetchAnalysis(rawData);

  // Handle tokens
  const token_data = useHandleTokens(data);

  useEffect(() => {
    const height = 440;
    const width = 700;

    if (!token_data) {
      return;
    }

    const packFunction = (data) =>
      pack()
        .size([width - 2, height - 2])
        .padding(3)(hierarchy({ children: data }).sum((d) => d.frequency));

    const root = packFunction(token_data);

    // Different color schemes for the names
    const color = scaleOrdinal(
      token_data.map((d) => d.name),
      schemeCategory10
    );

    // Clean contents of the svg
    document.getElementById("bubbleChart").innerHTML = "";

    const svg = select("#bubbleChart")
      // .attr("width", width)
      // .attr("height", height)
      .attr("viewBox", `0 0 ${width} ${height}`)
      .attr("font-family", "sans-serif")
      .attr("text-anchor", "middle");

    const leaf = svg
      .selectAll("g")
      .data(root.leaves())
      .join("g")
      .attr("transform", (d) => `translate(${d.x + 1},${d.y + 1})`);

    leaf
      .append("circle")
      .attr("id", (d, i) => (d.leafUid = `circle${i}`).valueOf())
      .attr("r", (d) => d.r)
      .attr("fill-opacity", 0.8)
      .attr("fill", (d) => {
        return color(d.data.name);
      });

    leaf
      .append("clipPath")
      .attr("id", (d, i) => (d.clipUid = `clip${i}`).valueOf())
      .append("use")
      .attr("xlink:href", (d) => `#${d.leafUid}`);

    leaf
      .append("text")
      .attr("clip-path", (d) => `url(#${d.clipUid})`)
      .selectAll("tspan")
      .data((d) => d.data.name.split(" "))
      .join("tspan")
      .attr("x", 0)
      .attr("y", (d, i, nodes) => {
        return `${i - nodes.length / 2 + 0.8}em`;
      })
      .text((d) => d);

    leaf
      .append("title")
      .text((d) => `word: ${d.data.name}. frequency: ${d.data.frequency}`);

    svg.node();
  }, [token_data]);

  return (
    <div style={{ width: "100%", height: "80%" }}>
      {/* Error state */}
      {!isPending && !data && error && (
        <ShowAlertLarge
          severity={"error"}
          title={"Data error"}
          message={`${error}`}
        />
      )}

      {/* Sentiment analysis details */}
      {!isPending && !error && data && (
        <div className={classes.chips}>
          {/* Polarity chip */}
          <Chip
            label={`Overall Polarity: ${data.sentiment.polarity.toFixed(4)}`}
            clickable
            style={{ marginRight: 10 }}
            variant="outlined"
          />

          {/* Subjectivity chip */}
          <Chip
            label={`Overall Subjectivity:  ${data.sentiment.subjectivity.toFixed(
              4
            )}`}
            clickable
            variant="outlined"
          />
          {/* <Divider
            style={{ marginInline: 10 }}
            orientation="vertical"
            flexItem
          />
          <Chip
            icon={<Face />}
            clickable
            color="secondary"
            variant="outlined"
          /> */}
        </div>
      )}

      {/* Chart canvas */}
      {!isPending && !error && data && token_data && (
        <svg id="bubbleChart"></svg>
      )}
    </div>
  );
}

export default BubbleChart;
