import { Typography } from "@material-ui/core";
import { Skeleton } from "@material-ui/lab";

function TableSkeleton() {
  const a = new Array(8).fill(1, 0, 8);

  return (
    <div>
      <Typography component="div" variant="h1">
        <Skeleton animation="wave" />
      </Typography>

      {a.map((x, i) => (
        <Skeleton key={i} animation="wave" />
      ))}
    </div>
  );
}

function GraphSkeleton() {
  return (
    <Skeleton
      style={{ marginTop: 28 }}
      height={280}
      width="90%"
      variant="rect"
      animation="wave"
    />
  );
}

function CardSkeleton() {
  return <Skeleton animation="pulse" variant="rect" width={280} height={150} />;
}

export { TableSkeleton, GraphSkeleton, CardSkeleton };
