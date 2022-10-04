interface LoadProps {
  size?: "small" | "medium" | "large";
}

export default function Load({ size = "medium" }: LoadProps) {
  function sizeType() {
    switch (size) {
      case "small":
        return "w-4 h-4";
      case "medium":
        return "w-8 h-8";
      case "large":
        return "w-12 h-12";
    }
  }

  return (
    <div
      className={`bg-transparent rounded-full animate-spin border-4 border-r-sky-600 border-t-sky-600 border-sky-300 ${sizeType()}`}
    />
  );
}
