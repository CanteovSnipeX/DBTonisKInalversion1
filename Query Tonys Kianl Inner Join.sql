use BDTonysKINAL2016532;

Delimiter $$
Create Procedure sp_listarReporte(in codigoEmpresa int )
Begin 
select * from  Empresas E inner join  presupuesto P on 
			E.codigoEmpresa = P.codigoEmpresa
			inner join Servicios  S on
					E.codigoEmpresa = S.codigoEmpresa 
					where  E.codigoEmpresa = codigoEmpresa  order by  p.cantidadPresupuesto;
End $$              
Delimiter ;

call  sp_listarReporte(1);
                