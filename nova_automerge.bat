REM THIS FILE EXIST TO HELP AUTOMATICALLY MERGE MOST CHANGES FROM NOVA
REM USE THIS WHEN YOU GET MERGE CONFLICTS AFTER NEXT COMMAND
REM git pull novasector master
REM PLACE HERE ONLY CHANGES THAT COULD BE ALWAYS SAFE COPIED FROM NOVA USING CHECKOUT --THEIRS!
REM IN PERFECT WORLD, EACH TIME ANY OF LISTED HERE IS CHANGED BY US, IT SHOULD BE MODIFIED AUTOMATICALLY BY SOME CI STUFF/GITHUB BOTS

REM SAFE MAPS
git checkout --theirs _maps/map_files
git add _maps/map_files
git checkout --theirs _maps/minigame
git add _maps/minigame
git checkout --theirs _maps/nova
git add _maps/nova
git checkout --theirs _maps/RandomZLevels
git add _maps/RandomZLevels
git checkout --theirs _maps/shuttles
git add _maps/shuttles

REM __ and _
git checkout --theirs code/__HELPERS
git add code/__HELPERS
git checkout --theirs code/__DEFINES/dcs
git add code/__DEFINES/dcs
git checkout --theirs code/__DEFINES/traits
git add code/__DEFINES/traits
git checkout --theirs code/_globalvars
git add code/_globalvars
git checkout --theirs code/_onclick
git add code/_onclick

REM DATUMS
git checkout --theirs code/datums/brain_damage
git add code/datums/brain_damage
git checkout --theirs code/datums/components
git add code/datums/components
git checkout --theirs code/datums/elements
git add code/datums/elements
git checkout --theirs code/datums/greyscale
git add code/datums/greyscale
git checkout --theirs code/datums/mutations
git add code/datums/mutations
git checkout --theirs code/datums/quirks
git add code/datums/quirks
git checkout --theirs code/datums/station_traits
git add code/datums/station_traits
git checkout --theirs code/datums/status_effects
git add code/datums/status_effects
git checkout --theirs code/datums/weather
git add code/datums/weather
git checkout --theirs code/datums/wires
git add code/datums/wires

REM GAME

git checkout --theirs code/game/machinery
git add code/game/machinery
git checkout --theirs code/game/objects
git add code/game/objects
git checkout --theirs code/game/turfs
git add code/game/turfs

REM MODULES

git checkout --theirs code/modules/antagonists/cult/cult_armor.dm
git add code/modules/antagonists/cult/cult_armor.dm
git checkout --theirs code/modules/antagonists/heretic
git add code/modules/antagonists/heretic
git checkout --theirs code/modules/assembly
git add code/modules/assembly
git checkout --theirs code/modules/asset_cache
git add code/modules/asset_cache
git checkout --theirs code/modules/atmospherics
git add code/modules/atmospherics
git checkout --theirs code/modules/bitrunning
git add code/modules/bitrunning
git checkout --theirs code/modules/cargo
git add code/modules/cargo
git checkout --theirs code/modules/client/client_colour.dm
git add code/modules/client/client_colour.dm
git checkout --theirs code/modules/engineering
git add code/modules/engineering
git checkout --theirs code/modules/jobs
git add code/modules/jobs
git checkout --theirs code/modules/loadout
git add code/modules/loadout
git checkout --theirs code/modules/logging
git add code/modules/logging
git checkout --theirs code/modules/mining
git add code/modules/mining
git checkout --theirs code/modules/mob/eye
git add code/modules/mob/eye
git checkout --theirs code/modules/mob/living/basic
git add code/modules/mob/living/basic
git checkout --theirs code/modules/mob/living/brain
git add code/modules/mob/living/brain
git checkout --theirs code/modules/mob/living/carbon/human/human_defense.dm
git add code/modules/mob/living/carbon/human/human_defense.dm
git checkout --theirs code/modules/mob/living/silicon/ai/freelook
git add code/modules/mob/living/silicon/ai/freelook
git checkout --theirs code/modules/mob/living/silicon/ai/multicam.dm
git add code/modules/mob/living/silicon/ai/multicam.dm
git checkout --theirs code/modules/mob/living/silicon/death.dm
git add code/modules/mob/living/silicon/death.dm
git checkout --theirs code/modules/mob/living/simple_animal
git add code/modules/mob/living/simple_animal
git checkout --theirs code/modules/mob/living/blood_types.dm
git add code/modules/mob/living/blood_types.dm
git checkout --theirs code/modules/mob/living/living_defense.dm
git add code/modules/mob/living/living_defense.dm
git checkout --theirs code/modules/mob_spawn
git add code/modules/mob_spawn
git checkout --theirs code/modules/mod
git add code/modules/mod
git checkout --theirs code/modules/modular_computers
git add code/modules/modular_computers
git checkout --theirs code/modules/movespeed
git add code/modules/movespeed
git checkout --theirs code/modules/projectiles
git add code/modules/projectiles
git checkout --theirs code/modules/reagents
git add code/modules/reagents
git checkout --theirs code/modules/religion
git add code/modules/religion
git checkout --theirs code/modules/research
git add code/modules/research
git checkout --theirs code/modules/shuttle
git add code/modules/shuttle
git checkout --theirs code/modules/spells
git add code/modules/spells
git checkout --theirs code/modules/surgery
git add code/modules/surgery
git checkout --theirs code/modules/unit_tests
git add code/modules/unit_tests
git checkout --theirs code/modules/vehicles
git add code/modules/vehicles
git checkout --theirs code/modules/wiremod
git add code/modules/wiremod

