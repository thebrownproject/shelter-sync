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

Shelter Sync is a full-stack animal shelter management system developed by a three person team as our Certificate IV in IT (Programming) first semester capstone project. The application streamlines shelter operations through comprehensive animal records management and real-time RFID tracking. The system integrates ESP32-based RFID scanners with real-time database synchronization, enabling staff to instantly access animal information via handheld devices or the web interface.

---

## Tech Stack

**Frontend:** SvelteKit 5 · TypeScript · TailwindCSS 4 · shadcn-svelte <br>
**Backend:** Supabase (PostgreSQL · Realtime · Auth) · Self-Hosted (Docker Compose) <br>
**Infrastructure:** DigitalOcean VPS · Caddy (Reverse Proxy) · SSL/TLS · DuckDNS <br>
**Hardware:** ESP32 · MicroPython · RFID (RC522) · OLED Display <br>
**Deployment:** Netlify (Frontend) · Docker · Ubuntu 25.04

---

## Features

- Animal management with full CRUD operations and adoption status tracking
- Two-stage RFID authentication where staff scan their access card before scanning animals
- Real-time RFID scanning with ESP32 handheld scanners displaying instant animal details on OLED display
- Supabase Realtime subscriptions for live scan log updates across all connected clients
- RFID scan log history with detailed tracking of all animal scans and staff interactions
- Authentication and authorisation via Supabase Auth with server-side session validation
- Data visualisation dashboard with interactive scan history charts
- Staff profile management with volunteer status tracking and role information
- Custom UI/UX design with shadcn-svelte component system and responsive layouts

---

## Architecture & Tech Decisions

Built with SvelteKit and Supabase to leverage server-side rendering with real-time database capabilities. The application integrates ESP32 RFID scanners with a web interface through Supabase's REST API and Realtime subscriptions, enabling instant synchronisation of scan events across all connected clients. Authentication handled via server hooks with session validation, ensuring all routes require authentication except the auth pages. UI built with shadcn-svelte component system for consistent, accessible design patterns.

### Key Technical Decisions

**Supabase Realtime for Hardware-Web Synchronisation**

Chose Supabase Realtime over polling to achieve sub-second latency for RFID scan updates. When ESP32 devices POST scan data via REST API, Realtime broadcasts changes to all connected web clients instantly via WebSockets. This eliminates the need for continuous polling and provides a live view of shelter activity.

**Two-Stage RFID Authentication**

Implemented a secure authentication flow where staff must scan their access card before scanning animals. Session expires after 30 seconds of inactivity, preventing unauthorised access if a device is left unattended. This mirrors industry security patterns (card + PIN, 2FA) while keeping the UX simple for staff.

**Self-Hosted Supabase Infrastructure**

Deployed full Supabase stack via Docker Compose on DigitalOcean VPS to demonstrate production DevOps capabilities. Configured Caddy as reverse proxy with automatic Let's Encrypt SSL/TLS certificates. DuckDNS domain provides HTTPS access to backend API, resolving browser mixed-content security restrictions for WebSocket connections. Frontend remains on Netlify CDN for optimal delivery.

**Component Architecture with Svelte 5 Runes**

Used Svelte 5's new runes (`$state`, `$derived`, `$effect`) for clean reactivity patterns. Organised components by feature domain (animals, rfid, forms, layout) with barrel exports for maintainable imports. Split large components into focused, single-responsibility modules for better testability and code clarity.

**Server-Side Form Actions**

SvelteKit form actions handle CRUD operations server-side, providing progressive enhancement and working without JavaScript enabled. Form submissions POST to `?/create`, `?/update`, `?/delete` actions which validate data and interact with Supabase securely without exposing credentials to the client.

---

## Role & Contributions

**My Contributions:**

**Technical Leadership & Planning:**

- Coordinated team of three developers using Jira for sprint planning and daily standups
- Designed database schema with relationships across multiple tables supporting animal management and RFID tracking
- Implemented Git branching strategy and managed pull requests for feature integration
- Set up CI/CD pipeline with Netlify for automated deployment

**Core Development Work (66% of commits):**

- Built authentication system with Supabase Auth, server-side session management, and protected route guards
- Developed majority of frontend pages including animal management, RFID scan logs, dashboard visualisation, and user profiles
- Designed and implemented UI/UX using shadcn-svelte component system with custom responsive layouts
- Created RFID scan log visualisation with real-time chart updates
- Implemented TypeScript type definitions for all database entities with snake_case to camelCase mapping
- Integrated Supabase Realtime subscriptions for live RFID scan detection across web and mobile interfaces

**DevOps & Deployment:**

- Deployed frontend to Netlify with automated CI/CD pipeline triggered by Git commits to main branch
- Self-hosted complete Supabase stack on DigitalOcean VPS using Docker Compose with persistent volume management
- Configured Caddy reverse proxy with automatic Let's Encrypt SSL/TLS certificate provisioning and renewal
- Set up DuckDNS dynamic DNS for HTTPS access to backend API, resolving mixed-content security restrictions
- Configured environment variables and secrets management across development and production environments

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
- Synchronising RFID scan data between ESP32 devices and web clients with sub-second latency using Supabase Realtime
- Balancing project scope with timeline constraints while delivering core functionality for animal management and RFID tracking
