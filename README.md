  # "มูลนิธิศูนย์เด็กกำพร้าชาลีมิตร"
  [![image.png](https://i.postimg.cc/2ysR7qV5/image.png)](https://postimg.cc/xN3401Gr)
                    ใน Assignmentที่ 3 นี้เป็นการนำโปรเจคต์ Pet-shop มาปรับปรุงให้เป็นแพลตฟอร์มสำหรับการรับอุปการะเด็กกำพร้าของ 
           "มูลนิธิศูนย์เด็กกำพร้าชาลีมิตร" 
           ประวัติของมูลนิธิศูนย์เด็กกำพร้าชาลีมิตร เริ่มต้นจากการที่มหาเศรษฐีลึกลับ ซึ่งใช้นามแฝงว่า "ชาลี" 
           ซึ่งเป็นเด็กกำพร้ามาก่อนจากการที่พ่อกับแม่ของเขาถูกโจรข้างถนนปล้นชิงทรัพย์ขณะที่ออกจากโรงโอเปร่าเมื่อครั้งเยาว์วัย  
           ชาลีได้ตระหนักดีถึงความทุกข์ของเด็กกำพร้าที่ขาดคนอุปการะเลี้ยงดูทั่วโลก จึงได้สร้างศูนย์เด็กกำพร้าแห่งแรกขึ้นที่ตลาดกุ้ง จ.สมุทรสาคร ในปี 1970 
           และได้ส่งสารต่อไปถึงผู้ใจบุญทั่วโลกถึงความตั้งใจอันแรงกล้าในการที่จะช่วยเหลือเด็กน้อยน่ารักเหล่านี้ 
           จนนำไปสู่การก่อตั้ง"มูลนิธิศูนย์เด็กกำพร้าชาลีมิตร" ณ สวนรถไฟ กทม.ในปี 2001 
                    ต่อมา Vitalik Buterin หนึ่งในผู้คิดค้น Ethereum ลูกครึ่งชาวรัสเซีย/แคนาดา/ปากเกร็ด 
           ได้ยื่นความช่วยเหลือให้กับชาลีในการเสนอการรับประกันความมีสวัสดิภาพของเด็กเหล่านี้ โดยการใช้บล็อกเชน 
           เพื่อให้เกิดความโปร่งใส สามารถสืบทราบได้ว่าเด็กแต่ละคน มีผู้ใดรับอุปการะไปเมื่อใด จากที่ใด ไปอยู่ที่ใด 
           โดยข้อมูลเหล่านี้จะถูกเก็บไว้ในบล็อกเชนตลอดไป ป้องกันมิจฉาชีพหรือผู้ประสงค์ไม่ดี รับเด็กไปเพื่อหาประโยชน์ส่วนตัวได้  
       
         
        

## 1. กำหนดค่าสิ่งแวดล้อมของโปรเจคต์
สร้างไดเร็กทอรีสำหรับบันทึกโปรเจ็คนี้ ซึ่งเนื่องจากนำต้นฉบับมาจาก truffle totorial เพื่อเป็นการป้องกันความผิดพลาดในการบันทึกไฟล์ จึงใช้ชื่อ pet-shop เหมือนกับที่ Truffle ตั้งไว้ โดยเปิด Terminal ขึ้นมาและใช้คำสั่งดังต่อไปนี้

```
mkdir pet-shop
cd pet-shop
```

1.1 ดาวน์โหลดโครงสร้างและไฟล์ต่างๆ ของโปรเจ็คต์ pet-shop จาก Truffle Framework โดยใช้คำสั่งต่อไปนี้ใน terminal

```
truffle unbox pet-shop
```
เครื่องจะทำการดาวน์โหลดไฟล์ลงมาไว้ในโฟลเดอร์ pet-shop ที่สร้างไว้ข้างต้น

ทดลองใช้คำสั่ง ```ls -l``` เพื่อดูโครงสร้างของโปรเจ็ค สังเกตว่า มีไดเร็กทอรีและไฟล์ที่สำคัญต่อไปนี้

- contracts: เป็นไดเร็กทอรีที่ใช้เก็บ Smart Contracts ที่เขียนด้วยภาษา Solidity
- migrations: เป็นไดเร็กทอรีที่ใช้เก็บไฟล์ JavaScript ซึ่งเป็นโค้ดที่ใช้ในการจัดการ Smart Contracts ให้ลงไปยังบล็อกเชน
- src: เป็นไดเร็กทอรีที่ใช้เก็บไฟล์ที่เกี่ยวข้องกับ Web Application เช่น JavaScript, CSS, HTML, images เป็นต้น
- test: เป็นไดเร็กทอรีใช้ที่เก็บไฟล์ Solidity หรือ JavaScript ก็ได้ ที่ใช้เพื่อทดสอบ Smart Contracts
- truffle-config.js: คือไฟล์ที่ใช้ในการกำหนดค่าของโปรเจ็ค

1.2 ที่ Visual studio code ให้เปิดโฟลเดอร์ที่เก็บไฟล์ที่ดาวน์โหลดจาก truffle framework โดยไปที่ File/open folder/pet-shop จากนั้นกด Select folder โฟลเดอร์ต่างๆ จะปรากฎที่ Explorer ตามภาพ  
[![Openfolder.png](https://i.postimg.cc/x88YjDbK/Openfolder.png)](https://postimg.cc/BLrRNzp6)

## 2. สร้าง Smart Contract
### 2.1. Adoption Smart Contract

ใช้ Visual Studio Code นำเคอร์เซอร์วางเหนือโฟลเดอร์ contracts แล้วคลิกขวาไปที่ New file สร้างไฟล์ชื่อ Adoption.sol โดยมีโค้ดดังนี้

```
pragma solidity ^0.7.4;

contract Adoption {
    address[16] public adopters;

    function adopt(uint kidId) public returns (uint) {
        require(kidId >= 0 && kidId <=15);
        adopters[kidId] = msg.sender;
        return kidId;
    }

    function getAdopters() public view returns (address[16] memory) {
        return adopters;
    }
}

```
จากโค้ด จะเห็นได้ว่าคล้ายกับงาน petshop มาก โดยยังใช้จำนวน 16 เท่าเดิม แต่เปลี่ยน Id เป็น kid เพื่อให้เข้ากับเนื้อหาของเว็บไซต์
### 2.2 compile 
ลำดับต่อไปให้ทำการคอมไฟล์ Smart Contracts เพื่อให้เป็นภาษาที่เครื่องเข้าใจ โดยใช้คำสั่งใน terminal ดังนี้

```
truffle compile
```

โปรดตรวจสอบว่า สามารถคอมไพล์ได้สำเร็จก่อนทำในขั้นตอนต่อไป โดยจะมีข้อความเช่นนี้หรือคล้ายกัน ปรากฎขึ้นมา
[![compile.png](https://i.postimg.cc/V6nxgsPs/compile.png)](https://postimg.cc/4742Ng3j)

ใช้ Visual Studio Code นำเคอร์เซอร์วางเหนือโฟลเดอร์ migrations แล้วคลิกขวาไปที่ New file แล้วสร้างไฟล์ชื่อ 2_deploy_contracts.js ในไดเร็กทอรี แล้วเขียนโค้ดดังนี้

```
var Adoption = artifacts.require("Adoption");

module.exports = function(deployer) {
  deployer.deploy(Adoption);
};
```
ดาวน์โหลด Ganache จาก https://www.trufflesuite.com/ganache เมื่อดาวน์โหลดแล้วใช้เมาส์ดับเบิลคลิกที่ชื่อไฟล์ 

[![ganache1.png](https://i.postimg.cc/W176MQyR/ganache1.png)](https://postimg.cc/NK5HtPYb)

จากนั้นคลิกที่ New Workspace ในที่นี้จะตั้งชื่อตามวิชาคือ NF507 จากนั้นคลิก Save Workspace
[![ganache2.png](https://i.postimg.cc/fRkm9JYd/ganache2.png)](https://postimg.cc/FY5YtFWF)



![Workspace](img/ganache_02.png)

ผลลัพธ์ที่ได้เป็นดังรูป โดย Ganache สร้างบัญชีให้ 10 บัญชี แต่ละบัญชีมี 100 ETH โดยดีฟอล์ต

![GanacheDefault](img/ganache_03.png)

เมื่อ Ganache ทำงานได้ดังรูปข้างต้น ขั้นตอนต่อไปคือการ migrate ทำได้โดยใช้คำสั่งต่อไปนี้

```
truffle migrate
```

### 1.3. ทดสอบ Smart Contract
ใช้ Visual Studio Code ในการสร้างไฟล์ TestAdoption.sol เพื่อทดสอบ Adoption.sol และบันทึกลงในไดเร็กทอรี test 

```
pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // The id of the pet that will be used for testing
  uint expectedPetId = 8;

  //The expected owner of adopted pet is this contract
  address expectedAdopter = address(this);

  function testUserCanAdoptPet() public {
    uint returnedId = adoption.adopt(expectedPetId);
    Assert.equal(returnedId, expectedPetId, "Adoption of the expected pet should match what is returned.");
  }

  // Testing retrieval of a single pet's owner
  function testGetAdopterAddressByPetId() public {
    address adopter = adoption.adopters(expectedPetId);
    Assert.equal(adopter, expectedAdopter, "Owner of the expected pet should be this contract");
  }

  // Testing retrieval of all pet owners
  function testGetAdopterAddressByPetIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();
    Assert.equal(adopters[expectedPetId], expectedAdopter, "Owner of the expected pet should be this contract");
  }
}
```

ต่อไปคือ การรันการทดสอบที่เขียนไว้ในไดเร็กทอรี test โดยใช้คำสั่งต่อไปนี้

```
truffle test
```

หากผลการทดสอบผ่านทั้ง 3 กรณีจะได้ผลลัพธ์ดังรูปต่อไปนี้

```
   Using network 'development'.

   Compiling your contracts...
   ===========================
   > Compiling ./test/TestAdoption.sol
   > Artifacts written to /var/folders/z3/v0sd04ys11q2sh8tq38mz30c0000gn/T/test-11934-19747-g49sra.0ncrr
   > Compiled successfully using:
      - solc: 0.5.0+commit.1d4f565a.Emscripten.clang

     TestAdoption
       ✓ testUserCanAdoptPet (91ms)
       ✓ testGetAdopterAddressByPetId (70ms)
       ✓ testGetAdopterAddressByPetIdInArray (89ms)


     3 passing (670ms)
```


## 2. ออกแบบ UI เพื่อใช้เชื่อมต่อกับผู้ใช้
ส่วนติดต่อกับผู้ใช้ เป็นดังรูปต่อไปนี้

![FrontPage](img/front_end_final.png)

สร้างผลลัพธ์เช่นรูปข้างต้นได้โดยใช้ไฟล์ ```src/index.html``` โปรดเปิดไฟล์นี้โดยใช้ Visual Studio Code และสำรวจโครงสร้างของไฟล์ สังเกตได้ว่า มีส่วนที่เป็น Template ในขณะที่ข้อมูลที่ใช้ในการแสดงผลจะถูกกำหนดโดยส่วน Backend

## 3. สร้าง Backend ที่สามารถเชื่อมต่อกับ Smart Contract
แก้ไขไฟล์ ```src/js/app.js``` ให้มีโค้ดดังนี้

```
App = {
  web3Provider: null,
  contracts: {},

  init: async function() {
    // Load pets.
    $.getJSON('../pets.json', function(data) {
      var petsRow = $('#petsRow');
      var petTemplate = $('#petTemplate');

      for (i = 0; i < data.length; i ++) {
        petTemplate.find('.panel-title').text(data[i].name);
        petTemplate.find('img').attr('src', data[i].picture);
        petTemplate.find('.pet-breed').text(data[i].breed);
        petTemplate.find('.pet-age').text(data[i].age);
        petTemplate.find('.pet-location').text(data[i].location);
        petTemplate.find('.btn-adopt').attr('data-id', data[i].id);

        petsRow.append(petTemplate.html());
      }
    });

    return await App.initWeb3();
  },

  initWeb3: async function() {
    // Modern dapp browsers...
    if (window.ethereum) {
      App.web3Provider = window.ethereum;
      try {
        // Request account access
        await window.ethereum.enable();
      } catch (error) {
        // User denied account access...
        console.error("User denied account access")
      }
    }
    // Legacy dapp browsers...
    else if (window.web3) {
      App.web3Provider = window.web3.currentProvider;
    }
    // If no injected web3 instance is detected, fall back to Ganache
    else {
      App.web3Provider = new Web3.providers.HttpProvider('http://localhost:7545');
    }
    web3 = new Web3(App.web3Provider);

    return App.initContract();
  },

  initContract: function() {
    $.getJSON('Adoption.json', function (data) {
      // Get the necessary contract artifact file and instantiate it with @truffle/contract
      var AdoptionArtifact = data;
      App.contracts.Adoption = TruffleContract(AdoptionArtifact);

      // Set the provider for our contract
      App.contracts.Adoption.setProvider(App.web3Provider);

      // Use our contract to retrieve and mark the adopted pets
      return App.markAdopted();
    });
    return App.bindEvents();
  },

  bindEvents: function() {
    $(document).on('click', '.btn-adopt', App.handleAdopt);
  },

  markAdopted: function() {
    var adoptionInstance;

    App.contracts.Adoption.deployed().then(function (instance) {
      adoptionInstance = instance;

      return adoptionInstance.getAdopters.call();
    }).then(function (adopters) {
      for (i = 0; i < adopters.length; i++) {
        if (adopters[i] !== '0x0000000000000000000000000000000000000000') {
          $('.panel-pet').eq(i).find('button').text('Success').attr('disabled', true);
        }
      }
    }).catch(function (err) {
      console.log(err.message);
    });
  },

  handleAdopt: function(event) {
    event.preventDefault();

    var petId = parseInt($(event.target).data('id'));

    var adoptionInstance;

    web3.eth.getAccounts(function (error, accounts) {
      if (error) {
        console.log(error);
      }

      var account = accounts[0];

      App.contracts.Adoption.deployed().then(function (instance) {
        adoptionInstance = instance;

        // Execute adopt as a transaction by sending account
        return adoptionInstance.adopt(petId, { from: account });
      }).then(function (result) {
        return App.markAdopted();
      }).catch(function (err) {
        console.log(err.message);
      });
    });
  }

};

$(function() {
  $(window).load(function() {
    App.init();
  });
});

```

## 4. ติดตั้ง MetaMask
- ติดตั้ง MetaMask ที่บราวเซอร์ Firefox
- เมื่อเริ่มใช้งาน MetaMask จะได้ดังรูป 

![Metamaks_01](img/metamask_01.png)

- คลิกที่ Get Started จะได้ผลลัพธ์ดังรูปด้านล่าง

![Metamask_02](img/metamask_02.png)

- คลิกที่ Import Wallet เพื่อเชื่อมต่อ MetaMask เข้ากับ Wallet ของ Ganache

![Metamask_03](img/metamask_03.png)

- ทำการก็อปปี้ Seed จาก Ganache นำมาวางลงในช่อง Wallet Seed ตั้งพาสเวิร์ด ติ๊กที่ I have read and agree to the Terms of Use แล้วคลิก Import

![Metamask_04](img/metamask_04.png)

- ทำการย้ายจาก Ethereum Mainnet มาที่ Ganache โดยคลิกที่ Ethereum Mainnet แล้วเลือก Custom RPC

![Metamask_05](img/metamask_05.png)

- ป้อนข้อมูล Network Name (เป็นค่าใดๆ ก็ได้ ในรูปนี้ตั้งชื่อเป็น Ganache) ส่วน New RPC URL ต้องเป็น URL ของ Ganache ซึ่งในที่นี้คือ ```http://127.0.0.1:7545```

## 5. รันโปรแกรม 

รัน Backend โดยใช้คำสั่ง 

```
npm run dev
```

จากนั้นเปิด Firefox ที่ URL ดังนี้ ```http://localhost:3000```


         

