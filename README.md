# **CHILD REPOSITORY** - flyway-2-grants 

> **🚫 DO NOT EDIT `read-write-flyway-files/` FOLDER** - These files are managed by the parent repo which you can find [here](https://github.com/CleanAyers/shared-flyway-ddl)


## Sync Status
| Repository | Status | Last Sync | Branch | Notes  |
|------------|--------|-----------|---------|-------|
| **flyway-2-grants** | [![Downstream Sync Status](https://github.com/CleanAyers/flyway-2-grants/actions/workflows/flyway-protection.yml/badge.svg)](https://github.com/CleanAyers/flyway-2-grants/actions/workflows/flyway-protection.yml) | ![Last Commit](https://img.shields.io/github/last-commit/CleanAyers/flyway-2-grants/main?label=&style=flat-square) | `main` | Grants & Permissions |


## 🔄 Data Flow Architecture

```
Parent Repo Structure:
┌─ shared-flyway-ddl/
│  ├─ read-write-flyway-files/  ← ✏️  EDIT HERE
│  │  ├─ sql/
│  │  ├─ callbacks/
│  │  ├─ global_config/
│  │  ├─ scripts/
│  │  └─ yaml/
│  └─ .github/workflows/
│     ├─ auto-sync.yml         ← 🤖 Auto triggers
│     └─ production-release.yml ← 🚀 Production deploy
│
│
└─ SYNCS TO ────────────────────────────┐
                                        │
┌───────────────────────────────────────▼─────────────────────────────────┐
│                     Child Repositories                                  │
│                                                                         │
│  flyway-1-pipeline/          flyway-1-grants/                           │
│  ├─ config/ (local)          ├─ conf/ (local)                           │
│  └─ read-only-flyway-files/  └─ read-only-flyway-files/                 │
│     ├─ sql/ ◄────────────────────┬─ sql/ ◄─────────────┐                │
│     ├─ callbacks/               ├─ callbacks/          │                │
│     ├─ global_config/           ├─ global_config/      │                │
│     ├─ scripts/                 ├─ scripts/            │                │
│     └─ yaml/                    └─ yaml/               │                │
│                                                        │                │
│  flyway-2-pipeline/          flyway-2-grants/          │                │
│  ├─ config/ (local)          ├─ config/ (local)        │                │
│  └─ read-only-flyway-files/  └─ read-only-flyway-files/│                │
│     ├─ sql/ ◄────────────────────┬─ sql/ ◄─────────────┘                │
│     ├─ callbacks/               ├─ callbacks/                           │
│     ├─ global_config/           ├─ global_config/                       │
│     ├─ scripts/                 ├─ scripts/                             │
│     └─ yaml/                    └─ yaml/                                │
└─────────────────────────────────────────────────────────────────────────┘
```