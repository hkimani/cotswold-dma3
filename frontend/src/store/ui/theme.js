import { createSlice } from "@reduxjs/toolkit";

const theme = createSlice({
    name: 'themeState',
    initialState: {
        mode: 'dark'
    },
    reducers: {
        changeTheme: (state, action) => {
            if (state.mode === 'dark') {
                state.mode = 'light'
            } else {
                state.mode = 'dark'
            }
        }
    }
})

export const { changeTheme } = theme.actions
export default theme.reducer
