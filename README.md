# 🏎️ Apex Metrics — Formula 1 Telemetry & Race Analytics Platform

[![PostgreSQL](https://img.shields.io/badge/PostgreSQL-16-336791?style=for-the-badge&logo=postgresql&logoColor=white)](https://www.postgresql.org/)
[![Power BI](https://img.shields.io/badge/Power_BI-Desktop-F2C811?style=for-the-badge&logo=powerbi&logoColor=black)](https://powerbi.microsoft.com/)
[![Python](https://img.shields.io/badge/Python-3.11-3776AB?style=for-the-badge&logo=python&logoColor=white)](https://www.python.org/)
[![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)](https://tailwindcss.com/)
[![Production Spec](https://img.shields.io/badge/Spec-v4.2-brightgreen?style=for-the-badge)](#)

An enterprise-grade, end-to-end telemetry engineering and computational intelligence ecosystem. The platform integrates an **8,000-row synthetic multi-parameter telemetry feature engine**, an analytical **PostgreSQL 16** layer running window partition queries (<15ms latency), and an executive **Power BI** semantic star schema powered by dynamic DAX measures and responsive web dashboards.

---

## 📑 Table of Contents
- [Executive Overview](#-executive-overview)
- [System Architecture](#-system-architecture)
- [Synthetic Telemetry Engine (58 Features)](#-synthetic-telemetry-engine-58-features)
- [PostgreSQL Analytical Engine (8 Core Queries)](#-postgresql-analytical-engine-8-core-queries)
- [Power BI Semantic Model & DAX](#-power-bi-semantic-model--dax)
- [Cross-Stack Comparison Matrix](#-cross-stack-comparison-matrix)
- [Repository Structure](#-repository-structure)
- [Getting Started](#-getting-started)

---

## ⚡ Executive Overview

Apex Metrics addresses the gap between low-level telemetry sensor noise and strategic race decision-making:
* **8,000 Grand Prix Records:** 100% complete dataset without sensor dropouts, enriched with physics-informed features across 6 distinct telemetry domains.
* **Complex Relational Analytics:** High-performance PostgreSQL 16 database running CTE window functions, ranking driver consistency, overtakes, and pit crew variance.
* **Enterprise Semantic Modeling:** Star-schema-based Power BI cockpit with dynamic context transitions (Pole-to-Win %, Podium %, Pit Variance).
* **Interactive Race Engineer Cockpit:** Lightweight HTML5, Tailwind CSS, and Chart.js telemetry layer for real-time visualization.

---

## 🏛️ System Architecture

The pipeline follows a 5-tier modular architecture:

```text
[ TIER 01: SYNTHESIS ]
Python 3.11 + Pandas + NumPy + openpyxl
  │  (Generates 8,000 rows × 58 telemetry columns + noise injection)
  ▼
[ TIER 02: PERSISTENCE ]
PostgreSQL 16 Relational Engine
  │  (ANSI SQL windowing, CTE rank partitioning, statistical aggregations)
  ▼
[ TIER 03: MODELING ]
Power BI Star Schema Engine
  │  (Power Query ETL, 1-to-many dimensional relationships, VertiPaq compression)
  ▼
[ TIER 04: CALCULATIONS ]
DAX Measure Core
  │  (Dynamic filter context, safe division via DIVIDE, CALCULATE overrides)
  ▼
[ TIER 05: PRESENTATION ]
Executive Power BI Cockpit & HTML5/Tailwind Web Telemetry HUD
