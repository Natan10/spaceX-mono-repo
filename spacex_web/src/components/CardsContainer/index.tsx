import React from "react";
import { Launch } from "../../App";
import Card from "../Card";
import Load from "../Load";

interface CardsContainerProps {
  load: boolean;
  launches: Launch[];
}

export default function CardsContainer({
  load,
  launches,
}: CardsContainerProps) {
  return (
    <div className="mt-5 flex flex-col items-center gap-8">
      {!load ? (
        launches.map((launch) => {
          return (
            <Card
              key={launch.id}
              {...launch}
              type={launch.upcoming ? "upcoming" : "past"}
            />
          );
        })
      ) : (
        <Load />
      )}
    </div>
  );
}
