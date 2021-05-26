import { Divider, Grid, makeStyles } from "@material-ui/core";
import { Chat, QuestionAnswer } from "@material-ui/icons";
import { useFetch } from "api/useFetch";
import { BarGraph, SummaryCard } from "components";
import { ShowAlertLarge } from "components/alert/alert";
import { CardSkeleton } from "components/skeletons/skeletons";

function Home() {
  const { data, isPending, error } = useFetch("summaries");
  const skeletons = new Array(4).fill(1, 0, 4);

  const useStyles = makeStyles({
    card: {
      marginTop: 10,
      marginBottom: 10,
    },
    divider: {
      marginTop: 30,
      marginBottom: 30,
    },
  });

  const classes = useStyles();

  return (
    <div>
      {/* Error state */}
      {!isPending && !data && error && (
        <ShowAlertLarge
          severity={"error"}
          title={"Data error"}
          message={`${error}`}
        />
      )}

      {/* Row 1 */}
      <Grid container>
        {/* Placeholder */}
        {isPending &&
          !data &&
          !error &&
          skeletons.map((x, idx) => (
            <Grid key={idx} item xs={12} sm={6} md={4} lg={3}>
              <div className={classes.card}>
                <CardSkeleton />
              </div>
            </Grid>
          ))}

        {/* Questions summary */}
        {data && !isPending && !error && (
          <Grid item xs={12} sm={6} md={4} lg={3}>
            <SummaryCard
              color={"#2196f3"}
              title={"Questions"}
              description={"Total number questions asked"}
              data={data.question_count}
            >
              <QuestionAnswer style={{ fontSize: 45 }} />
            </SummaryCard>
          </Grid>
        )}

        {/* Trivia summary */}
        {data && !isPending && !error && (
          <Grid item xs={12} sm={6} md={4} lg={3}>
            <SummaryCard
              color={"#d500f9"}
              title={"Responses"}
              description={"Total number of responses received"}
              data={data.trivia_count}
            >
              <Chat style={{ fontSize: 45 }} />
            </SummaryCard>
          </Grid>
        )}
      </Grid>

      {/* Divider */}
      <Divider className={classes.divider} />

      {/* Row 2 */}
      <Grid container>
        {/* Sexual harassment respondents summary */}
        {data && !isPending && !error && (
          <Grid item xs={12} sm={12} md={6} lg={4}>
            <SummaryCard
              color={"#d500f9"}
              width={380}
              title={"Sexual harassment responses"}
              description={
                "Responses from individuals that have experienced sexual harassment."
              }
              data={data.sh_count}
            >
              <Chat style={{ fontSize: 45 }} />
            </SummaryCard>
          </Grid>
        )}

        {/* Disability respondents summary */}
        {data && !isPending && !error && (
          <Grid item xs={12} sm={12} md={6} lg={4}>
            <SummaryCard
              color={"#d500f9"}
              width={380}
              title={"Living with disability"}
              description={
                "Responses from individuals that are living with disability."
              }
              data={data.d_count}
            >
              <Chat style={{ fontSize: 45 }} />
            </SummaryCard>
          </Grid>
        )}
      </Grid>

      {/* Divider */}
      <Divider className={classes.divider} />

      {/* Age distribution*/}
      <Grid container>
        <Grid item sm={12}>
          <div style={{ height: 500, width: "85%" }}>
            {data && (
              <BarGraph
                staticQuestion={{ col1: "Age distribution in %", qid: 1 }}
              />
            )}
          </div>
        </Grid>
      </Grid>

      {/* Gender distribution*/}
      <Grid container>
        <Grid item sm={12}>
          <div style={{ height: 500, width: "85%" }}>
            {data && (
              <BarGraph
                staticQuestion={{
                  col1: "Gender distribution in %",
                  qid: 2,
                }}
              />
            )}
          </div>
        </Grid>
      </Grid>
    </div>
  );
}

export default Home;
