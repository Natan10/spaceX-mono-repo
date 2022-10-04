import rocket from "../../assets/rocket.png";

type CardType = "upcoming" | "latest" | "next" | "past";

interface CardProps {
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
  type: CardType;
  article?: string;
}

export default function Card(props: CardProps) {
  const typeCardClass = function () {
    switch (props.type) {
      case "latest":
        return "bg-green-600 opacity-75";
      case "next":
        return "bg-sky-800 opacity-75";
      case "past":
        return "bg-zinc-500 opacity-75";
      case "upcoming":
        return "bg-red-400 opacity-75";
      default:
        return "";
    }
  };

  return (
    <div
      className={`${typeCardClass()} p-5 w-full flex items-center space-x-4 rounded`}
    >
      <div className="p-3">
        {props.logo_small ? (
          <img className="h-20 w-20" src={props.logo_small} alt="logo launch" />
        ) : (
          <img className="h-20 w-20" src={rocket} alt="rocker" />
        )}
      </div>

      <div className="flex-1 flex gap-5 flex-wrap">
        <div className="flex flex-col">
          <label className="text-slate-300 text-xs">Type</label>
          <span className="text-white text-sm">{props.type}</span>
        </div>
        <div className="flex flex-col">
          <label className="text-slate-300 text-xs">ID</label>
          <span className="text-white text-sm">{props.id}</span>
        </div>
        <div className="flex flex-col">
          <label className="text-slate-300 text-xs">Name</label>
          <span className="text-white text-sm">{props.name ?? "-"}</span>
        </div>
        <div className="flex flex-col">
          <label className="text-slate-300 text-xs">Success</label>
          <span className="text-white text-sm">
            {props.success ? `${props.success}` : "-"}
          </span>
        </div>
        <div className="flex flex-col">
          <label className="text-slate-300 text-xs">Details</label>
          <span className="text-white text-sm">{props.details ?? "-"}</span>
        </div>
        <div className="flex flex-col">
          <label className="text-slate-300 text-xs">Wiki</label>
          <span className="text-white text-sm">{props.wiki ?? "-"}</span>
        </div>
        <div className="flex flex-col">
          <label className="text-slate-300 text-xs">Video</label>
          {props.video ? (
            <a
              href={props.video}
              target="_blank"
              className="text-sm text-blue-700 hover:underline transition-all"
            >
              {props.video}
            </a>
          ) : (
            <span className="text-white">-</span>
          )}
        </div>
      </div>
    </div>
  );
}
