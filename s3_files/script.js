const API_URL =
  "https://vtp5k401kk.execute-api.us-east-1.amazonaws.com/example/mydemoresource";

async function getvisitors() {
  const response = await fetch(API_URL);
  const json = await response.json();
  console.log(json.body);
  const body = json.body;
  document.getElementById("visit").insertAdjacentHTML("afterbegin", body);
}
getvisitors();
