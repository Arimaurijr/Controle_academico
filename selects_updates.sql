SELECT TOP (1000) [id]
      ,[codigo]
      ,[nota1]
      ,[nota2]
      ,[sub]
      ,[faltas]
      ,[situacao]
      ,[media]
  FROM [DBFaculdade].[dbo].[Item_Matricula]

  INSERT INTO Item_Matricula (id, codigo, faltas, situacao) VALUES(
      4,
      2,
      0,
      'Matriculado'
  )

  UPDATE Item_Matricula SET faltas = 3 WHERE id = 4 AND codigo = 3
  SELECT * FROM Item_Matricula;

  UPDATE Item_Matricula SET nota1 = 5, nota2 = 3 WHERE id = 4 AND codigo = 3

 UPDATE Item_Matricula SET nota1 = 5 WHERE id = 4 AND codigo = 2;
 UPDATE Item_Matricula SET nota2 = 8 WHERE id = 4 AND codigo = 2;