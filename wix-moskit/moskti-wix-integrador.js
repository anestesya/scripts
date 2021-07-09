/* autor: Tadeu Luis Pires Gaudio
 * email: tadeu@tadtarget.com
 * site: https://www.tadtarget.com
 */

import {fetch} from 'wix-fetch';  

const API_KEY = "SUA CHAVE AQUI";

export function sendLead(dados) {
 return fetch("https://api.moskitcrm.com/v2/contacts", {
       method: 'post',
			 headers: {
				'Content-Type': 'application/json',
				'Authorization': API_KEY,
				'apiKey': API_KEY            
			 },
             body: JSON.stringify(dados)
 }).then(function(response) {
  if (response.status >= 200 && response.status < 300)
   return response.json();
  else {
    throw new Error(response.statusText);
  }
 });
};

export function createNegocio(dados) {
 return fetch("https://api.moskitcrm.com/v2/deals", {
       method: 'post',
			 headers: {
				'Content-Type': 'application/json',
				'Authorization': API_KEY,
				'apiKey': API_KEY            
			 },
       body: JSON.stringify(dados)
 }).then(function(response) {
  if (response.status >= 200 && response.status < 300)
   return response.json();
  else{
    throw new Error(response.statusText);
  }
 });
};
