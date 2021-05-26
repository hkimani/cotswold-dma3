import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from "react-redux";

// global styles
import 'styles/index.css';

// Main component
import { App } from 'components/';

// Store
import store from "store";

ReactDOM.render(
  <React.StrictMode>
    {/* Allow access to the store across the whole app */}
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>,
  document.getElementById('root')
);
