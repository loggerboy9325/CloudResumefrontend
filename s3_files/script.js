const getvisitors = async () => {
  try {
    const url =
      "https://3w0rcv6178.execute-api.us-east-1.amazonaws.com/example/MyDemoResource";
    const res = await fetch(url);
    console.log(res.ok);
    const data = await res.json();
    console.log(data);
  } catch (err) {
    console.log(err);
  }
};

getvisitors();
