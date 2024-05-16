import * as Comlink from "/js/dist/comlink.mjs";

const storageWorker = new Worker("js/storage-worker.js", { type: "module" });
const worker = Comlink.wrap(storageWorker);

storageWorker.onerror = (err) => {
  console.log(err);
};

const recordClick = (site) => {
  worker.recordClick(site);
};

const getTodaysClicks = worker.todaysClicks;

export { recordClick, getTodaysClicks };
