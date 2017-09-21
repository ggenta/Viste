CREATE VIEW dbo.costi_personale_x_attivita
AS
SELECT        dbo.PER_DTA_CST_MAT_PRO.Anno, dbo.PER_DTA_CST_MAT_PRO.Mese, dbo.PER_ANA_MAT.Cognome + N' ' + dbo.PER_ANA_MAT.Nome AS Nominativo, dbo.PER_DTA_CST_MAT_PRO.Matr, 
                         dbo.MST_ANA_AGG_DEN.DES_15 AS Ente, dbo.MST_ANA_AGG_DEN.DES_14 AS Struttura, dbo.MST_ANA_AGG_DEN.DES_13 AS Area, dbo.MST_ANA_AGG_DEN.DES_12 AS CdR, dbo.COA_ANA_CDC.CodCdc, 
                         dbo.COA_ANA_CDC.DesCdC, dbo.COA_ANA_FP.CodFP, dbo.COA_ANA_FP.DesFP AS FP, dbo.COA_ANA_FP.CodTipoFP AS TipoFP, dbo.COA_ANA_FP.CodCatFP AS CategoriaFP, dbo.COA_ANA_FP.CodClaFP AS ClasseFp, 
                         dbo.COA_ANA_FP.CodProcElab AS Proceduraelab, CASE COA_ANA_FP.CodFinanziamento WHEN 'ND' THEN COA_ANA_CDC_FIN.CodFinanziamento ELSE COA_ANA_FP.CodFinanziamento END AS Finanziamento, 
                         dbo.PER_DTA_CST_MAT_PRO.Tipo_costo AS TipoCosto, dbo.PER_DTA_CST_MAT_PRO.Imp_Cons * dbo.PER_LEG_MAT_CDR.PercCdR AS CostoConsuntivo, 
                         dbo.PER_DTA_CST_MAT_PRO.Imp_TF * dbo.PER_LEG_MAT_CDR.PercCdR AS CostoTotFissi, dbo.PER_DTA_CST_MAT_PRO.Imp_Rett * dbo.PER_LEG_MAT_CDR.PercCdR AS CostoRettifiche, 
                         dbo.PER_DTA_CST_MAT_PRO.Imp_Tot * dbo.PER_LEG_MAT_CDR.PercCdR AS Costo, dbo.PER_LEG_MAT_CDR.PercCdR, dbo.MST_ANA_AGG_DEN.ID_15, dbo.MST_ANA_AGG_DEN.ID_14, dbo.MST_ANA_AGG_DEN.ID_13, 
                         dbo.MST_ANA_AGG_DEN.ID_12, dbo.PER_ANA_MAT.CodFiscale AS Codicefiscale, COALESCE (dbo.PER_ANA_RUO.DesRuolo, N'Non definito') AS Ruolo, COALESCE (dbo.PER_ANA_PRO_SIN.DesProfiloSint, N'Non definito') 
                         AS Profilosintetico, COALESCE (dbo.PER_ANA_QUA.DesQualifica, N'Non definito') AS Qualifica, dbo.PER_ANA_TIP_RAP.CodTipoRapporto, COALESCE (dbo.PER_ANA_TIP_RAP.DesTipoRapporto, N'Non definito') AS Tiporapporto, 
                         COALESCE (CASE FlgInt WHEN - 1 THEN 'Interno' ELSE 'Esterno' END, 'Non definito') AS Interno, COALESCE (CASE FlgDip WHEN - 1 THEN 'Dipendente' ELSE 'Altro' END, 'Non definito') AS Inquadramento, 
                         dbo.PER_DTA_CST_MAT_PRO.CodCdC AS CdcPagatore, dbo.V_COA_DAT_CDC.DesCdC AS DesCdcPagatore, dbo.PER_ANA_RUO.CodClasse AS AreaProf, dbo.PER_ANA_TIP_RAP.Precario, 
                         dbo.COA_DAT_FP.Conto AS Codice_sottoconto, dbo.COA_ANA_CONTI.Des_scon, dbo.MST_ANA_AGG_DEN.COD_13, dbo.COA_ANA_FP_FON.DesFondo, dbo.COA_ANA_FP_FON_CAT.DesTipoFondo
