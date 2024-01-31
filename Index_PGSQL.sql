--Index in postgresql
/* Type of index
1.B-Tree
2.Hash
3.GiST
4.SP-GiST
5.GIN
6.BRIN
*/

CREATE INDEX mycolumnindex ON products using HASH (product_no)