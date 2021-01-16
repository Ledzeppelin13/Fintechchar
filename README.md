   # "มูลนิธิศูนย์เด็กกำพร้าชาลีมิตร"
 
   ใน Assignmentที่ 3 นี้เป็นการนำโปรเจคต์ **Pet-shop** มาปรับปรุงให้เป็นแพลตฟอร์มสำหรับการรับอุปการะเด็กกำพร้าของ "มูลนิธิศูนย์เด็กกำพร้าชาลีมิตร"                                                    ประวัติของมูลนิธิศูนย์เด็กกำพร้าชาลีมิตร เริ่มต้นจากการที่มหาเศรษฐีลึกลับ ซึ่งใช้นามแฝงว่า **"ชาลี"** 👨
ซึ่งเป็นเด็กกำพร้ามาก่อนจากการที่พ่อกับแม่ของเขาถูกโจรข้างถนนปล้นชิงทรัพย์ขณะที่ออกจากโรงโอเปร่าเมื่อครั้งเยาว์วัย  

  ชาลีได้ตระหนักดีถึงความทุกข์ของเด็กกำพร้า😥ที่ขาดคนอุปการะเลี้ยงดูทั่วโลก จึงได้สร้างศูนย์เด็กกำพร้าแห่งแรกขึ้นที่ตลาดกุ้ง จ.สมุทรสาคร ในปี 1970 
และได้ส่งสารต่อไปถึงผู้ใจบุญทั่วโลกถึงความตั้งใจอันแรงกล้าในการที่จะช่วยเหลือเด็กน้อยน่ารักเหล่านี้  จนนำไปสู่การก่อตั้ง"มูลนิธิศูนย์เด็กกำพร้าชาลีมิตร" ณ สวนรถไฟ กทม.ในปี 2001 

  ต่อมา **Vitalik Buterin** 👦หนึ่งในผู้คิดค้น **Ethereum** ลูกครึ่งชาวรัสเซีย/แคนาดา/ปากเกร็ด ได้ยื่นความช่วยเหลือให้กับชาลีในการเสนอการรับประกันความมีสวัสดิภาพของเด็กเหล่านี้ โดยการใช้บล็อกเชน 
เพื่อให้เกิดความโปร่งใส สามารถสืบทราบได้ว่าเด็กแต่ละคน มีผู้ใดรับอุปการะไปเมื่อใด👨‍👩‍👧 จากที่ใด ไปอยู่ที่ใด โดยข้อมูลเหล่านี้จะถูกเก็บไว้ในบล็อกเชนตลอดไป ป้องกันมิจฉาชีพหรือผู้ประสงค์ไม่ดี รับเด็กไปเพื่อหาประโยชน์ส่วนตัวได้   

## สรุปการทำงานของโปรเจคต์
โปรเจคต์นี้ สรุปได้ว่า เราใช้ Smart contract ที่เขียนโดยภาษา Solidity ซึ่งเรา deploy บนบล็อกเชนส่วนบุคคล Ganache/Metamask ไปเชื่อมต่อกับ Front-end และ back-end  ซึ่งจะมีไฟล์ที่สำคัญดังต่อไปนี้ 
       1.Adoption.sol
       2.index.html
       3.app.js
       4.Kids.json 

