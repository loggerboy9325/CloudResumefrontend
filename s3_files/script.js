const API_URL =
  "https://d2fdbbi5e7.execute-api.us-east-1.amazonaws.com/example/mydemoresource";

async function getvisitors() {
  const response = await fetch(API_URL);
  const json = await response.json();
  console.log(json.response);
}

getvisitors();
