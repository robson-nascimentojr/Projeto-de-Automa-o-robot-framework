require('dotenv/config');

const dns = require('dns');

const dnsServers = (process.env.DNS_SERVERS || '1.1.1.1,8.8.8.8')
  .split(',')
  .map((server) => server.trim())
  .filter(Boolean);

dns.setServers(dnsServers);

require('babel-core/register');
require('./build/app.js');
