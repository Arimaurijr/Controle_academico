CREATE OR ALTER TRIGGER TGR_Media_Insert ON Item_Matricula AFTER UPDATE
AS
BEGIN
    IF(UPDATE(nota2))
    BEGIN
        DECLARE @id INT, @codigo INT, @nota1 DECIMAL(4,2), @nota2 DECIMAL(4,2), @media DECIMAL(4,2)

        SELECT @id = id, @codigo = codigo, @nota1 = nota1, @nota2 = nota2 FROM inserted

        SET @media = (@nota1+@nota2)/2

        UPDATE Item_Matricula SET media = @media WHERE id = @id AND codigo = @codigo    
    END
END;
GO

CREATE OR ALTER TRIGGER TGR_Situacao_Update ON Item_Matricula AFTER UPDATE
AS
BEGIN
    IF(UPDATE (Media))
    BEGIN
        DECLARE @id INT, @codigo INT, @media DECIMAL(4,2), @situacao VARCHAR(19)

        SELECT @id = id, @codigo = codigo, @situacao = situacao, @media = media FROM inserted

        SET @situacao = CASE 
            WHEN (@media >= 5) THEN
                'Aprovado'
            ELSE
                'Reprovado'
        END
        -- PRINT(@situacao)
    
        UPDATE Item_Matricula SET situacao = @situacao WHERE id = @id AND codigo = @codigo
    END
END;