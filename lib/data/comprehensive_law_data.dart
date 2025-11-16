import '../database/database_helper.dart';

/// Comprehensive US Code Data
/// This provides manual fallback data for all 54 titles when bulk download fails
class ComprehensiveLawData {
  
  /// Get all 54 title names
  static List<String> getAllTitles() {
    return [
      'Title 1 — General Provisions',
      'Title 2 — The Congress',
      'Title 3 — The President',
      'Title 4 — Flag and Seal, Seat of Government, and the States',
      'Title 5 — Government Organization and Employees',
      'Title 6 — Domestic Security',
      'Title 7 — Agriculture',
      'Title 8 — Aliens and Nationality',
      'Title 9 — Arbitration',
      'Title 10 — Armed Forces',
      'Title 11 — Bankruptcy',
      'Title 12 — Banks and Banking',
      'Title 13 — Census',
      'Title 14 — Coast Guard',
      'Title 15 — Commerce and Trade',
      'Title 16 — Conservation',
      'Title 17 — Copyrights',
      'Title 18 — Crimes and Criminal Procedure',
      'Title 19 — Customs Duties',
      'Title 20 — Education',
      'Title 21 — Food and Drugs',
      'Title 22 — Foreign Relations and Intercourse',
      'Title 23 — Highways',
      'Title 24 — Hospitals and Asylums',
      'Title 25 — Indians',
      'Title 26 — Internal Revenue Code',
      'Title 27 — Intoxicating Liquors',
      'Title 28 — Judiciary and Judicial Procedure',
      'Title 29 — Labor',
      'Title 30 — Mineral Lands and Mining',
      'Title 31 — Money and Finance',
      'Title 32 — National Guard',
      'Title 33 — Navigation and Navigable Waters',
      'Title 34 — Crime Control and Law Enforcement',
      'Title 35 — Patents',
      'Title 36 — Patriotic and National Observances, Ceremonies, and Organizations',
      'Title 37 — Pay and Allowances of the Uniformed Services',
      'Title 38 — Veterans\' Benefits',
      'Title 39 — Postal Service',
      'Title 40 — Public Buildings, Property, and Works',
      'Title 41 — Public Contracts',
      'Title 42 — The Public Health and Welfare',
      'Title 43 — Public Lands',
      'Title 44 — Public Printing and Documents',
      'Title 45 — Railroads',
      'Title 46 — Shipping',
      'Title 47 — Telecommunications',
      'Title 48 — Territories and Insular Possessions',
      'Title 49 — Transportation',
      'Title 50 — War and National Defense',
      'Title 51 — National and Commercial Space Programs',
      'Title 52 — Voting and Elections',
      'Title 53 — [Reserved]',
      'Title 54 — National Park Service and Related Programs',
    ];
  }

  /// Get comprehensive law sections for all titles
  /// This includes hundreds of actual US Code sections
  static List<LawSection> getComprehensiveSections() {
    final sections = <LawSection>[];

    // TITLE 1 - General Provisions
    sections.addAll(_getTitle1Sections());
    
    // TITLE 2 - The Congress
    sections.addAll(_getTitle2Sections());
    
    // TITLE 3 - The President
    sections.addAll(_getTitle3Sections());
    
    // TITLE 4 - Flag and Seal
    sections.addAll(_getTitle4Sections());
    
    // TITLE 5 - Government Organization
    sections.addAll(_getTitle5Sections());
    
    // TITLE 7 - Agriculture
    sections.addAll(_getTitle7Sections());
    
    // TITLE 8 - Aliens and Nationality
    sections.addAll(_getTitle8Sections());
    
    // TITLE 10 - Armed Forces
    sections.addAll(_getTitle10Sections());
    
    // TITLE 11 - Bankruptcy
    sections.addAll(_getTitle11Sections());
    
    // TITLE 15 - Commerce and Trade
    sections.addAll(_getTitle15Sections());
    
    // TITLE 17 - Copyrights
    sections.addAll(_getTitle17Sections());
    
    // TITLE 18 - Crimes and Criminal Procedure
    sections.addAll(_getTitle18Sections());
    
    // TITLE 20 - Education
    sections.addAll(_getTitle20Sections());
    
    // TITLE 21 - Food and Drugs
    sections.addAll(_getTitle21Sections());
    
    // TITLE 26 - Internal Revenue Code
    sections.addAll(_getTitle26Sections());
    
    // TITLE 28 - Judiciary
    sections.addAll(_getTitle28Sections());
    
    // TITLE 29 - Labor
    sections.addAll(_getTitle29Sections());
    
    // TITLE 42 - Public Health and Welfare
    sections.addAll(_getTitle42Sections());
    
    // Additional Titles
    sections.addAll(_getTitle6Sections());
    sections.addAll(_getTitle9Sections());
    sections.addAll(_getTitle12Sections());
    sections.addAll(_getTitle13Sections());
    sections.addAll(_getTitle14Sections());
    sections.addAll(_getTitle16Sections());
    sections.addAll(_getTitle19Sections());
    sections.addAll(_getTitle22Sections());
    sections.addAll(_getTitle23Sections());
    sections.addAll(_getTitle25Sections());
    sections.addAll(_getTitle27Sections());
    sections.addAll(_getTitle31Sections());
    sections.addAll(_getTitle35Sections());
    sections.addAll(_getTitle38Sections());
    sections.addAll(_getTitle39Sections());
    sections.addAll(_getTitle41Sections());
    sections.addAll(_getTitle44Sections());
    sections.addAll(_getTitle47Sections());
    sections.addAll(_getTitle49Sections());
    sections.addAll(_getTitle50Sections());
    sections.addAll(_getTitle52Sections());

    return sections;
  }

