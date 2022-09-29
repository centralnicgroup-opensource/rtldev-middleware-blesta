<?php
/**
 * @copyright Copyright (c) 2018-2021, HEXONET
 * @license https://raw.githubusercontent.com/centralnicgroup-opensource/rtldev-middleware-blesta-ispapi-registrar/master/LICENSE MIT
 */

// Basics
$lang['Ispapi.name'] = 'Ispapi';
$lang['Ispapi.description'] = 'Resell domains through HEXONET.';
$lang['Ispapi.module_row'] = 'Account';
$lang['Ispapi.module_row_plural'] = 'Accounts';

// Module management
$lang['Ispapi.add_module_row'] = 'Add Account';
$lang['Ispapi.manage.module_rows_title'] = 'Accounts';
$lang['Ispapi.manage.module_rows_heading.user'] = 'User';
$lang['Ispapi.manage.module_rows_heading.key'] = 'API Key';
$lang['Ispapi.manage.module_rows_heading.sandbox'] = 'Sandbox';
$lang['Ispapi.manage.module_rows_heading.options'] = 'Options';
$lang['Ispapi.manage.module_rows.edit'] = 'Edit';
$lang['Ispapi.manage.module_rows.delete'] = 'Delete';
$lang['Ispapi.manage.module_rows.confirm_delete'] = 'Are you sure you want to delete this account?';
$lang['Ispapi.manage.module_rows_no_results'] = 'There are no accounts.';

// Row Meta
$lang['Ispapi.row_meta.user'] = 'User';
$lang['Ispapi.row_meta.key'] = 'Password';
$lang['Ispapi.row_meta.sandbox'] = 'Sandbox';
$lang['Ispapi.row_meta.sandbox_true'] = 'Yes';
$lang['Ispapi.row_meta.sandbox_false'] = 'No';

// Add row
$lang['Ispapi.add_row.box_title'] = 'Add Ispapi Account';
$lang['Ispapi.add_row.basic_title'] = 'Basic Settings';
$lang['Ispapi.add_row.add_btn'] = 'Add Account';

// Edit row
$lang['Ispapi.edit_row.box_title'] = 'Edit Ispapi Account';
$lang['Ispapi.edit_row.basic_title'] = 'Basic Settings';
$lang['Ispapi.edit_row.add_btn'] = 'Update Account';

// Package fields
$lang['Ispapi.package_fields.type'] = 'Type';
$lang['Ispapi.package_fields.type_domain'] = 'Domain Registration';
$lang['Ispapi.package_fields.type_ssl'] = 'SSL Certificate';
$lang['Ispapi.package_fields.tld_options'] = 'TLDs';
$lang['Ispapi.package_fields.ns1'] = 'Name Server 1';
$lang['Ispapi.package_fields.ns2'] = 'Name Server 2';
$lang['Ispapi.package_fields.ns3'] = 'Name Server 3';
$lang['Ispapi.package_fields.ns4'] = 'Name Server 4';
$lang['Ispapi.package_fields.ns5'] = 'Name Server 5';

// Service management
$lang['Ispapi.tab_whois.title'] = 'Whois';
$lang['Ispapi.tab_whois.section_Registrant'] = 'Registrant';
$lang['Ispapi.tab_whois.section_Admin'] = 'Administrative';
$lang['Ispapi.tab_whois.section_Tech'] = 'Technical';
$lang['Ispapi.tab_whois.section_Billing'] = 'Billing';
$lang['Ispapi.tab_whois.field_submit'] = 'Update Whois';

$lang['Ispapi.tab_nameservers.title'] = 'Name Servers';
$lang['Ispapi.tab_nameserver.field_ns'] = 'Name Server %1$s'; // %1$s is the name server number
$lang['Ispapi.tab_nameservers.field_submit'] = 'Update Name Servers';

$lang['Ispapi.tab_settings.title'] = 'Settings';
$lang['Ispapi.tab_settings.field_registrar_lock'] = 'Registrar Lock';
$lang['Ispapi.tab_settings.field_registrar_lock_yes'] = 'Set the registrar lock. Recommended to prevent unauthorized transfer.';
$lang['Ispapi.tab_settings.field_registrar_lock_no'] = 'Release the registrar lock so the domain can be transferred.';
$lang['Ispapi.tab_settings.field_request_epp'] = 'Request EPP Code/Transfer Key';
$lang['Ispapi.tab_settings.field_submit'] = 'Update Settings';

