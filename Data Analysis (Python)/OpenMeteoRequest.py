# Get solar data for 2024:

# Openmeteo historical data:
import openmeteo_requests

import requests_cache
import pandas as pd
from retry_requests import retry

# Setup the Open-Meteo API client with cache and retry on error
cache_session = requests_cache.CachedSession('.cache', expire_after = 3600)
retry_session = retry(cache_session, retries = 5, backoff_factor = 0.2)
openmeteo = openmeteo_requests.Client(session = retry_session)

# Make sure all required weather variables are listed here
# The order of variables in hourly or daily is important to assign them correctly below
url = "https://historical-forecast-api.open-meteo.com/v1/forecast"
params = {
	"latitude": 52.00667,
	"longitude": 4.35556,
	"start_date": "2024-01-01",
	"end_date": "2024-12-31",
	"minutely_15": ["temperature_2m", "global_tilted_irradiance"],
	"hourly": ["temperature_2m", "global_tilted_irradiance"],
	"timezone": "auto",
	"tilt": 45,
	"azimuth": 67
}
responses = openmeteo.weather_api(url, params=params)

# Process first location. Add a for-loop for multiple locations or weather models
response = responses[0]
print(f"Coordinates {response.Latitude()}°N {response.Longitude()}°E")
print(f"Elevation {response.Elevation()} m asl")
print(f"Timezone {response.Timezone()} {response.TimezoneAbbreviation()}")
print(f"Timezone difference to GMT+0 {response.UtcOffsetSeconds()} s")

# Process minutely_15 data. The order of variables needs to be the same as requested.
minutely_15 = response.Minutely15()
minutely_15_temperature_2m = minutely_15.Variables(0).ValuesAsNumpy()
minutely_15_global_tilted_irradiance = minutely_15.Variables(1).ValuesAsNumpy()

minutely_15_data = {"date": pd.date_range(
	start = pd.to_datetime(minutely_15.Time(), unit = "s", utc = True),
	end = pd.to_datetime(minutely_15.TimeEnd(), unit = "s", utc = True),
	freq = pd.Timedelta(seconds = minutely_15.Interval()),
	inclusive = "left"
)}
minutely_15_data["temperature_2m"] = minutely_15_temperature_2m
minutely_15_data["global_tilted_irradiance"] = minutely_15_global_tilted_irradiance

minutely_15_dataframe = pd.DataFrame(data = minutely_15_data)
print(minutely_15_dataframe)

# Process hourly data. The order of variables needs to be the same as requested.
hourly = response.Hourly()
hourly_temperature_2m = hourly.Variables(0).ValuesAsNumpy()
hourly_global_tilted_irradiance = hourly.Variables(1).ValuesAsNumpy()

hourly_data = {"date": pd.date_range(
	start = pd.to_datetime(hourly.Time(), unit = "s", utc = True),
	end = pd.to_datetime(hourly.TimeEnd(), unit = "s", utc = True),
	freq = pd.Timedelta(seconds = hourly.Interval()),
	inclusive = "left"
)}
hourly_data["temperature_2m"] = hourly_temperature_2m
hourly_data["global_tilted_irradiance"] = hourly_global_tilted_irradiance


TemperatureHR = pd.DataFrame({ # Make a DF that works with my scripts
        'time': pd.to_datetime(hourly_data['date']),  # Converts to datetime objectdf['validdate'],
        'value_float': hourly_temperature_2m,
        'device_id': 'forecaster',
        'measurement_id': 'termperature'
        })

GTIHR = pd.DataFrame({ # Make a DF that works with my scripts
        'time': pd.to_datetime(hourly_data['date']),  # Converts to datetime objectdf['validdate'],
        'value_float': hourly_global_tilted_irradiance,
        'device_id': 'forecaster',
        'measurement_id': 'irradiance'
        })


Temperaturemin = pd.DataFrame({ # Make a DF that works with my scripts
        'time': pd.to_datetime(minutely_15_data['date']),  # Converts to datetime objectdf['validdate'],
        'value_float': minutely_15_temperature_2m,
        'device_id': 'forecaster',
        'measurement_id': 'termperature'
        })

GTImin = pd.DataFrame({ # Make a DF that works with my scripts
        'time': pd.to_datetime(minutely_15_data['date']),  # Converts to datetime objectdf['validdate'],
        'value_float': minutely_15_global_tilted_irradiance,
        'device_id': 'forecaster',
        'measurement_id': 'irradiance'
        })

