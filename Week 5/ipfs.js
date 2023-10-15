const IPFS = require('ipfs-mini');
const ipfs = new IPFS({host: 'ips.infura.io',port: 5001,protocol:'https'});
const data = "some string";
ipfs.add(data, (err,hash) => {
  if(err)
  {
    return console.log(err);
  }
  console.log('https://ipfs.infura.io/ipfs/'+hash);
})