$lang['Ispapi.tab_transfer.title'] = 'Transfer';
$lang['Ispapi.tab_transfer.field_submit'] = 'Transfer Domain';

// Manual Renewals
$lang['Ispapi.manage.manual_renewal'] = "Manually Renew (select years)";

// Domain Data
$lang['Ispapi.renew.note'] = 'Please note that the HEXONET prices will be applied when you renew a domain';
$lang['Ispapi.domain.domaininformation'] = 'Domain data at your registrar system:';
$lang['Ispapi.domain.domainstatus'] = 'Status';
$lang['Ispapi.domain.expirydate'] = 'Expiry Date';


// Errors
$lang['Ispapi.!error.user.valid'] = 'Please enter a user.';
$lang['Ispapi.!error.key.valid'] = 'Please enter a password.';
$lang['Ispapi.!error.key.valid_connection'] = 'The user and password combination appear to be invalid, or your Ispapi account may not be configured to allow API access.';


// Domain Transfer Fields
$lang['Ispapi.transfer.domain'] = 'Domain Name';
$lang['Ispapi.transfer.EPPCode'] = 'EPP Code';
$lang['Ispapi.transfer.EPPCodeTransfer'] = 'EPP Code ( if required )';
#$lang['Ispapi.transfer.transfer_key'] = 'EPP Code';


// Domain Fields
$lang['Ispapi.domain.domain'] = 'Domain Name';
$lang['Ispapi.domain.NumYears'] = 'Years';
$lang['Ispapi.domain.WhoisPrivacy'] = "Whois Privacy";
$lang["Ispapi.domain.DomainAction"] = "Domain Action";
$lang["Ispapi.domain.TldSelection"] = "Select a TLD";
$lang['Ispapi.domain.registrationPeriod'] = 'Registration Period';

// Nameserver Fields
$lang['Ispapi.nameserver.ns1'] = 'Name Server 1';
$lang['Ispapi.nameserver.ns2'] = 'Name Server 2';
$lang['Ispapi.nameserver.ns3'] = 'Name Server 3';
$lang['Ispapi.nameserver.ns4'] = 'Name Server 4';
$lang['Ispapi.nameserver.ns5'] = 'Name Server 5';

// Whois Fields
$lang['Ispapi.whois.RegistrantFirstName'] = 'First Name';
$lang['Ispapi.whois.RegistrantLastName'] = 'Last Name';
$lang['Ispapi.whois.RegistrantOrganization'] = 'Company Name';
$lang['Ispapi.whois.RegistrantAddress1'] = 'Address 1';
$lang['Ispapi.whois.RegistrantAddress2'] = 'Address 2';
$lang['Ispapi.whois.RegistrantCity'] = 'City';
$lang['Ispapi.whois.RegistrantStateProvince'] = 'State/Province';
$lang['Ispapi.whois.RegistrantPostalCode'] = 'Postal Code';
$lang['Ispapi.whois.RegistrantCountry'] = 'Country';
$lang['Ispapi.whois.RegistrantPhone'] = 'Phone';
$lang['Ispapi.whois.RegistrantEmailAddress'] = 'Email';

$lang['Ispapi.whois.TechFirstName'] = 'First Name';
$lang['Ispapi.whois.TechLastName'] = 'Last Name';
$lang['Ispapi.whois.TechOrganization'] = 'Company Name';
$lang['Ispapi.whois.TechAddress1'] = 'Address 1';
$lang['Ispapi.whois.TechAddress2'] = 'Address 2';
$lang['Ispapi.whois.TechCity'] = 'City';
$lang['Ispapi.whois.TechStateProvince'] = 'State/Province';
$lang['Ispapi.whois.TechPostalCode'] = 'Postal Code';
$lang['Ispapi.whois.TechCountry'] = 'Country';
$lang['Ispapi.whois.TechPhone'] = 'Phone';
$lang['Ispapi.whois.TechEmailAddress'] = 'Email';