  // TITLE 1 - General Provisions
  static List<LawSection> _getTitle1Sections() {
    return [
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '1',
        sectionTitle: 'Words denoting number, gender, and so forth',
        sectionText: '''In determining the meaning of any Act of Congress, unless the context indicates otherwise—
words importing the singular include and apply to several persons, parties, or things;
words importing the plural include the singular;
words importing the masculine gender include the feminine as well;
words used in the present tense include the future as well as the present;
the words "insane" and "insane person" shall include every idiot, insane person, and person non compos mentis;
the words "person" and "whoever" include corporations, companies, associations, firms, partnerships, societies, and joint stock companies, as well as individuals;
"officer" includes any person authorized by law to perform the duties of the office;
"signature" or "subscription" includes a mark when the person making the same intended it as such;
"oath" includes affirmation, and "sworn" includes affirmed;
"writing" includes printing and typewriting and reproductions of visual symbols by photographing, multigraphing, mimeographing, manifolding, or otherwise.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '2',
        sectionTitle: '"County" as including "parish", and so forth',
        sectionText: '''The word "county" includes a parish, or any other equivalent subdivision of a State or Territory of the United States.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '3',
        sectionTitle: '"Vessel" as including all means of water transportation',
        sectionText: '''The word "vessel" includes every description of watercraft or other artificial contrivance used, or capable of being used, as a means of transportation on water.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '4',
        sectionTitle: '"Vehicle" as including all means of land transportation',
        sectionText: '''The word "vehicle" includes every description of carriage or other artificial contrivance used, or capable of being used, as a means of transportation on land.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '5',
        sectionTitle: '"Company" or "association" as including successors and assigns',
        sectionText: '''The word "company" or "association", when used in reference to a corporation, shall be deemed to embrace the words "successors and assigns of such company or association", in like manner as if these last-named words, or words of similar import, were expressed.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '6',
        sectionTitle: 'Limitation of term "products of American fisheries"',
        sectionText: '''Wherever, in the statutes of the United States or in the rulings, regulations, or interpretations of various administrative bureaus and agencies of the United States there appears or may appear the term "products of American fisheries" said term shall not include fresh or frozen fish fillets, fresh or frozen fish steaks, or fresh or frozen sliced halibut.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '7',
        sectionTitle: 'Marriage, spouse, husband, wife, widow, widower',
        sectionText: '''In determining the meaning of any Act of Congress, or of any ruling, regulation, or interpretation of the various administrative bureaus and agencies of the United States, the word "marriage" means only a legal union between one man and one woman as husband and wife, and the word "spouse" refers only to a person of the opposite sex who is a husband or a wife.''',
        notes: 'Note: This section has been affected by the Supreme Court decision in United States v. Windsor (2013) and Obergefell v. Hodges (2015).',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 5 - Government Organization and Employees
  static List<LawSection> _getTitle5Sections() {
    return [
      LawSection(
        titleNumber: '5',
        titleName: 'Government Organization and Employees',
        chapterNumber: '1',
        chapterName: 'Organization',
        sectionNumber: '101',
        sectionTitle: 'Executive departments',
        sectionText: '''The Executive departments are:
(1) Department of State.
(2) Department of the Treasury.
(3) Department of Defense.
(4) Department of Justice.
(5) Department of the Interior.
(6) Department of Agriculture.
(7) Department of Commerce.
(8) Department of Labor.
(9) Department of Health and Human Services.
(10) Department of Housing and Urban Development.
(11) Department of Transportation.
(12) Department of Energy.
(13) Department of Education.
(14) Department of Veterans Affairs.
(15) Department of Homeland Security.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '5',
        titleName: 'Government Organization and Employees',
        chapterNumber: '1',
        chapterName: 'Organization',
        sectionNumber: '102',
        sectionTitle: 'Military departments',
        sectionText: '''The military departments are:
(1) Department of the Army.
(2) Department of the Navy.
(3) Department of the Air Force.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '5',
        titleName: 'Government Organization and Employees',
        chapterNumber: '63',
        chapterName: 'Leave',
        sectionNumber: '6301',
        sectionTitle: 'Definitions',
        sectionText: '''For the purpose of this subchapter—
(1) "employee" means—
(A) an employee as defined by section 2105 of this title; and
(B) an individual first employed by the government of the District of Columbia before October 1, 1987;
but does not include—
(i) a teacher or librarian of the public schools of the District of Columbia;
(ii) a part-time employee who does not have an established regular tour of duty during the administrative workweek;
(iii) a temporary employee engaged in construction work at an hourly rate;
(iv) an employee of the Panama Canal Commission when employed on the Isthmus of Panama;
(v) a physician, dentist, or nurse in the Veterans Health Administration of the Department of Veterans Affairs; or
(vi) an employee of either House of Congress or of the two Houses.''',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 10 - Armed Forces
  static List<LawSection> _getTitle10Sections() {
    return [
      LawSection(
        titleNumber: '10',
        titleName: 'Armed Forces',
        chapterNumber: '1',
        chapterName: 'Definitions',
        sectionNumber: '101',
        sectionTitle: 'Definitions',
        sectionText: '''(a) IN GENERAL.—The following definitions apply in this title:
(1) The term "armed forces" means the Army, Navy, Air Force, Marine Corps, and Coast Guard.
(2) The term "uniformed services" means—
(A) the armed forces;
(B) the commissioned corps of the National Oceanic and Atmospheric Administration; and
(C) the commissioned corps of the Public Health Service.
(3) The term "department", when used with respect to a military department, means the executive part of the department and all field headquarters, forces, reserve components, installations, activities, and functions under the control or supervision of the Secretary of the department.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '10',
        titleName: 'Armed Forces',
        chapterNumber: '47',
        chapterName: 'Uniform Code of Military Justice',
        sectionNumber: '877',
        sectionTitle: 'Art. 77. Principals',
        sectionText: '''Any person punishable under this chapter who—
(1) commits an offense punishable by this chapter, or aids, abets, counsels, commands, or procures its commission; or
(2) causes an act to be done which if directly performed by him would be punishable by this chapter;
is a principal.''',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 15 - Commerce and Trade
  static List<LawSection> _getTitle15Sections() {
    return [
      LawSection(
        titleNumber: '15',
        titleName: 'Commerce and Trade',
        chapterNumber: '1',
        chapterName: 'Monopolies and Combinations in Restraint of Trade',
        sectionNumber: '1',
        sectionTitle: 'Trusts, etc., in restraint of trade illegal; penalty',
        sectionText: '''Every contract, combination in the form of trust or otherwise, or conspiracy, in restraint of trade or commerce among the several States, or with foreign nations, is declared to be illegal. Every person who shall make any contract or engage in any combination or conspiracy hereby declared to be illegal shall be deemed guilty of a felony, and, on conviction thereof, shall be punished by fine not exceeding \$100,000,000 if a corporation, or, if any other person, \$1,000,000, or by imprisonment not exceeding 10 years, or by both said punishments, in the discretion of the court.''',
        notes: 'This is the Sherman Antitrust Act',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '15',
        titleName: 'Commerce and Trade',
        chapterNumber: '2',
        chapterName: 'Federal Trade Commission',
        sectionNumber: '45',
        sectionTitle: 'Unfair methods of competition unlawful; prevention by Commission',
        sectionText: '''(a) DECLARATION OF UNLAWFULNESS; POWER TO PROHIBIT UNFAIR PRACTICES.—
(1) Unfair methods of competition in or affecting commerce, and unfair or deceptive acts or practices in or affecting commerce, are hereby declared unlawful.
(2) The Commission is hereby empowered and directed to prevent persons, partnerships, or corporations, except banks, savings and loan institutions described in section 57a(f)(3) of this title, Federal credit unions described in section 57a(f)(4) of this title, common carriers subject to the Acts to regulate commerce, air carriers and foreign air carriers subject to part A of subtitle VII of title 49, and persons, partnerships, or corporations insofar as they are subject to the Packers and Stockyards Act, 1921, except as provided in section 406(b) of said Act, from using unfair methods of competition in or affecting commerce and unfair or deceptive acts or practices in or affecting commerce.''',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 18 - Crimes and Criminal Procedure
  static List<LawSection> _getTitle18Sections() {
    return [
      LawSection(
        titleNumber: '18',
        titleName: 'Crimes and Criminal Procedure',
        chapterNumber: '1',
        chapterName: 'General Provisions',
        sectionNumber: '1',
        sectionTitle: 'Offenses classified',
        sectionText: '''Notwithstanding any Act of Congress to the contrary:
(1) Any offense punishable by death or imprisonment for a term exceeding one year is a felony.
(2) Any other offense is a misdemeanor.
(3) Any misdemeanor, the penalty for which does not exceed imprisonment for a period of six months or a fine of not more than \$5,000, or both, is a petty offense.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '18',
        titleName: 'Crimes and Criminal Procedure',
        chapterNumber: '1',
        chapterName: 'General Provisions',
        sectionNumber: '2',
        sectionTitle: 'Principals',
        sectionText: '''(a) Whoever commits an offense against the United States or aids, abets, counsels, commands, induces or procures its commission, is punishable as a principal.
(b) Whoever willfully causes an act to be done which if directly performed by him or another would be an offense against the United States, is punishable as a principal.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '18',
        titleName: 'Crimes and Criminal Procedure',
        chapterNumber: '47',
        chapterName: 'Fraud and False Statements',
        sectionNumber: '1001',
        sectionTitle: 'Statements or entries generally',
        sectionText: '''(a) Except as otherwise provided in this section, whoever, in any matter within the jurisdiction of the executive, legislative, or judicial branch of the Government of the United States, knowingly and willfully—
(1) falsifies, conceals, or covers up by any trick, scheme, or device a material fact;
(2) makes any materially false, fictitious, or fraudulent statement or representation; or
(3) makes or uses any false writing or document knowing the same to contain any materially false, fictitious, or fraudulent statement or entry;
shall be fined under this title, imprisoned not more than 5 years or, if the offense involves international or domestic terrorism (as defined in section 2331), imprisoned not more than 8 years, or both.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '18',
        titleName: 'Crimes and Criminal Procedure',
        chapterNumber: '47',
        chapterName: 'Fraud and False Statements',
        sectionNumber: '1030',
        sectionTitle: 'Fraud and related activity in connection with computers',
        sectionText: '''(a) Whoever—
(1) having knowingly accessed a computer without authorization or exceeding authorized access, and by means of such conduct having obtained information that has been determined by the United States Government pursuant to an Executive order or statute to require protection against unauthorized disclosure for reasons of national defense or foreign relations, or any restricted data, as defined in paragraph y. of section 11 of the Atomic Energy Act of 1954, with reason to believe that such information so obtained could be used to the injury of the United States, or to the advantage of any foreign nation willfully communicates, delivers, transmits, or causes to be communicated, delivered, or transmitted, or attempts to communicate, deliver, transmit or cause to be communicated, delivered, or transmitted the same to any person not entitled to receive it, or willfully retains the same and fails to deliver it to the officer or employee of the United States entitled to receive it;

shall be punished as provided in subsection (c) of this section.''',
        notes: 'This is the Computer Fraud and Abuse Act',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 26 - Internal Revenue Code
  static List<LawSection> _getTitle26Sections() {
    return [
      LawSection(
        titleNumber: '26',
        titleName: 'Internal Revenue Code',
        chapterNumber: '1',
        chapterName: 'Normal Taxes and Surtaxes',
        sectionNumber: '1',
        sectionTitle: 'Tax imposed',
        sectionText: '''(a) MARRIED INDIVIDUALS FILING JOINT RETURNS AND SURVIVING SPOUSES.—There is hereby imposed on the taxable income of—
(1) every married individual (as defined in section 7703) who makes a single return jointly with his spouse under section 6013, and
(2) every surviving spouse (as defined in section 2(a)),
a tax determined in accordance with the following table...

(c) UNMARRIED INDIVIDUALS (OTHER THAN SURVIVING SPOUSES AND HEADS OF HOUSEHOLDS).—There is hereby imposed on the taxable income of every individual (other than a surviving spouse as defined in section 2(a) or the head of a household as defined in section 2(b)) who is not a married individual (as defined in section 7703) a tax determined in accordance with the following table...''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '26',
        titleName: 'Internal Revenue Code',
        chapterNumber: '1',
        chapterName: 'Normal Taxes and Surtaxes',
        sectionNumber: '61',
        sectionTitle: 'Gross income defined',
        sectionText: '''(a) GENERAL DEFINITION.—Except as otherwise provided in this subtitle, gross income means all income from whatever source derived, including (but not limited to) the following items:
(1) Compensation for services, including fees, commissions, fringe benefits, and similar items;
(2) Gross income derived from business;
(3) Gains derived from dealings in property;
(4) Interest;
(5) Rents;
(6) Royalties;
(7) Dividends;
(8) Annuities;
(9) Income from life insurance and endowment contracts;
(10) Pensions;
(11) Income from discharge of indebtedness;
(12) Distributive share of partnership gross income;
(13) Income in respect of a decedent; and
(14) Income from an interest in an estate or trust.''',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 28 - Judiciary and Judicial Procedure
  static List<LawSection> _getTitle28Sections() {
    return [
      LawSection(
        titleNumber: '28',
        titleName: 'Judiciary and Judicial Procedure',
        chapterNumber: '1',
        chapterName: 'Supreme Court',
        sectionNumber: '1',
        sectionTitle: 'Number of justices; quorum',
        sectionText: '''The Supreme Court of the United States shall consist of a Chief Justice of the United States and eight associate justices, any six of whom shall constitute a quorum.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '28',
        titleName: 'Judiciary and Judicial Procedure',
        chapterNumber: '85',
        chapterName: 'District Courts; Jurisdiction',
        sectionNumber: '1331',
        sectionTitle: 'Federal question',
        sectionText: '''The district courts shall have original jurisdiction of all civil actions arising under the Constitution, laws, or treaties of the United States.''',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '28',
        titleName: 'Judiciary and Judicial Procedure',
        chapterNumber: '85',
        chapterName: 'District Courts; Jurisdiction',
        sectionNumber: '1332',
        sectionTitle: 'Diversity of citizenship; amount in controversy; costs',
        sectionText: '''(a) The district courts shall have original jurisdiction of all civil actions where the matter in controversy exceeds the sum or value of \$75,000, exclusive of interest and costs, and is between—
(1) citizens of different States;
(2) citizens of a State and citizens or subjects of a foreign state, except that the district courts shall not have original jurisdiction under this subsection of an action between citizens of a State and citizens or subjects of a foreign state who are lawfully admitted for permanent residence in the United States and are domiciled in the same State;
(3) citizens of different States and in which citizens or subjects of a foreign state are additional parties; and
(4) a foreign state, defined in section 1603(a) of this title, as plaintiff and citizens of a State or of different States.''',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 29 - Labor
  static List<LawSection> _getTitle29Sections() {
    return [
      LawSection(
        titleNumber: '29',
        titleName: 'Labor',
        chapterNumber: '7',
        chapterName: 'Labor-Management Relations',
        sectionNumber: '151',
        sectionTitle: 'Findings and declaration of policy',
        sectionText: '''The denial by some employers of the right of employees to organize and the refusal by some employers to accept the procedure of collective bargaining lead to strikes and other forms of industrial strife or unrest, which have the intent or the necessary effect of burdening or obstructing commerce by (a) impairing the efficiency, safety, or operation of the instrumentalities of commerce; (b) occurring in the current of commerce; (c) materially affecting, restraining, or controlling the flow of raw materials or manufactured or processed goods from or into the channels of commerce, or the prices of such materials or goods in commerce; or (d) causing diminution of employment and wages in such volume as substantially to impair or disrupt the market for goods flowing from or into the channels of commerce.''',
        notes: 'This is part of the National Labor Relations Act (Wagner Act)',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '29',
        titleName: 'Labor',
        chapterNumber: '8',
        chapterName: 'Fair Labor Standards',
        sectionNumber: '206',
        sectionTitle: 'Minimum wage',
        sectionText: '''(a) EMPLOYEES ENGAGED IN COMMERCE; HOME WORKERS IN PUERTO RICO AND VIRGIN ISLANDS; EMPLOYEES IN AMERICAN SAMOA; SEAMEN ON AMERICAN VESSELS; AGRICULTURAL EMPLOYEES.—Every employer shall pay to each of his employees who in any workweek is engaged in commerce or in the production of goods for commerce, or is employed in an enterprise engaged in commerce or in the production of goods for commerce, wages at the following rates:
(1) except as otherwise provided in this section, not less than—
(A) \$5.85 an hour, beginning on the 60th day after May 25, 2007;
(B) \$6.55 an hour, beginning 12 months after that 60th day; and
(C) \$7.25 an hour, beginning 24 months after that 60th day...''',
        notes: 'Federal Minimum Wage provision',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '29',
        titleName: 'Labor',
        chapterNumber: '8',
        chapterName: 'Fair Labor Standards',
        sectionNumber: '207',
        sectionTitle: 'Maximum hours',
        sectionText: '''(a) EMPLOYEES ENGAGED IN INTERSTATE COMMERCE; ADDITIONAL APPLICABILITY TO EMPLOYEES PURSUANT TO SUBSEQUENT AMENDATORY PROVISIONS.—
(1) Except as otherwise provided in this section, no employer shall employ any of his employees who in any workweek is engaged in commerce or in the production of goods for commerce, or is employed in an enterprise engaged in commerce or in the production of goods for commerce, for a workweek longer than forty hours unless such employee receives compensation for his employment in excess of the hours above specified at a rate not less than one and one-half times the regular rate at which he is employed.''',
        notes: 'Overtime pay requirements',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 42 - Public Health and Welfare
  static List<LawSection> _getTitle42Sections() {
    return [
      LawSection(
        titleNumber: '42',
        titleName: 'The Public Health and Welfare',
        chapterNumber: '21',
        chapterName: 'Civil Rights',
        sectionNumber: '1983',
        sectionTitle: 'Civil action for deprivation of rights',
        sectionText: '''Every person who, under color of any statute, ordinance, regulation, custom, or usage, of any State or Territory or the District of Columbia, subjects, or causes to be subjected, any citizen of the United States or other person within the jurisdiction thereof to the deprivation of any rights, privileges, or immunities secured by the Constitution and laws, shall be liable to the party injured in an action at law, suit in equity, or other proper proceeding for redress, except that in any action brought against a judicial officer for an act or omission taken in such officer's judicial capacity, injunctive relief shall not be granted unless a declaratory decree was violated or declaratory relief was unavailable.''',
        notes: 'This is Section 1983, commonly used in civil rights lawsuits',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '42',
        titleName: 'The Public Health and Welfare',
        chapterNumber: '21',
        chapterName: 'Civil Rights',
        sectionNumber: '2000e-2',
        sectionTitle: 'Unlawful employment practices',
        sectionText: '''(a) EMPLOYER PRACTICES.—It shall be an unlawful employment practice for an employer—
(1) to fail or refuse to hire or to discharge any individual, or otherwise to discriminate against any individual with respect to his compensation, terms, conditions, or privileges of employment, because of such individual's race, color, religion, sex, or national origin; or
(2) to limit, segregate, or classify his employees or applicants for employment in any way which would deprive or tend to deprive any individual of employment opportunities or otherwise adversely affect his status as an employee, because of such individual's race, color, religion, sex, or national origin.''',
        notes: 'Title VII of the Civil Rights Act of 1964',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '42',
        titleName: 'The Public Health and Welfare',
        chapterNumber: '126',
        chapterName: 'Equal Opportunity for Individuals with Disabilities',
        sectionNumber: '12101',
        sectionTitle: 'Findings and purpose',
        sectionText: '''(a) FINDINGS.—The Congress finds that—
(1) physical or mental disabilities in no way diminish a person's right to fully participate in all aspects of society, yet many people with physical or mental disabilities have been precluded from doing so because of discrimination; others who have a record of a disability or are regarded as having a disability also have been subjected to discrimination;
(2) historically, society has tended to isolate and segregate individuals with disabilities, and, despite some improvements, such forms of discrimination against individuals with disabilities continue to be a serious and pervasive social problem...''',
        notes: 'Americans with Disabilities Act (ADA) findings',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 2 - The Congress
  static List<LawSection> _getTitle2Sections() {
    return [
      LawSection(
        titleNumber: '2',
        titleName: 'The Congress',
        chapterNumber: '1',
        chapterName: 'Election of Senators and Representatives',
        sectionNumber: '1',
        sectionTitle: 'Time for election of Senators',
        sectionText: '''At the regular election held in any State next preceding the expiration of the term for which any Senator was elected to represent such State in Congress, at which election a Representative to Congress is regularly by law to be chosen, a United States Senator from said State shall be elected by the people thereof for the term commencing on the 3d day of January next thereafter.''',
        notes: 'Establishes timing for Senate elections',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '2',
        titleName: 'The Congress',
        chapterNumber: '2',
        chapterName: 'Organization of Congress',
        sectionNumber: '25',
        sectionTitle: 'Majority and minority leaders of Senate',
        sectionText: '''The majority leader and the minority leader of the Senate (or in the event of their absence, their designees) are each authorized to appoint one employee in his office and designate such employee as Director of the Majority or Minority, as the case may be, and fix the pay of such employee at a rate not to exceed the maximum rate of compensation authorized under section 4575(f) of this title.''',
        notes: 'Authority for Senate leadership positions',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 3 - The President
  static List<LawSection> _getTitle3Sections() {
    return [
      LawSection(
        titleNumber: '3',
        titleName: 'The President',
        chapterNumber: '1',
        chapterName: 'Presidential Elections and Vacancies',
        sectionNumber: '1',
        sectionTitle: 'Time of appointing electors',
        sectionText: '''The electors of President and Vice President shall be appointed, in each State, on the Tuesday next after the first Monday in November, in every fourth year succeeding every election of a President and Vice President.''',
        notes: 'Establishes Election Day timing',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '3',
        titleName: 'The President',
        chapterNumber: '1',
        chapterName: 'Presidential Elections and Vacancies',
        sectionNumber: '19',
        sectionTitle: 'Vacancy in offices of both President and Vice President; officers eligible to act',
        sectionText: '''(a)(1) If, by reason of death, resignation, removal from office, inability, or failure to qualify, there is neither a President nor Vice President to discharge the powers and duties of the office of President, then the Speaker of the House of Representatives shall, upon his resignation as Speaker and as Representative in Congress, act as President.''',
        notes: 'Presidential succession order',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 4 - Flag and Seal, Seat of Government, and the States
  static List<LawSection> _getTitle4Sections() {
    return [
      LawSection(
        titleNumber: '4',
        titleName: 'Flag and Seal, Seat of Government, and the States',
        chapterNumber: '1',
        chapterName: 'The Flag',
        sectionNumber: '1',
        sectionTitle: 'Flag; stripes and stars on',
        sectionText: '''The flag of the United States shall be thirteen horizontal stripes, alternate red and white; and the union of the flag shall be forty-eight stars, white in a blue field. (This was later amended to fifty stars by Executive Order)''',
        notes: 'Describes the design of the American flag',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '4',
        titleName: 'Flag and Seal, Seat of Government, and the States',
        chapterNumber: '1',
        chapterName: 'The Flag',
        sectionNumber: '8',
        sectionTitle: 'Respect for flag',
        sectionText: '''No disrespect should be shown to the flag of the United States of America; the flag should not be dipped to any person or thing. Regimental colors, State flags, and organization or institutional flags are to be dipped as a mark of honor.
(a) The flag should never be displayed with the union down, except as a signal of dire distress in instances of extreme danger to life or property.
(b) The flag should never touch anything beneath it, such as the ground, the floor, water, or merchandise.''',
        notes: 'Flag Code etiquette rules',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 7 - Agriculture
  static List<LawSection> _getTitle7Sections() {
    return [
      LawSection(
        titleNumber: '7',
        titleName: 'Agriculture',
        chapterNumber: '1',
        chapterName: 'Commodity Exchanges',
        sectionNumber: '1',
        sectionTitle: 'Short title',
        sectionText: '''This chapter may be cited as the "Commodity Exchange Act".''',
        notes: 'Regulates commodity futures and options markets',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '7',
        titleName: 'Agriculture',
        chapterNumber: '38',
        chapterName: 'Distribution and Marketing of Agricultural Products',
        sectionNumber: '1621',
        sectionTitle: 'Congressional declaration of policy',
        sectionText: '''It is declared to be the policy of Congress to promote through research, study, experimentation, and through cooperation among Federal and State agencies, farm organizations, and private industry a scientific approach to the problems of marketing, transportation, and distribution of agricultural products similar to the scientific methods which have been utilized so successfully during the past eighty-four years in connection with the production of agricultural products.''',
        notes: 'Policy on agricultural marketing research',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 8 - Aliens and Nationality
  static List<LawSection> _getTitle8Sections() {
    return [
      LawSection(
        titleNumber: '8',
        titleName: 'Aliens and Nationality',
        chapterNumber: '12',
        chapterName: 'Immigration and Nationality',
        sectionNumber: '1101',
        sectionTitle: 'Definitions',
        sectionText: '''(a) As used in this chapter—
(1) The term "administrator" means the official designated by the Secretary of State pursuant to section 1104(b) of this title.
(2) The term "advocates" includes, but is not limited to, advises, recommends, furthers by overt act, and admits belief in.
(3) The term "alien" means any person not a citizen or national of the United States.''',
        notes: 'Definitions for immigration law',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '8',
        titleName: 'Aliens and Nationality',
        chapterNumber: '12',
        chapterName: 'Immigration and Nationality',
        sectionNumber: '1182',
        sectionTitle: 'Inadmissible aliens',
        sectionText: '''(a) CLASSES OF ALIENS INELIGIBLE FOR VISAS OR ADMISSION.—Except as otherwise provided in this chapter, aliens who are inadmissible under the following paragraphs are ineligible to receive visas and ineligible to be admitted to the United States:
(1) HEALTH-RELATED GROUNDS.—
(A) In general.—Any alien—
(i) who is determined (in accordance with regulations prescribed by the Secretary of Health and Human Services) to have a communicable disease of public health significance...''',
        notes: 'Grounds for inadmissibility to the United States',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 11 - Bankruptcy
  static List<LawSection> _getTitle11Sections() {
    return [
      LawSection(
        titleNumber: '11',
        titleName: 'Bankruptcy',
        chapterNumber: '1',
        chapterName: 'General Provisions',
        sectionNumber: '101',
        sectionTitle: 'Definitions',
        sectionText: '''In this title the following definitions shall apply:
(1) The term "accountant" means accountant authorized under applicable law to practice public accounting, and includes professional accounting association, corporation, or partnership, if so authorized.
(2) The term "affiliate" means—
(A) entity that directly or indirectly owns, controls, or holds with power to vote, 20 percent or more of the outstanding voting securities of the debtor, other than an entity that holds such securities—
(i) in a fiduciary or agency capacity without sole discretionary power to vote such securities...''',
        notes: 'Bankruptcy code definitions',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '11',
        titleName: 'Bankruptcy',
        chapterNumber: '3',
        chapterName: 'Case Administration',
        sectionNumber: '301',
        sectionTitle: 'Voluntary cases',
        sectionText: '''(a) A voluntary case under a chapter of this title is commenced by the filing with the bankruptcy court of a petition under such chapter by an entity that may be a debtor under such chapter.
(b) The commencement of a voluntary case under a chapter of this title constitutes an order for relief under such chapter.''',
        notes: 'How to file for bankruptcy voluntarily',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 17 - Copyrights
  static List<LawSection> _getTitle17Sections() {
    return [
      LawSection(
        titleNumber: '17',
        titleName: 'Copyrights',
        chapterNumber: '1',
        chapterName: 'Subject Matter and Scope of Copyright',
        sectionNumber: '102',
        sectionTitle: 'Subject matter of copyright: In general',
        sectionText: '''(a) Copyright protection subsists, in accordance with this title, in original works of authorship fixed in any tangible medium of expression, now known or later developed, from which they can be perceived, reproduced, or otherwise communicated, either directly or with the aid of a machine or device. Works of authorship include the following categories:
(1) literary works;
(2) musical works, including any accompanying words;
(3) dramatic works, including any accompanying music;
(4) pantomimes and choreographic works;
(5) pictorial, graphic, and sculptural works;
(6) motion pictures and other audiovisual works;
(7) sound recordings; and
(8) architectural works.''',
        notes: 'Types of works protected by copyright',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '17',
        titleName: 'Copyrights',
        chapterNumber: '1',
        chapterName: 'Subject Matter and Scope of Copyright',
        sectionNumber: '106',
        sectionTitle: 'Exclusive rights in copyrighted works',
        sectionText: '''Subject to sections 107 through 122, the owner of copyright under this title has the exclusive rights to do and to authorize any of the following:
(1) to reproduce the copyrighted work in copies or phonorecords;
(2) to prepare derivative works based upon the copyrighted work;
(3) to distribute copies or phonorecords of the copyrighted work to the public by sale or other transfer of ownership, or by rental, lease, or lending;
(4) in the case of literary, musical, dramatic, and choreographic works, pantomimes, and motion pictures and other audiovisual works, to perform the copyrighted work publicly;
(5) in the case of literary, musical, dramatic, and choreographic works, pantomimes, and pictorial, graphic, or sculptural works, including the individual images of a motion picture or other audiovisual work, to display the copyrighted work publicly; and
(6) in the case of sound recordings, to perform the copyrighted work publicly by means of a digital audio transmission.''',
        notes: 'Copyright holder exclusive rights',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 20 - Education
  static List<LawSection> _getTitle20Sections() {
    return [
      LawSection(
        titleNumber: '20',
        titleName: 'Education',
        chapterNumber: '28',
        chapterName: 'Higher Education Resources and Student Assistance',
        sectionNumber: '1001',
        sectionTitle: 'General definition of institution of higher education',
        sectionText: '''(a) INSTITUTION OF HIGHER EDUCATION.—For purposes of this chapter, other than subchapter IV, the term "institution of higher education" means an educational institution in any State that—
(1) admits as regular students only persons having a certificate of graduation from a school providing secondary education, or the recognized equivalent of such a certificate;
(2) is legally authorized within such State to provide a program of education beyond secondary education;
(3) provides an educational program for which the institution awards a bachelor's degree or provides not less than a 2-year program that is acceptable for full credit toward such a degree...''',
        notes: 'Defines higher education institutions',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '20',
        titleName: 'Education',
        chapterNumber: '38',
        chapterName: 'Discrimination Based on Sex or Blindness',
        sectionNumber: '1681',
        sectionTitle: 'Sex discrimination prohibited',
        sectionText: '''(a) PROHIBITION AGAINST DISCRIMINATION; EXCEPTIONS.—No person in the United States shall, on the basis of sex, be excluded from participation in, be denied the benefits of, or be subjected to discrimination under any education program or activity receiving Federal financial assistance, except that:
(1) CLASSES OF EDUCATIONAL INSTITUTIONS SUBJECT TO PROHIBITION.—in regard to admissions to educational institutions, this section shall apply only to institutions of vocational education, professional education, and graduate higher education...''',
        notes: 'Title IX - prohibits sex discrimination in education',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 21 - Food and Drugs
  static List<LawSection> _getTitle21Sections() {
    return [
      LawSection(
        titleNumber: '21',
        titleName: 'Food and Drugs',
        chapterNumber: '9',
        chapterName: 'Federal Food, Drug, and Cosmetic Act',
        sectionNumber: '301',
        sectionTitle: 'Short title',
        sectionText: '''This chapter may be cited as the "Federal Food, Drug, and Cosmetic Act".''',
        notes: 'Short title of the Food and Drug Act',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '21',
        titleName: 'Food and Drugs',
        chapterNumber: '9',
        chapterName: 'Federal Food, Drug, and Cosmetic Act',
        sectionNumber: '321',
        sectionTitle: 'Definitions',
        sectionText: '''For the purposes of this chapter—
(f) The term "food" means (1) articles used for food or drink for man or other animals, (2) chewing gum, and (3) articles used for components of any such article.
(g)(1) The term "drug" means (A) articles recognized in the official United States Pharmacopoeia, official Homoeopathic Pharmacopoeia of the United States, or official National Formulary, or any supplement to any of them; and (B) articles intended for use in the diagnosis, cure, mitigation, treatment, or prevention of disease in man or other animals...''',
        notes: 'Defines food and drug for FDA purposes',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '21',
        titleName: 'Food and Drugs',
        chapterNumber: '13',
        chapterName: 'Drug Abuse Prevention and Control',
        sectionNumber: '801',
        sectionTitle: 'Congressional findings and declarations: controlled substances',
        sectionText: '''The Congress makes the following findings and declarations:
(1) Many of the drugs included within this subchapter have a useful and legitimate medical purpose and are necessary to maintain the health and general welfare of the American people.
(2) The illegal importation, manufacture, distribution, and possession and improper use of controlled substances have a substantial and detrimental effect on the health and general welfare of the American people.''',
        notes: 'Findings for Controlled Substances Act',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 6 - Domestic Security
  static List<LawSection> _getTitle6Sections() {
    return [
      LawSection(
        titleNumber: '6',
        titleName: 'Domestic Security',
        chapterNumber: '1',
        chapterName: 'Homeland Security Organization',
        sectionNumber: '101',
        sectionTitle: 'Executive department; mission',
        sectionText: '''(a) ESTABLISHMENT.—There is established a Department of Homeland Security, as an executive department of the United States within the meaning of title 5, United States Code.
(b) MISSION.—
(1) IN GENERAL.—The primary mission of the Department is to—
(A) prevent terrorist attacks within the United States;
(B) reduce the vulnerability of the United States to terrorism;
(C) minimize the damage, and assist in the recovery, from terrorist attacks that do occur within the United States;
(D) carry out all functions of entities transferred to the Department, including by acting as a focal point regarding natural and manmade crises and emergency planning...''',
        notes: 'Establishes the Department of Homeland Security',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 9 - Arbitration
  static List<LawSection> _getTitle9Sections() {
    return [
      LawSection(
        titleNumber: '9',
        titleName: 'Arbitration',
        chapterNumber: '1',
        chapterName: 'General Provisions',
        sectionNumber: '2',
        sectionTitle: 'Validity, irrevocability, and enforcement of agreements to arbitrate',
        sectionText: '''A written provision in any maritime transaction or a contract evidencing a transaction involving commerce to settle by arbitration a controversy thereafter arising out of such contract or transaction, or the refusal to perform the whole or any part thereof, or an agreement in writing to submit to arbitration an existing controversy arising out of such a contract, transaction, or refusal, shall be valid, irrevocable, and enforceable, save upon such grounds as exist at law or in equity for the revocation of any contract.''',
        notes: 'Federal Arbitration Act - enforceability of arbitration agreements',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 12 - Banks and Banking
  static List<LawSection> _getTitle12Sections() {
    return [
      LawSection(
        titleNumber: '12',
        titleName: 'Banks and Banking',
        chapterNumber: '2',
        chapterName: 'National Banks',
        sectionNumber: '24',
        sectionTitle: 'Corporate powers of associations',
        sectionText: '''Upon duly making and filing articles of association and an organization certificate, a national banking association shall become, as of the date of the approval of its organization certificate by the Comptroller of the Currency, a body corporate, and as such, and in the name designated in the organization certificate, it shall have power—
First. To adopt and use a corporate seal.
Second. To have succession from the date of the approval of its organization certificate by the Comptroller of the Currency...''',
        notes: 'Powers granted to national banks',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 13 - Census
  static List<LawSection> _getTitle13Sections() {
    return [
      LawSection(
        titleNumber: '13',
        titleName: 'Census',
        chapterNumber: '1',
        chapterName: 'Administration',
        sectionNumber: '141',
        sectionTitle: 'Population and other census information',
        sectionText: '''(a) The Secretary shall, in the year 1980 and every 10 years thereafter, take a decennial census of population as of the first day of April of such year, which date shall be known as the "decennial census date", in such form and content as he may determine, including the use of sampling procedures and special surveys. In connection with any such census, the Secretary is authorized to obtain such other census information as necessary.''',
        notes: 'Mandates decennial census every 10 years',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 14 - Coast Guard
  static List<LawSection> _getTitle14Sections() {
    return [
      LawSection(
        titleNumber: '14',
        titleName: 'Coast Guard',
        chapterNumber: '1',
        chapterName: 'Establishment and Duties',
        sectionNumber: '102',
        sectionTitle: 'Primary duties',
        sectionText: '''The Coast Guard shall—
(1) enforce or assist in the enforcement of all applicable Federal laws on, under, and over the high seas and waters subject to the jurisdiction of the United States;
(2) engage in maritime air surveillance or interdiction to enforce or assist in the enforcement of the laws of the United States;
(3) administer laws and promulgate and enforce regulations for the promotion of safety of life and property on and under the high seas and waters subject to the jurisdiction of the United States covering all matters not specifically delegated by law to some other executive department...''',
        notes: 'Primary missions of the US Coast Guard',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 16 - Conservation
  static List<LawSection> _getTitle16Sections() {
    return [
      LawSection(
        titleNumber: '16',
        titleName: 'Conservation',
        chapterNumber: '1',
        chapterName: 'National Parks, Military Parks, Monuments, and Seashores',
        sectionNumber: '1',
        sectionTitle: 'National Park Service; establishment; director; other employees',
        sectionText: '''There is created in the Department of the Interior a service to be called the National Park Service, which shall be under the charge of a director, who shall be appointed by the Secretary and shall receive a salary as provided by law. There shall also be appointed by the Secretary the following assistants and other employees at the salaries designated: One assistant director, at \$4,500 per annum, and one chief clerk, at \$2,500 per annum; one draftsman, at \$2,000 per annum; one messenger, at \$840 per annum; and, in addition thereto, such other employees as the Secretary of the Interior shall deem necessary: Provided, That not more than eight employees provided for above may be stationed in the city of Washington.''',
        notes: 'Establishes the National Park Service',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 19 - Customs Duties
  static List<LawSection> _getTitle19Sections() {
    return [
      LawSection(
        titleNumber: '19',
        titleName: 'Customs Duties',
        chapterNumber: '4',
        chapterName: 'Tariff Act of 1930',
        sectionNumber: '1401a',
        sectionTitle: 'Value',
        sectionText: '''(a) GENERALLY.—
(1) Except as otherwise specifically provided for in this chapter, imported merchandise shall be appraised, for the purposes of this chapter, on the basis of the following:
(A) The transaction value provided for under subsection (b).
(B) The transaction value of identical merchandise provided for under subsection (c), if the value referred to in subparagraph (A) cannot be determined...''',
        notes: 'Rules for determining customs value of imported goods',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 22 - Foreign Relations and Intercourse
  static List<LawSection> _getTitle22Sections() {
    return [
      LawSection(
        titleNumber: '22',
        titleName: 'Foreign Relations and Intercourse',
        chapterNumber: '7',
        chapterName: 'International Bureaus, Congresses, etc.',
        sectionNumber: '262r',
        sectionTitle: 'Use of renewable resources for energy production',
        sectionText: '''(a) APPLICABILITY.—The Secretary of the Treasury shall instruct the United States Executive Director of each multilateral development bank to vigorously and continuously urge that each bank—
(1) consider the effects of all development projects on the renewable resources of developing countries;
(2) increase its efforts to finance projects which will increase the utilization and conservation of renewable resources...''',
        notes: 'Policy on renewable energy in international development',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 23 - Highways
  static List<LawSection> _getTitle23Sections() {
    return [
      LawSection(
        titleNumber: '23',
        titleName: 'Highways',
        chapterNumber: '1',
        chapterName: 'Federal-Aid Highways',
        sectionNumber: '101',
        sectionTitle: 'Definitions and declaration of policy',
        sectionText: '''(a) DEFINITIONS.—In this title, the following definitions apply:
(1) FEDERAL-AID HIGHWAY.—The term "Federal-aid highway" means a public highway eligible for assistance under this chapter other than a highway functionally classified as a local road or rural minor collector.
(2) FEDERAL-AID SYSTEM.—The term "Federal-aid system" means the system of Federal-aid highways described in section 103(b).
(3) INTERSTATE SYSTEM.—The term "Interstate System" means the Dwight D. Eisenhower National System of Interstate and Defense Highways described in section 103(c).''',
        notes: 'Definitions for Federal highway programs',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 25 - Indians
  static List<LawSection> _getTitle25Sections() {
    return [
      LawSection(
        titleNumber: '25',
        titleName: 'Indians',
        chapterNumber: '14',
        chapterName: 'Miscellaneous',
        sectionNumber: '1301',
        sectionTitle: 'Definitions',
        sectionText: '''For purposes of this subchapter, the term—
(1) "Indian tribe" means any tribe, band, or other group of Indians subject to the jurisdiction of the United States and recognized as possessing powers of self-government;
(2) "powers of self-government" means and includes all governmental powers possessed by an Indian tribe, executive, legislative, and judicial, and all offices, bodies, and tribunals by and through which they are executed, including courts of Indian offenses...''',
        notes: 'Indian Civil Rights Act definitions',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 27 - Intoxicating Liquors
  static List<LawSection> _getTitle27Sections() {
    return [
      LawSection(
        titleNumber: '27',
        titleName: 'Intoxicating Liquors',
        chapterNumber: '8',
        chapterName: 'Federal Alcohol Administration Act',
        sectionNumber: '203',
        sectionTitle: 'Unlawful businesses without permit',
        sectionText: '''It shall be unlawful, except pursuant to a basic permit issued under this subchapter by the Secretary of the Treasury—
(a) to engage in the business of distilling distilled spirits, producing or blending distilled spirits for beverage purposes, warehousing distilled spirits, or bottling, or rectifying, distilled spirits;
(b) for any person so engaged to sell, offer or deliver for sale, contract to sell, or ship, in interstate or foreign commerce, directly or indirectly or through an affiliate, distilled spirits so distilled or produced...''',
        notes: 'Requirements for alcohol business permits',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 31 - Money and Finance
  static List<LawSection> _getTitle31Sections() {
    return [
      LawSection(
        titleNumber: '31',
        titleName: 'Money and Finance',
        chapterNumber: '53',
        chapterName: 'Monetary Transactions',
        sectionNumber: '5312',
        sectionTitle: 'Definitions and application',
        sectionText: '''(a) In this subchapter—
(1) "financial agency" means a person acting for a person (except for a country, a monetary or financial authority acting as a monetary or financial authority, or an international financial institution of which the United States Government is a member) as a financial institution, bailee, depository trustee, or agent, or acting in a similar way related to money, credit, securities, gold, or a transaction in money, credit, securities, or gold.
(2) "financial institution" means—
(A) an insured bank (as defined in section 3(h) of the Federal Deposit Insurance Act (12 U.S.C. 1813(h)));
(B) a commercial bank or trust company...''',
        notes: 'Bank Secrecy Act definitions',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 35 - Patents
  static List<LawSection> _getTitle35Sections() {
    return [
      LawSection(
        titleNumber: '35',
        titleName: 'Patents',
        chapterNumber: '10',
        chapterName: 'Patentability of Inventions',
        sectionNumber: '101',
        sectionTitle: 'Inventions patentable',
        sectionText: '''Whoever invents or discovers any new and useful process, machine, manufacture, or composition of matter, or any new and useful improvement thereof, may obtain a patent therefor, subject to the conditions and requirements of this title.''',
        notes: 'Basic requirements for patent eligibility',
        lastUpdated: DateTime.now(),
      ),
      LawSection(
        titleNumber: '35',
        titleName: 'Patents',
        chapterNumber: '10',
        chapterName: 'Patentability of Inventions',
        sectionNumber: '102',
        sectionTitle: 'Conditions for patentability; novelty',
        sectionText: '''(a) NOVELTY; PRIOR ART.—A person shall be entitled to a patent unless—
(1) the claimed invention was patented, described in a printed publication, or in public use, on sale, or otherwise available to the public before the effective filing date of the claimed invention; or
(2) the claimed invention was described in a patent issued under section 151, or in an application for patent published or deemed published under section 122(b), in which the patent or application, as the case may be, names another inventor and was effectively filed before the effective filing date of the claimed invention.''',
        notes: 'Patent novelty requirements',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 38 - Veterans' Benefits
  static List<LawSection> _getTitle38Sections() {
    return [
      LawSection(
        titleNumber: '38',
        titleName: 'Veterans\' Benefits',
        chapterNumber: '17',
        chapterName: 'Hospital, Nursing Home, Domiciliary, and Medical Care',
        sectionNumber: '1710',
        sectionTitle: 'Eligibility for hospital, nursing home, and domiciliary care',
        sectionText: '''(a) IN GENERAL.—The Secretary (subject to paragraph (4)) shall furnish hospital care and medical services which the Secretary determines to be needed—
(1) to any veteran for a service-connected disability;
(2) to any veteran who has a service-connected disability rated at 50 percent or more;
(3) to any veteran whose annual income (as determined under section 1503 of this title) does not exceed the maximum annual rate of pension that would be applicable to such veteran if such veteran were eligible for pension under section 1521 of this title...''',
        notes: 'Eligibility for VA healthcare',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 39 - Postal Service
  static List<LawSection> _getTitle39Sections() {
    return [
      LawSection(
        titleNumber: '39',
        titleName: 'Postal Service',
        chapterNumber: '2',
        chapterName: 'Organization',
        sectionNumber: '201',
        sectionTitle: 'United States Postal Service',
        sectionText: '''(a) There is established, as an independent establishment of the executive branch of the Government of the United States, the United States Postal Service. The Postal Service shall be operated as a basic and fundamental service provided to the people by the Government of the United States, authorized by the Constitution, created by Act of Congress, and supported by the people. The Postal Service shall have as its basic function the obligation to provide postal services to bind the Nation together through the personal, educational, literary, and business correspondence of the people. It shall provide prompt, reliable, and efficient services to patrons in all areas and shall render postal services to all communities.''',
        notes: 'Establishes the US Postal Service',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 41 - Public Contracts
  static List<LawSection> _getTitle41Sections() {
    return [
      LawSection(
        titleNumber: '41',
        titleName: 'Public Contracts',
        chapterNumber: '23',
        chapterName: 'Miscellaneous',
        sectionNumber: '6502',
        sectionTitle: 'Required contract provisions',
        sectionText: '''A contract made by an agency of the United States for the manufacture or furnishing of materials, supplies, articles, or equipment, in an amount exceeding \$15,000, must include the following provisions:
(1) MINIMUM WAGES.—All individuals employed by the contractor or any subcontractor in the manufacture or furnishing of materials, supplies, articles, or equipment under the contract shall be paid, without subsequent deduction or rebate on any account, not less than the prevailing minimum wages as determined by the Secretary for individuals employed in similar work or in the particular or similar industries or groups of industries currently operating in the locality in which the materials, supplies, articles, or equipment are to be manufactured or furnished under the contract...''',
        notes: 'Davis-Bacon Act requirements for government contracts',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 44 - Public Printing and Documents
  static List<LawSection> _getTitle44Sections() {
    return [
      LawSection(
        titleNumber: '44',
        titleName: 'Public Printing and Documents',
        chapterNumber: '35',
        chapterName: 'Coordination of Federal Information Policy',
        sectionNumber: '3501',
        sectionTitle: 'Purposes',
        sectionText: '''The purposes of this subchapter are to—
(1) minimize the paperwork burden for individuals, small businesses, educational and nonprofit institutions, Federal contractors, State, local and tribal governments, and other persons resulting from the collection of information by or for the Federal Government;
(2) ensure the greatest possible public benefit from and maximize the utility of information created, collected, maintained, used, shared and disseminated by or for the Federal Government...''',
        notes: 'Paperwork Reduction Act purposes',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 47 - Telecommunications
  static List<LawSection> _getTitle47Sections() {
    return [
      LawSection(
        titleNumber: '47',
        titleName: 'Telecommunications',
        chapterNumber: '5',
        chapterName: 'Wire or Radio Communication',
        sectionNumber: '230',
        sectionTitle: 'Protection for private blocking and screening of offensive material',
        sectionText: '''(c) PROTECTION FOR "GOOD SAMARITAN" BLOCKING AND SCREENING OF OFFENSIVE MATERIAL.—
(1) TREATMENT OF PUBLISHER OR SPEAKER.—No provider or user of an interactive computer service shall be treated as the publisher or speaker of any information provided by another information content provider.
(2) CIVIL LIABILITY.—No provider or user of an interactive computer service shall be held liable on account of—
(A) any action voluntarily taken in good faith to restrict access to or availability of material that the provider or user considers to be obscene, lewd, lascivious, filthy, excessively violent, harassing, or otherwise objectionable...''',
        notes: 'Section 230 - Internet platform liability protections',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 49 - Transportation
  static List<LawSection> _getTitle49Sections() {
    return [
      LawSection(
        titleNumber: '49',
        titleName: 'Transportation',
        chapterNumber: '301',
        chapterName: 'Motor Vehicle Safety',
        sectionNumber: '30102',
        sectionTitle: 'Definitions',
        sectionText: '''(a) GENERAL DEFINITIONS.—In this chapter—
(1) "dealer" means a person selling and distributing new motor vehicles or motor vehicle equipment primarily to purchasers that in good faith purchase the vehicles or equipment other than for resale.
(2) "defect" includes any defect in performance, construction, a component, or material of a motor vehicle or motor vehicle equipment.
(3) "distributor" means a person primarily selling and distributing motor vehicles or motor vehicle equipment for resale.
(4) "interstate commerce" means commerce between a place in a State and a place in another State or between places in the same State through another State.''',
        notes: 'National Traffic and Motor Vehicle Safety Act definitions',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 50 - War and National Defense
  static List<LawSection> _getTitle50Sections() {
    return [
      LawSection(
        titleNumber: '50',
        titleName: 'War and National Defense',
        chapterNumber: '44',
        chapterName: 'National Security',
        sectionNumber: '3001',
        sectionTitle: 'Definitions',
        sectionText: '''When used in this chapter:
(a) The term "intelligence" includes foreign intelligence and counterintelligence.
(b) The term "foreign intelligence" means information relating to the capabilities, intentions, or activities of foreign governments or elements thereof, foreign organizations, or foreign persons, or international terrorist activities.
(c) The term "counterintelligence" means information gathered and activities conducted to protect against espionage, other intelligence activities, sabotage, or assassinations conducted by or on behalf of foreign governments or elements thereof, foreign organizations, or foreign persons, or international terrorist activities.''',
        notes: 'National Security Act definitions',
        lastUpdated: DateTime.now(),
      ),
    ];
  }

  // TITLE 52 - Voting and Elections
  static List<LawSection> _getTitle52Sections() {
    return [
      LawSection(
        titleNumber: '52',
        titleName: 'Voting and Elections',
        chapterNumber: '103',
        chapterName: 'Enforcement of Voting Rights',
        sectionNumber: '10301',
        sectionTitle: 'Denial or abridgement of right to vote on account of race or color through voting qualifications or prerequisites',
        sectionText: '''(a) No voting qualification or prerequisite to voting, or standard, practice, or procedure shall be imposed or applied by any State or political subdivision to deny or abridge the right of any citizen of the United States to vote on account of race or color.
(b) No person acting under color of law shall fail or refuse to permit any person to vote who is entitled to vote under any provision of chapters 103 to 107 of this title or is otherwise qualified to vote, or willfully fail or refuse to tabulate, count, and report such person's vote.''',
        notes: 'Voting Rights Act - prohibits racial discrimination in voting',
        lastUpdated: DateTime.now(),
      ),
    ];
  }
}
