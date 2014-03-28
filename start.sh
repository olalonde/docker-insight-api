bitcoind -datadir='/data/bitcoin' -daemon -rpcallowip='127.0.0.1'
sleep 20
cd /opt/insight-api/
export INSIGHT_NETWORK="livenet"
export NODE_ENV="production"
export BITCOIND_DATADIR="/data/bitcoin"
node insight.js
