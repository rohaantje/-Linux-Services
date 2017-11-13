# -Linux-Services

Eindopdracht - Linux Services – 2016/2017

In de openstack omgeving dien je het volgende te realiseren:
Zet een hoofdserver op die de volgende functionaliteiten biedt:
- Centrale logservice;
- Monitoring service;
- Salstack master;
- Docker en Kubernetes master.

Overleg met de docent welke logservice en welke monitor je gaat aanbieden.
Het instaleren van de hiervoor genoemde services dienen met behulp van een script te
gebeuren

Realiseer 2 servers die dienst doen als Docker worker voor Kubernetes. De servers moeten
ingericht worden via Saltstack. Bij het opstarten van de VM mag je een script meegeven
zodat Saltstack minion services wordt geïnstalleerd. De VM’s moet hun system log naar de
log servers sturen en gemonitord wordt door de monitor service.

Op de Docker containers moet d.m.v saltstack een Wordpress installatie opgezet worden.
Alle scripts dienen op een git-repository te worden opgeslagen. De scripts moet eigen werk
zijn. Indien je scripts gebruikt die je op het internet hebt gevonden dan krijg je per script een
½ punt aftrek. Hierbij dien je wel de bron vermeldt te hebben. Indien er plagiaat wordt
geconstateerd zal de opdracht niet beoordeeld worden en de constatering bij de
examencommissie gemeld worden.

Op Blackboard staat een beoordelingsmodel voor deze opdracht.