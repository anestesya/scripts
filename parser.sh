#!/bin/bash
# arquivo parser.sh
# Este script tem o objetivo, retirar algumas informações de arquivos .html
# filtra diversas coisa no arquivo.

#nome dos arquivos procurados
colecao=(baby kids tweens)
alink="<a href=\""
flink="<a/>"
aitem="<li>"
fitem="</li>"

#para cada arquivo dentro do vetor
for i in ${colecao[@]};
 do
   echo "<!--  xxxxxxxx  $i xxxxxxxx -->"
   categoria=$i #nome base dos arquivos.
   link_categoria=$alink$categoria".html\" title=\"$categoria\">$categoria$flink"
   link_categoria=$aitem$link_categoria$fitem
   echo "'$link_categoria'+"
   #para cada arquivo da categoria
   for i in $(ls $categoria*); 
     do
	arquivo=$i #arquivo
 
 	linha=`cat $i | egrep "id_linha" | sort | cut -c34-36,67-`
	linha_num=`echo $linha | cut -c-3`
        linha_nome=`echo $linha | cut -c4-12` 
         
        #cria link para cada modelo.
        modelo_linha=`cat $i | egrep 'class=\"num_ref\"' | cut -c31-39`
	for i in $modelo_linha;
          do
              link_modelo=""
              link_modelo=$aitem$alink$arquivo\"" title=\"$linha_num $linha_nome\">"$i$flink$fitem
	      echo "'$link_modelo'+"
        done

     done
 done