$lang['Ispapi.whois.AdminFirstName'] = 'First Name';
$lang['Ispapi.whois.AdminLastName'] = 'Last Name';
$lang['Ispapi.whois.AdminOrganization'] = 'Company Name';
$lang['Ispapi.whois.AdminAddress1'] = 'Address 1';
$lang['Ispapi.whois.AdminAddress2'] = 'Address 2';
$lang['Ispapi.whois.AdminCity'] = 'City';
$lang['Ispapi.whois.AdminStateProvince'] = 'State/Province';
$lang['Ispapi.whois.AdminPostalCode'] = 'Postal Code';
$lang['Ispapi.whois.AdminCountry'] = 'Country';
$lang['Ispapi.whois.AdminPhone'] = 'Phone';
$lang['Ispapi.whois.AdminEmailAddress'] = 'Email';

$lang['Ispapi.whois.BillingFirstName'] = 'First Name';
$lang['Ispapi.whois.BillingLastName'] = 'Last Name';
$lang['Ispapi.whois.BillingOrganization'] = 'Company Name';
$lang['Ispapi.whois.BillingAddress1'] = 'Address 1';
$lang['Ispapi.whois.BillingAddress2'] = 'Address 2';
$lang['Ispapi.whois.BillingCity'] = 'City';
$lang['Ispapi.whois.BillingStateProvince'] = 'State/Province';
$lang['Ispapi.whois.BillingPostalCode'] = 'Postal Code';
$lang['Ispapi.whois.BillingCountry'] = 'Country';
$lang['Ispapi.whois.BillingPhone'] = 'Phone';
$lang['Ispapi.whois.BillingEmailAddress'] = 'Email';

// Additional domain fields

// .US domain fields
$lang['Ispapi.domain.RegistrantNexus'] = 'Registrant Type';
$lang['Ispapi.domain.RegistrantNexus.c11'] = 'US citizen';
$lang['Ispapi.domain.RegistrantNexus.c12'] = 'Permanent resident of the US';
$lang['Ispapi.domain.RegistrantNexus.c21'] = 'US entity or organization';
$lang['Ispapi.domain.RegistrantNexus.c31'] = 'Foreign organization';
$lang['Ispapi.domain.RegistrantNexus.c32'] = 'Foreign organization with an office in the US';
$lang['Ispapi.domain.RegistrantPurpose'] = 'Purpose';
$lang['Ispapi.domain.RegistrantPurpose.p1'] = 'Business';
$lang['Ispapi.domain.RegistrantPurpose.p2'] = 'Non-profit';
$lang['Ispapi.domain.RegistrantPurpose.p3'] = 'Personal';
$lang['Ispapi.domain.RegistrantPurpose.p4'] = 'Educational';
$lang['Ispapi.domain.RegistrantPurpose.p5'] = 'Governmental';
$lang['Ispapi.domain.RegistrantCountry'] = 'Specify the two-letter country-code of the registrant (if Nexus Category is either C31 or C32)';

// .BERLIN domain fields
$lang['Ispapi.domain.BerlinOptions'] = 'Registrant and/or Admin-C are domiciled in Berlin / Use Local Presence Service';

// .RUHR domain fields
$lang['Ispapi.domain.RuhrOptions'] = 'Registrant and/or Admin-C are domiciled in Ruhr / Use Local Presence Service';

// .HAMBURG domain fields
$lang['Ispapi.domain.HamburgOptions'] = 'Registrant and/or Admin-C are domiciled in Hamburg / Use Local Presence Service';

// .BAYERN domain fields
$lang['Ispapi.domain.BayernOptions'] = 'Registrant and/or Admin-C are domiciled in Bayern / Use Local Presence Service';

// .JP domain fields
$lang['Ispapi.domain.JpOptions'] = 'Registrant and/or Admin-C are domiciled in Japan / Use Local Presence Service';

//.EU domain fields
$lang['Ispapi.domain.euOptions'] = 'Registrant is domiciled in the EU / Use Local Presence Service';

// .SG domain fields
$lang['Ispapi.domain.sgOptions'] = 'Registrant and/or Admin-C are domiciled in Singapore / Use Local Presence Service';
$lang['Ispapi.domain.RCBSingaporeID'] = 'RCB/Singapore ID';
$lang['Ispapi.domain.AdminIDnumber'] = 'Admin ID number';

// .AERO domain fields
$lang['Ispapi.domain.AeroID'] = '.aero ID';
$lang['Ispapi.domain.AeroPassword'] = 'Password';

// .TRAVEL domain fields
$lang['Ispapi.domain.TravelIndustry'] = '.travel Industry';