## 1. กำหนดค่าสิ่งแวดล้อมของโปรเจคต์
- การสร้างโฟลเดอร์สำหรับบันทึกโปรเจ็คนี้ เนื่องจากนำต้นฉบับมาจาก [Pet Shop tutorial](http://truffleframework.com/tutorials/pet-shop) เพื่อเป็นการป้องกันความผิดพลาดในการบันทึกไฟล์ จึงใช้ชื่อ **pet-shop** เหมือนกับที่ Truffle ตั้งไว้ โดยเปิด Terminal ขึ้นมาและใช้คำสั่งดังต่อไปนี้

```
mkdir pet-shop
cd pet-shop
```

1.1 ดาวน์โหลดโครงสร้างและไฟล์ต่างๆ ของโปรเจ็คต์ **pet-shop** จาก **Truffle Framework** โดยใช้คำสั่งต่อไปนี้ใน terminal

```
truffle unbox pet-shop
```
เครื่องจะทำการดาวน์โหลดไฟล์ลงมาไว้ในโฟลเดอร์ pet-shop ที่สร้างไว้ข้างต้น  เมื่อดาวน์โหลดเสร็จ จะขึ้นข้อความตามภาพ

[![unbox.png](https://i.postimg.cc/fLdFbSSM/unbox.png)](https://postimg.cc/0M8ZWQC4)

ทดลองใช้คำสั่ง ```ls -l``` เพื่อดูโครงสร้างของโปรเจ็ค ซึ่งจะมีโฟลเดอร์และไฟล์ที่สำคัญต่อไปนี้

- contracts: เป็นโฟลเดอร์ที่ใช้เก็บ Smart Contracts ที่เขียนด้วยภาษา _**Solidity**_
- migrations: เป็นโฟลเดอร์ที่ใช้เก็บไฟล์ JavaScript ซึ่งเป็นโค้ดที่ใช้ในการจัดการ Smart Contracts ให้ลงไปยังบล็อกเชน
- src: เป็นโฟลเดอร์ที่ใช้เก็บไฟล์ที่เกี่ยวข้องกับ Web Application เช่น JavaScript, CSS, HTML, images เป็นต้น
- test: เป็นโฟลเดอร์ใช้ที่เก็บไฟล์ Solidity หรือ JavaScript ก็ได้ ที่ใช้เพื่อทดสอบ Smart Contracts
- truffle-config.js: คือไฟล์ที่ใช้ในการกำหนดค่าของโปรเจ็ค

1.2 ที่ Visual studio code ให้เปิดโฟลเดอร์ที่เก็บไฟล์ที่ดาวน์โหลดจาก truffle framework โดยไปที่ ```File/open folder/pet-shop``` จากนั้นกด ```Select folder``` โฟลเดอร์ต่างๆ จะปรากฎที่ ``` Explorer``` ตามภาพ  

[![Openfolder.png](https://i.postimg.cc/Kj2HN4LG/Openfolder.png)](https://postimg.cc/Q9fmN80w)

## 2. สร้าง Smart Contract
### 2.1. Adoption Smart Contract

ที่ Visual Studio Code ให้นำเคอร์เซอร์วางเหนือโฟลเดอร์ ```contracts``` แล้วคลิกขวาไปที่ ```New file``` และสร้างไฟล์ชื่อ ```Adoption.sol``` โดยมีโค้ดดังนี้

```
pragma solidity ^0.5.16;

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
จากโค้ด จะเห็นได้ว่าคล้ายกับงาน petshop มาก โดยยังใช้จำนวน 16 เท่าเดิม แต่เปลี่ยน _**PetId**_ เป็น _**kidId**_ เพื่อให้เข้ากับเนื้อหาของเว็บไซต์
ใน contract นี้จะมี 2 function ได้แก่ adopt ซึ่งเก็บค่าและคืนค่าเด็กกำพร้า (kidId)  และ function getAdopters ซึ่งเป็นการเรียกดูข้อมูลและคืนค่าผู้อุปการะ(adopters)  

### 2.2 compile 
---------
ลำดับต่อไปให้ทำการคอมไฟล์ Smart Contract เพื่อให้เป็นภาษาที่เครื่องเข้าใจ โดยใช้คำสั่งใน terminal ดังนี้

```
truffle compile
```

โปรดตรวจสอบว่า สามารถคอมไพล์ได้สำเร็จก่อนทำในขั้นตอนต่อไป โดยจะมีข้อความเช่นนี้หรือคล้ายกัน ปรากฎขึ้นมา

[![compile.png](https://i.postimg.cc/nz07LhxR/compile.png)](https://postimg.cc/0MKrWxbD)

จากนั้นใน **Visual Studio Code** ให้นำเคอร์เซอร์วางเหนือโฟลเดอร์ ```migrations``` แล้วคลิกขวาไปที่ ```New file``` แล้วสร้างไฟล์ชื่อ ```2_deploy_contracts.js``` แล้วเขียนโค้ดดังนี้

```
var Adoption = artifacts.require("Adoption");

module.exports = function(deployer) {
  deployer.deploy(Adoption);
};
```
ดาวน์โหลด **Ganache** จาก [Ganache](https://www.trufflesuite.com/ganache) เมื่อดาวน์โหลดแล้วใช้เมาส์ดับเบิลคลิกที่ชื่อไฟล์ 

[![ganache1.png](https://i.postimg.cc/bvqfzCdY/ganache1.png)](https://postimg.cc/pmc6CBD3)

คลิกที่  ```New Workspace```เพื่อตั้งชื่อ ในที่นี้จะตั้งชื่อตามวิชาคือ NF507 จากนั้นคลิก ```Save Workspace```

[![ganache2.png](https://i.postimg.cc/Y91XhkPJ/ganache2.png)](https://postimg.cc/zbGwQm8j)


จะปรากฎ การแสดง account บน ganache ต่างๆ ตามภาพ

[![ganache3.png](https://i.postimg.cc/85V489Cw/ganache3.png)](https://postimg.cc/f3BmmHm0)

### 2.3 Migrate
---------
ในขั้นตอนต่อไปให้ทำการ **migrate** Smart contract ไปอยู่บน _**personal blockchain**_ ซึ่งในที่นี้คือ **ganache** ทำได้โดยใช้คำสั่งใน **terminal** ดังต่อไปนี้

```
truffle migrate
```
หาก **migrate** ผ่าน จะปรากฎข้อความลักษณะดังกล่าว ซึ่งเป็นการอ่าน ไฟล์ ```Adoption.sol,1_initial_migration.js``` และ ```2_deploy_contracts.js```ซึ่งระบบจะนำข้อมูลไปไว้บนบล็อคเชน และคำนวณค่า gas ซึ่งมีหน่วยเป็น _**Wei**_ ,_**Gwei**_ และ _**Ether**_ ตามลำดับ

```
Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.



Starting migrations...
======================
> Network name:    'development'
> Network id:      5777
> Block gas limit: 6721975 (0x6691b7)


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0xc6c26d00c1a2389cf091b21acfbf8c6d49792b855738849bb3c0ea9381da3fab   > Blocks: 0            Seconds: 0
   > contract address:    0xBAD797B409700E05374664CAd548f20F3a47b84F
   > block number:        18
   > block timestamp:     1610204710
   > account:             0xd797cb4efB9759A907E7849a454fEE2D9ba059EF
   > balance:             99.97105016
   > gas used:            191943 (0x2edc7)
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.00383886 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.00383886 ETH


2_deploy_contracts.js
=====================

   Deploying 'Adoption'
   --------------------
   > transaction hash:    0x5fd4693613601e09253f91a33fd5abe31bc469f2f7a00360c87be5854d00caa4   > Blocks: 0            Seconds: 0
   > contract address:    0xA7621957B4A66C341a56Fd82b5f1eA93EC9859D1
   > block number:        20
   > block timestamp:     1610204711
   > account:             0xd797cb4efB9759A907E7849a454fEE2D9ba059EF
   > balance:             99.96612686
   > gas used:            203827 (0x31c33)
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.00407654 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.00407654 ETH


Summary
=======
> Total deployments:   2
> Final cost:          0.0079154 ETH
```
### 2.4 ทดสอบ Smart Contract
---------
ไปที่ **Visual Studio Code** โดยนำเคอร์เซอร์ไปวางเหนือโฟลเดอร์ ```contracts ``` แล้วคลิกขวาไปที่ ```New file```แล้วสร้างไฟล์ชื่อ ```TestAdoption.sol``` โดยมีโค้ดดังนี้ 

```
pragma solidity ^0.5.16;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
  // The address of the adoption contract to be tested
  Adoption adoption = Adoption(DeployedAddresses.Adoption());

  // The id of the kid that will be used for testing
  uint expectedKidId = 8;

  //The expected Foster parent of adopted kid is this contract
  address expectedAdopter = address(this);

  function testUserCanAdoptKid() public {
    uint returnedId = adoption.adopt(expectedKidId);
    Assert.equal(returnedId, expectedKidId, "Adoption of the expected kid should match what is returned.");
  }

  function testGetAdopterAddressByKidId() public {
    address adopter = adoption.adopters(expectedKidId);
    Assert.equal(adopter, expectedAdopter, "Foster parent of the expected Kid should be this contract");
  }

  // Testing retrieval of all kid Foster parents
  function testGetAdopterAddressByKidIdInArray() public {
    // Store adopters in memory rather than contract's storage
    address[16] memory adopters = adoption.getAdopters();
    Assert.equal(adopters[expectedKidId], expectedAdopter, "Foster parent of the expected Kid should be this contract");
  }
}
```

รันการทดสอบโค้ดด้านบน โดยใช้คำสั่งใน terminal ต่อไปนี้

```
truffle test
```

ที่หน้าจอของ Terminal จะขึ้นข้อความตามด้านล่าง หรือคล้ายกัน

```
 PS C:\Users\Account\pet-shop> truffle test
Using network 'development'.


Compiling your contracts...
===========================
> Compiling .\contracts\Adoption.sol
> Compiling .\contracts\TestAdoption.sol
> Artifacts written to C:\Users\Account\AppData\Local\Temp\test--44844-yY4cgjNa3zlN
> Compiled successfully using:
   - solc: 0.5.16+commit.9c3226ce.Emscripten.clang



  0 passing (0ms)
```


## 3.รูปแบบเว็บไซต์ ( User Interface :UI) ซึ่งเป็น front end เพื่อใช้เชื่อมต่อกับผู้ใช้
รูปลักษณ์ของเว็บแอพพลิเคชั่นที่ออกแบบมีลักษณะ ดังนี้ 

[![1.png](https://i.postimg.cc/GpnG9Y1m/1.png)](https://postimg.cc/ZWjCMWRG)
[![2.png](https://i.postimg.cc/gjj61H3N/2.png)](https://postimg.cc/MfkTQRPQ)

รูปลักษณ์ตามที่เห็นนี้เป็นการแก้ไขไฟล์```index.html``` , ```app.js``` และ ```Kids.json``` โดยเริ่มที่ **front end** คือไฟล์ ```index.html```ให้เปิด **Visual Studio Code** ไปที่ ```src/index.html``` โดยให้มีโค้ด ดังนี้ 

```<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>มูลนิธิศูนย์เด็กกำพร้าชาลีมิตร</title>
    
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body background="https://www.muralswallpaper.co.uk/app/uploads/watercolour-polka-dot-room-825x535.jpg">
    
    <div class="container">
      <div class="row">
        <div class="col-12 text-center">
          <h1
          style="font-size: 60px; 
                color: rgb(26, 20, 114);
                font-family: Verdana, Geneva, Tahoma, sans-serif;
                border: 10px rgb(218, 4, 4); 
                border-style: double; 
                background-color: white;" 
          class="text-center">
            <b>มูลนิธิศูนย์เด็กกำพร้าชาลีมิตร</b></h1>
          <hr/>
          <p style="font-size: 30px; 
          color: rgb(70, 121, 12);
          font-family: Verdana, Geneva, Tahoma, sans-serif;
          border: 10px rgb(218, 4, 4); 
          background-color: white;" >เบอร์ติดต่อ : 02-657-3741</p>
        </div>
      </div>
      <div id="kidsRow" class="row">
        <!-- KIDS LOAD HERE -->
      </div>
    </div>

    <div id="kidTemplate" style="display: none;">
      <div class="col-sm-6 col-md-4 col-lg-3">
        <div class="panel panel-default panel-pet">
          <div class="panel-heading">
            <h2 class="panel-title"><b>Scrappy</b></h2>
          </div>
          <div class="panel-body">
            <img alt="140x140" data-src="holder.js/140x140" class="img-rounded img-center" style="width: 100%;" src="https://animalso.com/wp-content/uploads/2017/01/Golden-Retriever_6.jpg" data-holder-rendered="true">
            <br/><br/>
            <strong>เชื้อชาติ</strong>: <span class="pet-breed">Golden Retriever</span><br/>
            <strong>อายุ</strong>: <span class="pet-age">3</span><br/>
            <strong>ที่อยู่ศูนย์กำพร้า</strong>: <span class="pet-location">Warren, MI</span><br/><br/>
            <button class="btn btn-default btn-adopt" type="button" data-id="0">รับอุปการะ</button>
          </div>
        </div>
      </div>
    </div>

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/web3.min.js"></script>
    <script src="js/truffle-contract.js"></script>
    <script src="js/app.js"></script>
  </body>
</html>
```
[![indexhtml1.png](https://i.postimg.cc/pLN2z7wp/indexhtml1.png)](https://postimg.cc/tY5QHrCj)

จากโค้ด **บรรทัดที่ 20-41**  เป็นการปรับแต่งพื้นหลัง สร้างกรอบข้อความรอบชื่อมูลนิธิ และใช้สีของตัวหนังสือที่ต่างๆ กันไป 

[![indexhtml2.png](https://i.postimg.cc/G2ZcK547/indexhtml2.png)](https://postimg.cc/LY3K6vBL)

จากโค้ด**บรรทัดที่ 47-59** เดิมเป็นการสร้างเทมเพลตเบื้องต้นจากต้นฉบับ(แสดงข้อมูลของสุนัข )ในที่นี้เราดัดแปลงมาเป็นการรับอุปการะเด็ก  โดยเปลี่ยนข้อความเป็นภาษาไทยตามภาพ ทั้งหัวข้อ เชื้อชาติ  อายุ สถานที่ และชื่อปุ่ม 

## 4. สร้าง Backend ที่สามารถเชื่อมต่อกับ Smart Contract
#### 4.1 ให้แก้ไขไฟล์ ```src/js/app.js``` ใน visual studio code ให้มีโค้ดดังนี้

```
App = {
  web3Provider: null,
  contracts: {},

  init: async function() {
    // Load pets.
    $.getJSON('../Kids.json', function(data) {
      var kidsRow = $('#kidsRow');
      var kidTemplate = $('#kidTemplate');

      for (i = 0; i < data.length; i ++) {
        kidTemplate.find('.panel-title').text(data[i].name);
        kidTemplate.find('img').attr('src', data[i].picture);
        kidTemplate.find('.pet-breed').text(data[i].Nationality);
        kidTemplate.find('.pet-age').text(data[i].age);
        kidTemplate.find('.pet-location').text(data[i].location);
        kidTemplate.find('.btn-adopt').attr('data-id', data[i].id);

        kidsRow.append(kidTemplate.html());
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
          $('.panel-pet').eq(i).find('button').text("อุปการะแล้ว").attr('disabled', true);
        }
      }
    }).catch(function (err) {
      console.log(err.message);
    });
  },

  handleAdopt: function(event) {
    event.preventDefault();

    var kidId = parseInt($(event.target).data('id'));

    var adoptionInstance;

    web3.eth.getAccounts(function (error, accounts) {
      if (error) {
        console.log(error);
      }

      var account = accounts[0];

      App.contracts.Adoption.deployed().then(function (instance) {
        adoptionInstance = instance;

        // Execute adopt as a transaction by sending account
        return adoptionInstance.adopt(kidId, { from: account });
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
[![appjs1.png](https://i.postimg.cc/4N015vPK/appjs1.png)](https://postimg.cc/gnvRcZfd)

**บรรทัดที่ 7-19**  เป็นการดึงข้อมูลจาก ```Kids.json``` ซึ่งบรรจุข้อมูลของเด็กทั้ง 16 คน มาใช้ในฟังก์ชั่น For loop ซึ่งสั่งให้โปรแกรมค้นหาข้อมูลเรียงตาม ```kidId``` ตั้งแต่คนแรกคือ id 0 จนถึง id 15 แล้วนำไปแสดงผลเชื่อมกับ ```kidTemplate``` ซึ่งเป็นเทมเพลตที่สร้างไว้ใน ```index.html```

[![appjs2.png](https://i.postimg.cc/nhkvC6rt/appjs2.png)](https://postimg.cc/sMMBLH5n)

**บรรทัดที่ 26-46** เป็นการระบุว่าจะใช้ web3 (บล็อกเชน) แบบใดในการเชื่อมต่อกับ smart contract โดยเริ่มจาก Metamask ,Legacy browser และ Ganache ตามลำดับ หากต้องการใช้เฉพาะอันใดอันหนึ่งก็ให้ทำการ comment บรรทัดที่เหลือ  

[![appjs3.png](https://i.postimg.cc/CM7Yr7Rx/appjs3.png)](https://postimg.cc/dDhzL8Rb)

**บรรทัดที่ 70-84**  เป็นการดึงเอา smart contract มาใช้ โดยสั่งการให้โปรแกรมเชื่อม wallet address เมื่อมีการกดปุ่ม "รับอุปการะ" Metamask/Ganache จะทำการคิดค่า gas ทันที และ frond end จะแสดงผลโดยเปลี่ยนปุ่ม "รับอุปการะ" เป็น "อุปการะแล้ว" เพื่อให้ผู้ใจบุญท่านอื่นทราบ และเลือกเด็กที่เหลือต่อไป
โดย **บรรทัดที่ 70** ประกาศฟังก์ชั่น ```markAdopted``` **บรรทัดที่ 71** ประกาศตัวแปร  ```adoptionInstance```  

**บรรทัดที่ 73-74**  เป็นการตรวจสอบว่า ```Adoption.sol``` ได้รับการ deploy แล้วหรือไม่ ถ้าเรียบร้อยแล้ว ให้ทำฟังก์ชั่น Instance ต่อ โดยนำค่าตัวแปร ``` instance```  ซึ่ง ณ ตอนนี้มีค่าเท่ากับ```Adoption.sol ที่ deploy แล้ว``` ไปใส่ไว้ใน ```adoptionInstance``` 

**บรรทัดที่ 76-77** เมื่อ function ```getAdopters``` ทำงานแล้ว ให้นำพารามิเตอร์ที่ได้ไปให้กับ function ```adopters``` ซึ่งจะทำงานต่อใน**บรรทัดที่ 78-80**   
**บรรทัดที่ 78-80**  เป็น function ```For loop``` ซึ่งนำเอาข้อมูลเด็กทั้ง 16 จากบล็อกเชนมาเชื่อมต่อกับ back end คือ ```app.js```  แปลความได้ว่า **เมื่อมีผู้อุปการะแล้วให้เปลี่ยนปุ่ม "รับอุปการะ" เป็น "อุปการะแล้ว"** ซึ่งก่อนจะจบ function ```markAdopted``` ให้ย้อนไปทำ function  ```bindEvents``` ใน**บรรทัดที่ 66** ก่อน 

[![appjs4.png](https://i.postimg.cc/RFmf2Xyk/appjs4.png)](https://postimg.cc/06tbwd8n)

จาก function  ```bindEvents``` ใน**บรรทัดที่ 66** เป็นการสั่งว่า เมื่อมีการคลิกที่ ```btn-adopt``` ซึ่งก็คือปุ่ม **"รับอุปการะ"** ให้ไปทำ function  ```handleAdopt ``` ใน**บรรทัดที่ 88**  
**บรรทัดที่ 89** หมายถึง function นี้ เราไม่ต้อง submit ลงไปในแอพพลิเคชั่น (ในเว็บนี้) ,เราต้องการที่จะจัดการ ( handle)  ด้วยตัวเอง  
**บรรทัดที่ 95-97** เป็นการอ่านค่า account บน web3 ( Ganache) หากอ่านค่าไม่ได้ให้แสดงผล error ออกมาทาง console 

**บรรทัดที่ 100-103** เป็นการประกาศตัวแปรชื่อ ```account```  ให้มีค่าเริ่มต้นเป็น account เบอร์ 0 จากนั้นให้ทำ function เช่นเดียวกับ **บรรทัดที่ 73-74** 
**บรรทัดที่ 106-108** เป็นการให้ ```adoptionInstance``` ซึ่งตอนนี้มีค่าเท่ากับ ```Adoption.sol``` อ่านค่า function ```adopt``` ตามด้วย ```kidId``` ตามด้วย ```account``` จะได้ค่า ```kidId``` ออกมา ให้นำไปไว้ใน function ```result``` (ซึ่งค่าใน result หลังจากนี้ ไม่ได้ใช้ทำอะไรต่อ) จากนั้นให้วนไปทำ function ```markAdopted``` ใน**บรรทัดที่ 70-84** ตามที่ได้กล่าวมาแล้ว  


### 4.2 สร้างไฟล์ .json ซึ่งเป็นฐานข้อมูลของเด็กกำพร้าทั้ง 16 คน 
---------
โดยไปที่โฟลเดอร์ ```src``` แล้วสร้าง  ```New file``` ชื่อ ```Kids.json``` โดยให้มีโค้ด ดังต่อไปนี้
```[
    {
      "id": 0,
      "name": "ยืนยง โอภากุล",
      "picture": "images/0.jpg",
      "age": 3,
      "Nationality": "จีน",
      "location": "นครพนม"
    },
    {
      "id": 1,
      "name": "ทาโนชน์ แหวนงาม",
      "picture": "images/1.jpg",
      "age": 45,
      "Nationality": "คริปตอน",
      "location": "สำเพ็ง"
    },
    {
      "id": 2,
      "name": "นาตาชา เปลี่ยนวิถี",
      "picture": "images/2.jpg",
      "age": 35,
      "Nationality": "ไทย",
      "location": "บิ๊กซีดอนเมือง"
    },
    {
      "id": 3,
      "name": "พ่อคล้าว แม่ทองกวาว",
      "picture": "images/3.jpg",
      "age": 60,
      "Nationality": "กัมพูชา",
      "location": "ตลาดกุ้งสมุทรสาคร"
    },
    {
      "id": 4,
      "name": "เบบี้ โยดา",
      "picture": "images/4.jpg",
      "age": 2,
      "Nationality": "โรฮิงญา",
      "location": "สวนรถไฟ"
    },
    {
      "id": 5,
      "name": "บรูซ เข้าเวร",
      "picture": "images/5.jpg",
      "age": 45,
      "Nationality": "ไทลื้อ",
      "location": "วิลล่าอารีย์"
    },
    {
      "id": 6,
      "name": "ลีวาย สายสมร",
      "picture": "images/6.jpg",
      "age": 32,
      "Nationality": "มองโกล",
      "location": "บาร์บีคิวพลาซ่า"
    },
    {
      "id": 7,
      "name": "เพนนีไวซ์ กัลยาณมิตร",
      "picture": "images/7.jpg",
      "age": 103,
      "Nationality": "ยูเครน",
      "location": "อ.เต่างอย สกลนคร"
    },
    {
      "id": 8,
      "name": "ปู พงษ์สิทธิ์ คำหล้า",
      "picture": "images/8.jpg",
      "age": 12,
      "Nationality": "รัสเซีย",
      "location": "อ.ธาตุพนม นครพนม"
    },
    {
      "id": 9,
      "name": "เลอา สกายวอล์คกิ้ง",
      "picture": "images/9.jpg",
      "age": 18,
      "Nationality": "ซูดาน",
      "location": "สถานเสาวภา"
    },
    {
      "id": 10,
      "name": "วันเดอร์วูแมน",
      "picture": "images/10.jpg",
      "age": 105,
      "Nationality": "อะเมซอน",
      "location": "เชียงคาน จ.เลย"
    },
    {
      "id": 11,
      "name": "ออพติมัส พลายงาม",
      "picture": "images/11.jpg",
      "age": 1200,
      "Nationality": "ไซเบอร์ตรอน",
      "location": "เซเว่นข้างวัดพระศรี"
    },
    {
      "id": 12,
      "name": "อาจารย์หมูแว่น",
      "picture": "images/12.jpg",
      "age": 8,
      "Nationality": "หมู",
      "location": "เล้าหมู"
    },
    {
      "id": 13,
      "name": "สิทธิชัย หยุ่น",
      "picture": "images/13.jpg",
      "age": 16,
      "Nationality": "อิตาลี",
      "location": "สวนหย่อมข้างพารากอน"
    },
    {
      "id": 14,
      "name": "อีลอน ไตรมาส",
      "picture": "images/14.jpg",
      "age": 52,
      "Nationality": "สิงคโปร์",
      "location": "อเมริกาฬสินธุ์"
    },
    {
      "id": 15,
      "name": "ซาโตชิ นาฬิกาโกโก้",
      "picture": "images/15.jpg",
      "age": 50,
      "Nationality": "ญี่ปุ่น",
      "location": "โรงเบียร์เยอรมัน เลียบด่วน"
    }
  ]
  ```
## 5. ติดตั้ง MetaMask
- ดาวน์โหลดและติดตั้ง **MetaMask** ที่  [Metamask](https://metamask.io/)
- เมื่อเริ่มใช้งาน **MetaMask** จะเข้าสู่หน้าแรก ตามภาพ 

[![metamask-01.png](https://i.postimg.cc/gJr5Jfpp/metamask-01.png)](https://postimg.cc/0MRZXXrX)

- คลิกที่ ```Get Started``` จะได้ผลลัพธ์ดังรูปด้านล่าง  - สำหรับผู้ที่ยังไม่ได้สมัครมาก่อนให้กด ```Create wallet```  สำหรับผู้ที่มีบัญชีอยู่แล้วให้คลิกที่  ```Import Wallet``` เพื่อเชื่อมต่อ MetaMask เข้ากับ Wallet ของ Ganache

[![metamask-02.png](https://i.postimg.cc/BQWKmHXc/metamask-02.png)](https://postimg.cc/jCX25W6L)

- ทำการก็อปปี้ Seed จาก Ganache นำมาวางลงในช่อง Wallet Seed จากนั้นตั้งพาสเวิร์ด แล้วติ๊กที่```I have read and agree to the Terms of Use```แล้วคลิก ```Import```

[![Seed.png](https://i.postimg.cc/sX9tbp3Q/Seed.png)](https://postimg.cc/47yL9H7s)
[![metamask-03.png](https://i.postimg.cc/SNyM0qfJ/metamask-03.png)](https://postimg.cc/c6bHYpjS)

- ทำการย้ายจาก ```Ethereum Mainnet``` มาที่ ```Ganache```โดยคลิกที่ ```Ethereum Mainnet```แล้วเลือก ```Custom RPC```

[![metamask-04.png](https://i.postimg.cc/jjgbjHGp/metamask-04.png)](https://postimg.cc/McQ4PQZ5)

- กรอกข้อมูล ```Network Name``` เป็น ```Ganache```เพื่อให้จำง่าย สำหรับ ```New RPC URL``` ต้องเป็น URL ของ Ganache ซึ่งในที่นี้คือ ```http://127.0.0.1:7545``` 
- สำหรับการตั้งค่าอื่นๆ ให้ดูตามภาพ

[![metamask-05.png](https://i.postimg.cc/FR3D6mgT/metamask-05.png)](https://postimg.cc/qhBstPFK)



## 6. การทำงานของโปรแกรม 

ให้รันโปรแกรม โดยใช้คำสั่งใน terminal ดังนี้ 

```
npm run dev
```

-จากนั้น Web browser จะเปิดหน้าเว็บแอพพลิเคชั่นขึ้นมาที่ URL  ```http://localhost:3000```

-จะเห็นได้ว่า ก่อนที่จะมีการอุปการะ ปุ่มด้านล่างกล่องข้อมูลของเด็กแต่ละคนจะขึ้นว่า **"รับอุปการะ"** เป็นตัวหนังสือ**สีเข้ม**อยู่ 

[![before-Adopt.png](https://i.postimg.cc/RVd98xgC/before-Adopt.png)](https://postimg.cc/QHFR9wLv)

-เมื่อมีผู้ใจบุญมาเลือกเด็กไปอุปการะแล้ว ปุ่มด้านล่างกล่องข้อมูลจะเปลี่ยนเป็น ```"อุปการะแล้ว" ```เป็นตัวหนังสือสี```จาง```แทน

[![After-Adopt.png](https://i.postimg.cc/9fhf5YGC/After-Adopt.png)](https://postimg.cc/PCSH1Z3R)

-**Ganache** และ **Metamask** จะอัพเดทยอดเงินหลังหักค่า gas ให้ตรงกัน ถือว่าการทำงานสมบูรณ์ 🙂

[![Meta-Ganache.png](https://i.postimg.cc/W306pny8/Meta-Ganache.png)](https://postimg.cc/r0FtQSMR)


         

