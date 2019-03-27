package com.Server;

import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

public class QuestionServer {

    // connection variable
    private Connection connection;

    // question variable for post and delete
    private Question question = new Question();
    // question array
    ArrayList<Question> questions = new ArrayList<>();
    ArrayList<Written> writtens = new ArrayList<>();
    ArrayList<Practical> practicals = new ArrayList<>();
    ArrayList<Mcq> mcqs = new ArrayList<>();

    // question variable for post and delete
    Written written = new Written();
    Practical practical = new Practical();
    Mcq mcq = new Mcq();

    public QuestionServer(Connection connection) {

        // initialise connection variable
        this.connection = connection;
    }

    public ArrayList<Question> get() {

        // question array
        ArrayList<Question> questions = new ArrayList<>();

        try {

            // get database variables
            Statement statement = connection.createStatement();

            // query
            String query = "SELECT * FROM public.question";

            // execute statement
            ResultSet set = statement.executeQuery(query);

            while(set.next()) {

                // Question class variable
                Question question = new Question();

                // set variables
                question.setLecturerId(set.getString("lecturer_id"));
                question.setQuestionType(set.getString("question_type"));
                question.setQuestionBody(set.getString("question_body"));
                question.setQuestionAns(set.getString("question_ans"));
                question.setQuestionDifficulty(set.getString("question_difficulty"));
                question.setQuestionDate(set.getDate("question_date"));
                question.setQuestionLastUsed(set.getDate("question_last_used"));
                question.setQuestionVariance(set.getInt("question_variance"));
                question.setQuestionMark(set.getInt("question_mark"));

                // add to array list
                questions.add(question);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return questions;
    }

    //post method for written question
    public boolean post(Written q) {

        // TODO create-question form passes in a question variable
        // TODO if successful return true, if true redirect to question view

        // parameters
        String questionBody = q.getQuestionBody();
        String questionAns = q.getQuestionAns();
        String questionType = q.getQuestionType();
        String questionDiff = "Easy";
        int questionMark = q.getQuestionMark();
        int questionVar = 0;
        int question_line = q.question_line;
        Date question_lastused = q.getQuestionLastUsed();
        String lecturerID = q.getLecturerId();
        Random random = new Random();
        int qId = random.nextInt(1000);
        Random random1 = new Random();
        int written_question_id = random.nextInt(1000);

        try {
           /* String query = "INSERT INTO public.question(question_id, lecturer_id, question_type, question_body, question_ans, question_difficulty, question_date, question_last_used, question_variance, question_mark)" +
                    "VALUES (?,?,?,?,?,?,now(),now(),?,?)";*/
            String query1 = "INSERT INTO public.written_question(question_id, lecturer_id, question_type, question_body, question_ans, question_difficulty, question_date, question_last_used, question_variance, question_mark,question_lines,written_question_id)" +
                    "VALUES (?,?,?,?,?,?,now(),now(),?,?,?,?)";


            // statement
           /* PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, qId);
            statement.setString(2,lecturerID);
            statement.setString(3,questionType);
            statement.setString(4,questionBody);
            statement.setString(5, questionAns);
            statement.setString(6,questionDiff);
            statement.setInt(7,questionVar);
            statement.setInt(8, questionMark);*/

            PreparedStatement statement1 = connection.prepareStatement(query1);
            statement1.setInt(1, qId);
            statement1.setString(2,lecturerID);
            statement1.setString(3,questionType);
            statement1.setString(4,questionBody);
            statement1.setString(5, questionAns);
            statement1.setString(6,questionDiff);
            statement1.setInt(7,questionVar);
            statement1.setInt(8, questionMark);
            statement1.setInt(9,question_line);
            statement1.setInt(10,written_question_id);


            int set1 = statement1.executeUpdate();
           // int set = statement.executeUpdate();


            // if result inserted set > 0 "1 rows affected" - sql thing
            return set1 > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }

    }
    //post method for practical
    public boolean post(Practical q) {

        // TODO create-question form passes in a question variable
        // TODO if successful return true, if true redirect to question view

        // parameters
        String questionBody = q.getQuestionBody();
        String questionAns = q.getQuestionAns();
        String questionType = q.getQuestionType();
        String questionDiff = "Easy";
        int questionMark = q.getQuestionMark();
        int questionVar = 0;
        String sample_input =  q.sample_input;
        String sample_output = q.sample_output;
        Date question_lastused = q.getQuestionLastUsed();
        String lecturerID = q.getLecturerId();
        Random random = new Random();
        int qId = random.nextInt(1000);
        Random random1 = new Random();
        int pq_id = random.nextInt(1000);

        try {
          /*  String query = "INSERT INTO public.question(question_id, lecturer_id, question_type, question_body, question_ans, question_difficulty, question_date, question_last_used, question_variance, question_mark)" +
                    "VALUES (?,?,?,?,?,?,now(),now(),?,?)";*/
            String query1 = "INSERT INTO public.practical_question(question_id, lecturer_id, question_type, question_body, question_ans, question_difficulty, question_date, question_last_used, question_variance, question_mark,sample_input,sample_output,pq_id)" +
                    "VALUES (?,?,?,?,?,?,now(),now(),?,?,?,?,?)";


            // statement
           /* PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, qId);
            statement.setString(2,lecturerID);
            statement.setString(3,questionType);
            statement.setString(4,questionBody);
            statement.setString(5, questionAns);
            statement.setString(6,questionDiff);
            statement.setInt(7,questionVar);
            statement.setInt(8, questionMark);*/

            PreparedStatement statement1 = connection.prepareStatement(query1);
            statement1.setInt(1, qId);
            statement1.setString(2,lecturerID);
            statement1.setString(3,questionType);
            statement1.setString(4,questionBody);
            statement1.setString(5, questionAns);
            statement1.setString(6,questionDiff);
            statement1.setInt(7,questionVar);
            statement1.setInt(8, questionMark);
            statement1.setString(9,sample_input);
            statement1.setString(10,sample_output);
            statement1.setInt(11,pq_id);


            int set1 = statement1.executeUpdate();
           // int set = statement.executeUpdate();


            // if result inserted set > 0 "1 rows affected" - sql thing
            return set1 > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }

    }
    //post method for mcq
    public boolean post(Mcq q) {

        // TODO create-question form passes in a question variable
        // TODO if successful return true, if true redirect to question view

        // parameters
        String questionBody = q.getQuestionBody();
        String questionAns = q.getQuestionAns();
        String questionType = q.getQuestionType();
        String questionDiff = "Easy";
        int questionMark = q.getQuestionMark();
        int questionVar = 0;
        String mcq_choices = q.mcq_choices;
        Date question_lastused = q.getQuestionLastUsed();
        String lecturerID = q.getLecturerId();
        Random random = new Random();
        int qId = random.nextInt(1000);
        Random random1 = new Random();
        int mcq_id = random.nextInt(1000);

        try {
          /*  String query = "INSERT INTO public.question(question_id, lecturer_id, question_type, question_body, question_ans, question_difficulty, question_date, question_last_used, question_variance, question_mark)" +
                    "VALUES (?,?,?,?,?,?,now(),now(),?,?)";*/
            String query1 = "INSERT INTO public.mcq_question(question_id, lecturer_id, question_type, question_body, question_ans, question_difficulty, question_date, question_last_used, question_variance, question_mark,mcq_choices,mcq_id)" +
                    "VALUES (?,?,?,?,?,?,now(),now(),?,?,?,?)";


            // statement
           /* PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, qId);
            statement.setString(2,lecturerID);
            statement.setString(3,questionType);
            statement.setString(4,questionBody);
            statement.setString(5, questionAns);
            statement.setString(6,questionDiff);
            statement.setInt(7,questionVar);
            statement.setInt(8, questionMark);*/

            PreparedStatement statement1 = connection.prepareStatement(query1);
            statement1.setInt(1, qId);
            statement1.setString(2,lecturerID);
            statement1.setString(3,questionType);
            statement1.setString(4,questionBody);
            statement1.setString(5, questionAns);
            statement1.setString(6,questionDiff);
            statement1.setInt(7,questionVar);
            statement1.setInt(8, questionMark);
            statement1.setString(9,mcq_choices);
            statement1.setInt(10,mcq_id);


            int set1 = statement1.executeUpdate();
            // int set = statement.executeUpdate();


            // if result inserted set > 0 "1 rows affected" - sql thing
            return set1 > 0;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return false;
        }

    }

    //get
    public Question getQuestion() {
        return this.question;
    }
    public Question getWritten() {
        return this.written;
    }
    public Question getPractical() {
        return this.practical;
    }
    public Question getMcq() {
        return this.mcq;
    }


    public class Question {

        // attributes
        private String lecturer_id;
        private String question_type;
        private String question_body;
        private String question_ans;
        private String question_difficulty;
        private Date question_date;
        private Date question_last_used;
        private int question_variance;
        private int question_mark;

        public String getLecturerId() {
            return lecturer_id;
        }

        public String getQuestionType() {
            return question_type;
        }

        public String getQuestionBody() {
            return question_body;
        }

        public String getQuestionAns() {
            return question_ans;
        }

        public String getQuestionDifficulty() {
            return question_difficulty;
        }

        public Date getQuestionDate() {
            return question_date;
        }

        public Date getQuestionLastUsed() {
            return question_last_used;
        }

        public int getQuestionVariance() {
            return question_variance;
        }

        public int getQuestionMark() {
            return question_mark;
        }

        public void setLecturerId(String lecture_id) {
            this.lecturer_id = lecture_id;
        }

        public void setQuestionType(String question_type) {
            this.question_type = question_type;
        }

        public void setQuestionBody(String question_body) {
            this.question_body = question_body;
        }

        public void setQuestionAns(String question_ans) {
            this.question_ans = question_ans;
        }

        public void setQuestionDifficulty(String question_difficulty) {
            this.question_difficulty = question_difficulty;
        }

        public void setQuestionDate(Date question_date) {
            this.question_date = question_date;
        }

        public void setQuestionLastUsed(Date question_last_used) {
            this.question_last_used = question_last_used;
        }

        public void setQuestionVariance(int question_variance) {
            this.question_variance = question_variance;
        }

        public void setQuestionMark(int question_mark) {
            this.question_mark = question_mark;
        }
    }

    //model for written question
    public class Written extends Question{

        //attributes
        private int question_line;
        //accessors
        public int getQuestion_line() {
            return question_line;
        }
        public void setQuestion_line(int question_line) {
            this.question_line = question_line;
        }
    }
    //model for practical question
    public class Practical extends Question{

        //attributes
        private String sample_input;
        private String sample_output;
        //accessors
        public String getSample_input() { return sample_input;}
        public void setSample_input(String sample_input) {
            this.sample_input = sample_output;
        }

        public String getSample_output() { return sample_output;}
        public void setSample_output(String sample_input) {
            this.sample_output = sample_output;
        }
    }
    //model for mcq question
    public class Mcq extends Question{

        //attributes
        private String mcq_choices;
        //accessors
        public String getMcq_choices() { return mcq_choices;}
        public void setMcq_choices(String sample_input) {
            this.mcq_choices = mcq_choices;
        }
    }
}
