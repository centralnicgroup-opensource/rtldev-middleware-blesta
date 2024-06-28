<?php

/**
 * @copyright Copyright (c) 2018-2024, CNR
 * @license https://raw.githubusercontent.com/centralnicgroup-opensource/rtldev-middleware-blesta/master/LICENSE MIT
 */

// Transfer fields
Configure::set('Cnr.transfer_fields', [
    'domain' => [
        'label' => Language::_('Cnr.transfer.domain', true),
        'type' => 'text'
    ],
    'transfer_key' => [
        'label' => Language::_('Cnr.transfer.EPPCode', true),
        'type' => 'text'
    ]
]);

// Domain fields
Configure::set('Cnr.domain_fields', [
    'domain' => [
        'label' => Language::_('Cnr.domain.domain', true),
        'type' => 'text'
    ],
]);

// Nameserver fields
Configure::set('Cnr.nameserver_fields', [
    'ns1' => [
        'label' => Language::_('Cnr.nameserver.ns1', true),
        'type' => 'text'
    ],
    'ns2' => [
        'label' => Language::_('Cnr.nameserver.ns2', true),
        'type' => 'text'
    ],
    'ns3' => [
        'label' => Language::_('Cnr.nameserver.ns3', true),
        'type' => 'text'
    ],
    'ns4' => [
        'label' => Language::_('Cnr.nameserver.ns4', true),
        'type' => 'text'
    ],
    'ns5' => [
        'label' => Language::_('Cnr.nameserver.ns5', true),
        'type' => 'text'
    ]
]);

// Whois sections
Configure::set('Cnr.whois_sections', [
    'Registrant',
    'Tech',
    'Admin',
    'Billing'
]);

