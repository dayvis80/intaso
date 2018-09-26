/*        INICIO DE CREACION DE BASE DE DATOS INTASO         */
create database intaso;
use intaso;
/*           FIN DE CREACION DE BASE DE DATOS INTASO          */
/*------------------------------------------------------------*/
/*      INICIO DE CREACION DE TABLAS Y DATOS DE SUCURSAL      */
drop table if exists tsucursal;
create table tsucursal(
	idsucursal serial primary key,
	descripcion varchar(30),
	direccion varchar(30),
	departamento varchar(20),
	provincia varchar(20),
	distrito varchar(20)
	);

insert into tsucursal (descripcion, direccion, departamento, provincia, distrito) values ('AGENCIA SICUANI','AV. MANUEL CALLO ZEVALLOS 444','CUSCO','CANCHIS','SICUANI');
/*        FIN DE CREACION DE TABLAS Y DATOS DE SUCURSAL       */
/*------------------------------------------------------------*/
/*   INICIO DE CREACION DE TABLAS Y DATOS DE TIPO TRABAJADOR  */
drop table if exists ttipotrabajador;
create table ttipotrabajador(
	idtipotrabajador serial primary key,
	descripcion varchar(30)
	);
    
insert into ttipotrabajador (descripcion) values ('ADMINISTRADOR DE SISTEMAS');
insert into ttipotrabajador (descripcion) values ('ADMINISTRADOR DE OFICINA');
insert into ttipotrabajador (descripcion) values ('ANALISTA');
insert into ttipotrabajador (descripcion) values ('AUXILIAR DE OPERACIONES');
insert into ttipotrabajador (descripcion) values ('CAJERO');
insert into ttipotrabajador (descripcion) values ('CONTADOR');
insert into ttipotrabajador (descripcion) values ('GESTOR DE RECUPERACIONES');
insert into ttipotrabajador (descripcion) values ('JEFE DE AHORROS');
insert into ttipotrabajador (descripcion) values ('JEFE DE CREDITOS');
insert into ttipotrabajador (descripcion) values ('JEFE DE OPERACIONES');
insert into ttipotrabajador (descripcion) values ('JEFE DE UNIDAD DE COMBRANZAS');
insert into ttipotrabajador (descripcion) values ('PROMOTOR DE AHORRO Y CREDITOS');
/*    FIN DE CREACION DE TABLAS Y DATOS DE TIPO TRABAJADOR    */
/*------------------------------------------------------------*/
/*          INICIO DE CREACION DE TABLA DE TRABAJADOR         */
drop table if exists ttrabajador;
create table ttrabajador(
	idtrabajador serial primary key,
	dni varchar(10),
	apaterno varchar(20),
	amaterno varchar(20),
	nombres varchar(30),
	celular varchar (12),
	tipotrabajador integer,
	sucursal smallint,
	fregistro timestamp
	);
/* show datestyle; -- Permite Verificar el formato de datos   */ 
/*           FIN DE CREACION DE TABLA DE TRABAJADOR           */
/*------------------------------------------------------------*/
/*---------------INICIO DE CREACION TABLA USARIO--------------*/
drop table if exists tusuario;
create table tusuario(
	idusuario smallint,
	usuario varchar(16),
	contrasena varchar(60),
	clave varchar(30),   
	idtrabajador integer,
	);
/*sucursal - activo */
/*               FIN DE CREACION TABLAS USUARIO               */
/*------------------------------------------------------------*/
/*            INICIO DE CREACION DE TABLA DE SOCIO            */
drop table if exists tsocio;
create table tsocio(
	idsocio serial,
	tipodoc varchar(10) not null,
	numerodoc varchar(10) not null primary key,
	apaterno varchar(20) not null,
	amaterno varchar(20) not null,
	nombres varchar(30) not null,
	numhijos smallint,
	ecivil varchar(10),
	sexo varchar(10),
	fnacimiento date,
	tcelular varchar(10),
	temergencia varchar(10),
	email varchar(30),
	ocupacion varchar(35),
	departamento varchar(15),
	provincia varchar(15),
	distrito varchar(15),
	direccion varchar(60) not null,
	referencia varchar(60),
	tvivienda varchar(10),
	mconstruccion varchar(20),
	utrabajo varchar(60),
	rtrabajo varchar(60),
	cdni varchar(10),
	capaterno varchar(20),
	camaterno varchar(20),
	cnombres varchar(30),
	analista smallint,
	mafiliacion decimal,
	afiliado varchar(2),
	sucursal smallint,
	usuario smallint,
	fregistro timestamp
	);
