drop view dbo.v_costi_personale_cedolino

go

create VIEW dbo.v_costi_personale_cedolino
AS
SELECT        dbo.PER_DTA_COS_STIP.AnnoRif, dbo.PER_DTA_COS_STIP.MeseRif, dbo.PER_DTA_COS_STIP.Matricola, dbo.PER_ANA_MAT.Cognome, dbo.PER_ANA_MAT.Nome, dbo.PER_DTA_COS_STIP.CodTipoCosto, 
                         dbo.PER_DTA_COS_STIP.CodContratto, dbo.PER_DTA_COS_STIP.CodVoceStip, dbo.PER_ANA_VOCI_STIP.DesVoceStip, dbo.PER_DTA_COS_STIP.Propro, dbo.PER_DTA_COS_STIP.Posfun, dbo.PER_DTA_COS_STIP.Posizione, 
                         dbo.PER_DTA_COS_STIP.Livello, dbo.PER_DTA_COS_STIP.PercAppartenenza, dbo.PER_DTA_COS_STIP.Qta, dbo.PER_DTA_COS_STIP.ImportoEuro, dbo.PER_DTA_COS_STIP.CodFp, dbo.COA_ANA_FP.DesFP, 
                         dbo.PER_DTA_COS_STIP.CodCdC, dbo.PER_DTA_COS_STIP.PesoCdC, dbo.PER_DTA_COS_STIP.CodCdr, dbo.PER_DTA_COS_STIP.PesoCdR, dbo.PER_DTA_COS_STIP.IdRuolo, dbo.PER_ANA_RUO.DesRuolo, 
                         dbo.PER_DTA_COS_STIP.PesoRuolo, dbo.PER_DTA_COS_STIP.FlgSanitario, dbo.PER_DTA_COS_STIP.AnnoLiq, dbo.PER_DTA_COS_STIP.MeseLiq, dbo.PER_DTA_COS_STIP.ImportoPesato, dbo.COA_DAT_FP.Conto, 
                         dbo.COA_ANA_CONTI.Des_scon, dbo.MST_ANA_AGG_DEN.DES_0, dbo.MST_ANA_AGG_DEN.COD_13, dbo.MST_ANA_AGG_DEN.DES_12, dbo.PER_ANA_RUO.FlgSanitario AS RuoloSanitario, dbo.PER_ANA_RUO.CodClasse, 
                         dbo.V_PER_SITUAZIONE_AL_TOTALE.CodTipoRapporto, dbo.COA_ANA_CDC.CodFinanziamento, dbo.COA_ANA_FP_FON.DesFondo, dbo.COA_ANA_FP_FON_CAT.DesTipoFondo
FROM            dbo.COA_ANA_FP_FON_CAT LEFT OUTER JOIN
                         dbo.COA_ANA_FP_FON ON dbo.COA_ANA_FP_FON_CAT.CodTipoFondo = dbo.COA_ANA_FP_FON.CodTipoFondo RIGHT OUTER JOIN
                         dbo.PER_DTA_COS_STIP INNER JOIN
                         dbo.PER_ANA_VOCI_STIP ON dbo.PER_DTA_COS_STIP.CodTipoCosto = dbo.PER_ANA_VOCI_STIP.CodTipoCosto AND dbo.PER_DTA_COS_STIP.CodContratto = dbo.PER_ANA_VOCI_STIP.CodContr AND 
                         dbo.PER_DTA_COS_STIP.RuoloSigma = dbo.PER_ANA_VOCI_STIP.RuoloSigma AND dbo.PER_DTA_COS_STIP.CodVoceStip = dbo.PER_ANA_VOCI_STIP.CodVoceStip INNER JOIN
                         dbo.COA_DAT_FP ON dbo.PER_DTA_COS_STIP.AnnoRif = dbo.COA_DAT_FP.anno AND dbo.PER_DTA_COS_STIP.CodFp = dbo.COA_DAT_FP.Codice_FP INNER JOIN
                         dbo.COA_ANA_FP ON dbo.COA_DAT_FP.Codice_FP = dbo.COA_ANA_FP.CodFP INNER JOIN
                         dbo.COA_ANA_CONTI ON dbo.COA_DAT_FP.Conto = dbo.COA_ANA_CONTI.Cod_scon INNER JOIN
                         dbo.PER_ANA_RUO ON dbo.PER_DTA_COS_STIP.IdRuolo = dbo.PER_ANA_RUO.IdRuolo INNER JOIN
                         dbo.V_PER_SITUAZIONE_AL_TOTALE ON dbo.PER_DTA_COS_STIP.AnnoRif = dbo.V_PER_SITUAZIONE_AL_TOTALE.Anno AND dbo.PER_DTA_COS_STIP.MeseRif = dbo.V_PER_SITUAZIONE_AL_TOTALE.Mese AND 
                         dbo.PER_DTA_COS_STIP.Matricola = dbo.V_PER_SITUAZIONE_AL_TOTALE.Matricola INNER JOIN
                         dbo.COA_ANA_CDC ON dbo.PER_DTA_COS_STIP.CodCdC = dbo.COA_ANA_CDC.CodCdc INNER JOIN
                         dbo.MST_ANA_AGG_DEN ON dbo.PER_DTA_COS_STIP.CodCdr = dbo.MST_ANA_AGG_DEN.ID_0 ON dbo.COA_ANA_FP_FON.CodFondo = dbo.COA_ANA_FP.CodFondo LEFT OUTER JOIN
                         dbo.PER_ANA_MAT ON dbo.PER_DTA_COS_STIP.Matricola = dbo.PER_ANA_MAT.Matricola
WHERE        (dbo.COA_ANA_FP.Gruppo3 <> N'NoCostoPers') AND (dbo.PER_ANA_RUO.Gruppo3 <> N'NoCostoPers') AND (dbo.PER_DTA_COS_STIP.Matricola <> 194) OR
             (dbo.COA_ANA_FP.Gruppo3 <> N'NoCostoPers') AND (dbo.PER_ANA_RUO.Gruppo3 <> N'NoCostoPers') AND (dbo.PER_DTA_COS_STIP.AnnoRif <> 2015)

/* REPLICO LA CONDIZIONE USATA SULLA VISTA COSTI_PERSONALE_X_ATTIVITA

WHERE        (dbo.PER_DTA_CST_MAT_PRO.Anno >= 2008) AND (dbo.PER_ANA_RUO.Gruppo3 <> N'NoCostoPers') AND (dbo.COA_ANA_FP.Gruppo3 <> N'NoCostoPers') 
AND (dbo.PER_DTA_CST_MAT_PRO.Matr <> 194) 
OR
(dbo.PER_DTA_CST_MAT_PRO.Anno >= 2008) AND (dbo.PER_ANA_RUO.Gruppo3 <> N'NoCostoPers') AND (dbo.COA_ANA_FP.Gruppo3 <> N'NoCostoPers') 
AND (dbo.PER_DTA_CST_MAT_PRO.Anno <> 2015)
*/

/*test verifica congruita
2075583,62  select sum(importopesato) from v_costi_personale_cedolino where annoliq = 2017 and meseliq = 9;

verifico una modifica inserita a settembre retroattiva da febbraio, che nella mia tabella è già recepita
select * from v_costi_personale_cedolino where annoliq = 2017 and matricola = 1099 and meseliq = 2;
select * from per_dta_stip where annoliq = 2017 and matricola = 1099 and meseliq =2;
select * from costi_personale_x_attivita where matr = 1099 and anno = 2016 and mese = 12;
*/

/*Faccio una modifica in modo che la struttura organizzativa sia legata al cento di attività e non al centro pagatore*/