// .FR domain fields
$lang['Ispapi.domain.frOptions'] = 'Registrant and/or Admin-C are domiciled in France / Use Local Presence Service';
$lang['Ispapi.domain.DateOfBirth'] = 'Date of Birth';
$lang['Ispapi.domain.PlaceOfBirth'] = 'Place of Birth';
$lang['Ispapi.domain.VatIDorSiren'] = 'VATID or SIREN/SIRET number';
$lang['Ispapi.domain.TrademarkNumber'] = 'Trademark Number';
$lang['Ispapi.domain.DunsNumber'] = 'DUNS number';
$lang['Ispapi.domain.LocalID'] = 'Local ID';
$lang['Ispapi.domain.DateOfDeclaration'] = 'Date of Declaration';
$lang['Ispapi.domain.NumberJo'] = 'Number [JO]';
$lang['Ispapi.domain.JoPage'] = 'Page of Announcement [JO]';
$lang['Ispapi.domain.DateOfPublicationJo'] = 'Date of Publication [JO]';

// .JOBS domain fields
$lang['Ispapi.domain.CompanyURL'] = 'Company URL';
$lang['Ispapi.domain.IndustryClassification'] = 'Industry Classification';
$lang['Ispapi.domain.AccountingBankingFinance'] = 'Accounting/Banking/Finance';
$lang['Ispapi.domain.AgricultureFarming'] = 'Agriculture/Farming';
$lang['Ispapi.domain.Biotechnologycience'] = 'Biotechnology/Science';
$lang['Ispapi.domain.ComputerInformationechnology'] = 'Computer/Information Technology';
$lang['Ispapi.domain.ConstructionBuildingServices'] = 'Construction/Building Services';
$lang['Ispapi.domain.Consulting'] = 'Consulting';
$lang['Ispapi.domain.EducationTrainingLibrary'] = 'Education/Training/Library';
$lang['Ispapi.domain.Entertainment'] = 'Entertainment';
$lang['Ispapi.domain.Environmental'] = 'Environmental';
$lang['Ispapi.domain.Hospitality'] = 'Hospitality';
$lang['Ispapi.domain.GovernmentCivilService'] = 'Government/Civil Service';
$lang['Ispapi.domain.Healthcare'] = 'Healthcare';
$lang['Ispapi.domain.HRRecruiting'] = 'HR/Recruiting';
$lang['Ispapi.domain.Insurance'] = 'Insurance';
$lang['Ispapi.domain.Legal'] = 'Legal';
$lang['Ispapi.domain.Manufacturing'] = 'Manufacturing';
$lang['Ispapi.domain.MediaAdvertising'] = 'Media/Advertising';
$lang['Ispapi.domain.ParksRecreation'] = 'Parks & Recreation';
$lang['Ispapi.domain.Pharmaceutical'] = 'Pharmaceutical';
$lang['Ispapi.domain.RealEstate'] = 'Real Estate';
$lang['Ispapi.domain.RestaurantFoodService'] = 'Restaurant/Food Service';
$lang['Ispapi.domain.Retail'] = 'Retail';
$lang['Ispapi.domain.Telemarketing'] = 'Telemarketing';
$lang['Ispapi.domain.Transportation'] = 'Transportation';
$lang['Ispapi.domain.Other'] = 'Other';

// .PRO domain fields
$lang['Ispapi.domain.Profession'] = 'Profession';
$lang['Ispapi.domain.Authority'] = 'Authority';
$lang['Ispapi.domain.AuthorityWebsite'] = 'Authority Website';
$lang['Ispapi.domain.LicenseNumber'] = 'License Number';
$lang['Ispapi.domain.PROTerms'] = '.PRO Terms';
$lang['Ispapi.domain.PROTerms.yes'] = 'Tick to confirm that you agree to the .PRO End User Terms Of Use at: http://www.registry.pro/legal/user-terms';

