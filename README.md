# Viste
Tengo traccia delle viste che stanno "sotto" ai nuovi report del personale, eventualmente amplierò il monitoraggio anche ai nuovi report e/o a modifiche sostanziali dei vecchi report qlik.

Costi_personale_x_attività  
    è la vista che alimenta direttamente il report \\qliksrv2\qlikPub\reportSperimentali\Costo_personale_new.qvw

prova_costi_personale_x_attivita
    era la versione di prova della vista precedente, è stata testata con la quadratura al centesimo con le query di mirella. Le successive modifiche hanno preso il nome senza il prova davanti (è entrata in produzione). La tengo come test per confrontare i risultati di modifiche sulla vista in produzione, in modo che una semplice modifica di un campo, non deve portare a mifiche sostanziali.

v_costi_personale_cedolino
    vista alla base del report \\qliksrv2\qlikPub\reportSperimentali\Cedolini.qvw
    che però viene alimentato da QVD generati da E:\CONTROLLO DI GESTIONE\CDG\QLIK-report\crea_qvd_costi_personale.qvw

    nasce dall'esigenza dell'ufficio personale di sapere relativamente ai costi del personale anno e mese sia di competenza sia di liquidazione, unitamente