/*              FIN DE CREACION DE TABLA DE SOCIO             */
/*------------------------------------------------------------*/
/*           INICIO DE CREACION TABLA TIPO PRESTAMO           */
drop table if exists ttipoprestamo;
create table ttipoprestamo(
idtipoprestamo serial primary key,
descripcion varchar(30),
plazo smallint,
tem decimal,
moneda varchar(3),
comision decimal,
mora decimal,
montomin int,
montomax int,
sucursal smallint
);
/*usuario*/
/*            FIN DE CREACION TABLAS TIPO PRESTAMO            */
/*------------------------------------------------------------*/
/*            INICIO DE CREACION TABLA PRESTAMO               */
drop table if exists tprestamo;
create table tprestamo(
idprestamo serial primary key,
idsocio smallint,
nprestamo varchar(8),
descripcion varchar(30),
tcuotas smallint,
mcuota decimal,
monto decimal,
plazo smallint,
comision decimal,
aporte decimal,
tea decimal,
tem decimal,
mora decimal,
tipopago varchar(20),
fprestamo date,
ftermino date,
fecpago varchar(15),
condicion varchar(15),
garantia varchar(20),
analista smallint,
recaudador smallint,
estado varchar(20),
aprobado varchar(2),
usuario smallint,
sucursal smallint
);
/*               FIN DE CREACION TABLA PRESTAMO               */
/*------------------------------------------------------------*/
/*              INICIO DE CREACION TABLA CUOTAS               */
drop table if exists tcuotas;
create table tcuotas(
idcuota serial primary key,
nprestamo varchar(8),
ncuota int,
fvencimiento date,
capital decimal,
interes decimal,
amortizacion decimal,
comision decimal,
aporte decimal,
montocuota decimal,
dmora smallint,
vmora decimal,
estado varchar(10),
sucursal smallint
descuentom decimal,
descuentoi decimal,
descuentoc decimal,
fpagp date
);
/*                FIN DE CREACION TABLA CUOTAS                */
/*------------------------------------------------------------*/
/*             INICIO DE CREACION TABLA CRONOGRAMA            */
drop table if exists tcronograma;
create table tcronograma(
idcronograma serial primary key,
nprestamo varchar(8),
ncuota int,
fvencimiento date,
capital decimal,
interes decimal,
amortizacion decimal,
comision decimal,
aporte decimal,
montocuota decimal,
sucursal smallint
);
/*              FIN DE CREACION TABLA CRONOGRAMA              */
/*------------------------------------------------------------*/
/*             INICIO DE CREACION TABLA TIPO AHORRO           */
drop table if exists ttipoahorro;
create table ttipoahorro(
idtipoahorro serial primary key,
descripcion varchar(30),
plazo smallint,
tem decimal,
moneda varchar(3),
montomin int,
montomax int,
sucursal smallint
);
/*             INICIO DE CREACION TABLA TIPO AHORRO           */
/*------------------------------------------------------------*/
/*                INICIO DE CREACION TABLA AHORRO             */
drop table if exists tahorro;
create table tahorro(
idahorro serial primary key,
idsocio smallint,
cuenta varchar(8),
descripcion varchar(30),
plazo smallint,
tem decimal,
moneda varchar(3),
fapertura date,
fvencimiento date,
saldo decimal,
estado varchar(10),
intmensual decimal,
usuario smallint,
sucursal smallint
);
/*                FIN DE CREACION TABLA AHORRO                */
/*------------------------------------------------------------*/
/*                  INICIO DE CREACION FERIADO                */
drop table if exists tferiado;
create table tferiado(
idferiado serial primary key,
dia varchar(30),
fecha date
);
/*sucursal usuario*/
/*                FIN DE CREACION TABLA FERIADO               */
/*------------------------------------------------------------*/
/*                INICIO DE CREACION TABLA CAJA               */
drop table if exists tcaja;
create table tcaja(
idcaja serial primary key,
trabajador smallint,
fapertura date,
hapertura time,
fcierre date,
hcierre time,
minicial numeric,
mfinal numeric,
mcierre numeric,
movimientos smallint,
abierto varchar(8),
usuario smallint,
sucursal smallint
);
/*                 FIN DE CREACION TABLA CAJA                 */
/*------------------------------------------------------------*/
/*              INICIO DE CREACION TABLA TIPO MOV             */
drop table if exists ttipomov;
create table ttipomov(
idtipomov serial primary key,
descripcion varchar(15),
detalle varchar(2),
sucursal smallint
);

