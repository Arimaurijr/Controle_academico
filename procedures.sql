CREATE OR ALTER PROCEDURE CalcularMedia @ID INT, @CODIGO INT
AS
BEGIN
    DECLARE @media DECIMAL(4,2) , @nota1 DECIMAL(4,2), @nota2 DECIMAL(4,2)

    SELECT @nota1 = nota1, @nota2 = nota2 FROM Item_Matricula WHERE id = @id AND codigo = @codigo

    SET @media = (@nota1 + @nota2)/2

    UPDATE Item_Matricula SET media = @media WHERE id = @id AND codigo = @codigo
END;
GO

CREATE OR ALTER PROCEDURE IniciarSemestre 
AS
BEGIN
    UPDATE Item_Matricula SET 
    nota1 = null, nota2 = null, 
    sub = null, faltas = 0, media = null, situacao = 'Matriculado'
END;
GO

CREATE OR ALTER PROCEDURE MatricularAluno @idMatricula INT, @codigoDisciplina INT
AS
BEGIN
    DECLARE @id INT
    
    SELECT @id = id FROM Matricula WHERE id = @idMatricula
    IF(@id IS null)
        PRINT('Não existe Aluno Matriculado.')
    ELSE
    BEGIN
        INSERT INTO Item_Matricula (id, codigo, situacao, faltas) VALUES (
            @idMatricula, @codigoDisciplina, 'Matriculado', 0
        )
        PRINT('Aluno Matricualdo com SUCESSO!!')
    END
END;
GO




SELECT * FROM Disciplina