REM ICONS

git checkout --theirs icons
git add icons

REM MODULAR_NOVA
REM MODULAR_NOVA MASTER_FILES
REM MODULAR_NOVA MASTER_FILES CODE
git checkout --theirs modular_nova/master_files/code/datums/quirks/neutral_quirks/lungs.dm
git add modular_nova/master_files/code/datums/quirks/neutral_quirks/lungs.dm
git checkout --theirs modular_nova/master_files/code/game
git add modular_nova/master_files/code/game
git checkout --theirs modular_nova/master_files/code/modules/atmospherics
git add modular_nova/master_files/code/modules/atmospherics
git checkout --theirs modular_nova/master_files/code/modules/client/preferences_savefile.dm
git add modular_nova/master_files/code/modules/client/preferences_savefile.dm
git checkout --theirs modular_nova/master_files/code/modules/clothing
git add modular_nova/master_files/code/modules/clothing
git checkout --theirs modular_nova/master_files/code/modules/mining
git add modular_nova/master_files/code/modules/mining
git checkout --theirs modular_nova/master_files/code/modules/projectiles
git add modular_nova/master_files/code/modules/projectiles

REM MODULAR_NOVA MASTER_FILES ICONS
git checkout --theirs modular_nova/master_files/icons
git add modular_nova/master_files/icons

REM MODULAR_NOVA MODULES
git checkout --theirs modular_nova/modules/alerts
git add modular_nova/modules/alerts
git checkout --theirs modular_nova/modules/ashwalkers
git add modular_nova/modules/ashwalkers
git checkout --theirs modular_nova/modules/awaymissions_nova
git add modular_nova/modules/awaymissions_nova
git checkout --theirs modular_nova/modules/bitrunning
git add modular_nova/modules/bitrunning
git checkout --theirs modular_nova/modules/cargo
git add modular_nova/modules/cargo
git checkout --theirs modular_nova/modules/cellguns
git add modular_nova/modules/cellguns

REM OURS START CHARACTER_DIRECTORY
git checkout --ours modular_nova/modules/character_directory
git add modular_nova/modules/character_directory
REM OURS END

git checkout --theirs modular_nova/modules/cellguns
git add modular_nova/modules/cellguns
git checkout --theirs modular_nova/modules/company_imports/code/armament_datums/deforest_medical.dm
git add modular_nova/modules/company_imports/code/armament_datums/deforest_medical.dm
git checkout --theirs modular_nova/modules/company_imports/code/armament_datums/kahraman_industries.dm
git add modular_nova/modules/company_imports/code/armament_datums/kahraman_industries.dm