// .HK domain fields
$lang['Ispapi.domain.RegistrantDocumentType'] = 'Registrant Document Type';
$lang['Ispapi.domain.HongKongIdentityNumber'] = 'Individual - Hong Kong Identity Number';
$lang['Ispapi.domain.OtherCountryIdentityNumber'] = 'Individual - Others Country Identity Number';
$lang['Ispapi.domain.PassportNo'] = 'Individual - Passport No.';
$lang['Ispapi.domain.BirthCertificate'] = 'Individual - Birth Certificate';
$lang['Ispapi.domain.OthersIndividualDocument'] = 'Individual - Others Individual Document';
$lang['Ispapi.domain.BusinessRegistrationCertificate'] = 'Organization - Business Registration Certificate';
$lang['Ispapi.domain.CertificateofIncorporation'] = 'Organization - Certificate of Incorporation';
$lang['Ispapi.domain.CertificateofRegistrationofaSchool'] = 'Organization - Certificate of Registration of a School';
$lang['Ispapi.domain.HongKongSpecialAdministrativeRegionGovernment'] = 'Organization - Hong Kong Special Administrative Region Government Department';
$lang['Ispapi.domain.OrdinanceofHongKong'] = 'Organization - Ordinance of Hong Kong';
$lang['Ispapi.domain.OthersOrganizationDocument'] = 'Organization - Others Organization Document';
$lang['Ispapi.domain.RegistrantDocumentNumber'] = 'Registrant Document Number';
$lang['Ispapi.domain.RegistrantDocumentOriginCountry'] = 'Registrant Document Origin Country';
$lang['Ispapi.domain.RegistrantBirthDateforindividuals'] = 'Registrant Birth Date for individuals';
$lang['Ispapi.domain.HKTermsforindividuals'] = 'HK Terms for individuals';
$lang['Ispapi.domain.HKTermsforindividuals.yes'] = 'Accept the .HK https://www.hkirc.hk/content.jsp?id=3#!/6 (mandatory, if the registrant is an individual)';

// .FI domain fields
$lang['Ispapi.domain.FICORAAgreement'] = 'FICORA Agreement';
$lang['Ispapi.domain.IDNumber'] = 'ID Number';
$lang['Ispapi.domain.FIagreement.yes'] = 'I Accept the https://domain.fi/info/en/index/hakeminen/kukavoihakea.html FI Domain Name Agreement';

// .SE domain fields
$lang['Ispapi.domain.RegistrantIDNumber'] = 'Registrant ID Number';
$lang['Ispapi.domain.RegistrantVatID'] = 'Registrant VAT ID';

// .DK domain fields
$lang['Ispapi.domain.RegistrantVatID'] = 'Registrant VAT ID';
$lang['Ispapi.domain.AdminVATID'] = 'Admin VAT ID';
$lang['Ispapi.domain.Registrantcontact'] = 'Registrant contact';
$lang['Ispapi.domain.Admincontact'] = 'Admin contact';

// .IT domain fields
$lang['Ispapi.domain.PIN'] = 'PIN';
$lang['Ispapi.domain.Section3Agreemen'] = 'Section 3 Agreement';
$lang['Ispapi.domain.Section3Agreemen.yes'] = 'Section 3 - Declarations and assumptions of liability The Registrant of the domain name in question, declares under their own responsibility that they are:
in possession of the citizenship or resident in a country belonging to the European Union (in the case of registration for natural persons);
established in a country belonging to the European Union (in the case of registration for other organizations);
aware and accept that the registration and management of a domain name is subject to the Rules of assignment and management of domain names in ccTLD. it and Regulations for the resolution of disputes in the ccTLD.it and their subsequent amendments;
entitled to the use and/or legal availability of the domain name applied for, and that they do not prejudice, with the request for registration, the rights of others;
aware that for the inclusion of personal data in the Database of assigned domain names, and their possible dissemination and accessibility via the Internet, consent must be given explicitly by ticking the appropriate boxes in the information below. See The policy of the .it Registry in the Whois Database on the website of the Registry (http://www.nic.it);
aware and agree that in the case of erroneous or false declarations in this request, the Registry shall immediately revoke the domain name, or proceed with other legal actions. In such case the revocation shall not in any way give rise to claims against the Registry;
release the Registry from any liability resulting from the assignment and use of the domain name by the natural person that has made the request;
accept Italian jurisdiction and laws of the Italian State.';
$lang['Ispapi.domain.Section5Agreemen'] = 'Section 5 Agreement';
$lang['Ispapi.domain.Section5Agreemen.yes'] = 'Section 5 - Consent to the processing of personal data for registration
The interested party, after reading the above disclosure, gives consent to the processing of information required for registration, as defined in the above disclosure. Giving consent is optional, but if no consent is given, it will not be possible to finalize the registration, assignment and management of the domain name.';
$lang['Ispapi.domain.Section6Agreemen'] = 'Section 6 Agreement';
$lang['Ispapi.domain.Section6Agreemen.yes'] = 'Section 6 - Consent to the processing of personal data for diffusion and accessibility via the Internet
The interested party, after reading the above disclosure, gives consent to the dissemination and accessibility via the Internet, as defined in the disclosure above. Giving consent is optional, but absence of consent does not allow the dissemination and accessibility of Internet data.';
$lang['Ispapi.domain.Section7Agreemen'] = 'Section 7 Agreement';
$lang['Ispapi.domain.Section7Agreemen.yes'] = 'Section 7 - Explicit Acceptance of the following points
For explicit acceptance, the interested party declares that they:
d) are aware and agree that the registration and management of a domain name is subject to the Rules of assignment and management of domain names in ccTLD.it and Regulations for the resolution of disputes in the ccTLD.it and their subsequent amendments;
e) are aware and agree that in the case of erroneous or false declarations in this request, the Registry shall immediately revoke the domain name, or proceed with other legal actions. In such case the revocation shall not in any way give rise to claims against the Registry;
f) release the Registry from any liability resulting from the assignment and use of the domain name by the natural person that has made the request;
g) accept the Italian jurisdiction and laws of the Italian State.';

