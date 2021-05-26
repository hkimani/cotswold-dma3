import ResponsesList from "./responseList";
import React from "react";
import { BubbleChart } from "components";
import { useSelector } from "react-redux";

function ResponseDialogHandler({ comments, question }) {
  const bubbleShow = useSelector((state) => state.comments.showBubbleChart);

  return (
    <div>
      {/* Custom responses table */}
      {!bubbleShow && comments.length > 0 && (
        <ResponsesList question={question} customResponses={comments} />
      )}

      {/* Bubble chart */}
      {bubbleShow && comments.length > 0 && <BubbleChart comments={comments} />}
    </div>
  );
}

export default ResponseDialogHandler;