REM OURS START ARMAMENT_DATUMS
git checkout --ours modular_nova/modules/company_imports/code/armament_datums/nri_military_surplus.dm
git add modular_nova/modules/company_imports/code/armament_datums/nri_military_surplus.dm
git checkout --ours modular_nova/modules/company_imports/code/armament_datums/sol_defense.dm
git add modular_nova/modules/company_imports/code/armament_datums/sol_defense.dm
REM OURS END

git checkout --theirs modular_nova/modules/condos
git add modular_nova/modules/condos
git checkout --theirs modular_nova/modules/customization/modules/client
git add modular_nova/modules/customization/modules/client
git checkout --theirs modular_nova/modules/customization/modules/clothing
git add modular_nova/modules/customization/modules/clothing
git checkout --theirs modular_nova/modules/customization/modules/mob/dead
git add modular_nova/modules/customization/modules/mob/dead
git checkout --theirs modular_nova/modules/customization/modules/mob/living/carbon
git add modular_nova/modules/customization/modules/mob/living/carbon
git checkout --theirs modular_nova/modules/deforest_medical_items
git add modular_nova/modules/deforest_medical_items
git checkout --theirs modular_nova/modules/exp_corps
git add modular_nova/modules/exp_corps
git checkout --theirs modular_nova/modules/faction
git add modular_nova/modules/faction
git checkout --theirs modular_nova/modules/GAGS/icons
git add modular_nova/modules/GAGS/icons
git checkout --theirs modular_nova/modules/GAGS/json_configs
git add modular_nova/modules/GAGS/json_configs

REM OURS START NSFW GAGS
git checkout --ours modular_nova/modules/GAGS/nsfw
git add modular_nova/modules/GAGS/nsfw
REM END

git checkout --theirs modular_nova/modules/GAGS/greyscale_configs.dm
git add modular_nova/modules/GAGS/greyscale_configs.dm
git checkout --theirs modular_nova/modules/icemoon_additions
git add modular_nova/modules/icemoon_additions
git checkout --theirs modular_nova/modules/implants
git add modular_nova/modules/implants
git checkout --theirs modular_nova/modules/loadouts/loadout_items/donator/personal/donator_personal.dm
git add modular_nova/modules/loadouts/loadout_items/donator/personal/donator_personal.dm

REM OURS START LOADOUTS
git checkout --ours modular_nova/modules/loadouts/loadout_items/under/loadout_datum_under.dm
git add modular_nova/modules/loadouts/loadout_items/under/loadout_datum_under.dm
git checkout --ours modular_nova/modules/loadouts/loadout_items/loadout_datum_accessory.dm
git add modular_nova/modules/loadouts/loadout_items/loadout_datum_accessory.dm
git checkout --ours modular_nova/modules/loadouts/loadout_items/loadout_datum_belts.dm
git add modular_nova/modules/loadouts/loadout_items/loadout_datum_belts.dm
git checkout --ours modular_nova/modules/loadouts/loadout_items/loadout_datum_erp.dm
git add modular_nova/modules/loadouts/loadout_items/loadout_datum_erp.dm
git checkout --ours modular_nova/modules/loadouts/loadout_items/loadout_datum_gloves.dm
git add modular_nova/modules/loadouts/loadout_items/loadout_datum_gloves.dm
git checkout --ours modular_nova/modules/loadouts/loadout_items/loadout_datum_neck.dm
git add modular_nova/modules/loadouts/loadout_items/loadout_datum_neck.dm
git checkout --ours modular_nova/modules/loadouts/loadout_items/loadout_datum_shoes.dm
git add modular_nova/modules/loadouts/loadout_items/loadout_datum_shoes.dm
REM END

git checkout --theirs modular_nova/modules/mapping
git add modular_nova/modules/mapping
git checkout --theirs modular_nova/modules/medical_designs
git add modular_nova/modules/medical_designs
git checkout --theirs modular_nova/modules/mentoring
git add modular_nova/modules/mentoring

