const API_URL =
  "https://6aap9frpn4.execute-api.us-east-1.amazonaws.com/example/MyDemoResource";

async function getvisitors() {
  const response = await fetch(API_URL);
  const json = await response.json();
  console.log(response.body);
}

getvisitors();
