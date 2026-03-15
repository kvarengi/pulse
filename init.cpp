#include <legal/manifest.h>
#include <util/system.h> // For tfm::format or LogPrintf

// Inside the AppInitMain function
bool AppInitMain(Config& config, RPCServer& rpcServer, HTTPRPCServer& httpRPCServer)
{
    // ... basic checks ...

    // Display the Maritime Manifest to the console (stdout)
    if (!gArgs.GetBoolArg("-daemon", false)) {
        fmt::print("{}", MARITIME_LEGAL_MANIFEST);
    } else {
        LogPrintf("Maritime Law: Vessel Commissioned and Anchored to Pulse.\n");
    }

    // ... continue loading the Pulse Node ...
}