REM OURS NIFSOFTS
git checkout --ours modular_nova/modules/modular_implants/code/nifsofts/dorms.dm
git add modular_nova/modules/modular_implants/code/nifsofts/dorms.dm
REM END

git checkout --theirs modular_nova/modules/modular_implants/code/nifsofts/huds.dm
git add modular_nova/modules/modular_implants/code/nifsofts/huds.dm
git checkout --theirs modular_nova/modules/modular_implants/code/nifsofts/service_summoner.dm
git add modular_nova/modules/modular_implants/code/nifsofts/service_summoner.dm
git checkout --theirs modular_nova/modules/modular_implants/code/misc_devices.dm
git add modular_nova/modules/modular_implants/code/misc_devices.dm
git checkout --theirs modular_nova/modules/modular_items/code
git add modular_nova/modules/modular_items/code

REM OURS NO LEWD ITEMS
git checkout --ours modular_nova/modules/modular_items/lewd_items
git add modular_nova/modules/modular_items/lewd_items
REM END

git checkout --theirs modular_nova/modules/modular_persistence
git add modular_nova/modules/modular_persistence
git checkout --theirs modular_nova/modules/modular_vending
git add modular_nova/modules/modular_vending

REM OURS MODULAR_WEAPONS code
git checkout --ours modular_nova/modules/modular_weapons/code
git add modular_nova/modules/modular_weapons/code
REM END

git checkout --theirs modular_nova/modules/modular_weapons/icons
git add modular_nova/modules/modular_weapons/icons
git checkout --theirs modular_nova/modules/moretraitoritems
git add modular_nova/modules/moretraitoritems
git checkout --theirs modular_nova/modules/mounted_machine_gun
git add modular_nova/modules/mounted_machine_gun
git checkout --theirs modular_nova/modules/pet_owner
git add modular_nova/modules/pet_owner
git checkout --theirs modular_nova/modules/plexagon_selfserve
git add modular_nova/modules/plexagon_selfserve
git checkout --theirs modular_nova/modules/RBMK2
git add modular_nova/modules/RBMK2
git checkout --theirs modular_nova/modules/reagent_forging
git add modular_nova/modules/reagent_forging
git checkout --theirs modular_nova/modules/roundstart_implants
git add modular_nova/modules/roundstart_implants
git checkout --theirs modular_nova/modules/sec_haul/code/security_clothing/head.dm
git add modular_nova/modules/sec_haul/code/security_clothing/head.dm
git checkout --theirs modular_nova/modules/sec_haul/code/security_clothing/under.dm
git add modular_nova/modules/sec_haul/code/security_clothing/under.dm
git checkout --theirs modular_nova/modules/SiliconQoL
git add modular_nova/modules/SiliconQoL
git checkout --theirs modular_nova/modules/syndie_edits
git add modular_nova/modules/syndie_edits
git checkout --theirs modular_nova/modules/synths
git add modular_nova/modules/synths
git checkout --theirs modular_nova/modules/tarkon
git add modular_nova/modules/tarkon

REM title_screen HTML
git checkout --ours modular_nova/modules/title_screen/code/title_screen_html.dm
git add modular_nova/modules/title_screen/code/title_screen_html.dm
REM END

git checkout --theirs modular_nova/modules/tribal_extended
git add modular_nova/modules/tribal_extended

REM SOUND
git checkout --theirs sound
git add sound

REM TGUI OH GOD
REM OURS TGUI
git checkout --ours tgui/packages/tgui/interfaces/PreferencesMenu/preferences/features/game_preferences/nova/erp_preferences.tsx
git add tgui/packages/tgui/interfaces/PreferencesMenu/preferences/features/game_preferences/nova/erp_preferences.tsx
git checkout --ours tgui/packages/tgui/interfaces/NovaCharacterDirectory.jsx
git add tgui/packages/tgui/interfaces/NovaCharacterDirectory.jsx
git checkout --ours tgui/packages/tgui/interfaces/AntagInfoRules.tsx
git add tgui/packages/tgui/interfaces/AntagInfoRules.tsx
git checkout --ours tgui/packages/tgui/interfaces/AutomatedAnnouncement.tsx
git add tgui/packages/tgui/interfaces/AutomatedAnnouncement.tsx
REM END OUR TGUI

