PROJECT_GENERATOR_VERSION = 3

newoption({
    trigger = "gmcommon",
    description = "Sets the path to the garrysmod_common (https://github.com/danielga/garrysmod_common) directory",
    default = "../garrysmod_common"
})

local gmcommon = assert(_OPTIONS.gmcommon or os.getenv("GARRYSMOD_COMMON"),
    "you didn't provide a path to your garrysmod_common (https://github.com/danielga/garrysmod_common) directory")
include(gmcommon)

CreateWorkspace({name = "b2mmenu", abi_compatible = false})
    CreateProject({serverside = true, manual_files = false})
        IncludeSDKCommon()
        IncludeSDKTier0()
        IncludeSDKTier1()

        filter("system:windows")
            files({"source/win32/*.cpp", "source/win32/*.hpp"})

        filter("system:linux or macosx")
            files({"source/posix/*.cpp", "source/posix/*.hpp"})
                filter "system:linux"

                links
                {
                    "dl",
                }