// .NYC domain fields
$lang['Ispapi.domain.NEXUSCategory'] = 'NEXUS Category';
$lang['Ispapi.domain.NaturalPerson'] = 'Natural Person - primary domicile with physical address in NYC';
$lang['Ispapi.domain.Entityororganization'] = 'Entity or organization - primary domicile with physical address in NYC';

// .ES domain fields
$lang['Ispapi.domain.RegistrantType'] = 'Registrant Type';
$lang['Ispapi.domain.RegistrantIdentificationNumber'] = 'Registrant Identification Number';
$lang['Ispapi.domain.AdminContactType'] = 'Admin-Contact Type';
$lang['Ispapi.domain.AdminContactIdentificationNumber'] = 'Admin-Contact Identification Number';
$lang['Ispapi.domain.ESAgreement'] = 'I agree to the .ES registration TAC for individuals';
$lang['Ispapi.domain.Alien'] = 'Alien registration card';
$lang['Ispapi.domain.NIF'] = 'NIF/NIE; For Spanish Individual or Organization';
$lang['Ispapi.domain.Otra'] = 'Otra; For non-spanish owner';

// .ES .VOTE .VOTO
$lang['Ispapi.domain.Agreement'] = 'Agreement';

// .IE domain fields
$lang['Ispapi.domain.RegistrantClass'] = 'Registrant Class';
$lang['Ispapi.domain.CompanyBusinessOwnerClub'] = 'Company,Business Owner,Club';
$lang['Ispapi.domain.Band'] = 'Band';
$lang['Ispapi.domain.LocalGroupSchool'] = 'Local Group,School';
$lang['Ispapi.domain.CollegeStateAgencyCharityBlogger'] = 'College,State Agency,Charity,Blogger';
$lang['Ispapi.domain.Other'] = 'Other';
$lang['Ispapi.domain.ProofofconnectiontoIreland'] = 'Proof of connection to Ireland';

// .NU .NO domain fields
$lang['Ispapi.domain.RegistrantIDnumber'] = 'Registrant ID number';

// .NU domain fields
$lang['Ispapi.domain.VatID'] = 'Vat ID';

// . NO domain fields
$lang['Ispapi.domain.Faxrequired'] = 'Fax required';
$lang['Ispapi.domain.NOFaxrequired.yes'] = 'I confirm I will send the following form back to complete the registration process: http://www.domainform.net/form/no/search?view=registration';

// .VOTE domain fields
$lang['Ispapi.domain.VOTEAgreement.yes'] = 'I confirm bona fide use of this domain name for a relevant election cycle with a clearly identified political/democratic process.';

// .VOTO domain fields
$lang['Ispapi.domain.VOTOAgreement.yes'] = 'I confirm bona fide use of this domain name for a relevant election cycle with a clearly identified political/democratic process.';

// .RO domain fields
$lang['Ispapi.domain.RegistrantVatID'] = 'Registrant VAT ID';
$lang['Ispapi.domain.RegistrantIDnumber'] = 'Registrant ID Number';

// .IT .FR .SG .EU .DE .JP .BAYERN .HAMBURG .RUHR .BERLIN domain fields
$lang['Ispapi.domain.LocalPresence'] = 'Local Presence';

