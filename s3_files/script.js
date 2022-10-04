const API_URL =
  "https://vjimxc26d8.execute-api.us-east-1.amazonaws.com/example/MyDemoResource";

async function getvisitors() {
  const response = await fetch(API_URL);
  const json = await response.text();
  console.log(text.body);
  const body = text.body;
  document.getElementById("visit").insertAdjacentHTML("afterbegin", body);
}

getvisitors();
