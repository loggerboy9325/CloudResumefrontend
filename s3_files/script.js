const getvisitors = async () => {
  try {
    const url =
      "https://xdlucjb9lk.execute-api.us-east-1.amazonaws.com/example/MyDemoResource";
    const res = await fetch(url);
    console.log(res.ok);
    const data = await res.json();
    return data;
  } catch (err) {
    console.error(err);
  }
};

getvisitors();
