# :closed_lock_with_key: End-to-end encrypted HTTP relay proxy

**Introduction & Use case:**

Enterprise solution to hide actual IP addresses/network of server entirely when making outbound HTTP calls. Deploy this
package quickly on a single or multiple cheap $5 cloud VM instances and their IP addresses are the ones that will be
visible in your outbound calls. Just like any other HTTP call, response alongside status code and all the headers are
relayed back to you in real time.

Uses **AES-256** encryption for communication between client and server using a shared secret, does not require SSL/TLS.
Quickly create cluster of untraceable and disposable IP addresses that are exposed in outbound calls.


