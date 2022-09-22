SHOW DATABASES;
USE oficina_mecanica;
SHOW TABLES;

-- Inserindo valores na tabela referente aos profissionais da oficina mecânica:

INSERT INTO `profissional_de_mecanica`(`nome`, `endereço`, `especialidade`) 
VALUES
  ("Phoebe Kirby","2338 Netus Ave","carros de luxo"),
  ("Leilani Rocha","Ap #725-875 In Rd.","carros antigos"),
  ("Deborah Bolton","Ap #254-860 Feugiat. Street","caminhão"),
  ("Lucas Wells","P.O. Box 434, 732 Justo. Ave","máquinas agrícolas"),
  ("Aline Morris","6357 Sit Street","customização"),
  ("Gloria Blevins","Ap #162-7378 Malesuada Avenue","carros de luxo"),
  ("Sopoline Downs","Ap #938-7787 Proin Av.","carros antigos"),
  ("Rhiannon Perez","Ap #656-4726 Dapibus St.","caminhão"),
  ("Alec Mcconnell","Ap #924-8536 Et, Street","máquinas agrícolas"),
  ("Lillian Gordon","6803 Turpis St.","customização");


-- Inserindo valores na tabela de referência de preços de mão de obra e de itens:

INSERT INTO `valor_maodeobra` (`descrição`, `preço`)
VALUES
  ("troca de pastilha de freio",40.5),
  ("troca de disco de freio",70.5),
  ("troca de amortecedor",140),
  ("troca de vela",80),
  ("higienização do ar condicionado",35),
  ("limpeza do tbi",70),
  ("pintura",500),
  ("instalação de faróis LED",250),
  ("troca de óleo",30),
  ("troca de pastilha de freio",40);


INSERT INTO `valor_item`(`descrição`, `preço`)
VALUES
("pastilha de freio", 15),
("disco de freio", 5.4),
("amortecedor", 20),
("vela", 13),
("ar condicionado", 450),
("tbi", 18),
("farol LED", 75),
("pastilha de freio", 7),
("nenhum item adicionado", 0);



-- Inserindo valores na tabela de clientes:
INSERT INTO `cliente` (`Nome`, `Email`, `Contato`)
VALUES
  ("Eleanor Horton","ullamcorper.duis@protonmail.couk","(09) 5849 1553"),
  ("Ezekiel Hester","id.risus@google.ca","(04) 8682 4328"),
  ("Stephen Solis","egestas.aliquam@hotmail.ca","(06) 8287 3395"),
  ("Uta Duran","nec.eleifend.non@icloud.couk","(05) 9195 5170"),
  ("Geraldine Waters","erat.volutpat.nulla@protonmail.couk","(01) 4116 4096"),
  ("Cruz Murray","sit@icloud.org","(07) 1184 9632"),
  ("Alfreda Alvarez","gravida.sagittis.duis@hotmail.org","(04) 6806 3212"),
  ("Alden Mendez","urna@hotmail.edu","(03) 2896 8375"),
  ("Demetria Talley","mauris@google.net","(08) 7635 5586"),
  ("Chiquita Aguilar","nec@hotmail.org","(04) 6603 5712");



-- Inserindo dados na tabela de veículos:
INSERT INTO `veículo` (`cod_cliente`, `Categoria`, `Placa`)
VALUES
  (1,"carros de luxo","UYXM-5U46"),
  (2,"carros antigos","CNIK-2D16"),
  (3,"caminhão","XOWZ-6Q15"),
  (4,"máquinas agrícolas","CQPH-4T47"),
  (5,"carros de luxo","ISME-2R24"),
  (6,"carros antigos","VEPW-2B99"),
  (7,"caminhão","UENR-1E73"),
  (8,"máquinas agrícolas","HBNN-6P08"),
  (9,"carros de luxo","ERPK-4P09"),
  (10,"carros antigos","NCSW-4U43"),
  (1,"caminhão","NCYK-4H25"),
  (3,"máquinas agrícolas","HWLY-5F04"),
  (6,"carros de luxo","GXMT-5D85");
  
  
  -- Inserindo os dados nas tabelas de equipe:
  
  INSERT INTO `equipe` (`cod_cliente`, `cod_veículo`)
  VALUES
  (1,1),
  (1, 11),
  (2,2),
  (3,3),
  (3, 12),
  (4,4),
  (5,5),
  (6,6),
  (6, 13),
  (7,7),
  (8,8),
  (9,9),
  (10,10);

