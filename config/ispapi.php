<?php
// All available TLDs
// TODO - Is there a way (any command) to get list of TLDs that hexonet offers ? if no, which tlds we want to offer here
Configure::set('Ispapi.tlds', [
    // Second-Level
    '.br.com',
    '.cn.com',
    '.com.au',
    '.com.de',
    '.com.es',
    '.com.pe',
    '.com.sg',
    '.de.com',
    '.eu.com',
    '.gr.com',
    '.hu.com',
    '.net.au',
    '.net.pe',
    '.no.com',
    '.nom.es',
    '.nom.pe',
    '.org.au',
    '.org.es',
    '.org.pe',
    '.qc.com',
    '.ru.com',
    '.sq.com',
    '.se.com',
    '.uk.com',
    '.us.com',
    '.us.org',
    '.uy.com',
    '.za.com',
    '.com.mx',
    '.uk.net',
    '.se.net',
    '.co.uk',
    // Generic
    '.biz',
    '.com',
    '.info',
    '.name',
    '.net',
    '.org',
    '.xxx',
    // Speciality
    '.asia',
    '.cm',
    '.co',
    '.me',
    '.mobi',
    '.pro',
    '.pw',
    '.tel',
    '.tv',
    // Country Code
    '.ac',
    '.am',
    '.at',
    '.be',
    '.bz',
    '.ca',
    '.cc',
    '.ch',
    '.cn',
    '.de',
    '.es',
    '.eu',
    '.fm',
    '.fr',
    '.gs',
    '.in',
    '.io',
    '.it',
    '.jp',
    '.la',
    '.li',
    '.ms',
    '.nl',
    '.nz',
    '.pe',
    '.sg',
    '.sh',
    '.tc',
    '.tm',
    '.tw',
    '.us',
    '.uk',
    '.vg',
    '.ws',
    //
    '.eco',
    '.pm',
    '.id.au',
    '.nu'
]);

// Transfer fields
Configure::set('Ispapi.transfer_fields', [
    'domain' => [
        'label' => Language::_('Ispapi.transfer.domain', true),
        'type' => 'text'
    ],
    'transfer_key' => [
        'label' => Language::_('Ispapi.transfer.EPPCode', true),
        'type' => 'text'
    ]
]);

// Domain fields
Configure::set('Ispapi.domain_fields', [
    'domain' => [
        'label' => Language::_('Ispapi.domain.domain', true),
        'type' => 'text'
    ],
]);

// Nameserver fields
Configure::set('Ispapi.nameserver_fields', [
    'ns1' => [
        'label' => Language::_('Ispapi.nameserver.ns1', true),
        'type' => 'text'
    ],
    'ns2' => [
        'label' => Language::_('Ispapi.nameserver.ns2', true),
        'type' => 'text'
    ],
    'ns3' => [
        'label' => Language::_('Ispapi.nameserver.ns3', true),
        'type' => 'text'
    ],
    'ns4' => [
        'label' => Language::_('Ispapi.nameserver.ns4', true),
        'type' => 'text'
    ],
    'ns5' => [
        'label' => Language::_('Ispapi.nameserver.ns5', true),
        'type' => 'text'
    ]
]);

// Whois sections
Configure::set('Ispapi.whois_sections', [
    'Registrant',
    'Tech',
    'Admin',
    'Billing'
]);

