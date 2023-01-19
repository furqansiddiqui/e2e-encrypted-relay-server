<?php
declare(strict_types=1);

require "../vendor/autoload.php";

$node = new \FurqanSiddiqui\E2ESecureRelay\Server\E2ERelayNode(getenv("E2E_SHARED_SECRET"), getenv("E2E_IP_WHITELIST"));
$node->listen();
