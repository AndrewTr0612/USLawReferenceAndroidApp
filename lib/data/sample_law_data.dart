import '../database/database_helper.dart';

class SampleLawData {
  static List<LawSection> getSampleLawSections() {
    return [
      // Title 1 - General Provisions
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '1',
        sectionTitle: 'Words denoting number, gender, and so forth',
        sectionText:
            'In determining the meaning of any Act of Congress, unless the context indicates otherwise— the words "insofar" and "in so far" shall be interchangeable with the words "to the extent"; and words relying on the plural form shall include the singular and words relying on the singular form shall include the plural.',
        notes: 'This section establishes fundamental rules for interpreting legislation.',
      ),
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '2',
        sectionTitle: '"Officers" and "employees"',
        sectionText:
            'The word "officer" includes any person authorized by law to perform official duties; the word "employee" includes officers and persons employed or engaged in the performance of official duties.',
        notes: 'Defines key terminology used throughout federal law.',
      ),
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '3',
        sectionTitle: '"Person" and "whoever"',
        sectionText:
            'The word "person" includes corporations, companies, associations, firms, partnerships, societies, and joint stock companies, as well as individuals.',
        notes: 'Expands definition of person to include legal entities.',
      ),
      LawSection(
        titleNumber: '1',
        titleName: 'General Provisions',
        chapterNumber: '1',
        chapterName: 'Rules of Construction',
        sectionNumber: '4',
        sectionTitle: '"Acting" or "Acting within the scope of his office"',
        sectionText:
            'The words "acting" and "acting within the scope of his office" include any authority conferred upon, or duty imposed upon, a public officer by any act of Congress.',
        notes: 'Defines scope of official authority.',
      ),
      // Title 18 - Crimes and Criminal Procedure
      LawSection(
        titleNumber: '18',
        titleName: 'Crimes and Criminal Procedure',
        chapterNumber: '1',
        chapterName: 'General Provisions',
        sectionNumber: '1',
        sectionTitle: 'Theft of Government property',
        sectionText:
            'Whoever steals, purloins, or knowingly converts to his use or the use of another, any record, voucher, money, or thing of value of the United States or of any department or agency thereof, or any such property which has been or shall be entrusted to him or deposited with him, shall be fined under this title or imprisoned not more than ten years, or both.',
        notes: 'Establishes penalties for theft of government property.',
      ),
      LawSection(
        titleNumber: '18',
        titleName: 'Crimes and Criminal Procedure',
        chapterNumber: '1',
        chapterName: 'General Provisions',
        sectionNumber: '2',
        sectionTitle: 'Principals',
        sectionText:
            'Whoever commits an offense against the United States or aids, abets, counsels, commands, induces or procures its commission, is punishable as a principal. Whoever willfully causes an act to be done which if directly performed by him would be an offense against the United States, is punishable as a principal.',
        notes: 'Defines liability for accomplices and conspirators.',
      ),
      LawSection(
        titleNumber: '18',
        titleName: 'Crimes and Criminal Procedure',
        chapterNumber: '1',
        chapterName: 'General Provisions',
        sectionNumber: '3',
        sectionTitle: 'Accessory after the fact',
        sectionText:
            'Whoever, knowing that an offense against the United States has been committed, receives, relieves, comforts or assists the offender in order to hinder or prevent his apprehension, trial, conviction, or punishment, is an accessory after the fact.',
        notes: 'Establishes crime of being an accessory after the fact.',
      ),
      // Title 42 - The Public Health and Welfare
      LawSection(
        titleNumber: '42',
        titleName: 'The Public Health and Welfare',
        chapterNumber: '21',
        chapterName: 'Civil Rights',
        sectionNumber: '1983',
        sectionTitle: 'Civil action for deprivation of rights',
        sectionText:
            'Every person who, under color of any statute, ordinance, regulation, custom, or usage, of any State or Territory or the District of Columbia, subjects, or causes to be subjected, any citizen of the United States or any other person within the jurisdiction thereof to the deprivation of any rights, privileges, or immunities secured by the Constitution and laws, shall be liable to the party injured in an action at law, suit in equity, or other proper proceeding for redress.',
        notes: 'Provides remedy for constitutional violations by government officials.',
      ),
      LawSection(
        titleNumber: '42',
        titleName: 'The Public Health and Welfare',
        chapterNumber: '21',
        chapterName: 'Civil Rights',
        sectionNumber: '1988',
        sectionTitle: 'Attorney\'s fees',
        sectionText:
            'In any action or proceeding to enforce a provision of sections 1981, 1983, 1985, and 1986 of this title, title IX of Public Law 92–318, or in any civil action or proceeding, by or on behalf of the United States of America, to enforce, or charging a violation of, a provision of the United States Internal Revenue Code, or title VI, title VII, title VIII, title IX of Public Law 92–318, the Voting Rights Act of 1965, the Fair Housing Act, or section 504 of the Rehabilitation Act of 1973, the court, in its discretion, may allow the prevailing party, other than the United States, a reasonable attorney\'s fee as part of the costs.',
        notes: 'Allows recovery of attorney fees in civil rights cases.',
      ),
    ];
  }

  static List<String> getTitles() {
    return [
      'Title 1 - General Provisions',
      'Title 5 - Government Organization and Employees',
      'Title 18 - Crimes and Criminal Procedure',
      'Title 26 - Internal Revenue Code',
      'Title 28 - Judiciary and Judicial Procedure',
      'Title 42 - The Public Health and Welfare',
      'Title 49 - Transportation',
    ];
  }
}
