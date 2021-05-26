import { Box, Button, Grid, Paper } from "@material-ui/core"
import { Link } from "react-router-dom"

function NoMatch() {
    return (
        <Grid style={{
            height: '80vh'
        }} direction="column" container justify="center" alignItems="center">
            <Paper style={{
                borderRadius: '50%'
            }}>
                <Box m={9}>
                    <h1 style={{
                        fontSize: 80,
                        marginTop: 0,
                        marginBottom: 0
                    }}>404</h1>
                    <p style={{
                        fontSize: 20,
                        marginTop: 0,
                    }}>Page not found</p>
                </Box>
            </Paper>

            <p style={{
                marginTop: 30,
                fontSize: 16,
                textAlign: 'center'
            }}> Maybe this page moved? Got deleted? Doesn't exist?</p>

            {/* Go home link */}
            <Link style={{
                textDecoration: 'none'
            }} to="/">
                <Button variant="outlined" color="secondary">
                    Home
                </Button>
            </Link>

        </Grid>
    )
}

export default NoMatch