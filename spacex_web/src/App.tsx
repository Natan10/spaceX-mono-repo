import { useState, useEffect } from "react";
import { BiJoystick } from "react-icons/bi";

import spacexLogo from "./assets/spacex-logo.svg";
import Card from "./components/Card";
import CardsContainer from "./components/CardsContainer";
import Load from "./components/Load";
import api from "./services/api";

export interface Launch {
  id: string;
  logo_small?: string;
  logo_large?: string;
  video?: string;
  wiki?: string;
  success?: boolean;
  details?: string;
  name?: string;
  date?: Date;
  date_local?: Date;
  fire_date?: Date;
  article?: string;
  upcoming: boolean;
}

function App() {
  const [nextLaunch, setNextLaunch] = useState<Launch>();
  const [latestLaunch, setLatestLaunch] = useState<Launch>();
  const [launches, setLaunches] = useState<Launch[]>([]);
  const [loadLaunches, setLoadLaunches] = useState(false);
  const [type, setType] = useState<"upcoming" | "past">("upcoming");

  useEffect(() => {
    (async function () {
      try {
        setLoadLaunches(true);
        const [latest, next, typeRequest] = await Promise.all([
          api.get("latest"),
          api.get("next"),
          api.get(type),
        ]);

        setNextLaunch(next.data);
        setLatestLaunch(latest.data);
        setLaunches(typeRequest.data);
      } catch (e) {
        console.log(e);
      } finally {
        setLoadLaunches(false);
      }
    })();
  }, []);

  async function handleLaunches(e: any) {
    try {
      const { data } = await api.get(e.target.name);
      setLaunches(data);
      setType((_) => e.target.name);
    } catch (e) {
      console.error(e);
    }
  }

  return (
    <div className="app bg-bg-space bg-cover w-full min-h-screen">
      <div className="flex flex-col mx-auto w-full max-w-6xl p-5">
        {/* Navbar */}
        <div className="flex justify-center">
          <img
            className="h-24 w-60 hover:scale-105"
            src={spacexLogo}
            alt="spaceX logo"
          />
        </div>

        {/* Header Card */}
        <div className="my-8 flex justify-center gap-5">
          {!loadLaunches && nextLaunch && latestLaunch ? (
            <>
              <Card {...nextLaunch} type="next" />

              <Card {...latestLaunch} type="latest" />
            </>
          ) : (
            <Load />
          )}
        </div>

        {/* Filter Buttons */}
        {!loadLaunches && (
          <div className="my-8 flex flex-col gap-5">
            <div className="flex items-center gap-2">
              <h2 className="text-white font-thin text-2xl">Controls</h2>
              <BiJoystick className="text-white" size={25} />
            </div>
            <div className="flex space-x-5">
              <button
                name="upcoming"
                onClick={(e) => handleLaunches(e)}
                className={` ${
                  type === "upcoming" ? "text-white" : ""
                } p-4 py-2 rounded bg-yellow-700 hover:bg-yellow-600 transition-colors`}
              >
                Upcoming Launches
              </button>
              <button
                name="past"
                onClick={(e) => handleLaunches(e)}
                className={`${
                  type === "past" ? "text-white" : ""
                } p-4 py-2 rounded bg-zinc-700 hover:bg-zinc-600 transition-colors`}
              >
                Past Launches
              </button>
            </div>
          </div>
        )}

        {/* Cards */}
        <CardsContainer load={loadLaunches} launches={launches} />
      </div>
    </div>
  );
}

export default App;
