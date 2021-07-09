/* autor: Tadeu Luis Pires Gaudio
 * email: tadeu@tadtarget.com
 * site: https://www.tadtarget.com
 */

import {sendLead, createNegocio} from 'backend/moskit'
import {to} from 'wix-location'


$w.onReady(function () {
	// Write your JavaScript here	
$w('#wixForms3').onWixFormSubmit(function(e){
  $w('#button10').disable()
  $w('#button10').hide()
  let novoLead = {
                  "createdBy": {
                    "id": 56378
                  },
                  "responsible": {
                    "id": 56378
                  },
                  "name": $w("#input11").value || "tadeu22 negocios",
                  
                  "phones": [
                    {
                      "id": 0,
                      "number": $w("#input12").value || '4399650493',
                      "type": {
                        "id": 0,
                        "name": "Telefone",
                        "module": "phone"
                      }
                    }
                  ],
                  "emails": [
                    {
                      "id": 0,
                      "address": $w("#input10").value || 'tadeu2323@tadtarget.com',
                      "type": {
                        "id": 0,
                        "name": "contatoSite"
                      }
                    }
                  ]
        };

        let novoNegocio = {
            "createdBy": {
              "id": 56378
            },
            "responsible": {
              "id": 56378
            },
            "name": "",
            "status": "OPEN",
            "stage": {"id": 170569},
            "contacts": [],
            "entityCustomFields": [
              {
                "id": "CF_g40MLBiPCExQ1D29",
                "textValue": $w("#input13").value || "PR",
              },
              {
                "id": "CF_YXoDkki3CV6RZDGE",
                "textValue": $w("#input14").value || 'Londrina',
              },

            ],
          };  

    
        sendLead(novoLead).then(async function(data) {
          novoNegocio.name = "Negócio "+data.name,
          novoNegocio.contacts.push({"id": data.id})

          createNegocio(novoNegocio).then(function(dataLog){
            to("/cadastro-realizado")

          })
        })

    return false;
    
})

      
  

  
});

 
