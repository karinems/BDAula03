/*Fazer um algoritmo que leia 3 valores e retorne se os valores formam um triângulo e se ele é
isóceles, escaleno ou equilátero.
Condições para formar um triângulo
	Nenhum valor pode ser = 0
	Um lado não pode ser maior que a soma dos outros 2.
*/

declare @lado01 as int,
		@lado02 as int,
		@lado03 as int

set @lado01 = 2
set @lado02 = 2
set @lado03 = 1

if(@lado01 = 0 or @lado02 = 0 or @lado03 =0)
begin -- {
	print 'Nenhum valor pode ser igual a 0'
end -- }
else
begin
	if((@lado01 + @lado02) < @lado03 or (@lado01 + @lado03) < @lado02 or (@lado02 + @lado03) < @lado01) 
	begin
		Print ' Um lado não pode ser maior que a soma dos outros 2 '
	end
	else
	begin
		if((@lado01 = @lado02) and (@lado02 = @lado03))
		begin
			print 'Equilátero'
		end
		else
		IF ((@lado01 = @lado02) or (@lado02 = @lado03) or (@lado01 = @lado03))
		begin
			print 'Isóceles'
			end
			else
			begin
				print 'Escaleno'
			end

		end
	end
	

 -- Fazer um algoritmo que leia 1 número e mostre se são múltiplos de 2,3,5 ou nenhum deles
declare @num as int,
        @mult2 as int,
        @mult3 as int,
        @mult5 as int,
        @i as int

 set @num = 12
 set @i = 0
 set @mult2 = 0
 set @mult3 = 0
 set @mult5 = 0

if(@num % 2 = 0)
 begin 
    set @mult2 = 1
end

if(@num % 3 = 0)
begin
    set @mult3 = 1
end

if(@num % 5 = 0)
begin
    set @mult5 = 1
end

if(@mult2 = 0 and @mult3 = 0 and @mult5 = 0)
begin 
    print 'Não é múltiplo de 2, 3 nem 5'
end
else
begin
    if(@mult2 = 1)
    begin
        print 'Multiplo de 2'
    end

    if(@mult3 = 1)
    begin
        print 'Multiplo de 3'
    end

    if(@mult5 = 1)
    begin
        print 'Multiplo de 5'
    end
end


-- Fazer um algoritmo que leia 3 número e mostre o maior e o menor
create database bdExercicioMaiorMenor
go
use bdExercicioMaiorMenor
go
create table tbNumeros(
	numero int not null
	)

insert into tbNumeros values (7), (0), (5)

declare @maior as int,
    @menor as int

set @maior = (select max(numero) from tbNumeros)

set @menor = (select min(numero) from tbNumeros)

print 'O maior número é ' + convert (char(2),@maior) + ' e o menor numero é ' + convert (char(2),@menor)


/*
Fazer um algoritmo que calcule os 15 primeiros termos da série
1,1,2,3,5,8,13,21,...
E calcule a soma dos 15 termos
*/

declare @ant as int,
        @atual as int,
        @prox as int,
        @i as int,
        @soma as int
 
 set @ant = 0
 set @atual = 1
 set @prox = 0
 set @i = 0
 set @soma = 0

 while(@i < 15)
 begin
    print convert (char(3),@atual)

    set @soma = @soma + @atual

    set @prox = @ant + @atual
    set @ant = @atual
    set @atual = @prox

    set @i = @i + 1
 end

 print 'A soma é: ' + convert (char(5),@soma)


 -- Fazer um algorimto que separa uma frase, colocando todas as letras em maiúsculo e em minúsculo]

 declare @frase as varchar(100),
		@fraseMaius as varchar(100),
		@fraseMinus as varchar (100)

set @frase = 'Hello world'
set @fraseMaius = UPPER(@frase)
set @fraseMinus = LOWER(@frase)

print @fraseMaius
print @fraseMinus



-- Fazer um algoritmo que inverta uma palavra

declare @palavra as varchar(20),
	@palavraInversa as varchar(20)

set @palavra = 'bolo'
set @palavraInversa = REVERSE(@palavra)

print @palavra
print @palavraInversa


-- Verificar palindromo
declare @palav as varchar(50),
        @palavInversa as varchar(50)

set @palav = 'bolo'
set @palav =  REPLACE (@palav, ' ', '' )
set @palavInversa = REVERSE(@palav)

if(@palav = @palavInversa)
begin
    print 'Palindromo'
end
else
begin
    print 'Não é palíndromo'
end


