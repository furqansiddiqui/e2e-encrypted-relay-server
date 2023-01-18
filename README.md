# :closed_lock_with_key: End-to-end encrypted HTTP relay proxy

**Introduction & Use case:**

Enterprise solution to hide actual IP addresses/network of server entirely when making outbound HTTP calls. Deploy this
package quickly on a single or multiple cheap $5 cloud VM instances and their IP addresses are the ones that will be
visible in your outbound calls. Just like any other HTTP call, response alongside status code and all the headers are
relayed back to you in real time.

Uses **AES-256** encryption for communication between client and server using a shared secret, does not require SSL/TLS.
Quickly create cluster of untraceable and disposable IP addresses that are exposed in outbound calls.

## Deployment Instructions

### Configuration

Edit `.env` file to change following parameters:

| Variable      | Default Value          | Description                                                                                                                                            |
|---------------|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| HTTP_PORT     | 6001                   | Exposed HTTP port that will be used alongside instance's IP address for the client to communicate with. Suggested to use any random TCP port (<65535). |
| SHARED_SECRET | E2E_Shared_Secret_Here | Shared secret for AES-256 encryption. This value must match with the client.                                                                           |

### Prerequisite & Deployment

Clone this repository in any non-root user account:

`git clone https://github.com/furqansiddiqui/e2e-encrypted-relay-server`

Edit configuration file:

`pico .env`

Quick deployment with Docker Compose V2 using single command:

`docker compose up -d`

## Access & Error Log

The directory `log/` is mounted as volume with docker build which means the HTTP access and error log are available
real-time. Following are the available log files:

| File       | Description                                            |
|------------|--------------------------------------------------------|
| access.log | HTTP server access log                                 |
| error.log  | Error log from Nginx, FPM or PHP fatal errors (if any) |

Logs can be accessed with `cat` or `tail` commands:

`tail -f log/[filename].log`

**Gotcha:** These log files are not automatically trimmed/rotated therefore depending on use these may grow into very large files over the time. So manual truncation may be adviced depending on the consumption.