INSERT INTO `profissionais_por_equipe` (`cod_equipe`, `cod_cliente`, `cod_veículo`, `cod_profissional`) VALUES
  (1, 1,1, 6),
  (1, 1,1, 1),
  (2, 1, 11, 3),
  (2, 1, 11, 8),
  (3, 2,2, 7),
  (3, 2,2, 2),
  (4, 3,3, 8),
  (4, 3,3, 3),
  (5, 3, 12, 4),
  (5, 3, 12, 9),
  (6, 4,4, 4),
  (6, 4,4,9),
  (7, 5,5,1),
  (7, 5,5,6),
  (8, 6,6,2),
  (8, 6,6,7),
  (9, 6, 13,1),
  (9, 6, 13,6),
  (10, 7,7,3),
  (10, 7,7,8),
  (11, 8,8,4),
  (11, 8,8,9),
  (12, 9,9,1),
  (12, 9,9,6),
  (13, 10,10,2),
  (13, 10,10,7);



-- Inserindo dados na tabela de serviço:
INSERT INTO `serviço` (`cliente_cod_cliente`, `Status`) VALUES
  (1,"Autorizado"),
  (1,"Não autorizado"),
  (2,"Autorização pendente"),
  (3,"Autorizado"),
  (3,"Não autorizado"),
  (4, "Autorização pendente"),
  (5,"Não autorizado"),
  (6,"Autorização pendente"),
  (6,"Autorizado"),
  (7,"Não autorizado"),
  (8,"Autorizado"),
  (9,"Não autorizado"),
  (10,"Autorização pendente");



-- Inserindo os dados na tabela de Ordem de Serviço:

INSERT INTO `ordem_serviço` (`equipe_cod_equipe`, `cod_veículo`, `cod_cliente`, `cod_serviço`, `cod_maodeobra`,
`cod_item`, `data_emissão`, `data_conclusão`)
VALUES
(1, 1, 1, 1, 10, 1, "12-03-2022", "26-03-2022"),
(2, 11, 1, 2, 9, 9, "30-03-2022", "01-04-2022"),
(3, 2, 2, 3, 8, 7, "02-04-2022", "09-04-2022"),
(4, 3, 3, 4, 7, 9, "14-04-2022", "16-04-2022"),
(5, 12, 3, 5, 6, 9, "20-04-2022", "27-04-2022"),
(6, 4, 4, 6, 5, 9, "29-04-2022", "03-05-2022"),
(7, 5, 5, 7, 4, 4, "05-05-2022", "12-05-2022"),
(8, 6, 6, 8, 3, 3,"12-05-2022", "13-05-2022"),
(9, 13, 6, 9, 2, 2, "13-05-2022", "20-05-2022"),
(10, 7, 7, 10, 1, 8, "03-06-2022", "10-06-2022"),
(11, 8, 8, 11, 10, 1, "12-06-2022", "14-06-2022"),
(12, 9, 9, 12, 9, 9, "17-06-2022", "17-06-2022"),
(13, 10, 10, 13, 8, 7, "18-06-2022", "26-08-2022");



-- QUERIES>

-- Relacionando profissionais de mecânica com os veículos, de acordo com as especialidades dos primeiros e as categorias
-- dos segundos, respectivamente:
SELECT pdm.cod_profissional, v.cod_veículo, pdm.nome ,pdm.especialidade, v.Categoria FROM `profissional_de_mecanica` pdm, `veículo` v
WHERE pdm.especialidade = v.Categoria;

