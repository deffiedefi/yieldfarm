const { assert } = require('chai')
const { Item } = require('react-bootstrap/lib/Breadcrumb')
const _deploy_contracts = require('../migrations/2_deploy_contracts')

const DappToken = artifacts.require('DappToken')
const DaiToken = artifacts.require('DaiToken')
const TokenFarm = artifacts.require('TokenFarm')

require('chai')
    .use(require('chai-as-promised'))
    .should()

contract('TokenFarm', (accounts) => {
    let daiToken

    before(async () => {
        daiToken = await DaiToken.new()
    })
// write tests here...
    describe('Mock Dai deployment', async () => {
        it('has a name', async () => {
            const name = await daiToken.name()
            assert.equal(name, 'Mock DAI Token')
        })
    })

})   