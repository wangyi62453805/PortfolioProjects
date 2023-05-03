--Looking AT Total Cases VS Total Deaths (Death Rate) --shows the probability OF dying
--if you get Covid IN United States
SELECT
  location,
  date,
  total_cases,
  total_deaths,
  (total_deaths/total_cases)*100 AS Death_Percentage
FROM
  `CovidDeaths.CovidDeaths` --

WHERE
  continent IS NOT NULL
ORDER BY
  1,
  2 

  --Looking AT Toal Cases VS Population --Shows what percentage OF population get Covid
SELECT
  location,
  date,
  population,
  total_cases,
  (total_cases/population)*100 AS percentage_population_get_covid
FROM
  `CovidDeaths.CovidDeaths` --

WHERE
  continent IS NOT NULL
ORDER BY
  1,
  2
--Looking AT countries with Highest Infection Rate compared TO population
SELECT
  location,
  population,
  MAX(total_cases) AS Highest_Infection_Count,
  MAX((total_cases/population))*100 AS percentage_population_infected
FROM
  `CovidDeaths.CovidDeaths` --

WHERE
  continent IS NOT NULL
GROUP BY
  location,
  population
ORDER BY
  percentage_population_infected DESC

  --Showing continents with highest death count per population
SELECT
  continent,
  MAX(CAST(total_deaths AS int64)) AS ToalDeathCount
FROM
  `CovidDeaths.CovidDeaths` --

WHERE
  continent IS NOT NULL
GROUP BY
  continent
ORDER BY
  ToalDeathCount DESC 
  --Global Numbers total case VS total Deaths
SELECT
  date,
  SUM(new_cases) AS total_cases,
  SUM(CAST(new_deaths AS int64)) AS total_deaths,
  SUM(CAST(new_deaths AS int64)) / SUM(new_cases)*100 AS DeathPercentage
FROM
  `CovidDeaths.CovidDeaths` --
WHERE
  location = 'United States'
WHERE
  continent IS NOT NULL
  AND new_cases <> 0
GROUP BY
  date
ORDER BY
  1,
  2