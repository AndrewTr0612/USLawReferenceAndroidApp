import '../database/database_helper.dart';

class SampleData {
  static List<LegalTerm> getSampleTerms() {
    return [
      LegalTerm(
        term: 'Statute',
        definition:
            'A law passed by a legislative body. In the United States, statutes are laws enacted by Congress or state legislatures.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Tort',
        definition:
            'A wrongful act or infringement of a right (other than under contract) leading to civil legal liability.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Plaintiff',
        definition:
            'A person who initiates a lawsuit. The plaintiff is the party who brings a case against another party.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Defendant',
        definition:
            'A person or party being sued or accused in a court of law. The party against whom a claim is made.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Jurisdiction',
        definition:
            'The power and authority given to a court to hear and decide on legal cases. Also refers to the geographical area within which authority may be exercised.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Liability',
        definition:
            'Legal responsibility for ones actions or omissions. The state of being responsible or obligated in law.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Subpoena',
        definition:
            'A court order requiring a person to testify in court or before a judicial officer or to produce documents.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Habeas Corpus',
        definition:
            'Latin term meaning "you have the body". A fundamental right allowing a person to challenge unlawful detention.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Amendment',
        definition:
            'A formal change or addition made to a law, statute, or document. The first ten amendments to the U.S. Constitution are known as the Bill of Rights.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Indictment',
        definition:
            'A formal charge or accusation of a serious crime issued by a grand jury based upon probable cause.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Perjury',
        definition:
            'The act of wilfully telling a lie while under oath in a judicial proceeding or before an authorized official.',
        uscode: 'https://uscode.house.gov',
      ),
      LegalTerm(
        term: 'Arbitration',
        definition:
            'A method of dispute resolution in which a neutral third party (arbitrator) hears evidence and makes a binding decision.',
        uscode: 'https://uscode.house.gov',
      ),
    ];
  }
}