// Whois fields
Configure::set('Ispapi.whois_fields', [
    'RegistrantFirstName' => [
        'label' => Language::_('Ispapi.whois.RegistrantFirstName', true),
        'type' => 'text'
    ],
    'RegistrantLastName' => [
        'label' => Language::_('Ispapi.whois.RegistrantLastName', true),
        'type' => 'text'
    ],
    'RegistrantOrganization' => [
        'label' => Language::_('Ispapi.whois.RegistrantOrganization', true),
        'type' => 'text'
    ],
    'RegistrantAddress1' => [
        'label' => Language::_('Ispapi.whois.RegistrantAddress1', true),
        'type' => 'text'
    ],
    'RegistrantAddress2' => [
        'label' => Language::_('Ispapi.whois.RegistrantAddress2', true),
        'type' => 'text'
    ],
    'RegistrantCity' => [
        'label' => Language::_('Ispapi.whois.RegistrantCity', true),
        'type' => 'text'
    ],
    'RegistrantStateProvince' => [
        'label' => Language::_('Ispapi.whois.RegistrantStateProvince', true),
        'type' => 'text'
    ],
    'RegistrantPostalCode' => [
        'label' => Language::_('Ispapi.whois.RegistrantPostalCode', true),
        'type' => 'text'
    ],
    'RegistrantCountry' => [
        'label' => Language::_('Ispapi.whois.RegistrantCountry', true),
        'type' => 'text'
    ],
    'RegistrantPhone' => [
        'label' => Language::_('Ispapi.whois.RegistrantPhone', true),
        'type' => 'text'
    ],
    'RegistrantEmailAddress' => [
        'label' => Language::_('Ispapi.whois.RegistrantEmailAddress', true),
        'type' => 'text'
    ],
    'TechFirstName' => [
        'label' => Language::_('Ispapi.whois.TechFirstName', true),
        'type' => 'text'
    ],
    'TechLastName' => [
        'label' => Language::_('Ispapi.whois.TechLastName', true),
        'type' => 'text'
    ],
    'TechOrganization' => [
        'label' => Language::_('Ispapi.whois.TechOrganization', true),
        'type' => 'text'
    ],
    'TechAddress1' => [
        'label' => Language::_('Ispapi.whois.TechAddress1', true),
        'type' => 'text'
    ],
    'TechAddress2' => [
        'label' => Language::_('Ispapi.whois.TechAddress2', true),
        'type' => 'text'
    ],
    'TechCity' => [
        'label' => Language::_('Ispapi.whois.TechCity', true),
        'type' => 'text'
    ],
    'TechStateProvince' => [
        'label' => Language::_('Ispapi.whois.TechStateProvince', true),
        'type' => 'text'
    ],
    'TechPostalCode' => [
        'label' => Language::_('Ispapi.whois.TechPostalCode', true),
        'type' => 'text'
    ],
    'TechCountry' => [
        'label' => Language::_('Ispapi.whois.TechCountry', true),
        'type' => 'text'
    ],
    'TechPhone' => [
        'label' => Language::_('Ispapi.whois.TechPhone', true),
        'type' => 'text'
    ],
    'TechEmailAddress' => [
        'label' => Language::_('Ispapi.whois.TechEmailAddress', true),
        'type' => 'text'
    ],
    'AdminFirstName' => [
        'label' => Language::_('Ispapi.whois.AdminFirstName', true),
        'type' => 'text'
    ],
    'AdminLastName' => [
        'label' => Language::_('Ispapi.whois.AdminLastName', true),
        'type' => 'text'
    ],
    'AdminOrganization' => [
        'label' => Language::_('Ispapi.whois.AdminOrganization', true),
        'type' => 'text'
    ],
    'AdminAddress1' => [
        'label' => Language::_('Ispapi.whois.AdminAddress1', true),
        'type' => 'text'
    ],
    'AdminAddress2' => [
        'label' => Language::_('Ispapi.whois.AdminAddress2', true),
        'type' => 'text'
    ],
    'AdminCity' => [
        'label' => Language::_('Ispapi.whois.AdminCity', true),
        'type' => 'text'
    ],
    'AdminStateProvince' => [
        'label' => Language::_('Ispapi.whois.AdminStateProvince', true),
        'type' => 'text'
    ],
    'AdminPostalCode' => [
        'label' => Language::_('Ispapi.whois.AdminPostalCode', true),
        'type' => 'text'
    ],
    'AdminCountry' => [
        'label' => Language::_('Ispapi.whois.AdminCountry', true),
        'type' => 'text'
    ],
    'AdminPhone' => [
        'label' => Language::_('Ispapi.whois.AdminPhone', true),
        'type' => 'text'
    ],
    'AdminEmailAddress' => [
        'label' => Language::_('Ispapi.whois.AdminEmailAddress', true),
        'type' => 'text'
    ],
    'BillingFirstName' => [
        'label' => Language::_('Ispapi.whois.BillingFirstName', true),
        'type' => 'text'
    ],
    'BillingLastName' => [
        'label' => Language::_('Ispapi.whois.BillingLastName', true),
        'type' => 'text'
    ],
    'BillingOrganization' => [
        'label' => Language::_('Ispapi.whois.BillingOrganization', true),
        'type' => 'text'
    ],
    'BillingAddress1' => [
        'label' => Language::_('Ispapi.whois.BillingAddress1', true),
        'type' => 'text'
    ],
    'BillingAddress2' => [
        'label' => Language::_('Ispapi.whois.BillingAddress2', true),
        'type' => 'text'
    ],
    'BillingCity' => [
        'label' => Language::_('Ispapi.whois.BillingCity', true),
        'type' => 'text'
    ],
    'BillingStateProvince' => [
        'label' => Language::_('Ispapi.whois.BillingStateProvince', true),
        'type' => 'text'
    ],
    'BillingPostalCode' => [
        'label' => Language::_('Ispapi.whois.BillingPostalCode', true),
        'type' => 'text'
    ],
    'BillingCountry' => [
        'label' => Language::_('Ispapi.whois.BillingCountry', true),
        'type' => 'text'
    ],
    'BillingPhone' => [
        'label' => Language::_('Ispapi.whois.BillingPhone', true),
        'type' => 'text'
    ],
    'BillingEmailAddress' => [
        'label' => Language::_('Ispapi.whois.BillingEmailAddress', true),
        'type' => 'text'
    ]
]);