// Whois fields
Configure::set('Cnr.whois_fields', [
    'RegistrantFirstName' => [
        'label' => Language::_('Cnr.whois.RegistrantFirstName', true),
        'type' => 'text'
    ],
    'RegistrantLastName' => [
        'label' => Language::_('Cnr.whois.RegistrantLastName', true),
        'type' => 'text'
    ],
    'RegistrantOrganization' => [
        'label' => Language::_('Cnr.whois.RegistrantOrganization', true),
        'type' => 'text'
    ],
    'RegistrantAddress1' => [
        'label' => Language::_('Cnr.whois.RegistrantAddress1', true),
        'type' => 'text'
    ],
    'RegistrantAddress2' => [
        'label' => Language::_('Cnr.whois.RegistrantAddress2', true),
        'type' => 'text'
    ],
    'RegistrantCity' => [
        'label' => Language::_('Cnr.whois.RegistrantCity', true),
        'type' => 'text'
    ],
    'RegistrantStateProvince' => [
        'label' => Language::_('Cnr.whois.RegistrantStateProvince', true),
        'type' => 'text'
    ],
    'RegistrantPostalCode' => [
        'label' => Language::_('Cnr.whois.RegistrantPostalCode', true),
        'type' => 'text'
    ],
    'RegistrantCountry' => [
        'label' => Language::_('Cnr.whois.RegistrantCountry', true),
        'type' => 'text'
    ],
    'RegistrantPhone' => [
        'label' => Language::_('Cnr.whois.RegistrantPhone', true),
        'type' => 'text'
    ],
    'RegistrantEmailAddress' => [
        'label' => Language::_('Cnr.whois.RegistrantEmailAddress', true),
        'type' => 'text'
    ],
    'TechFirstName' => [
        'label' => Language::_('Cnr.whois.TechFirstName', true),
        'type' => 'text'
    ],
    'TechLastName' => [
        'label' => Language::_('Cnr.whois.TechLastName', true),
        'type' => 'text'
    ],
    'TechOrganization' => [
        'label' => Language::_('Cnr.whois.TechOrganization', true),
        'type' => 'text'
    ],
    'TechAddress1' => [
        'label' => Language::_('Cnr.whois.TechAddress1', true),
        'type' => 'text'
    ],
    'TechAddress2' => [
        'label' => Language::_('Cnr.whois.TechAddress2', true),
        'type' => 'text'
    ],
    'TechCity' => [
        'label' => Language::_('Cnr.whois.TechCity', true),
        'type' => 'text'
    ],
    'TechStateProvince' => [
        'label' => Language::_('Cnr.whois.TechStateProvince', true),
        'type' => 'text'
    ],
    'TechPostalCode' => [
        'label' => Language::_('Cnr.whois.TechPostalCode', true),
        'type' => 'text'
    ],
    'TechCountry' => [
        'label' => Language::_('Cnr.whois.TechCountry', true),
        'type' => 'text'
    ],
    'TechPhone' => [
        'label' => Language::_('Cnr.whois.TechPhone', true),
        'type' => 'text'
    ],
    'TechEmailAddress' => [
        'label' => Language::_('Cnr.whois.TechEmailAddress', true),
        'type' => 'text'
    ],
    'AdminFirstName' => [
        'label' => Language::_('Cnr.whois.AdminFirstName', true),
        'type' => 'text'
    ],
    'AdminLastName' => [
        'label' => Language::_('Cnr.whois.AdminLastName', true),
        'type' => 'text'
    ],
    'AdminOrganization' => [
        'label' => Language::_('Cnr.whois.AdminOrganization', true),
        'type' => 'text'
    ],
    'AdminAddress1' => [
        'label' => Language::_('Cnr.whois.AdminAddress1', true),
        'type' => 'text'
    ],
    'AdminAddress2' => [
        'label' => Language::_('Cnr.whois.AdminAddress2', true),
        'type' => 'text'
    ],
    'AdminCity' => [
        'label' => Language::_('Cnr.whois.AdminCity', true),
        'type' => 'text'
    ],
    'AdminStateProvince' => [
        'label' => Language::_('Cnr.whois.AdminStateProvince', true),
        'type' => 'text'
    ],
    'AdminPostalCode' => [
        'label' => Language::_('Cnr.whois.AdminPostalCode', true),
        'type' => 'text'
    ],
    'AdminCountry' => [
        'label' => Language::_('Cnr.whois.AdminCountry', true),
        'type' => 'text'
    ],
    'AdminPhone' => [
        'label' => Language::_('Cnr.whois.AdminPhone', true),
        'type' => 'text'
    ],
    'AdminEmailAddress' => [
        'label' => Language::_('Cnr.whois.AdminEmailAddress', true),
        'type' => 'text'
    ],
    'BillingFirstName' => [
        'label' => Language::_('Cnr.whois.BillingFirstName', true),
        'type' => 'text'
    ],
    'BillingLastName' => [
        'label' => Language::_('Cnr.whois.BillingLastName', true),
        'type' => 'text'
    ],
    'BillingOrganization' => [
        'label' => Language::_('Cnr.whois.BillingOrganization', true),
        'type' => 'text'
    ],
    'BillingAddress1' => [
        'label' => Language::_('Cnr.whois.BillingAddress1', true),
        'type' => 'text'
    ],
    'BillingAddress2' => [
        'label' => Language::_('Cnr.whois.BillingAddress2', true),
        'type' => 'text'
    ],
    'BillingCity' => [
        'label' => Language::_('Cnr.whois.BillingCity', true),
        'type' => 'text'
    ],
    'BillingStateProvince' => [
        'label' => Language::_('Cnr.whois.BillingStateProvince', true),
        'type' => 'text'
    ],
    'BillingPostalCode' => [
        'label' => Language::_('Cnr.whois.BillingPostalCode', true),
        'type' => 'text'
    ],
    'BillingCountry' => [
        'label' => Language::_('Cnr.whois.BillingCountry', true),
        'type' => 'text'
    ],
    'BillingPhone' => [
        'label' => Language::_('Cnr.whois.BillingPhone', true),
        'type' => 'text'
    ],
    'BillingEmailAddress' => [
        'label' => Language::_('Cnr.whois.BillingEmailAddress', true),
        'type' => 'text'
    ]
]);

// DNSSEC
Configure::set('Cnr.dnssec', [
    'flags' => [
        'label' => Language::_('Cnr.dnssec.flags', true),
        'type' => 'select',
        'options' => [
            '' => Language::_('AppController.select.please', true),
            '256' => 'Zone Signing Key (256)',
            '257' => 'Key Signing Key (257)'
        ]
    ],
    'digest_type' => [
       'label' => Language::_('Cnr.dnssec.digest_type', true),
       'type' => 'select',
       'options' => [
           '' => Language::_('AppController.select.please', true),
           '2' => 'SHA-256 (2)',
           '3' => 'GOST R 34.11-94 (3)',
           '4' => 'SHA-384 (4)'
       ]
    ],
    'algorithm' => [
        'label' => Language::_('Cnr.dnssec.algorithm', true),
        'type' => 'select',
        'options' => [
            '' => Language::_('AppController.select.please', true),
            '8' => 'RSA/SHA-256 (8)',
            '10' => 'RSA/SHA-512 (10)',
            '12' => 'ECC-GOST (12)',
            '13' => 'ECDSA Curve P-256 with SHA-256 (13)',
            '14' => 'ECDSA Curve P-384 with SHA-384 (14)',
            '15' => 'Ed25519 (15)',
            '16' => 'Ed448 (16)'
        ]
    ],
]);

