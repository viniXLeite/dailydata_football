import os
from dotenv import load_dotenv, dotenv_values
import requests

load_dotenv()
try:
    FOOTBALL_API_KEY = os.getenv("FOOTBALL_API_KEY")
except Exception as erro:
    print(f"{erro}")
    

def get_matches():
    try:
        headers = {'X-Auth-Token': FOOTBALL_API_KEY}
        url_football = "https://api.football-data.org/v4/competitions/WC/matches"

        response = requests.get(url_football, headers=headers)
        response.raise_for_status()
        return response.json()['matches']
    except requests.exceptions.RequestException as re:
        print(f"ERRO API: {re}")
        return None
    
matches = get_matches()
print(matches)