// .US
Configure::set('Ispapi.domain_fields.us', [
    'X-US-NEXUS-CATEGORY' => [
        'label' => Language::_('Ispapi.domain.RegistrantNexus', true),
        'type' => 'select',
        'options' => [
            'C11' => Language::_('Ispapi.domain.RegistrantNexus.c11', true),
            'C12' => Language::_('Ispapi.domain.RegistrantNexus.c12', true),
            'C21' => Language::_('Ispapi.domain.RegistrantNexus.c21', true),
            'C31' => Language::_('Ispapi.domain.RegistrantNexus.c31', true),
            'C32' => Language::_('Ispapi.domain.RegistrantNexus.c32', true)
        ]
    ],
    'X-US-NEXUS-APPPURPOSE' => [
        'label' => Language::_('Ispapi.domain.RegistrantPurpose', true),
        'type' => 'select',
        'options' => [
            'P1' => Language::_('Ispapi.domain.RegistrantPurpose.p1', true),
            'P2' => Language::_('Ispapi.domain.RegistrantPurpose.p2', true),
            'P3' => Language::_('Ispapi.domain.RegistrantPurpose.p3', true),
            'P4' => Language::_('Ispapi.domain.RegistrantPurpose.p4', true),
            'P5' => Language::_('Ispapi.domain.RegistrantPurpose.p5', true)
        ]
    ],
    'X-US-NEXUS-VALIDATOR' => [
        'label' => Language::_('Ispapi.domain.RegistrantCountry', true),
        'type' => 'text'
    ]

]);

// .NU
Configure::set('Ispapi.domain_fields.nu', [
    'X-REGISTRANT-IDNUMBER' => [
        'label' => Language::_('Ispapi.domain.RegistrantIDnumber', true),
        'type' => 'text'
    ],
    'X-VATID' => [
        'label' => Language::_('Ispapi.domain.VatID', true),
        'type' => 'text'
    ],

]);

// .VOTE
Configure::set('Ispapi.domain_fields.vote', [
    'X-VOTE-ACCEPT-HIGHLY-REGULATED-TAC' => [
        'label' => Language::_('Ispapi.domain.Agreement', true),
        'type' => 'checkbox',
        'options' => [
            'I AGREE' => Language::_('Ispapi.domain.VOTEAgreement.yes', true)
        ]
    ]
]);

// .VOTO
Configure::set('Ispapi.domain_fields.voto', [
    'X-VOTO-ACCEPT-HIGHLY-REGULATED-TAC' => [
        'label' => Language::_('Ispapi.domain.Agreement', true),
        'type' => 'checkbox',
        'options' => [
            'I AGREE' => Language::_('Ispapi.domain.VOTOAgreement.yes', true)
        ]
    ]
]);

// .RO
Configure::set('Ispapi.domain_fields.ro', [
    'X-REGISTRANT-IDNUMBER' => [
        'label' => Language::_('Ispapi.domain.RegistrantIDnumber', true),
        'type' => 'text'
    ],
    'X-REGISTRANT-VATID' => [
        'label' => Language::_('Ispapi.domain.RegistrantVatID', true),
        'type' => 'text'
    ]

]);

// .BERLIN
Configure::set('Ispapi.domain_fields.berlin', [
    'X-BERLIN-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Ispapi.domain.BerlinOptions', true)
        ]
    ]
]);

// .RUHR
Configure::set('Ispapi.domain_fields.ruhr', [
    'X-RUHR-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Ispapi.domain.RuhrOptions', true)
        ]
    ]
]);

// .HAMBURG
Configure::set('Ispapi.domain_fields.hamburg', [
    'X-HAMBURG-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Ispapi.domain.HamburgOptions', true)
        ]
    ]
]);

// .BAYERN
Configure::set('Ispapi.domain_fields.bayern', [
    'X-BAYERN-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Ispapi.domain.BayernOptions', true)
        ]
    ]
]);

