import React, { useEffect, createContext, useState } from "react";
import { firebase } from "../firebase";

export const FlagsContext = createContext({});
const remoteConfig = firebase.remoteConfig();

// Only for development
remoteConfig.settings = {
  minimumFetchIntervalMillis: 300000,
};
const FlagsProvider = ({ defaults, children }) => {
  const [flags, setFlags] = useState(defaults);

  useEffect(() => {
    remoteConfig.defaultConfig = defaults;
    remoteConfig
      .fetchAndActivate()
      .then((activated) => {
        return remoteConfig.getAll();
      })
      .then((remoteFlags) => {
        const newFlags = {
          ...flags,
        };
        for (const [key, config] of Object.entries(remoteFlags)) {
          if (config._value) {
            newFlags[key] = parseInt(config._value);
          }
        }

        setFlags(newFlags);
      })
      .catch((error) => console.error(error));
  }, []);

  return (
    <FlagsContext.Provider value={flags}>{children}</FlagsContext.Provider>
  );
};

export default FlagsProvider;
