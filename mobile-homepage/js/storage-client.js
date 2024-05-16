import * as Comlink from "/js/dist/comlink.mjs";

const storageWorker = new Worker("js/storage-worker.js", { type: "module" });
const worker = Comlink.wrap(storageWorker);

storageWorker.onerror = (err) => {
  console.error(err);
};

const recordClick = worker.recordClick;
const getTodaysClicks = worker.todaysClicks;

export { recordClick, getTodaysClicks };