SELECT DISTINCT pdm.cod_profissional, pdm.nome, pdm.especialidade, v.cod_veículo, v.categoria FROM `profissional_de_mecanica` pdm
INNER JOIN `profissionais_por_equipe` ppe ON pdm.cod_profissional = ppe.cod_profissional
INNER JOIN `veículo` v ON ppe.cod_veículo = v.cod_veículo
GROUP BY ppe.cod_profissional;


-- RELACIONANDO os clientes com seus veículos:
SELECT * FROM `cliente` c
INNER JOIN veículo v ON v.cod_cliente = c.cod_cliente
GROUP BY c.cod_cliente;



-- Verificando quantos carros cada cliente possui: 
SELECT c.Nome AS "Cliente", COUNT(v.cod_veículo) AS "Quantidade de veículos" FROM `cliente` c, `veículo` v
WHERE v.cod_cliente = c.cod_cliente
GROUP BY c.cod_cliente
HAVING COUNT(v.cod_veículo) > 0;



-- Verificando quais clientes possuem mais de 01 vaículo: 
SELECT c.Nome AS "Cliente", COUNT(v.cod_veículo) AS "Quantidade de veículos" FROM `cliente` c, `veículo` v
WHERE v.cod_cliente = c.cod_cliente
GROUP BY c.cod_cliente
HAVING COUNT(v.cod_veículo) > 1;



-- Verificando quais ITENS e quais SERVIÇOS estão presentes em cada Ordem de Seviço:
SELECT os.cod_os, i.descrição AS "item", mo.descrição AS "serviço"
FROM `ordem_serviço` os, `valor_item` i, `valor_maodeobra` mo
WHERE os.cod_item = i.cod_item AND os.cod_maodeobra = mo.cod_maodeobra
ORDER BY os.cod_os;



-- Verificando para quais clientes os serviços foram feitos:
SELECT os.cod_os, c.Nome AS "Cliente", mo.descrição AS "serviço", i.descrição AS "item"
FROM `ordem_serviço` os, `valor_item` i, `valor_maodeobra` mo, `cliente` c
WHERE os.cod_item = i.cod_item
AND os.cod_maodeobra = mo.cod_maodeobra
AND os.cod_cliente = c.cod_cliente
ORDER BY os.cod_os;


-- Analisando os status de cada serviço, em relação a cada cliente:
SELECT os.cod_os, c.Nome AS "Cliente", mo.descrição AS "serviço", s.Status
FROM `ordem_serviço` os, `valor_maodeobra` mo, `cliente` c, `serviço` s
WHERE os.cod_serviço = s.cod_serviço
AND os.cod_maodeobra = mo.cod_maodeobra
AND os.cod_cliente = c.cod_cliente
ORDER BY os.cod_os;



-- Verificando os preços dos serviços e dos itens:
SELECT os.cod_os, c.Nome AS "Cliente", mo.descrição AS "serviço", mo.preço AS "valor da mão de obra",
i.descrição AS "item", i.preço AS "valor do item", i.preço + mo.preço AS "valor total"
FROM `ordem_serviço` os, `valor_item` i, `valor_maodeobra` mo, `cliente` c
WHERE os.cod_item = i.cod_item
AND os.cod_maodeobra = mo.cod_maodeobra
AND os.cod_cliente = c.cod_cliente
ORDER BY os.cod_os;



-- Analisando os status de cada serviço, por cliente, e seus respectivos valores: 
SELECT os.cod_os, c.Nome AS "Cliente", mo.descrição AS "serviço", i.descrição AS "item",
i.preço + mo.preço AS "valor total", s.Status
FROM `ordem_serviço` os, `valor_item` i, `valor_maodeobra` mo, `cliente` c, `serviço` s
WHERE os.cod_item = i.cod_item
AND os.cod_maodeobra = mo.cod_maodeobra
AND os.cod_cliente = c.cod_cliente
AND os.cod_serviço = s.cod_serviço
ORDER BY os.cod_os;