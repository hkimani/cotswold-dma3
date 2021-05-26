import { useMediaQuery, useTheme } from "@material-ui/core";
import { DataGrid } from "@material-ui/data-grid";
import { useDispatch } from "react-redux";
import { selectQuestion } from "store/survey/data";

function GridData({ questions }) {
  // const questions = useSelector((state) => state.survey.questions);
  const dispatch = useDispatch();
  const theme = useTheme();
  const smallScreen = useMediaQuery(theme.breakpoints.down("sm"));

  // Styling for responsivity
  const height = () => {
    return smallScreen ? "50vh" : "73vh";
  };
  // Styling for responsivity end

  // Generate row data
  const rows = questions.map((val, idx) => ({
    id: idx,
    col1: val.question_text,
    qid: val.id,
  }));

  // Columns
  const columns = [
    { field: "col1", headerName: "Survey Questions", width: 570 },
  ];

  // Handle selected row
  const handleSelected = (row) => {
    dispatch(selectQuestion(row.data));
  };

  return (
    <div style={{ height: height(), width: "100%" }}>
      <DataGrid
        onRowSelected={handleSelected}
        pageSize={10}
        rowsPerPageOptions={[10, 20, 30, 50]}
        rows={rows}
        columns={columns}
      />
    </div>
  );
}

export default GridData;
