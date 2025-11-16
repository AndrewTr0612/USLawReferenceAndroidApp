import '../database/database_helper.dart';

/// Constitutional Data - Constitution of the United States
class ConstitutionalData {
  static List<LawSection> getConstitutionalSections() {
    return [
      // Preamble
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Preamble',
        chapterNumber: 'Preamble',
        chapterName: 'Founding Document',
        sectionNumber: 'Preamble',
        sectionTitle: 'We the People',
        sectionText: 'We the People of the United States, in Order to form a more perfect Union, establish Justice, insure domestic Tranquility, provide for the common defence, promote the general Welfare, and secure the Blessings of Liberty to ourselves and our Posterity, do ordain and establish this Constitution for the United States of America.',
        lastUpdated: DateTime(1787, 9, 17),
      ),
      
      // Article I - Legislative Branch
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Article I',
        chapterNumber: 'Art. I',
        chapterName: 'Legislative Department',
        sectionNumber: '1',
        sectionTitle: 'Legislative Powers',
        sectionText: 'All legislative Powers herein granted shall be vested in a Congress of the United States, which shall consist of a Senate and House of Representatives.',
        lastUpdated: DateTime(1788, 6, 21),
      ),
      
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Article I',
        chapterNumber: 'Art. I',
        chapterName: 'Legislative Department',
        sectionNumber: '8',
        sectionTitle: 'Powers of Congress',
        sectionText: 'The Congress shall have Power: To lay and collect Taxes; To regulate Commerce with foreign Nations, and among the several States; To coin Money; To establish Post Offices; To declare War; To raise and support Armies; To provide and maintain a Navy; And To make all Laws which shall be necessary and proper for carrying into Execution the foregoing Powers.',
        lastUpdated: DateTime(1788, 6, 21),
      ),
      
      // Article II - Executive Branch
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Article II',
        chapterNumber: 'Art. II',
        chapterName: 'Executive Department',
        sectionNumber: '1',
        sectionTitle: 'Executive Power',
        sectionText: 'The executive Power shall be vested in a President of the United States of America. No Person except a natural born Citizen shall be eligible to the Office of President; neither shall any person be eligible who shall not have attained to the Age of thirty five Years.',
        lastUpdated: DateTime(1788, 6, 21),
      ),
      
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Article II',
        chapterNumber: 'Art. II',
        chapterName: 'Executive Department',
        sectionNumber: '2',
        sectionTitle: 'Presidential Powers',
        sectionText: 'The President shall be Commander in Chief of the Army and Navy. He shall have Power, by and with the Advice and Consent of the Senate, to make Treaties; and he shall appoint Ambassadors, Judges of the supreme Court, and all other Officers of the United States.',
        lastUpdated: DateTime(1788, 6, 21),
      ),
      
      // Article III - Judicial Branch
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Article III',
        chapterNumber: 'Art. III',
        chapterName: 'Judicial Department',
        sectionNumber: '1',
        sectionTitle: 'Judicial Power',
        sectionText: 'The judicial Power of the United States, shall be vested in one supreme Court, and in such inferior Courts as the Congress may from time to time ordain and establish. The Judges shall hold their Offices during good Behaviour.',
        lastUpdated: DateTime(1788, 6, 21),
      ),
      
      // Bill of Rights
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Amendment I',
        chapterNumber: 'Bill of Rights',
        chapterName: 'First Ten Amendments',
        sectionNumber: 'I',
        sectionTitle: 'Religion, Speech, Press, Assembly',
        sectionText: 'Congress shall make no law respecting an establishment of religion, or prohibiting the free exercise thereof; or abridging the freedom of speech, or of the press; or the right of the people peaceably to assemble, and to petition the government for a redress of grievances. Ratified: December 15, 1791',
        lastUpdated: DateTime(1791, 12, 15),
      ),
      
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Amendment II',
        chapterNumber: 'Bill of Rights',
        chapterName: 'First Ten Amendments',
        sectionNumber: 'II',
        sectionTitle: 'Right to Bear Arms',
        sectionText: 'A well regulated Militia, being necessary to the security of a free state, the right of the people to keep and bear Arms, shall not be infringed. Ratified: December 15, 1791',
        lastUpdated: DateTime(1791, 12, 15),
      ),
      
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Amendment IV',
        chapterNumber: 'Bill of Rights',
        chapterName: 'First Ten Amendments',
        sectionNumber: 'IV',
        sectionTitle: 'Search and Seizure',
        sectionText: 'The right of the people to be secure in their persons, houses, papers, and effects, against unreasonable searches and seizures, shall not be violated. Ratified: December 15, 1791',
        lastUpdated: DateTime(1791, 12, 15),
      ),
      
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Amendment V',
        chapterNumber: 'Bill of Rights',
        chapterName: 'First Ten Amendments',
        sectionNumber: 'V',
        sectionTitle: 'Due Process',
        sectionText: 'No person shall be compelled in any criminal case to be a witness against himself, nor be deprived of life, liberty, or property, without due process of law; nor shall private property be taken for public use, without just compensation. Ratified: December 15, 1791',
        lastUpdated: DateTime(1791, 12, 15),
      ),
      
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Amendment VI',
        chapterNumber: 'Bill of Rights',
        chapterName: 'First Ten Amendments',
        sectionNumber: 'VI',
        sectionTitle: 'Criminal Prosecutions',
        sectionText: 'In all criminal prosecutions, the accused shall enjoy the right to a speedy and public trial, by an impartial jury; and to have the Assistance of Counsel for his defense. Ratified: December 15, 1791',
        lastUpdated: DateTime(1791, 12, 15),
      ),
      
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Amendment XIV',
        chapterNumber: 'Reconstruction',
        chapterName: 'Post-Civil War',
        sectionNumber: 'XIV',
        sectionTitle: 'Equal Protection',
        sectionText: 'All persons born or naturalized in the United States are citizens. No State shall deprive any person of life, liberty, or property, without due process of law; nor deny to any person within its jurisdiction the equal protection of the laws. Ratified: July 9, 1868',
        lastUpdated: DateTime(1868, 7, 9),
      ),
      
      LawSection(
        titleNumber: 'Constitution',
        titleName: 'Amendment XIX',
        chapterNumber: 'Progressive Era',
        chapterName: 'Early 20th Century',
        sectionNumber: 'XIX',
        sectionTitle: 'Womens Suffrage',
        sectionText: 'The right of citizens of the United States to vote shall not be denied or abridged by the United States or by any State on account of sex. Ratified: August 18, 1920',
        lastUpdated: DateTime(1920, 8, 18),
      ),
    ];
  }
}