// Additional domain fields

// .US
Configure::set('Cnr.domain_fields.us', [
    'X-US-NEXUS-CATEGORY' => [
        'label' => Language::_('Cnr.domain.RegistrantNexus', true),
        'type' => 'select',
        'options' => [
            'C11' => Language::_('Cnr.domain.RegistrantNexus.c11', true),
            'C12' => Language::_('Cnr.domain.RegistrantNexus.c12', true),
            'C21' => Language::_('Cnr.domain.RegistrantNexus.c21', true),
            'C31' => Language::_('Cnr.domain.RegistrantNexus.c31', true),
            'C32' => Language::_('Cnr.domain.RegistrantNexus.c32', true)
        ]
    ],
    'X-US-NEXUS-APPPURPOSE' => [
        'label' => Language::_('Cnr.domain.RegistrantPurpose', true),
        'type' => 'select',
        'options' => [
            'P1' => Language::_('Cnr.domain.RegistrantPurpose.p1', true),
            'P2' => Language::_('Cnr.domain.RegistrantPurpose.p2', true),
            'P3' => Language::_('Cnr.domain.RegistrantPurpose.p3', true),
            'P4' => Language::_('Cnr.domain.RegistrantPurpose.p4', true),
            'P5' => Language::_('Cnr.domain.RegistrantPurpose.p5', true)
        ]
    ],
    'X-US-NEXUS-VALIDATOR' => [
        'label' => Language::_('Cnr.domain.RegistrantCountry', true),
        'type' => 'text'
    ]

]);

// .NU
Configure::set('Cnr.domain_fields.nu', [
    'X-REGISTRANT-IDNUMBER' => [
        'label' => Language::_('Cnr.domain.RegistrantIDnumber', true),
        'type' => 'text'
    ],
    'X-VATID' => [
        'label' => Language::_('Cnr.domain.VatID', true),
        'type' => 'text'
    ],

]);

// .VOTE
Configure::set('Cnr.domain_fields.vote', [
    'X-VOTE-ACCEPT-HIGHLY-REGULATED-TAC' => [
        'label' => Language::_('Cnr.domain.Agreement', true),
        'type' => 'checkbox',
        'options' => [
            'I AGREE' => Language::_('Cnr.domain.VOTEAgreement.yes', true)
        ]
    ]
]);

// .VOTO
Configure::set('Cnr.domain_fields.voto', [
    'X-VOTO-ACCEPT-HIGHLY-REGULATED-TAC' => [
        'label' => Language::_('Cnr.domain.Agreement', true),
        'type' => 'checkbox',
        'options' => [
            'I AGREE' => Language::_('Cnr.domain.VOTOAgreement.yes', true)
        ]
    ]
]);

// .RO
Configure::set('Cnr.domain_fields.ro', [
    'X-REGISTRANT-IDNUMBER' => [
        'label' => Language::_('Cnr.domain.RegistrantIDnumber', true),
        'type' => 'text'
    ],
    'X-REGISTRANT-VATID' => [
        'label' => Language::_('Cnr.domain.RegistrantVatID', true),
        'type' => 'text'
    ]

]);

// .BERLIN
Configure::set('Cnr.domain_fields.berlin', [
    'X-BERLIN-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Cnr.domain.BerlinOptions', true)
        ]
    ]
]);

// .RUHR
Configure::set('Cnr.domain_fields.ruhr', [
    'X-RUHR-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Cnr.domain.RuhrOptions', true)
        ]
    ]
]);

// .HAMBURG
Configure::set('Cnr.domain_fields.hamburg', [
    'X-HAMBURG-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Cnr.domain.HamburgOptions', true)
        ]
    ]
]);

// .BAYERN
Configure::set('Cnr.domain_fields.bayern', [
    'X-BAYERN-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Cnr.domain.BayernOptions', true)
        ]
    ]
]);