insert into ttipomov (descripcion, detalle, sucursal) values ('AFILIACION','A','1');
insert into ttipomov (descripcion, detalle, sucursal) values ('AHORRO','H','1');
insert into ttipomov (descripcion, detalle, sucursal) values ('PRESTAMO','P','1');
insert into ttipomov (descripcion, detalle, sucursal) values ('DEPOSITAR','D','1');
insert into ttipomov (descripcion, detalle, sucursal) values ('RETIRO','R','1');
insert into ttipomov (descripcion, detalle, sucursal) values ('PAGO CUOTA','C','1');
insert into ttipomov (descripcion, detalle, sucursal) values ('ING. EFECTIVO','E','1');
insert into ttipomov (descripcion, detalle, sucursal) values ('SAL. EFECTIVO','S','1');


drop table if exists tmovimiento;
create table tmovimiento(
idmovimiento serial primary key,
idcaja smallint,
tipomov varchar(2),
socio smallint,
cuenta varchar(8),
descripcion varchar(35),
flujomov varchar(2),
numeromov int,
moneda varchar(3),
monto decimal,
saldo decimal,
fechamov date,
horamov time,
pago varchar(8),
dmora smallint null,
vmora decimal null, 
ncuota smallint null,
fechaprog date null,
conciliado varchar(3),
fconciliado date null,
anulado varchar(2) not null,
usuario smallint,
sucursal smallint
);


drop table if exists trecaudar;
create table trecaudar(
idrecaudar serial primary key,
idcaja smallint,
idpromotor smallint,
cmovimientos int,
total decimal,
fcobro date,
frecaudacion date,
hrecaudacion time,
usuario smallint,
sucursal smallint
);


drop table if exists tineg;
create table tineg(
idineg serial primary key,
detalle varchar(30),
trabajador smallint,
tipomov varchar(2),
moneda varchar(3),
monto decimal,
tipodoc varchar(3),
numerodoc varchar(15),
fechaineg date,
observaciones text,
fechareg date,
horareg time,
usuario smallint,
sucursal smallint
);


/*Enero-1: Año Nuevo
Marzo-29: Jueves Santo (Semana Santa)
Marzo-30: Viernes Santo (Semana Santa)
Abril-1: Domingo de Resurrección (Semana Santa)
Mayo-1: Día del Trabajo
Junio-24: Inti Raymi (Fiesta Inca del Sol)
Junio-29: Festividad de San Pedro y San Pablo
Julio-28: Fiesta de la Independencia Nacional
Julio-29: Fiesta de la Independencia Nacional(2)
Agosto-30: Festividad de Santa Rosa de Lima
Octubre-8: Celebración de la Batalla de Angamos
Noviembre-1: Día de Todos los Santos
Diciembre-8: Día de la Inmaculada Concepción
Diciembre-25: Navidad*/


ALTER TABLE tusuario ALTER COLUMN usuario TYPE varchar(16);

alter table tcaja
  add abierto varchar(2);

  alter table mi-tabla rename column nombre-antiguo to nombre-nuevo;


  //reiniciar contador de caja en 5
ALTER sequence tcaja_idcaja_seq RESTART WITH 5;

ALTER sequence tmovimiento_idmovimiento_seq RESTART WITH 5;
