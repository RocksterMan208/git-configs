return {
  "Civitasv/cmake-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = { "c", "cpp", "cmake" },  -- lazy-load only for relevant filetypes
  cmd = {
    "CMakeGenerate", "CMakeBuild", "CMakeRun", "CMakeDebug",
    "CMakeSelectBuildType", "CMakeSelectBuildTarget",
    "CMakeSelectLaunchTarget", "CMakeSettings", "CMakeClean",
  },
  opts = {
    cmake_build_directory = "build",
    cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" },
  },
}