// .JP
Configure::set('Ispapi.domain_fields.jp', [
    'X-JP-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Ispapi.domain.JpOptions', true)
        ]
    ]
]);

// .DE
Configure::set('Ispapi.domain_fields.de', [
    'X-DE-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Ispapi.domain.deOptions', true)
        ]
    ]
]);

// .EU
Configure::set('Ispapi.domain_fields.eu', [
    'X-EU-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Ispapi.domain.euOptions', true)
        ]
    ]
]);

// .SG
Configure::set('Ispapi.domain_fields.sg', [
    'X-SG-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Ispapi.domain.sgOptions', true)
        ]
    ],
    'X-SG-RCBID' => [
        'label' => Language::_('Ispapi.domain.RCBSingaporeID', true),
        'type' => 'text'
        ],
    'X-ADMIN-IDNUMBER' => [
        'label' => Language::_('Ispapi.domain.AdminIDnumber', true),
        'type' => 'text'
    ]

]);

// .COM.SG
Configure::set('Ispapi.domain_fields.com.sg',
    Configure::get('Ispapi.domain_fields.sg', true)
);

// .EDU.SG
Configure::set('Ispapi.domain_fields.edu.sg',
    Configure::get('Ispapi.domain_fields.sg', true)
);

// .NET.SG
Configure::set('Ispapi.domain_fields.net.sg',
    Configure::get('Ispapi.domain_fields.sg', true)
);

// .ORG.SG
Configure::set('Ispapi.domain_fields.org.sg',
    Configure::get('Ispapi.domain_fields.sg', true)
);

// .PER.SG
Configure::set('Ispapi.domain_fields.per.sg',
    Configure::get('Ispapi.domain_fields.sg', true)
);

// .CA
Configure::set('Ispapi.domain_fields.ca', [
    'X-CA-LEGALTYPE' => [
        'label' => Language::_('Ispapi.domain.CIRALegalType', true),
        'type' => 'select',
        'options' => [
            'CCO' => Language::_('Ispapi.domain.RegistrantPurpose.cco', true),
            'CCT' => Language::_('Ispapi.domain.RegistrantPurpose.cct', true),
            'RES' => Language::_('Ispapi.domain.RegistrantPurpose.res', true),
            'GOV' => Language::_('Ispapi.domain.RegistrantPurpose.gov', true),
            'EDU' => Language::_('Ispapi.domain.RegistrantPurpose.edu', true),
            'ASS' => Language::_('Ispapi.domain.RegistrantPurpose.ass', true),
            'HOP' => Language::_('Ispapi.domain.RegistrantPurpose.hop', true),
            'PRT' => Language::_('Ispapi.domain.RegistrantPurpose.prt', true),
            'TDM' => Language::_('Ispapi.domain.RegistrantPurpose.tdm', true),
            'TRD' => Language::_('Ispapi.domain.RegistrantPurpose.trd', true),
            'PLT' => Language::_('Ispapi.domain.RegistrantPurpose.plt', true),
            'LAM' => Language::_('Ispapi.domain.RegistrantPurpose.lam', true),
            'TRS' => Language::_('Ispapi.domain.RegistrantPurpose.trs', true),
            'ABO' => Language::_('Ispapi.domain.RegistrantPurpose.abo', true),
            'INB' => Language::_('Ispapi.domain.RegistrantPurpose.inb', true),
            'LGR' => Language::_('Ispapi.domain.RegistrantPurpose.lgr', true),
            'OMK' => Language::_('Ispapi.domain.RegistrantPurpose.omk', true),
            'MAJ' => Language::_('Ispapi.domain.RegistrantPurpose.maj', true)
        ]
    ],
    'X-CA-LANGUAGE' => [
        'label' => Language::_('Ispapi.domain.CIRALanguage', true),
        'type' => 'select',
        'options' => [
            'en' => Language::_('Ispapi.domain.CIRALanguage.en', true),
            'fr' => Language::_('Ispapi.domain.CIRALanguage.fr', true),
        ]
    ]
]);

// .AERO
Configure::set('Ispapi.domain_fields.aero', [
    'X-AERO-ENS-AUTH-ID' => [
        'label' => Language::_('Ispapi.domain.AeroID', true),
        'type' => 'text',
    ],
    'X-AERO-ENS-AUTH-KEY' => [
        'label' => Language::_('Ispapi.domain.AeroPassword', true),
        'type' => 'text'
    ]
]);

// .TRAVEL
Configure::set('Ispapi.domain_fields.travel', [
    'X-TRAVEL-INDUSTRY' => [
        'label' => Language::_('Ispapi.domain.TravelIndustry', true),
        'type' => 'text'
    ]
]);

