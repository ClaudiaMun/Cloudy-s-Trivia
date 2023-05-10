//
//  TriviaViewController.swift
//  Cloudy's Trivia


import UIKit

class TriviaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var gameModels = [Question]()
    var nowQuestion: Question?
  
    @IBAction func endTrivia(){
        let vc = storyboard?.instantiateViewController(identifier: "end") as! EndViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    
    @IBOutlet var label: UILabel!
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        allQuestions()
        configureUI(question: gameModels.first!)
    }
    
   private func configureUI(question: Question){
        label.text = question.text
        nowQuestion = question
        table.reloadData()
    }
    
    private func checkCorrect(answer: Answer, question: Question) -> Bool {
        return question.answers.contains(where: { $0.text == answer.text}) && answer.correct
    }
    
    private func allQuestions(){
        gameModels.append(Question(text: "The Flintstones is one of the most popular cartoons in history, but which period is the series based?", answers: [
            Answer(text: "Iron Age", correct: false),
            Answer(text: "Stone Age", correct: true),
            Answer(text: "Bronze Age", correct: false),
            Answer(text: "Ice Age", correct: false),
        ]))
        
        gameModels.append(Question(text: "Who is the antagonist in the “Lion King”?", answers: [
            Answer(text: "Mufasa", correct: false),
            Answer(text: "Simba", correct: false),
            Answer(text: "Scar", correct: true),
            Answer(text: "Zazu", correct: false),
        ]))
        
        gameModels.append(Question(text: "Which cartoon character serves as the official mascot for Warner Bros Entertainment?", answers: [
            Answer(text: "Bugs Bunny", correct: true),
            Answer(text: "Daffy Duck", correct: false),
            Answer(text: "Donald Duck", correct: false),
            Answer(text: "Thumper", correct: false),
        ]))
        
        gameModels.append(Question(text: "Anger criticizes which city for ruining pizza in the cartoon “Inside Out”?", answers: [
            Answer(text: "Miami", correct: false),
            Answer(text: "Seattle", correct: false),
            Answer(text: "San Francisco", correct: true),
            Answer(text: "Boston", correct: false),
        ]))
        
        
        gameModels.append(Question(text: "What are the three names of the Powerpuff Girls?", answers: [
            Answer(text: "Buttercup, Flower, Bubbles", correct: false),
            Answer(text: "Stacy, Butter, Waters", correct: false),
            Answer(text: "Bubbles, Buttercup, Blossom", correct: true),
            Answer(text: "Rosie, Barbara, Keara", correct: false),
        ]))
        
        gameModels.append(Question(text: "Who is Bambi’s love interest?", answers: [
            Answer(text: "Lala", correct: false),
            Answer(text: "Faline", correct: true),
            Answer(text: "Jasmine", correct: false),
            Answer(text: "Flower", correct: false),
        ]))
        
        gameModels.append(Question(text: "What did Peter leave behind in Wendy’s room in the film Peter Pan?", answers: [
            Answer(text: "His shoe", correct: false),
            Answer(text: "Neverland", correct: false),
            Answer(text: "Necklace", correct: false),
            Answer(text: "His own shadow", correct: true),
        ]))
        
        gameModels.append(Question(text: "In the movie Monsters Incorporated, what is the slogan for the company?", answers: [
            Answer(text: "We scare because we care", correct: true),
            Answer(text: "Let them fear us", correct: false),
            Answer(text: "We care so we scare", correct: false),
            Answer(text: "We don't care if we scare", correct: false),
        ]))
        
        gameModels.append(Question(text: "In Tiny Toons, there is a girl who is obsessed with petting and chasing animals. She also wears a skull bow in her hair. What is her name?", answers: [
            Answer(text: "Elmyra", correct: true),
            Answer(text: "Shaina", correct: false),
            Answer(text: "Cely", correct: false),
            Answer(text: "Rosie", correct: false),
        ]))
        
        gameModels.append(Question(text: "The piece of sky that fell in Chicken Little’s room was what shape?", answers: [
            Answer(text: "Circle", correct: false),
            Answer(text: "Pentagon", correct: false),
            Answer(text: "Sqaure", correct: false),
            Answer(text: "Octagon", correct: true),
        ]))
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nowQuestion?.answers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = nowQuestion?.answers[indexPath.row].text
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let question = nowQuestion else {
            return
        }
        
        let answer = question.answers[indexPath.row]
                
        if checkCorrect(answer: answer, question: question){
            //right
            if let index = gameModels.firstIndex(where: { $0.text == question.text}){
                if index < (gameModels.count - 1){
                    //continues game
                    let nextQuestion = gameModels[index+1]
                    //print("\(nextQuestion.text)")
                    nowQuestion = nil
                    configureUI(question: nextQuestion)
                }
                
                else{
                    //end
                    let alert = UIAlertController(title: "End", message:"You did it!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
                    present(alert, animated: true)
                    
                }
            }
        }
        
        else {
            //wrong
            let alert = UIAlertController(title: "WRONG", message:"Wow, you didn't know this?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Back", style: .cancel, handler: nil))
            present(alert, animated: true)
        }
    }
}

    
    struct Question{
        let text: String
        let answers: [Answer]
    }
    
    struct Answer {
        let text: String
        let correct: Bool //true /false
    }
