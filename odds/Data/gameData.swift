//
//  gameData.swift
//  odds
//
//  Created by Ballet Tom on 20/06/2023.
//

import Foundation

struct Game: Codable {
    let id: String
    let sportKey: String
    let sportTitle: String
    let commenceTime: String
    let homeTeam, awayTeam: String
    let bookmakers: [Bookmaker]
}

struct Bookmaker: Codable {
    let key, title: String
    let lastUpdate: String
    let markets: [Market]
}

struct Market: Codable {
    let key: String
    let lastUpdate: String
    let outcomes: [Outcome]
}

struct Outcome: Codable {
    let name: String
    let price: Double
}


let regions: [String: String] = [
    "EU": "eu",
    "UK": "uk",
    "US": "us",
    "AUS": "au"
]

let sportsPicker: [String: String] = [
    "Tennis": "tennis",
    "Soccer": "soccer",
    "Basketball": "basketball",
    "Football": "football"
]

let soccer: [String: String] = [
    "Soccer Primera División - Argentina": "soccer_argentina_primera_division",
    "Soccer A-League": "soccer_australia_aleague",
    "Soccer Austrian Football Bundesliga": "soccer_austria_bundesliga",
    "Soccer Belgium First Div": "soccer_belgium_first_div",
    "Soccer Brazil Série A": "soccer_brazil_campeonato",
    "Soccer Brazil Série B": "soccer_brazil_serie_b",
    "Soccer Primera División - Chile": "soccer_chile_campeonato",
    "Soccer Super League - China": "soccer_china_superleague",
    "Soccer Denmark Superliga": "soccer_denmark_superliga",
    "Soccer Championship": "soccer_efl_champ",
    "Soccer EFL Cup": "soccer_england_efl_cup",
    "Soccer League 1": "soccer_england_league1",
    "Soccer League 2": "soccer_england_league2",
    "Soccer EPL": "soccer_epl",
    "Soccer FA Cup": "soccer_fa_cup",
    "Soccer FIFA World Cup": "soccer_fifa_world_cup",
    "Soccer Veikkausliiga - Finland": "soccer_finland_veikkausliiga",
    "Soccer Ligue 1 - France": "soccer_france_ligue_one",
    "Soccer Ligue 2 - France": "soccer_france_ligue_two",
    "Soccer Bundesliga - Germany": "soccer_germany_bundesliga",
    "Soccer Bundesliga 2 - Germany": "soccer_germany_bundesliga2",
    "Soccer 3. Liga - Germany": "soccer_germany_liga3",
    "Soccer Super League - Greece": "soccer_greece_super_league",
    "Soccer Serie A - Italy": "soccer_italy_serie_a",
    "Soccer Serie B - Italy": "soccer_italy_serie_b",
    "Soccer J League": "soccer_japan_j_league",
    "Soccer K League 1": "soccer_korea_kleague1",
    "Soccer League of Ireland": "soccer_league_of_ireland",
    "Soccer Liga MX": "soccer_mexico_ligamx",
    "Soccer Dutch Eredivisie": "soccer_netherlands_eredivisie",
    "Soccer Eliteserien - Norway": "soccer_norway_eliteserien",
    "Soccer Ekstraklasa - Poland": "soccer_poland_ekstraklasa",
    "Soccer Primeira Liga - Portugal": "soccer_portugal_primeira_liga",
    "Soccer Premier League - Russia": "soccer_russia_premier_league",
    "Soccer La Liga - Spain": "soccer_spain_la_liga",
    "Soccer La Liga 2 - Spain": "soccer_spain_segunda_division",
    "Soccer Premiership - Scotland": "soccer_spl",
    "Soccer Allsvenskan - Sweden": "soccer_sweden_allsvenskan",
    "Soccer Superettan - Sweden": "soccer_sweden_superettan",
    "Soccer Swiss Superleague": "soccer_switzerland_superleague",
    "Soccer Turkey Super League": "soccer_turkey_super_league",
    "Soccer UEFA Champions League": "soccer_uefa_champs_league",
    "Soccer UEFA Europa League": "soccer_uefa_europa_league",
    "Soccer MLS": "soccer_usa_mls",
]
    
