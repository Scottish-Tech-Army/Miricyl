import React, { useContext } from "react";
import { FlagsContext } from "../components/FlagsProvider";

export const useFlags = () => {
  const context = useContext(FlagsContext);
  return context;
};
