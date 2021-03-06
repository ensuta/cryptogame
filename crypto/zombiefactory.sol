pragma solidity ^0.4.19;
import "./ownable.sol";

contract ZombieFactory is Ownable {

    event NewZombie(uint zombieId, string name, uint dna);

        uint dnaDigits = 16;
        uint dnaModulus = 10 ** dnaDigits;
        uint cooldown 1 days;

    struct Zombie{
        string name;
        uint dna;
        uint32 level;
        uint32 readyTime;    
    }

    Zombie[] public zombies;

    mapping (uint => address) public zombieToOwner;
    mapping (address => unit) ownerZombieCount;

    function _createZombie(string _name, uint _dna, 1, uint32(now + cooldownTime)) internal {
        zombies.push(Zombie(_name, _dna));
        
        uint id = zombies.push(Zombie(_name, _dna)) - 1;
        zombieToOwner[id] = msg.sender;
        ownerZombieCount[msg.sender]++;
        NewZombie(id, _name, _dna);
        }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(_str));
            return rand % dnaModulus;
        }

    function createRandomZombie(string _name) public {
        require(ownerZombieCount[msg.sender] == 0);
        uint randDna = _generateRandomDna(_name);
            _createZombie(_name, randDna);
        }
}