// .DE domain fields
$lang['Ispapi.domain.deOptions'] = 'Registrant and/or Admin-C are domiciled in Germany / Use Local Presence Service';

// .ECO domain fields
$lang['Ispapi.domain.HighlyRegulatedTLD'] = 'I agree - Highly Regulated TLD:';
$lang['Ispapi.domain.ECOHighlyRegulatedTLD.yes'] = 'All .ECO domain names will be first registered with “server hold” status pending the completion of the minimum requirements of the Eco Profile, namely, the .ECO registrant 1) affirming their compliance with the .ECO Eligibility Policy and 2) pledging to support positive change for the planet and to be honest when sharing information on their environmental actions. The registrant will be emailed with instructions on how to create an Eco Profile. Once these steps have been completed, the .ECO domain will be immediately activated by the registry.';

// .PT domain fields
$lang['Ispapi.domain.RegistrantVatID'] = 'Registrant Vat ID';
$lang['Ispapi.domain.TechvatID'] = 'Tech Vat ID';

// .LV domain fields
$lang['Ispapi.domain.VatID'] = 'Vat ID';
$lang['Ispapi.domain.IDnumber'] = 'ID number';

// .SWISS domain fields
$lang['Ispapi.domain.EnterpriseID'] = 'Enterprise ID';
$lang['Ispapi.domain.SWISSIntendeduse'] = 'Intended use';

// .SCOT domain fields
$lang['Ispapi.domain.SCOTIntendeduse'] = 'Intended use';

// .QUEBEC domain fields
$lang['Ispapi.domain.QUEBECIntendeduse'] = 'Intended use';

// .COM.AU domain fields
$lang['Ispapi.domain.RegistrantIDType'] = 'Registrant ID Type';
$lang['Ispapi.domain.AustralianBusinessNumber'] = 'Australian Business Number';
$lang['Ispapi.domain.AustralianCompanyNumber'] = 'Australian Company Number';
$lang['Ispapi.domain.BusinessRegistrationNumber'] = 'Business Registration Number';
$lang['Ispapi.domain.TrademarkNumber'] = 'Trademark Number';

// .CA domain fields
$lang['Ispapi.domain.CIRALegalType'] = 'Legal Type';
$lang['Ispapi.domain.RegistrantPurpose.cco'] = 'Corporation';
$lang['Ispapi.domain.RegistrantPurpose.cct'] = 'Canadian citizen';
$lang['Ispapi.domain.RegistrantPurpose.res'] = 'Canadian resident';
$lang['Ispapi.domain.RegistrantPurpose.gov'] = 'Government entity';
$lang['Ispapi.domain.RegistrantPurpose.edu'] = 'Educational';
$lang['Ispapi.domain.RegistrantPurpose.ass'] = 'Unincorporated Association';
$lang['Ispapi.domain.RegistrantPurpose.hop'] = 'Hospital';
$lang['Ispapi.domain.RegistrantPurpose.prt'] = 'Partnership';
$lang['Ispapi.domain.RegistrantPurpose.tdm'] = 'Trade-mark';
$lang['Ispapi.domain.RegistrantPurpose.trd'] = 'Trade Union';
$lang['Ispapi.domain.RegistrantPurpose.plt'] = 'Political Party';
$lang['Ispapi.domain.RegistrantPurpose.lam'] = 'Libraries, Archives and Museums';
$lang['Ispapi.domain.RegistrantPurpose.trs'] = 'Trust';
$lang['Ispapi.domain.RegistrantPurpose.abo'] = 'Aboriginal Peoples';
$lang['Ispapi.domain.RegistrantPurpose.inb'] = 'Indian Band';
$lang['Ispapi.domain.RegistrantPurpose.lgr'] = 'Legal Representative';
$lang['Ispapi.domain.RegistrantPurpose.omk'] = 'Official Mark';
$lang['Ispapi.domain.RegistrantPurpose.maj'] = 'The Queen';
$lang['Ispapi.domain.CIRAWhoisDisplay'] = 'Whois';
$lang['Ispapi.domain.CIRAWhoisDisplay.full'] = 'Make Public';
$lang['Ispapi.domain.CIRAWhoisDisplay.private'] = 'Keep Private';
$lang['Ispapi.domain.CIRALanguage'] = 'Preferred language for communication';
$lang['Ispapi.domain.CIRALanguage.en'] = 'English';
$lang['Ispapi.domain.CIRALanguage.fr'] = 'French';
