-- exercício CPF

declare @cpf as varchar(11),
		@dig1 as int,
		@dig2 as int,
		@cont as int,
		@caractere as int,
		@restoDiv as int,
		@cpfDigitado as char(11)

set @cpfDigitado = '44444444444'

-- VE SE TODOS OS ALGARISMOS SÃO IGUAIS
if (@cpfDigitado like '11111111111' or @cpfDigitado like '22222222222' or @cpfDigitado like '33333333333' 
or @cpfDigitado like '44444444444' or @cpfDigitado like '55555555555' or @cpfDigitado like '66666666666'
or @cpfDigitado like '7777777777' or @cpfDigitado like '8888888888' or @cpfDigitado like '99999999999')
begin
	print 'Inválido - Os algarismos não podem ser iguais'
	end
else
begin
set @cpf =SUBSTRING(@cpfDigitado, 1, 9)
	set @cont = 10
	set @caractere = 1
	set @dig1 = 0

	-- DIGITO VERIFICADOR 01
	while (@cont >= 1)
	begin
		set @dig1 = @dig1 + ((cast(substring(@cpf, @caractere, 1) as int)) * @cont)
		set @caractere = @caractere + 1
		set @cont = @cont - 1
	end

	set @restoDiv = @dig1 % 11

	if(@restoDiv < 2)
	begin
		set @dig1 = 0
	end
	else
	begin
		set	@dig1 = 11 - @restoDiv
	end

	set @cpf = concat(@cpf, cast(@dig1 as char(1)))

	-- DIGITO VERIFICADOR 02

	set @cont = 11
	set @caractere = 1
	set @dig2 = 0

	while (@cont >= 2)
	begin
		set @dig2 = @dig2 + ((cast(substring(@cpf, @caractere, 1) as int)) * @cont)

		set @caractere = @caractere + 1
		set @cont = @cont - 1
	end

	set @restoDiv = @dig2 % 11

	if(@restoDiv < 2)
	begin
		set @dig2 = 0
	end
	else
	begin
		set	@dig2 = 11 - @restoDiv
	end

	set @cpf = concat(@cpf, cast(@dig2 as char(1)))

	-- Se o cpf for igual ao calculado com os dígitos é válido
	if(@cpf = @cpfDigitado)
	begin
		print 'Válido'
	end
	else
	begin
		print 'Inválido'
	end
	end