FROM            dbo.PER_ANA_QUA RIGHT OUTER JOIN
                         dbo.PER_LEG_MAT_RUO ON dbo.PER_ANA_QUA.IdQualifica = dbo.PER_LEG_MAT_RUO.IdQualifica LEFT OUTER JOIN
                         dbo.PER_ANA_TIP_RAP ON dbo.PER_LEG_MAT_RUO.CodTipoRapporto = dbo.PER_ANA_TIP_RAP.CodTipoRapporto LEFT OUTER JOIN
                         dbo.PER_ANA_RUO ON dbo.PER_LEG_MAT_RUO.IdRuolo = dbo.PER_ANA_RUO.IdRuolo RIGHT OUTER JOIN
                         dbo.COA_ANA_FP_FON_CAT RIGHT OUTER JOIN
                         dbo.COA_ANA_FP_FON ON dbo.COA_ANA_FP_FON_CAT.CodTipoFondo = dbo.COA_ANA_FP_FON.CodTipoFondo RIGHT OUTER JOIN
                         dbo.COA_DAT_FP INNER JOIN
                         dbo.MST_ANA_AGG_DEN INNER JOIN
                         dbo.V_COA_DAT_CDC INNER JOIN
                         dbo.PER_DTA_CST_MAT_PRO ON dbo.V_COA_DAT_CDC.Anno = dbo.PER_DTA_CST_MAT_PRO.Anno AND dbo.V_COA_DAT_CDC.CodCdc = dbo.PER_DTA_CST_MAT_PRO.CodCdC INNER JOIN
                         dbo.COA_ANA_CDC_FIN ON dbo.V_COA_DAT_CDC.CodFinanziamento = dbo.COA_ANA_CDC_FIN.CodFinanziamento INNER JOIN
                         dbo.PER_LEG_MAT_CDR ON dbo.PER_DTA_CST_MAT_PRO.Anno = dbo.PER_LEG_MAT_CDR.Anno AND dbo.PER_DTA_CST_MAT_PRO.Mese = dbo.PER_LEG_MAT_CDR.Mese AND 
                         dbo.PER_DTA_CST_MAT_PRO.Matr = dbo.PER_LEG_MAT_CDR.Matricola INNER JOIN
                         dbo.COA_ANA_CDC ON dbo.PER_LEG_MAT_CDR.CodCdR = dbo.COA_ANA_CDC.CodCdc ON dbo.MST_ANA_AGG_DEN.ID_0 = dbo.PER_LEG_MAT_CDR.CodCdR ON 
                         dbo.COA_DAT_FP.anno = dbo.PER_DTA_CST_MAT_PRO.Anno AND dbo.COA_DAT_FP.Codice_FP = dbo.PER_DTA_CST_MAT_PRO.CodFP INNER JOIN
                         dbo.COA_ANA_CONTI ON dbo.COA_DAT_FP.Conto = dbo.COA_ANA_CONTI.Cod_scon INNER JOIN
                         dbo.COA_ANA_FP ON dbo.COA_DAT_FP.Codice_FP = dbo.COA_ANA_FP.CodFP ON dbo.COA_ANA_FP_FON.CodFondo = dbo.COA_ANA_FP.CodFondo ON dbo.PER_LEG_MAT_RUO.Anno = dbo.PER_DTA_CST_MAT_PRO.Anno AND 
                         dbo.PER_LEG_MAT_RUO.Mese = dbo.PER_DTA_CST_MAT_PRO.Mese AND dbo.PER_LEG_MAT_RUO.Matricola = dbo.PER_DTA_CST_MAT_PRO.Matr LEFT OUTER JOIN
                         dbo.PER_ANA_MAT ON dbo.PER_DTA_CST_MAT_PRO.Matr = dbo.PER_ANA_MAT.Matricola LEFT OUTER JOIN
                         dbo.PER_ANA_PRO_SIN ON dbo.PER_ANA_QUA.IdProfiloSint = dbo.PER_ANA_PRO_SIN.IdProfiloSint
WHERE        (dbo.PER_DTA_CST_MAT_PRO.Anno >= 2008) AND (dbo.PER_ANA_RUO.Gruppo3 <> N'NoCostoPers') AND (dbo.COA_ANA_FP.Gruppo3 <> N'NoCostoPers') AND (dbo.PER_DTA_CST_MAT_PRO.Matr <> 194) OR
                         (dbo.PER_DTA_CST_MAT_PRO.Anno >= 2008) AND (dbo.PER_ANA_RUO.Gruppo3 <> N'NoCostoPers') AND (dbo.COA_ANA_FP.Gruppo3 <> N'NoCostoPers') AND (dbo.PER_DTA_CST_MAT_PRO.Anno <> 2015)