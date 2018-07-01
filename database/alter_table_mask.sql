ALTER TABLE  `socios` CHANGE  `cpf`  `cpf` VARCHAR( 14 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

ALTER TABLE  `socios` CHANGE  `telefone`  `telefone` VARCHAR( 14 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

ALTER TABLE  `socios` CHANGE  `celular`  `celular` VARCHAR( 15 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

ALTER TABLE  `socios` CHANGE  `cep`  `cep` VARCHAR( 9 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

ALTER TABLE  `fornecedores` CHANGE  `celular`  `celular` VARCHAR( 15 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ;

ALTER TABLE  `fornecedores` CHANGE  `telefone`  `telefone` VARCHAR( 14 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ;

ALTER TABLE  `usuarios` CHANGE  `cpf`  `cpf` VARCHAR( 14 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

ALTER TABLE  `usuarios` CHANGE  `telefone`  `telefone` VARCHAR( 14 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

ALTER TABLE  `usuarios` CHANGE  `celular`  `celular` VARCHAR( 15 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

ALTER TABLE  `usuarios` CHANGE  `cep`  `cep` VARCHAR( 9 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL ;

ALTER TABLE  `professores` CHANGE  `telefone`  `telefone` VARCHAR( 14 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ;

ALTER TABLE  `professores` CHANGE  `celular`  `celular` VARCHAR( 15 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL ;
