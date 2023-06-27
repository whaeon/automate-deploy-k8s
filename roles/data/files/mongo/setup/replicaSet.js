rs.initiate({
    _id: "rs0",
    members: [
      { _id: 0, host: "m-0" },
      { _id: 1, host: "m-1" },
      { _id: 2, host: "m-2" },
    ],
  });
  
rs.conf();