# Shelter Sync

![Status](https://img.shields.io/badge/status-complete-green)
![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?logo=typescript&logoColor=white)
![SvelteKit](https://img.shields.io/badge/SvelteKit-FF3E00?logo=svelte&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?logo=postgresql&logoColor=white)
![MicroPython](https://img.shields.io/badge/MicroPython-2B2728?logo=micropython&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)
![DigitalOcean](https://img.shields.io/badge/DigitalOcean-0080FF?logo=digitalocean&logoColor=white)

> Animal shelter management system with CRUD operations, real-time RFID tracking, and team collaboration using Agile development principles

🔗 **Live Demo:** [shelter-sync.netlify.app](https://shelter-sync.netlify.app)

---

## Overview

Shelter Sync is a full-stack animal shelter management system developed by a three person team as our Certificate IV in IT (Programming) capstone first semester project. The application streamlines shelter operations through comprehensive animal records management, adoption tracking, veterinary health monitoring, and volunteer scheduling. The system integrates ESP32-based RFID scanners with real-time database synchronization, enabling staff to instantly access animal information via handheld devices or the web interface.

---

## Tech Stack

**Frontend:** SvelteKit 5 · TypeScript · TailwindCSS 4 · shadcn-svelte <br>
**Backend:** Supabase (PostgreSQL · Realtime · Auth) · Self-Hosted (Docker Compose) <br>
**Infrastructure:** DigitalOcean VPS · Caddy (Reverse Proxy) · SSL/TLS · DuckDNS <br>
**Hardware:** ESP32 · MicroPython · RFID (RC522) · OLED Display <br>
**Deployment:** Netlify (Frontend) · Docker · Ubuntu 25.04

---

## Features

- Animal management with CRUD operations, adoption status tracking, and bonded pair relationships
- Two-stage RFID authentication system where staff scan their access card before scanning animals
- Real-time RFID scanning with ESP32 handheld scanners displaying instant animal details on OLED display
- Supabase Realtime subscriptions for live scan log updates across all connected clients
- Comprehensive adoption workflow tracking from application to completion
- Veterinary health record management with examination history
- Staff and volunteer scheduling system with shift management
- Authentication and authorization via Supabase Auth with server-side session validation
- Data visualization dashboard with scan history charts using LayerChart
- Custom UI/UX design with shadcn-svelte component system and responsive layouts

---

## Architecture & Tech Decisions

Built with SvelteKit and Supabase to leverage server-side rendering with real-time database capabilities. The architecture separates concerns between authenticated routes under `/private` and public authentication pages, with session validation handled in server hooks. Chose Supabase Realtime for instant scan log synchronization between hardware devices and web clients without polling. The RFID hardware implements a secure two-stage authentication flow using MicroPython on ESP32: staff must authenticate with their RFID access card via REST API before scanning animals, with automatic session timeout after 30 seconds of inactivity. Custom Supabase client configuration supports both cloud and local development with ngrok compatibility. UI components built with shadcn-svelte for consistent, accessible design patterns across the application.

**Self-Hosted Infrastructure**
Self-hosted Supabase deployment on DigitalOcean demonstrates production DevOps capabilities. Deployed full Supabase stack (13 microservices) via Docker Compose on Ubuntu 25.04 VPS with 2GB RAM. Configured Caddy as reverse proxy with automatic Let's Encrypt SSL/TLS certificate management. Free DuckDNS domain provides HTTPS access to backend API, resolving browser mixed-content security restrictions for WebSocket connections. Frontend remains on Netlify CDN for optimal delivery while backend runs on self-managed infrastructure.

---

## Role & Contributions

**My Contributions:**

**Technical Leadership & Planning:**

- Coordinated team of three developers using Jira for sprint planning and daily standups
- Designed database schema with seven core tables and relationships (animals, adoptions, health checks, users, shifts, RFID logs)
- Implemented Git branching strategy and managed pull requests for feature integration
- Set up CI/CD pipeline with Netlify for automated deployment

**Core Development Work (66% of commits):**

- Built authentication system with Supabase Auth, server-side session management, and protected route guards
- Developed majority of frontend pages including animal management, adoption tracking, health records, and volunteer scheduling
- Designed and implemented UI/UX using shadcn-svelte component system with custom responsive layouts
- Created RFID scan log visualization with real-time chart updates
- Implemented TypeScript type definitions for all database entities with snake_case to camelCase mapping
- Integrated Supabase Realtime subscriptions for live RFID scan detection across web and mobile interfaces
- Deployed self-hosted Supabase infrastructure with Docker containerization, reverse proxy configuration, and SSL automation

**Hardware Integration:**

- Collaborated on ESP32 RFID scanner firmware using MicroPython with OLED display feedback and audio/visual indicators
- Implemented two-stage authentication system where users scan access cards before animal scanning
- Configured WiFi connectivity and RESTful API communication from hardware to Supabase backend

---

## Learnings & Challenges

**Key Learnings:**

- Leading a development team through full Agile workflow with sprint planning, standups, and retrospectives
- Architecting a full-stack application with real-time capabilities across web and hardware interfaces
- Managing complex database relationships and ensuring data integrity with PostgreSQL constraints
- Integrating hardware devices with cloud infrastructure via RESTful APIs and realtime subscriptions
- Deploying production infrastructure with Docker Compose, reverse proxies (Caddy), and SSL/TLS certificate automation

**Challenges Overcome:**

- Coordinating team contributions across different skill levels while maintaining code quality through PR reviews
- Configuring Supabase client for both server-side rendering and client-side realtime features with custom fetch handling
- Synchronizing RFID scan data between ESP32 devices and web clients with sub-second latency using Supabase Realtime
- Balancing project scope with timeline constraints while delivering core functionality for shelter operations
