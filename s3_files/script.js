const API_URL =
  "https://vjimxc26d8.execute-api.us-east-1.amazonaws.com/example/MyDemoResource";

async function getvisitors() {
  const response = await fetch(API_URL);
  const json = await response.json();
  console.log(response.body);
  const body = response.body;
  document.getElementById("visit").insertAdjacentHTML("afterbegin", body);
}

getvisitors();
