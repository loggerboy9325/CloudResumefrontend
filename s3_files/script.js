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

function fetchStream() {
  const reader = stream.getReader();
  let charsReceived = 0;

  // read() returns a promise that resolves
  // when a value has been received
  reader.read().then(function processText({ done, value }) {
    // Result objects contain two properties:
    // done  - true if the stream has already given you all its data.
    // value - some data. Always undefined when done is true.
    if (done) {
      console.log("Stream complete");
      para.textContent = value;
      return;
    }

    // value for fetch streams is a Uint8Array
    charsReceived += value.length;
    const chunk = value;
    let listItem = document.createElement("li");
    listItem.textContent = `Received ${charsReceived} characters so far. Current chunk = ${chunk}`;
    list2.appendChild(listItem);

    result += chunk;

    // Read some more, and call this function again
    return reader.read().then(processText);
  });
}