// .JP
Configure::set('Cnr.domain_fields.jp', [
    'X-JP-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Cnr.domain.JpOptions', true)
        ]
    ]
]);

// .DE
Configure::set('Cnr.domain_fields.de', [
    'X-DE-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Cnr.domain.deOptions', true)
        ]
    ]
]);

// .EU
Configure::set('Cnr.domain_fields.eu', [
    'X-EU-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Cnr.domain.euOptions', true)
        ]
    ]
]);

// .SG
Configure::set('Cnr.domain_fields.sg', [
    'X-SG-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Cnr.domain.sgOptions', true)
        ]
    ],
    'X-SG-RCBID' => [
        'label' => Language::_('Cnr.domain.RCBSingaporeID', true),
        'type' => 'text'
        ],
    'X-ADMIN-IDNUMBER' => [
        'label' => Language::_('Cnr.domain.AdminIDnumber', true),
        'type' => 'text'
    ]

]);

// .COM.SG
Configure::set('Cnr.domain_fields.com.sg', Configure::get('Cnr.domain_fields.sg', true));

// .EDU.SG
Configure::set('Cnr.domain_fields.edu.sg', Configure::get('Cnr.domain_fields.sg', true));

// .NET.SG
Configure::set('Cnr.domain_fields.net.sg', Configure::get('Cnr.domain_fields.sg', true));

// .ORG.SG
Configure::set('Cnr.domain_fields.org.sg', Configure::get('Cnr.domain_fields.sg', true));

// .PER.SG
Configure::set('Cnr.domain_fields.per.sg', Configure::get('Cnr.domain_fields.sg', true));

// .CA
Configure::set('Cnr.domain_fields.ca', [
    'X-CA-LEGALTYPE' => [
        'label' => Language::_('Cnr.domain.CIRALegalType', true),
        'type' => 'select',
        'options' => [
            'CCO' => Language::_('Cnr.domain.RegistrantPurpose.cco', true),
            'CCT' => Language::_('Cnr.domain.RegistrantPurpose.cct', true),
            'RES' => Language::_('Cnr.domain.RegistrantPurpose.res', true),
            'GOV' => Language::_('Cnr.domain.RegistrantPurpose.gov', true),
            'EDU' => Language::_('Cnr.domain.RegistrantPurpose.edu', true),
            'ASS' => Language::_('Cnr.domain.RegistrantPurpose.ass', true),
            'HOP' => Language::_('Cnr.domain.RegistrantPurpose.hop', true),
            'PRT' => Language::_('Cnr.domain.RegistrantPurpose.prt', true),
            'TDM' => Language::_('Cnr.domain.RegistrantPurpose.tdm', true),
            'TRD' => Language::_('Cnr.domain.RegistrantPurpose.trd', true),
            'PLT' => Language::_('Cnr.domain.RegistrantPurpose.plt', true),
            'LAM' => Language::_('Cnr.domain.RegistrantPurpose.lam', true),
            'TRS' => Language::_('Cnr.domain.RegistrantPurpose.trs', true),
            'ABO' => Language::_('Cnr.domain.RegistrantPurpose.abo', true),
            'INB' => Language::_('Cnr.domain.RegistrantPurpose.inb', true),
            'LGR' => Language::_('Cnr.domain.RegistrantPurpose.lgr', true),
            'OMK' => Language::_('Cnr.domain.RegistrantPurpose.omk', true),
            'MAJ' => Language::_('Cnr.domain.RegistrantPurpose.maj', true)
        ]
    ],
    'X-CA-LANGUAGE' => [
        'label' => Language::_('Cnr.domain.CIRALanguage', true),
        'type' => 'select',
        'options' => [
            'en' => Language::_('Cnr.domain.CIRALanguage.en', true),
            'fr' => Language::_('Cnr.domain.CIRALanguage.fr', true),
        ]
    ]
]);

// .AERO
Configure::set('Cnr.domain_fields.aero', [
    'X-AERO-ENS-AUTH-ID' => [
        'label' => Language::_('Cnr.domain.AeroID', true),
        'type' => 'text',
    ],
    'X-AERO-ENS-AUTH-KEY' => [
        'label' => Language::_('Cnr.domain.AeroPassword', true),
        'type' => 'text'
    ]
]);

