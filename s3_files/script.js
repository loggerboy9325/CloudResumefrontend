const getvisitors = async () => {
  try {
    const url =
      "https://rf7sqy0lgl.execute-api.us-east-1.amazonaws.com/example/MyDemoResource";
    const res = await fetch(url);
    console.log(res.ok);
    const data = await res.json();
    console.log(data);
    body = data.visitor;
    document.getElementById("visit").insertAdjacentHTML("afterbegin", body);
  } catch (err) {
    console.error(err);
  }
};

getvisitors();
