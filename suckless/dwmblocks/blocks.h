//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/

  //{"", "~/suckless/dwmblocks/scripts/cpu", 1, 0},
  {"/\x02", "~/suckless/dwmblocks/scripts/cpu_temp", 1, 0},
  {"\x03", "~/suckless/dwmblocks/scripts/memperc", 1, 0},
  //{"Swap: ", "~/suckless/dwmblocks/scripts/swapperc", 1, 0},
  {"\x04", "~/suckless/dwmblocks/scripts/freestorage", 1, 0},
  //{"", "~/suckless/dwmblocks/scripts/upload", 1, 0},
  //{"", "~/suckless/dwmblocks/scripts/download", 1, 0},
  {"\x05", "~/suckless/dwmblocks/scripts/packages", 999, 0},
  //{"", "~/suckless/dwmblocks/scripts/updates", 999, 0},
  //{"", "~/suckless/dwmblocks/scripts/keymap", 999, 0},
  //{"", "~/suckless/dwmblocks/scripts/capslock", 1, 0},
  //{"", "~/suckless/dwmblocks/scripts/volume", 1, 1},
  //{"\x06", "~/suckless/dwmblocks/scripts/shell", 999, 0},
  {"\x06", "~/suckless/dwmblocks/scripts/kernelinfo", 999, 0},
  {"\x07", "~/suckless/dwmblocks/scripts/weather", 60, 0},
  {"\x08", "~/suckless/dwmblocks/scripts/date", 999, 0},
  {"\x09", "~/suckless/dwmblocks/scripts/time24h", 60, 0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = "/"; // "    "
static unsigned int delimLen = 5; //5