git checkout --theirs tgui/packages/tgui/interfaces/AirlockElectronics.tsx
git add tgui/packages/tgui/interfaces/AirlockElectronics.tsx
git checkout --theirs tgui/packages/tgui/interfaces/AiVoiceChanger.tsx
git add tgui/packages/tgui/interfaces/AiVoiceChanger.tsx
git checkout --theirs tgui/packages/tgui/interfaces/AlertModal.tsx
git add tgui/packages/tgui/interfaces/AlertModal.tsx
git checkout --theirs tgui/packages/tgui/interfaces/BountyBoard.tsx
git add tgui/packages/tgui/interfaces/BountyBoard.tsx
git checkout --theirs tgui/packages/tgui/interfaces/ChemPress.tsx
git add tgui/packages/tgui/interfaces/ChemPress.tsx
git checkout --theirs tgui/packages/tgui/interfaces/CommandReport.tsx
git add tgui/packages/tgui/interfaces/CommandReport.tsx
git checkout --theirs tgui/packages/tgui/interfaces/CrewConsole.tsx
git add tgui/packages/tgui/interfaces/CrewConsole.tsx
git checkout --theirs tgui/packages/tgui/interfaces/CyborgBootDebug.jsx
git add tgui/packages/tgui/interfaces/CyborgBootDebug.jsx
git checkout --theirs tgui/packages/tgui/interfaces/Filteriffic.jsx
git add tgui/packages/tgui/interfaces/Filteriffic.jsx
git checkout --theirs tgui/packages/tgui/interfaces/GreyscaleModifyMenu.tsx
git add tgui/packages/tgui/interfaces/GreyscaleModifyMenu.tsx
git checkout --theirs tgui/packages/tgui/interfaces/HighLuminosityEyesMenu.tsx
git add tgui/packages/tgui/interfaces/HighLuminosityEyesMenu.tsx
git checkout --theirs tgui/packages/tgui/interfaces/HoloPay.tsx
git add tgui/packages/tgui/interfaces/HoloPay.tsx
git checkout --theirs tgui/packages/tgui/interfaces/HypnoChair.jsx
git add tgui/packages/tgui/interfaces/HypnoChair.jsx
git checkout --theirs tgui/packages/tgui/interfaces/LaunchpadConsole.tsx
git add tgui/packages/tgui/interfaces/LaunchpadConsole.tsx
git checkout --theirs tgui/packages/tgui/interfaces/LibraryVisitor.jsx
git add tgui/packages/tgui/interfaces/LibraryVisitor.jsx
git checkout --theirs tgui/packages/tgui/interfaces/LogViewer.tsx
git add tgui/packages/tgui/interfaces/LogViewer.tsx
git checkout --theirs tgui/packages/tgui/interfaces/LTSRBT.tsx
git add tgui/packages/tgui/interfaces/LTSRBT.tsx
git checkout --theirs tgui/packages/tgui/interfaces/MCDependencyDebug.tsx
git add tgui/packages/tgui/interfaces/MCDependencyDebug.tsx
git checkout --theirs tgui/packages/tgui/interfaces/MechpadConsole.jsx
git add tgui/packages/tgui/interfaces/MechpadConsole.jsx
git checkout --theirs tgui/packages/tgui/interfaces/Newscaster.jsx
git add tgui/packages/tgui/interfaces/Newscaster.jsx
git checkout --theirs tgui/packages/tgui/interfaces/NtosCard.tsx
git add tgui/packages/tgui/interfaces/NtosCard.tsx
git checkout --theirs tgui/packages/tgui/interfaces/NtosNetDownloader.tsx
git add tgui/packages/tgui/interfaces/NtosNetDownloader.tsx
git checkout --theirs tgui/packages/tgui/interfaces/NtosNotepad.tsx
git add tgui/packages/tgui/interfaces/NtosNotepad.tsx
git checkout --theirs tgui/packages/tgui/interfaces/NtosPortraitPrinter.jsx
git add tgui/packages/tgui/interfaces/NtosPortraitPrinter.jsx
git checkout --theirs tgui/packages/tgui/interfaces/NtosRobotact.jsx
git add tgui/packages/tgui/interfaces/NtosRobotact.jsx
git checkout --theirs tgui/packages/tgui/interfaces/NtosScipaper.jsx
git add tgui/packages/tgui/interfaces/NtosScipaper.jsx
git checkout --theirs tgui/packages/tgui/interfaces/OreContainer.tsx
git add tgui/packages/tgui/interfaces/OreContainer.tsx
git checkout --theirs tgui/packages/tgui/interfaces/OreRedemptionMachine.tsx
git add tgui/packages/tgui/interfaces/OreRedemptionMachine.tsx
git checkout --theirs tgui/packages/tgui/interfaces/PlaneMasterDebug.tsx
git add tgui/packages/tgui/interfaces/PlaneMasterDebug.tsx
git checkout --theirs tgui/packages/tgui/interfaces/PlayerTicketHistory.tsx
git add tgui/packages/tgui/interfaces/PlayerTicketHistory.tsx
git checkout --theirs tgui/packages/tgui/interfaces/PortraitPicker.jsx
git add tgui/packages/tgui/interfaces/PortraitPicker.jsx
git checkout --theirs tgui/packages/tgui/interfaces/ProduceConsole.tsx
git add tgui/packages/tgui/interfaces/ProduceConsole.tsx
git checkout --theirs tgui/packages/tgui/interfaces/RapidPipeDispenser.tsx
git add tgui/packages/tgui/interfaces/RapidPipeDispenser.tsx
git checkout --theirs tgui/packages/tgui/interfaces/RequestManager.tsx
git add tgui/packages/tgui/interfaces/RequestManager.tsx
git checkout --theirs tgui/packages/tgui/interfaces/SelectEquipment.jsx
git add tgui/packages/tgui/interfaces/SelectEquipment.jsx
git checkout --theirs tgui/packages/tgui/interfaces/SentienceFunBalloon.jsx
git add tgui/packages/tgui/interfaces/SentienceFunBalloon.jsx
git checkout --theirs tgui/packages/tgui/interfaces/Spellbook.tsx
git add tgui/packages/tgui/interfaces/Spellbook.tsx
git checkout --theirs tgui/packages/tgui/interfaces/StackCrafting.tsx
git add tgui/packages/tgui/interfaces/StackCrafting.tsx
git checkout --theirs tgui/packages/tgui/interfaces/Telecomms.jsx
git add tgui/packages/tgui/interfaces/Telecomms.jsx
git checkout --theirs tgui/packages/tgui/stories
git add tgui/packages/tgui/stories
git checkout --theirs tgui/packages/tgui/styles/interfaces/IntegratedCircuit.scss
git add tgui/packages/tgui/styles/interfaces/IntegratedCircuit.scss
git checkout --theirs tgui/packages/tgui/package.json
git add tgui/packages/tgui/package.json
git checkout --theirs tgui/packages/tgui-bench
git add tgui/packages/tgui-bench
git checkout --theirs tgui/packages/tgui-panel
git add tgui/packages/tgui-panel
git checkout --theirs tgui/packages/tgui-say
git add tgui/packages/tgui-say
git checkout --theirs tgui/public
git add tgui/public
git checkout --theirs tgui/.yarnrc.yml
git add tgui/.yarnrc.yml
git checkout --theirs tgui/package.json
git add tgui/package.json
git checkout --theirs tgui/rspack.config-dev.cjs
git add tgui/rspack.config-dev.cjs
git checkout --theirs tgui/rspack.config.cjs
git add tgui/rspack.config.cjs
git checkout --theirs tgui/yarn.lock
git add tgui/yarn.lock

REM OUR STUFF
git checkout --ours rust_g.dll
git add rust_g.dll
REM END OUR STAFF

pause