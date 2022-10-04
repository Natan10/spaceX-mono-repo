/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./src/**/*.{js,jsx,ts,tsx}"],
  theme: {
    extend: {
      backgroundImage: {
        "bg-space": "url('/public/bg-space.jpg')",
      },
    },
  },
  plugins: [],
};