// .FR
Configure::set('Ispapi.domain_fields.fr', [
    'X-FR-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'select',
        'options' => [
            ' ' => ' ',
            '1' => Language::_('Ispapi.domain.frOptions', true)
        ]
    ],
    'X-FR-REGISTRANT-BIRTH-DATE' => [
        'label' => Language::_('Ispapi.domain.DateOfBirth', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-BIRTH-PLACE' => [
        'label' => Language::_('Ispapi.domain.PlaceOfBirth', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-LEGAL-ID' => [
        'label' => Language::_('Ispapi.domain.VatIDorSiren', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-TRADEMARK-NUMBER' => [
        'label' => Language::_('Ispapi.domain.TrademarkNumber', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-DUNS-NUMBER' => [
        'label' => Language::_('Ispapi.domain.DunsNumber', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-LOCAL-ID' => [
        'label' => Language::_('Ispapi.domain.LocalID', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-JO-DATE-DECLARATION' => [
        'label' => Language::_('Ispapi.domain.DateOfDeclaration', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-JO-NUMBER' => [
        'label' => Language::_('Ispapi.domain.NumberJo', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-JO-PAGE' => [
        'label' => Language::_('Ispapi.domain.JoPage', true),
        'type' => 'text'
    ],
    'X-FR-REGISTRANT-JO-DATE-PUBLICATION' => [
        'label' => Language::_('Ispapi.domain.DateOfPublicationJo', true),
        'type' => 'text'
    ]
]);

// .PM
Configure::set('Ispapi.domain_fields.pm',
    Configure::get('Ispapi.domain_fields.fr', true)
);

// .RE
Configure::set('Ispapi.domain_fields.re',
    Configure::get('Ispapi.domain_fields.fr', true)
);

// .TF
Configure::set('Ispapi.domain_fields.tf',
    Configure::get('Ispapi.domain_fields.fr', true)
);

// .WF
Configure::set('Ispapi.domain_fields.wf',
    Configure::get('Ispapi.domain_fields.fr', true)
);

// .YT
Configure::set('Ispapi.domain_fields.yt',
    Configure::get('Ispapi.domain_fields.fr', true)
);

// .JOBS
Configure::set('Ispapi.domain_fields.jobs', [
    'X-JOBS-COMPANYURL' => [
        'label' => Language::_('Ispapi.domain.CompanyURL', true),
        'type' => 'text'
    ],
    'X-JOBS-INDUSTRYCLASSIFICATION' => [
        'label' => Language::_('Ispapi.domain.IndustryClassification', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '2' => Language::_('Ispapi.domain.AccountingBankingFinance', true),
            '3' => Language::_('Ispapi.domain.AgricultureFarming', true),
            '21' => Language::_('Ispapi.domain.Biotechnologycience', true),
            '5' => Language::_('Ispapi.domain.ComputerInformationechnology', true),
            '4' => Language::_('Ispapi.domain.ConstructionBuildingServices', true),
            '12' => Language::_('Ispapi.domain.Consulting', true),
            '6' => Language::_('Ispapi.domain.EducationTrainingLibrary', true),
            '7' => Language::_('Ispapi.domain.Entertainment', true),
            '13' => Language::_('Ispapi.domain.Environmental', true),
            '19' => Language::_('Ispapi.domain.Hospitality', true),
            '10' => Language::_('Ispapi.domain.GovernmentCivilService', true),
            '11' => Language::_('Ispapi.domain.Healthcare', true),
            '15' => Language::_('Ispapi.domain.HRRecruiting', true),
            '16' => Language::_('Ispapi.domain.Insurance', true),
            '17' => Language::_('Ispapi.domain.Legal', true),
            '18' => Language::_('Ispapi.domain.Manufacturing', true),
            '20' => Language::_('Ispapi.domain.MediaAdvertising', true),
            '9' => Language::_('Ispapi.domain.ParksRecreation', true),
            '26' => Language::_('Ispapi.domain.Pharmaceutical', true),
            '22' => Language::_('Ispapi.domain.RealEstate', true),
            '14' => Language::_('Ispapi.domain.RestaurantFoodService', true),
            '23' => Language::_('Ispapi.domain.Retail', true),
            '8' => Language::_('Ispapi.domain.Telemarketing', true),
            '24' => Language::_('Ispapi.domain.Transportation', true),
            '25' => Language::_('Ispapi.domain.Other', true)
        ]
    ],
]);

// .PRO
Configure::set('Ispapi.domain_fields.pro', [
    'X-PRO-PROFESSION' => [
        'label' => Language::_('Ispapi.domain.Profession', true),
        'type' => 'text'
    ],
    'X-PRO-AUTHORITY' => [
        'label' => Language::_('Ispapi.domain.Authority', true),
        'type' => 'text'
    ],
    'X-PRO-AUTHORITYWEBSITE' => [
        'label' => Language::_('Ispapi.domain.AuthorityWebsite', true),
        'type' => 'text'
    ],
    'X-PRO-LICENSENUMBER' => [
        'label' => Language::_('Ispapi.domain.LicenseNumber', true),
        'type' => 'text'
    ],
    'X-PRO-ACCEPT-TOU' => [
        'label' => Language::_('Ispapi.domain.PROTerms', true),
        'type' => 'checkbox',
        'options' => [
            '1' => Language::_('Ispapi.domain.PROTerms.yes', true)
        ]
    ],
]);

// .HK
Configure::set('Ispapi.domain_fields.hk', [
    'X-HK-REGISTRANT-DOCUMENT-TYPE' => [
        'label' => Language::_('Ispapi.domain.RegistrantDocumentType', true),
        'type' => 'select',
        'options' => [
            'HKID' => Language::_('Ispapi.domain.HongKongIdentityNumber', true),
            'OTHID' => Language::_('Ispapi.domain. OtherCountryIdentityNumber', true),
            'PASSNO' => Language::_('Ispapi.domain.PassportNo', true),
            'BIRTHCERT' => Language::_('Ispapi.domain.BirthCertificate', true),
            'OTHIDV' => Language::_('Ispapi.domain.OthersIndividualDocument', true),
            'BR' => Language::_('Ispapi.domain.BusinessRegistrationCertificate', true),
            'CI' => Language::_('Ispapi.domain.CertificateofIncorporation', true),
            'CRS' => Language::_('Ispapi.domain.CertificateofRegistrationofaSchool', true),
            'HKSARG' => Language::_('Ispapi.domain.HongKongSpecialAdministrativeRegionGovernment', true),
            'HKORDINANCE' => Language::_('Ispapi.domain.OrdinanceofHongKong', true),
            'OTHORG' => Language::_('Ispapi.domain.OthersOrganizationDocument', true)
        ]
    ],
    'X-HK-REGISTRANT-DOCUMENT-NUMBER' => [
        'label' => Language::_('Ispapi.domain.RegistrantDocumentNumber', true),
        'type' => 'text'
    ],
    'X-HK-REGISTRANT-DOCUMENT-ORIGIN-COUNTRY' => [
        'label' => Language::_('Ispapi.domain.RegistrantDocumentOriginCountry', true),
        'type' => 'text'
    ],
    'X-HK-REGISTRANT-BIRTH-DATE' => [
        'label' => Language::_('Ispapi.domain.RegistrantBirthDateforindividuals', true),
        'type' => 'text'
    ],
    'X-HK-ACCEPT-INDIVIDUAL-REGISTRATION-TAC' => [
        'label' => Language::_('Ispapi.domain.HKTermsforindividuals', true),
        'type' => 'checkbox',
        'options' => [
            '1' => Language::_('Ispapi.domain.HKTermsforindividuals.yes', true)
        ]
    ]
]);

// .FI
Configure::set('Ispapi.domain_fields.fi', [
    'X-FI-ACCEPT-REGISTRATION-TAC' => [
        'label' => Language::_('Ispapi.domain.FICORAAgreement', true),
        'type' => 'checkbox',
        'options' => [
            '1' => Language::_('Ispapi.domain.FIagreement.yes', true)
        ]
    ],
    'X-FI-IDNUMBER' => [
        'label' => Language::_('Ispapi.domain.IDNumber', true),
        'type' => 'text'
    ]
]);

// .SE
Configure::set('Ispapi.domain_fields.se', [
    'X-NICSE-IDNUMBER' => [
        'label' => Language::_('Ispapi.domain.RegistrantIDNumber', true),
        'type' => 'text'
    ],
    'X-NICSE-VATID' => [
        'label' => Language::_('Ispapi.domain.RegistrantVatID', true),
        'type' => 'text'
    ]
]);

// .DK 
Configure::set('Ispapi.domain_fields.dk', [
    'X-REGISTRANT-VATID' => [
        'label' => Language::_('Ispapi.domain.RegistrantVatID', true),
        'type' => 'text'
    ],
    'X-ADMIN-VATID' => [
        'label' => Language::_('Ispapi.domain.AdminVATID', true),
        'type' => 'text'
    ],
    'X-DK-REGISTRANT-CONTACT' => [
        'label' => Language::_('Ispapi.domain.Registrantcontact', true),
        'type' => 'text'
    ],
    'X-DK-ADMIN-CONTACT' => [
        'label' => Language::_('Ispapi.domain.Admincontact', true),
        'type' => 'text'
    ]
]);

// .IT
Configure::set('Ispapi.domain_fields.it', [
    'X-IT-ACCEPT-TRUSTEE-TAC' => [
        'label' => Language::_('Ispapi.domain.LocalPresence', true),
        'type' => 'text'
    ],
    'X-IT-PIN' => [
        'label' => Language::_('Ispapi.domain.PIN', true),
        'type' => 'text'
    ],
    'X-IT-ACCEPT-LIABILITY-TAC' => [
        'label' => Language::_('Ispapi.domain.Section3Agreemen', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Ispapi.domain.Section3Agreemen.yes', true)
        ]
    ],
    'X-IT-ACCEPT-REGISTRATION-TAC' => [
        'label' => Language::_('Ispapi.domain.Section5Agreemen', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Ispapi.domain.Section5Agreemen.yes', true)
        ]
    ],
    'X-IT-ACCEPT-DIFFUSION-AND-ACCESSIBILITY-TAC' => [
        'label' => Language::_('Ispapi.domain.Section6Agreement', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Ispapi.domain.Section6Agreemen.yes', true)
        ]
    ],
    'X-IT-ACCEPT-EXPLICIT-TAC' => [
        'label' => Language::_('Ispapi.domain.Section7Agreemen', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Ispapi.domain.Section7Agreemen.yes', true)
        ]
    ]
]);

// .QUEBEC
Configure::set('Ispapi.domain_fields.quebec', [
    'X-CORE-INTENDED-USE' => [
        'label' => Language::_('Ispapi.domain.QUEBECIntendeduse', true),
        'type' => 'text'
    ]
]);

// .SCOT
Configure::set('Ispapi.domain_fields.scot', [
    'X-CORE-INTENDED-USE' => [
        'label' => Language::_('Ispapi.domain.SCOTIntendeduse', true),
        'type' => 'text'
    ]
]);

// .NYC
Configure::set('Ispapi.domain_fields.nyc', [
    'X-NYC-REGISTRANT-NEXUS-CATEGORY' => [
        'label' => Language::_('Ispapi.domain.NEXUSCategory', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Ispapi.domain.NaturalPerson', true),
            '2' =>  Language::_('Ispapi.domain.Entityororganization', true)
        ]
    ]
]);

// .ES
Configure::set('Ispapi.domain_fields.es', [
    'X-ES-REGISTRANT-TIPO-IDENTIFICACION' => [
        'label' => Language::_('Ispapi.domain.RegistrantType', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '0' => Language::_('Ispapi.domain.Otra', true),
            '1' => Language::_('Ispapi.domain.NIF', true),
            '3' => Language::_('Ispapi.domain.Alien', true),
        ]
    ],
    'X-ES-REGISTRANT-IDENTIFICACION' => [
        'label' => Language::_('Ispapi.domain.RegistrantIdentificationNumber', true),
        'type' => 'text'
    ],
    'X-ES-ADMIN-TIPO-IDENTIFICACION' => [
        'label' => Language::_('Ispapi.domain.AdminContactType', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '0' => Language::_('Ispapi.domain.Otra', true),
            '1' => Language::_('Ispapi.domain.NIF', true),
            '3' => Language::_('Ispapi.domain.Alien', true),
        ]
    ],
    'X-ES-ADMIN-IDENTIFICACION' => [
        'label' => Language::_('Ispapi.domain.AdminContactIdentificationNumber', true),
        'type' => 'text'
    ],
    'X-ES-ACCEPT-INDIVIDUAL-REGISTRATION-TAC' => [
        'label' => Language::_('Ispapi.domain.Agreement', true),
        'type' => 'select',
        'options' => [
            '0' => '',
            '1' => Language::_('Ispapi.domain.ESAgreement', true)
        ]
    ]
]);

// .IE 
Configure::set('Ispapi.domain_fields.ie', [
    'X-IE-REGISTRANT-CLASS' => [
        'label' => Language::_('Ispapi.domain.RegistrantClass', true),
        'type' => 'select',
        'options' => [
            '' => '',
            'Company,Business Owner,Club' => Language::_('Ispapi.domain.CompanyBusinessOwnerClub', true),
            'Band' => Language::_('Ispapi.domain.Band', true),
            'Local Group,School' => Language::_('Ispapi.domain.LocalGroupSchool', true),
            'College,State Agency,Charity,Blogger' => Language::_('Ispapi.domain.CollegeStateAgencyCharityBlogger', true),
            'Other' => Language::_('Ispapi.domain.Other', true)
        ]
    ],
    'X-IE-REGISTRANT-REMARKS' => [
        'label' => Language::_('Ispapi.domain.ProofofconnectiontoIreland', true),
        'type' => 'text'
    ]
]);

// .NO
Configure::set('Ispapi.domain_fields.no', [
    'X-NO-REGISTRANT-IDENTITY' => [
        'label' => Language::_('Ispapi.domain.RegistrantIDnumber', true),
        'type' => 'text'
    ],
    'Fax-Required' => [
        'label' => Language::_('Ispapi.domain.Faxrequired', true),
        'type' => 'checkbox',
        'options' => [
            'I AGREE' => Language::_('Ispapi.domain.NOFaxrequired.yes', true)
        ]
    ]
]);

// .SWISS
Configure::set('Ispapi.domain_fields.swiss', [
    'X-SWISS-REGISTRANT-ENTERPRISE-ID' => [
        'label' => Language::_('Ispapi.domain.EnterpriseID', true),
        'type' => 'text'
    ],
    'X-CORE-INTENDED-USE' => [
        'label' => Language::_('Ispapi.domain.SWISSIntendeduse', true),
        'type' => 'text'
    ]
]);

// .PT
Configure::set('Ispapi.domain_fields.pt', [
    'X-PT-REGISTRANT-VATID' => [
        'label' => Language::_('Ispapi.domain.RegistrantVatID', true),
        'type' => 'text'
    ],
    'X-PT-TECH-VATID' => [
        'label' => Language::_('Ispapi.domain.TechvatID', true),
        'type' => 'text'
    ],
]);

// .ECO
Configure::set('Ispapi.domain_fields.eco', [
    'X-ECO-ACCEPT-HIGHLY-REGULATED-TAC' => [
        'label' => Language::_('Ispapi.domain.HighlyRegulatedTLD', true),
        'type' => 'select',
        'options' => [
            '' => '',
            '1' => Language::_('Ispapi.domain.ECOHighlyRegulatedTLD.yes', true)
        ]
    ]
]);

// .CN
Configure::set('Ispapi.domain_fields.cn', [
    'X-CN-REGISTRANT-ID-TYPE' => [
        'label' => Language::_('Ispapi.domain.RegistrantIDType', true),
        'type' => 'text'
    ],
    'X-CN-REGISTRANT-ID-NUMBER' => [
        'label' => Language::_('Ispapi.domain.RegistrantIDNumber', true),
        'type' => 'text'
    ]
]);

// .COM.CN
Configure::set('Ispapi.domain_fields.com.cn',
    Configure::get('Ispapi.domain_fields.cn', true)
);
// .NET.CN
Configure::set('Ispapi.domain_fields.net.cn',
    Configure::get('Ispapi.domain_fields.cn', true)
);
// .ORG.CN
Configure::set('Ispapi.domain_fields.org.cn',
    Configure::get('Ispapi.domain_fields.cn', true)
);

// .COM.AU
Configure::set('Ispapi.domain_fields.com.au', [
    'X-CN-REGISTRANT-ID-TYPE' => [
        'label' => Language::_('Ispapi.domain.RegistrantIDType', true),
        'type' => 'select',
        'options' => [
            'ABN' => Language::_('Ispapi.domain.AustralianBusinessNumber', true),
            'ACN' => Language::_('Ispapi.domain.AustralianCompanyNumber', true),
            'RBN' => Language::_('Ispapi.domain.BusinessRegistrationNumber', true),
            'TM' => Language::_('Ispapi.domain.TrademarkNumber', true)
        ]
    ]
]);

// .NET.AU
Configure::set('Ispapi.domain_fields.net.au',
    Configure::get('Ispapi.domain_fields.com.au', true)
);
// .ORG.AU
Configure::set('Ispapi.domain_fields.org.au',
    Configure::get('Ispapi.domain_fields.com.au', true)
);
// .ID.AU
Configure::set('Ispapi.domain_fields.id.au',
    Configure::get('Ispapi.domain_fields.com.au', true)
);

// .LV
Configure::set('Ispapi.domain_fields.lv', [
    'X-VATID' => [
        'label' => Language::_('Ispapi.domain.VatID', true),
        'type' => 'text'
    ],
    'X-IDNUMBER' => [
        'label' => Language::_('Ispapi.domain.IDnumber', true),
        'type' => 'text'
    ],
]);
