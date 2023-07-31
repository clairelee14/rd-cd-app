<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Litawards extends CI_Controller {

	public function index()
	{
        $data['heading'] = "Most Prestigious Literary Awards";
		$data['picture'] = "library.jpeg";
		$data['content'] = "<p>As an author, it's rewarding to have your work and achievements recognized.</p>
		<p>Receiving a major book award and becoming an “award-winning author” may just be the thing to launch your author career to new heights.</p>
		<p>But what are the major awards for each book category?
		We've put together a list of the best book awards out there, included links to their websites, and showcased recent winners.</p>";

		$this->load->view('includes/header', $data);
		$this->load->view('litawards_view', $data); // we need to pass the array to the view
		$this->load->view('includes/footer');
	}
	public function pulitzer()
	{
        $data['heading'] = "Pulitzer Prize";
		$data['picture'] = "pulitzer.jpeg";
		$data['content'] = "<p>Another highly prestigious award, the Pulitzer is presented by Columbia University and awarded annually. Established in 1917, the award is named after Joseph Pulitzer and continues to reign as a coveted award for distinguished writing across multiple genres.</p>
		<p>Newspaper publisher Joseph Pulitzer gave money in his will to Columbia University to launch a journalism school and establish the Pulitzer Prize. It allocated $250,000 to the prize and scholarships. He specified \"four awards in journalism, four in letters and drama, one in education, and four traveling scholarships.\"</p>
		<p>After his death on October 29, 1911, the first Pulitzer Prizes were awarded June 4, 1917 (they are now announced in April). The Chicago Tribune under the control of Colonel Robert R. McCormick felt that the Pulitzer Prize was nothing more than a 'mutual admiration society' and not to be taken seriously; the paper refused to compete for the prize during McCormick's tenure up until 1961. Until 1975, the prizes were overseen by the trustees of Columbia University.</p>";

		$this->load->view('includes/header');
		$this->load->view('litawards_view', $data); // we need to pass the array to the view
		$this->load->view('includes/footer');
	}
    public function newbery()
	{
		$data['heading'] = "John Newbery Medal";
		$data['picture'] = "newbery-medal.jpg";
		$data['content'] = "<p>In 1921 Frederic G.Melcher had the Newbery Medal designed by René Paul Chambellan. The bronze medal has the winner's name and the date engraved on the back. The American Library Association Executive Board in 1922 delegated to the Children's Librarians' Section the responsibility for selecting the book to receive the Newbery Medal.</p>

		<p>The inscription on the Newbery Medal still reads \"Children's Librarians' Section,\" although the section has changed its name four times and its membership now includes both school and public library children's librarians in contrast to the years 1922-58, when the section, under three different names, included only public library children's librarians. Today the Medal is administered by the Association for Library Service to Children, a division of ALA.</p>
		
		<p>How the Newbery Medal Came to Be
		The Newbery Medal is awarded annually by the American Library Association for the most distinguished American children's book published the previous year. On June 22, 1921, Frederic G. Melcher proposed the award to the American Library Association meeting of the Children's Librarians' Section and suggested that it be named for the eighteenth-century English bookseller John Newbery. The idea was enthusiastically accepted by the children's librarians, and Melcher's official proposal was approved by the ALA Executive Board in 1922. In Melcher's formal agreement with the board, the purpose of the Newbery Medal was stated as follows: \"To encourage original creative work in the field of books for children. To emphasize to the public that contributions to the literature for children deserve similar recognition to poetry, plays, or novels. To give those librarians, who make it their life work to serve children's reading interests, an opportunity to encourage good writing in this field.\"</p>
		
		<p>The Newbery Award thus became the first children's book award in the world. Its terms, as well as its long history, continue to make it the best known and most discussed children's book award in this country.</p>
		
		<p>From the beginning of the awarding of the Newbery and Caldecott Medals, committees could, and usually did, cite other books as worthy of attention. Such books were referred to as Newbery or Caldecott \"runners-up.\" In 1971 the term \"runners-up\" was changed to \"honor books.\" The new terminology was made retroactive so that all former runners-up are now referred to as Newbery or Caldecott Honor Books.</p>";

		$this->load->view('includes/header');
		$this->load->view('litawards_view', $data); // we need to pass the array to the view
		$this->load->view('includes/footer');
	}
	public function booker()
	{
		$data['heading'] = "Booker Prize";
		$data['picture'] = "booker.webp";
		$data['content'] = "<p>The Booker Prize, formerly known as the Booker Prize for Fiction (1969-2001) and the Man Booker Prize (2002-2019), is a literary prize awarded each year for the best novel written in English and published in the United Kingdom or Ireland. The winner of the Booker Prize receives international publicity which usually leads to a sales boost. When the prize was created, only novels written by Commonwealth, Irish, and South African (and later Zimbabwean) citizens were eligible to receive the prize; in 2014 it was widened to any English-language novel—a change that proved controversial.</p>

		<p>A five-person panel constituted by authors, librarians, literary agents, publishers, and booksellers is appointed by the Booker Prize Foundation each year to choose the winning book.</p>
		
		<p>A high-profile literary award in British culture, the Booker Prize is greeted with anticipation and fanfare.[6] Literary critics have noted that it is a mark of distinction for authors to be selected for inclusion in the shortlist or to be nominated for the \"longlist\".</p>
		
		<p>A sister prize, the International Booker Prize, is awarded for a book translated into English and published in the United Kingdom or Ireland. The £50,000 prize money is split evenly between the author and translator of the winning novel.</p>";

		$this->load->view('includes/header');
		$this->load->view('litawards_view', $data); // we need to pass the array to the view
		$this->load->view('includes/footer');
	}
	public function nobel()
	{
        $data['heading'] = "Nobel Prize in Literature";
		$data['picture'] = "nobel-prize.jpeg";
		$data['content'] = "<p>The Nobel Prize in Literature (here meaning for literature; Swedish: Nobelpriset i litteratur) is a Swedish literature prize that is awarded annually, since 1901, to an author from any country who has, in the words of the will of Swedish industrialist Alfred Nobel, \"in the field of literature, produced the most outstanding work in an idealistic direction\" (original Swedish: den som inom litteraturen har producerat det utmärktaste i idealisk rigtning).</p>
		<p>Though individual works are sometimes cited as being particularly noteworthy, the award is based on an author's body of work as a whole. The Swedish Academy decides who, if anyone, will receive the prize. The academy announces the name of the laureate in early October.</p>
		<p>It is one of the five Nobel Prizes established by the will of Alfred Nobel in 1895. Literature is traditionally the final award presented at the Nobel Prize ceremony. On some occasions the award has been postponed to the following year, most recently in 2018 as of May 2022.</p>";

		$this->load->view('includes/header');
		$this->load->view('litawards_view', $data); // we need to pass the array to the view
		$this->load->view('includes/footer');
	}
}