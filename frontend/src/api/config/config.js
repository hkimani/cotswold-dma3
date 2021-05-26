function config() {
  const dev = process.env.NODE_ENV === "development";

  return {
    endpoint: dev ? "http://localhost:8000" : "http://41.89.64.18:9090",
  };
}

export default config;