// .TRAVEL
Configure::set('Cnr.domain_fields.travel', [
    'X-TRAVEL-INDUSTRY' => [
        'label' => Language::_('Cnr.domain.TravelIndustry', true),
        'type' => 'text'
    ]
]);

// .FR
Configure::set('Cnr.domain_fields.fr', [
    'X-FR-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Cnr.domain.frOptions', true)
        ]
    ],
    'X-FR-REGISTRANT-BIRTH-DATE' => [
        'label' => Language::_('Cnr.domain.DateOfBirth', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-BIRTH-PLACE' => [
        'label' => Language::_('Cnr.domain.PlaceOfBirth', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-LEGAL-ID' => [
        'label' => Language::_('Cnr.domain.VatIDorSiren', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-TRADEMARK-NUMBER' => [
        'label' => Language::_('Cnr.domain.TrademarkNumber', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-DUNS-NUMBER' => [
        'label' => Language::_('Cnr.domain.DunsNumber', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-LOCAL-ID' => [
        'label' => Language::_('Cnr.domain.LocalID', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-JO-DATE-DECLARATION' => [
        'label' => Language::_('Cnr.domain.DateOfDeclaration', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-JO-NUMBER' => [
        'label' => Language::_('Cnr.domain.NumberJo', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-JO-PAGE' => [
        'label' => Language::_('Cnr.domain.JoPage', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-JO-DATE-PUBLICATION' => [
        'label' => Language::_('Cnr.domain.DateOfPublicationJo', true),
        'type' => 'text'
    ]
]);

// .PM
Configure::set('Cnr.domain_fields.pm', Configure::get('Cnr.domain_fields.fr', true));

// .RE
Configure::set('Cnr.domain_fields.re', Configure::get('Cnr.domain_fields.fr', true));

// .TF
Configure::set('Cnr.domain_fields.tf', Configure::get('Cnr.domain_fields.fr', true));

// .WF
Configure::set('Cnr.domain_fields.wf', Configure::get('Cnr.domain_fields.fr', true));

// .YT
Configure::set('Cnr.domain_fields.yt', Configure::get('Cnr.domain_fields.fr', true));

// .JOBS
Configure::set('Cnr.domain_fields.jobs', [
    'X-JOBS-COMPANYURL' => [
        'label' => Language::_('Cnr.domain.CompanyURL', true),
        'type' => 'text'
    ],
    'X-JOBS-INDUSTRYCLASSIFICATION' => [
        'label' => Language::_('Cnr.domain.IndustryClassification', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '2' => Language::_('Cnr.domain.AccountingBankingFinance', true),
            '3' => Language::_('Cnr.domain.AgricultureFarming', true),
            '21' => Language::_('Cnr.domain.Biotechnologycience', true),
            '5' => Language::_('Cnr.domain.ComputerInformationechnology', true),
            '4' => Language::_('Cnr.domain.ConstructionBuildingServices', true),
            '12' => Language::_('Cnr.domain.Consulting', true),
            '6' => Language::_('Cnr.domain.EducationTrainingLibrary', true),
            '7' => Language::_('Cnr.domain.Entertainment', true),
            '13' => Language::_('Cnr.domain.Environmental', true),
            '19' => Language::_('Cnr.domain.Hospitality', true),
            '10' => Language::_('Cnr.domain.GovernmentCivilService', true),
            '11' => Language::_('Cnr.domain.Healthcare', true),
            '15' => Language::_('Cnr.domain.HRRecruiting', true),
            '16' => Language::_('Cnr.domain.Insurance', true),
            '17' => Language::_('Cnr.domain.Legal', true),
            '18' => Language::_('Cnr.domain.Manufacturing', true),
            '20' => Language::_('Cnr.domain.MediaAdvertising', true),
            '9' => Language::_('Cnr.domain.ParksRecreation', true),
            '26' => Language::_('Cnr.domain.Pharmaceutical', true),
            '22' => Language::_('Cnr.domain.RealEstate', true),
            '14' => Language::_('Cnr.domain.RestaurantFoodService', true),
            '23' => Language::_('Cnr.domain.Retail', true),
            '8' => Language::_('Cnr.domain.Telemarketing', true),
            '24' => Language::_('Cnr.domain.Transportation', true),
            '25' => Language::_('Cnr.domain.Other', true)
        ]
    ],
]);

// .PRO
Configure::set('Cnr.domain_fields.pro', [
    'X-PRO-PROFESSION' => [
        'label' => Language::_('Cnr.domain.Profession', true),
        'type' => 'text'
    ],
    'X-PRO-AUTHORITY' => [
        'label' => Language::_('Cnr.domain.Authority', true),
        'type' => 'text'
    ],
    'X-PRO-AUTHORITYWEBSITE' => [
        'label' => Language::_('Cnr.domain.AuthorityWebsite', true),
        'type' => 'text'
    ],
    'X-PRO-LICENSENUMBER' => [
        'label' => Language::_('Cnr.domain.LicenseNumber', true),
        'type' => 'text'
    ],
    'X-PRO-ACCEPT-TOU' => [
        'label' => Language::_('Cnr.domain.PROTerms', true),
        'type' => 'checkbox',
        'options' => [
            '1' => Language::_('Cnr.domain.PROTerms.yes', true)
        ]
    ],
]);

// .HK
Configure::set('Cnr.domain_fields.hk', [
    'X-HK-REGISTRANT-DOCUMENT-TYPE' => [
        'label' => Language::_('Cnr.domain.RegistrantDocumentType', true),
        'type' => 'select',
        'options' => [
            'HKID' => Language::_('Cnr.domain.HongKongIdentityNumber', true),
            'OTHID' => Language::_('Cnr.domain. OtherCountryIdentityNumber', true),
            'PASSNO' => Language::_('Cnr.domain.PassportNo', true),
            'BIRTHCERT' => Language::_('Cnr.domain.BirthCertificate', true),
            'OTHIDV' => Language::_('Cnr.domain.OthersIndividualDocument', true),
            'BR' => Language::_('Cnr.domain.BusinessRegistrationCertificate', true),
            'CI' => Language::_('Cnr.domain.CertificateofIncorporation', true),
            'CRS' => Language::_('Cnr.domain.CertificateofRegistrationofaSchool', true),
            'HKSARG' => Language::_('Cnr.domain.HongKongSpecialAdministrativeRegionGovernment', true),
            'HKORDINANCE' => Language::_('Cnr.domain.OrdinanceofHongKong', true),
            'OTHORG' => Language::_('Cnr.domain.OthersOrganizationDocument', true)
        ]
    ],
    'X-HK-REGISTRANT-DOCUMENT-NUMBER' => [
        'label' => Language::_('Cnr.domain.RegistrantDocumentNumber', true),
        'type' => 'text'
    ],
    'X-HK-REGISTRANT-DOCUMENT-ORIGIN-COUNTRY' => [
        'label' => Language::_('Cnr.domain.RegistrantDocumentOriginCountry', true),
        'type' => 'text'
    ],
    'X-HK-REGISTRANT-BIRTH-DATE' => [
        'label' => Language::_('Cnr.domain.RegistrantBirthDateforindividuals', true),
        'type' => 'text'
    ],
    'X-HK-ACCEPT-INDIVIDUAL-REGISTRATION-TAC' => [
        'label' => Language::_('Cnr.domain.HKTermsforindividuals', true),
        'type' => 'checkbox',
        'options' => [
            '1' => Language::_('Cnr.domain.HKTermsforindividuals.yes', true)
        ]
    ]
]);

// .FI
Configure::set('Cnr.domain_fields.fi', [
    'X-FI-ACCEPT-REGISTRATION-TAC' => [
        'label' => Language::_('Cnr.domain.FICORAAgreement', true),
        'type' => 'checkbox',
        'options' => [
            '1' => Language::_('Cnr.domain.FIagreement.yes', true)
        ]
    ],
    'X-FI-IDNUMBER' => [
        'label' => Language::_('Cnr.domain.IDNumber', true),
        'type' => 'text'
    ]
]);

// .SE
Configure::set('Cnr.domain_fields.se', [
    'X-NICSE-IDNUMBER' => [
        'label' => Language::_('Cnr.domain.RegistrantIDNumber', true),
        'type' => 'text'
    ],
    'X-NICSE-VATID' => [
        'label' => Language::_('Cnr.domain.RegistrantVatID', true),
        'type' => 'text'
    ]
]);

// .DK
Configure::set('Cnr.domain_fields.dk', [
    'X-REGISTRANT-VATID' => [
        'label' => Language::_('Cnr.domain.RegistrantVatID', true),
        'type' => 'text'
    ],
    'X-ADMIN-VATID' => [
        'label' => Language::_('Cnr.domain.AdminVATID', true),
        'type' => 'text'
    ],
    'X-DK-REGISTRANT-CONTACT' => [
        'label' => Language::_('Cnr.domain.Registrantcontact', true),
        'type' => 'text'
    ],
    'X-DK-ADMIN-CONTACT' => [
        'label' => Language::_('Cnr.domain.Admincontact', true),
        'type' => 'text'
    ]
]);

// .IT
Configure::set('Cnr.domain_fields.it', [
    'X-IT-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Cnr.domain.LocalPresence', true),
        'type' => 'text'
    ],
    'X-IT-PIN' => [
        'label' => Language::_('Cnr.domain.PIN', true),
        'type' => 'text'
    ],
    'X-IT-ACCEPT-LIABILITY-TAC' => [
        'label' => Language::_('Cnr.domain.Section3Agreemen', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Cnr.domain.Section3Agreemen.yes', true)
        ]
    ],
    'X-IT-ACCEPT-REGISTRATION-TAC' => [
        'label' => Language::_('Cnr.domain.Section5Agreemen', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Cnr.domain.Section5Agreemen.yes', true)
        ]
    ],
    'X-IT-ACCEPT-DIFFUSION-AND-ACCESSIBILITY-TAC' => [
        'label' => Language::_('Cnr.domain.Section6Agreement', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Cnr.domain.Section6Agreemen.yes', true)
        ]
    ],
    'X-IT-ACCEPT-EXPLICIT-TAC' => [
        'label' => Language::_('Cnr.domain.Section7Agreemen', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Cnr.domain.Section7Agreemen.yes', true)
        ]
    ]
]);

// .QUEBEC
Configure::set('Cnr.domain_fields.quebec', [
    'X-CORE-INTENDED-USE' => [
        'label' => Language::_('Cnr.domain.QUEBECIntendeduse', true),
        'type' => 'text'
    ]
]);

// .SCOT
Configure::set('Cnr.domain_fields.scot', [
    'X-CORE-INTENDED-USE' => [
        'label' => Language::_('Cnr.domain.SCOTIntendeduse', true),
        'type' => 'text'
    ]
]);

// .NYC
Configure::set('Cnr.domain_fields.nyc', [
    'X-NYC-REGISTRANT-NEXUS-CATEGORY' => [
        'label' => Language::_('Cnr.domain.NEXUSCategory', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Cnr.domain.NaturalPerson', true),
            '2' =>  Language::_('Cnr.domain.Entityororganization', true)
        ]
    ]
]);

// .ES
Configure::set('Cnr.domain_fields.es', [
    'X-ES-REGISTRANT-TIPO-IDENTIFICACION' => [
        'label' => Language::_('Cnr.domain.RegistrantType', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '0' => Language::_('Cnr.domain.Otra', true),
            '1' => Language::_('Cnr.domain.NIF', true),
            '3' => Language::_('Cnr.domain.Alien', true),
        ]
    ],
    'X-ES-REGISTRANT-IDENTIFICACION' => [
        'label' => Language::_('Cnr.domain.RegistrantIdentificationNumber', true),
        'type' => 'text'
    ],
    'X-ES-ADMIN-TIPO-IDENTIFICACION' => [
        'label' => Language::_('Cnr.domain.AdminContactType', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '0' => Language::_('Cnr.domain.Otra', true),
            '1' => Language::_('Cnr.domain.NIF', true),
            '3' => Language::_('Cnr.domain.Alien', true),
        ]
    ],
    'X-ES-ADMIN-IDENTIFICACION' => [
        'label' => Language::_('Cnr.domain.AdminContactIdentificationNumber', true),
        'type' => 'text'
    ],
    'X-ES-ACCEPT-INDIVIDUAL-REGISTRATION-TAC' => [
        'label' => Language::_('Cnr.domain.Agreement', true),
        'type' => 'select',
        'options' => [
            '0' => '',
            '1' => Language::_('Cnr.domain.ESAgreement', true)
        ]
    ]
]);

// .IE
Configure::set('Cnr.domain_fields.ie', [
    'X-IE-REGISTRANT-CLASS' => [
        'label' => Language::_('Cnr.domain.RegistrantClass', true),
        'type' => 'select',
        'options' => [
            '' => '',
            'Company,Business Owner,Club' => Language::_('Cnr.domain.CompanyBusinessOwnerClub', true),
            'Band' => Language::_('Cnr.domain.Band', true),
            'Local Group,School' => Language::_('Cnr.domain.LocalGroupSchool', true),
            'College,State Agency,Charity,Blogger' => Language::_('Cnr.domain.CollegeStateAgencyCharityBlogger', true),
            'Other' => Language::_('Cnr.domain.Other', true)
        ]
    ],
    'X-IE-REGISTRANT-REMARKS' => [
        'label' => Language::_('Cnr.domain.ProofofconnectiontoIreland', true),
        'type' => 'text'
    ]
]);

// .NO
Configure::set('Cnr.domain_fields.no', [
    'X-NO-REGISTRANT-IDENTITY' => [
        'label' => Language::_('Cnr.domain.RegistrantIDnumber', true),
        'type' => 'text'
    ],
    'Fax-Required' => [
        'label' => Language::_('Cnr.domain.Faxrequired', true),
        'type' => 'checkbox',
        'options' => [
            'I AGREE' => Language::_('Cnr.domain.NOFaxrequired.yes', true)
        ]
    ]
]);

// .SWISS
Configure::set('Cnr.domain_fields.swiss', [
    'X-SWISS-REGISTRANT-ENTERPRISE-ID' => [
        'label' => Language::_('Cnr.domain.EnterpriseID', true),
        'type' => 'text'
    ],
    'X-CORE-INTENDED-USE' => [
        'label' => Language::_('Cnr.domain.SWISSIntendeduse', true),
        'type' => 'text'
    ]
]);

// .PT
Configure::set('Cnr.domain_fields.pt', [
    'X-PT-REGISTRANT-VATID' => [
        'label' => Language::_('Cnr.domain.RegistrantVatID', true),
        'type' => 'text'
    ],
    'X-PT-TECH-VATID' => [
        'label' => Language::_('Cnr.domain.TechvatID', true),
        'type' => 'text'
    ],
]);

// .ECO
Configure::set('Cnr.domain_fields.eco', [
    'X-ECO-ACCEPT-HIGHLY-REGULATED-TAC' => [
        'label' => Language::_('Cnr.domain.HighlyRegulatedTLD', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Cnr.domain.ECOHighlyRegulatedTLD.yes', true)
        ]
    ]
]);

// .CN
Configure::set('Cnr.domain_fields.cn', [
    'X-CN-REGISTRANT-ID-TYPE' => [
        'label' => Language::_('Cnr.domain.RegistrantIDType', true),
        'type' => 'text'
    ],
    'X-CN-REGISTRANT-ID-NUMBER' => [
        'label' => Language::_('Cnr.domain.RegistrantIDNumber', true),
        'type' => 'text'
    ]
]);

// .COM.CN
Configure::set('Cnr.domain_fields.com.cn', Configure::get('Cnr.domain_fields.cn', true));
// .NET.CN
Configure::set('Cnr.domain_fields.net.cn', Configure::get('Cnr.domain_fields.cn', true));
// .ORG.CN
Configure::set('Cnr.domain_fields.org.cn', Configure::get('Cnr.domain_fields.cn', true));

// .COM.AU
Configure::set('Cnr.domain_fields.com.au', [
    'X-CN-REGISTRANT-ID-TYPE' => [
        'label' => Language::_('Cnr.domain.RegistrantIDType', true),
        'type' => 'select',
        'options' => [
            'ABN' => Language::_('Cnr.domain.AustralianBusinessNumber', true),
            'ACN' => Language::_('Cnr.domain.AustralianCompanyNumber', true),
            'RBN' => Language::_('Cnr.domain.BusinessRegistrationNumber', true),
            'TM' => Language::_('Cnr.domain.TrademarkNumber', true)
        ]
    ]
]);

// .NET.AU
Configure::set('Cnr.domain_fields.net.au', Configure::get('Cnr.domain_fields.com.au', true));
// .ORG.AU
Configure::set('Cnr.domain_fields.org.au', Configure::get('Cnr.domain_fields.com.au', true));
// .ID.AU
Configure::set('Cnr.domain_fields.id.au', Configure::get('Cnr.domain_fields.com.au', true));

// .LV
Configure::set('Cnr.domain_fields.lv', [
    'X-VATID' => [
        'label' => Language::_('Cnr.domain.VatID', true),
        'type' => 'text'
    ],
    'X-IDNUMBER' => [
        'label' => Language::_('Cnr.domain.IDnumber', true),
        'type' => 'text'
    ],
]);
