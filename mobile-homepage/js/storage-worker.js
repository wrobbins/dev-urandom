import * as Comlink from "/js/dist/comlink.mjs";
import Dexie from "/js/dist/dexie.mjs";

const millsecondsInDay = 86400000;

const db = new Dexie("test");
db.version(1).stores({
  clicks: "++id, site, timestamp",
});

const todaysClicks = async () => {
  const now = new Date();
  now.setHours(0, 0, 0, 0);
  const startOfDay = now.getTime();

  const endOfDay = startOfDay + millsecondsInDay - 1;

  const clicks = await db.clicks
    .where("timestamp")
    .between(startOfDay, endOfDay)
    .toArray();

  return clicks.reduce((acc, row) => {
    const { site } = row;
    let siteCount = acc[site];
    if (!siteCount) {
      siteCount = 0;
    }
    acc[site] = siteCount + 1;

    return acc;
  }, {});
};

const recordClick = (site) => {
    db.clicks.add({ site, timestamp: Date.now() });
}

const workerInterface = {
  todaysClicks,
  recordClick
}
Comlink.expose(workerInterface);
