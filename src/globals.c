#include "fh.h"

char type_char[]       = " dD g";
char color_char[]      = " OBAFGKM";
char size_char[]       = "0123456789";
char gas_string[14][4] = { "   ", "H2",  "CH4", "He", "NH3", "N2",  "CO2",
                           "O2",  "HCl", "Cl2", "F2", "H2O", "SO2", "H2S" };

char tech_abbr[6][4] = { "MI", "MA", "ML", "GV", "LS", "BI" };

char tech_name[6][16] = { "Mining",    "Manufacturing", "Military",
                          "Gravitics", "Life Support",  "Biology" };

int data_in_memory[MAX_SPECIES];
int data_modified[MAX_SPECIES];
int num_new_namplas[MAX_SPECIES];
int num_new_ships[MAX_SPECIES];

struct species_data spec_data[MAX_SPECIES];
struct nampla_data *namp_data[MAX_SPECIES];
struct ship_data *  ship_data[MAX_SPECIES];

char item_name[MAX_ITEMS][32] = {
    "Raw Material Unit",
    "Planetary Defense Unit",
    "Starbase Unit",
    "Damage Repair Unit",
    "Colonist Unit",
    "Colonial Mining Unit",
    "Colonial Manufacturing Unit",
    "Fail-Safe Jump Unit",
    "Jump Portal Unit",
    "Forced Misjump Unit",
    "Forced Jump Unit",
    "Gravitic Telescope Unit",
    "Field Distortion Unit",
    "Terraforming Plant",
    "Germ Warfare Bomb",
    "Mark-1 Shield Generator",
    "Mark-2 Shield Generator",
    "Mark-3 Shield Generator",
    "Mark-4 Shield Generator",
    "Mark-5 Shield Generator",
    "Mark-6 Shield Generator",
    "Mark-7 Shield Generator",
    "Mark-8 Shield Generator",
    "Mark-9 Shield Generator",
    "Mark-1 Gun Unit",
    "Mark-2 Gun Unit",
    "Mark-3 Gun Unit",
    "Mark-4 Gun Unit",
    "Mark-5 Gun Unit",
    "Mark-6 Gun Unit",
    "Mark-7 Gun Unit",
    "Mark-8 Gun Unit",
    "Mark-9 Gun Unit",
    "X1 Unit",
    "X2 Unit",
    "X3 Unit",
    "X4 Unit",
    "X5 Unit",
};

char item_abbr[MAX_ITEMS][4] = {
    "RM",  "PD",  "SU",  "DR",  "CU",  "IU",  "AU",  "FS",  "JP",  "FM",
    "FJ",  "GT",  "FD",  "TP",  "GW",  "SG1", "SG2", "SG3", "SG4", "SG5",
    "SG6", "SG7", "SG8", "SG9", "GU1", "GU2", "GU3", "GU4", "GU5", "GU6",
    "GU7", "GU8", "GU9", "X1",  "X2",  "X3",  "X4",  "X5"
};

long item_cost[MAX_ITEMS] = {
    1,        1,  110,   50,    1,    1,    1,   25,  100,  100,  125, 500,  50,
    50000, 1000,  250,  500,  750, 1000, 1250, 1500, 1750, 2000, 2250, 250, 500,
    750,   1000, 1250, 1500, 1750, 2000, 2250, 9999, 9999, 9999, 9999, 9999
};

short item_carry_capacity[MAX_ITEMS] = {
    1,     3, 20,  1,  1,  1,  1,    1,   10,    5,    5, 20,  1,
    100, 100,  5, 10, 15, 20, 25,   30,   35,   40,   45,  5, 10,
    15,   20, 25, 30, 35, 40, 45, 9999, 9999, 9999, 9999, 9999
};

char item_critical_tech[MAX_ITEMS] = {
    MI, ML, MA, MA, LS, MI, MA, GV, GV, GV, GV, GV, LS, BI, BI, LS, LS, LS, LS,
    LS, LS, LS, LS, LS, ML, ML, ML, ML, ML, ML, ML, ML, ML, 99, 99, 99, 99, 99
};

short item_tech_requirment[MAX_ITEMS] = {
    1,   1, 20, 30,  1,  1,  1,  20,  25,  30,  40, 50, 20,
    40, 50, 10, 20, 30, 40, 50,  60,  70,  80,  90, 10, 20,
    30, 40, 50, 60, 70, 80, 90, 999, 999, 999, 999, 999
};

char ship_abbr[NUM_SHIP_CLASSES][4] = { "PB", "CT", "ES", "FF", "DD", "CL",
                                        "CS", "CA", "CC", "BC", "BS", "DN",
                                        "SD", "BM", "BW", "BR", "BA", "TR" };

char ship_type[3][2] = { "", "S", "S" };

short ship_tonnage[NUM_SHIP_CLASSES] = { 1,   2,  5, 10, 15, 20, 25, 30, 35,
                                         40, 45, 50, 55, 60, 65, 70,  1, 1 };

short ship_cost[NUM_SHIP_CLASSES] = { 100,   200,  500, 1000, 1500, 2000,
                                      2500, 3000, 3500, 4000, 4500, 5000,
                                      5500, 6000, 6500, 7000,  100, 100 };

char command_abbr[NUM_COMMANDS][4] = {
    "   ", "ALL", "AMB", "ATT", "AUT", "BAS", "BAT", "BUI", "CON", "DEE", "DES",
    "DEV", "DIS", "END", "ENE", "ENG", "EST", "HAV", "HID", "HIJ", "IBU", "ICO",
    "INS", "INT", "JUM", "LAN", "MES", "MOV", "NAM", "NEU", "ORB", "PJU", "PRO",
    "REC", "REP", "RES", "SCA", "SEN", "SHI", "STA", "SUM", "SUR", "TAR", "TEA",
    "TEC", "TEL", "TER", "TRA", "UNL", "UPG", "VIS", "WIT", "WOR", "ZZZ"
};

char command_name[NUM_COMMANDS][16] = {
    "Undefined", "Ally",    "Ambush",     "Attack",    "Auto",      "Base",
    "Battle",    "Build",   "Continue",   "Deep",      "Destroy",   "Develop",
    "Disband",   "End",     "Enemy",      "Engage",    "Estimate",  "Haven",
    "Hide",      "Hijack",  "Ibuild",     "Icontinue", "Install",   "Intercept",
    "Jump",      "Land",    "Message",    "Move",      "Name",      "Neutral",
    "Orbit",     "Pjump",   "Production", "Recycle",   "Repair",    "Research",
    "Scan",      "Send",    "Shipyard",   "Start",     "Summary",   "Surrender",
    "Target",    "Teach",   "Tech",       "Telescope", "Terraform", "Transfer",
    "Unload",    "Upgrade", "Visited",    "Withdraw",  "Wormhole",  "ZZZ"
};
