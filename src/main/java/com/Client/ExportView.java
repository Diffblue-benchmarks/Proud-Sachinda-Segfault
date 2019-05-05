package com.Client;

import com.Dashboard;
import com.Objects.QuestionItem;
import com.Server.QuestionServer;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfName;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.vaadin.navigator.Navigator;
import com.vaadin.navigator.View;
import com.vaadin.navigator.ViewChangeListener;
import com.vaadin.ui.*;
import com.Server.ExportServer;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.util.ArrayList;

public class ExportView extends HorizontalLayout implements View {

    // navigator used to redirect to another page
    private Navigator navigator;

    // connection for database
    private Connection connection;

    // route strings - nothing special just things like qbank_exploded_war/route_name
    protected final String question = "question";
    protected final String course = "course";
    protected final String export = "export";

    // navigation and content area
    final VerticalLayout navigation = new VerticalLayout();
    final VerticalLayout content = new VerticalLayout();
    final HorizontalLayout coursecode = new HorizontalLayout();
    final HorizontalLayout topicname = new HorizontalLayout();
    final HorizontalLayout date = new HorizontalLayout();
    final HorizontalLayout yos = new HorizontalLayout();
    final HorizontalLayout degree = new HorizontalLayout();
    final HorizontalLayout faculties = new HorizontalLayout();
    final HorizontalLayout internalexaminer = new HorizontalLayout();
    final HorizontalLayout externalexaminer = new HorizontalLayout();
    final HorizontalLayout material = new HorizontalLayout();
    final HorizontalLayout time = new HorizontalLayout();
    final HorizontalLayout topic = new HorizontalLayout();
    final HorizontalLayout instructions= new HorizontalLayout();
    final HorizontalLayout mark= new HorizontalLayout();
    final Label lblcoursecode = new Label("Course of Topic No(s)");
    final Label lbltopicname = new Label("Course or topic name(s)\n" +
            "Paper Number & title");
    final Label lbldate = new Label("Test to be\n" +
            "held during the months(s) of");
    final Label lblyos = new Label("Year of Study");
    final Label lbldegree = new Label("Degrees/Diplomas for which\n" +
            "this course is prescribed");
    final Label lblfaculties = new Label("Faculty/ies presenting\n" +
            "candidates");
    final Label lblinternalexaminer = new Label("Internal examiner(s)\n" +
            "and telephone extension\n" +
            "number(s)");
    final Label lblexternalexaminer = new Label("External examiner(s)");
    final Label lblmaterial = new Label("Special materials required");
    final Label lbltime = new Label("Time allowance");
    final Label lblinstructions= new Label("Instructions");
    final Label lblmark= new Label("Mark");
    final TextField txtcoursecode= new TextField();
    final TextField txttopicname= new TextField();
    final TextField txtdate= new TextField();
    final TextField txtyos= new TextField();
    final TextField txtdegree= new TextField();
    final TextField txtfaculties= new TextField();
    final TextField txtinternalexaminer= new TextField();
    final TextField txtexternalexaminer= new TextField();
    final TextField txtmaterial= new TextField();
    final TextField txttime= new TextField();
    final TextField txtmark= new TextField();
    final TextArea txtinstructions= new TextArea();
    final Button exe = new Button("export");


    public ExportView(Navigator navigator, Connection connection) {

        // we get the Apps Navigator object
        this.navigator = navigator;

        // set connection variable
        this.connection = connection;

        // set to fill browser screen
        setSizeFull();



        //click listener

        exe.addClickListener(new Button.ClickListener() {
            @Override
            public void buttonClick(Button.ClickEvent clickEvent) {
               // ExportServer trackServer = new ExportServer(connection);
                System.out.println("are you coming");
                ArrayList<String> Q = new ArrayList<String>();
                ArrayList<ExportServer.Track> tracks= retreivetracks();
                for(int i=0;i<tracks.size();i++){

                QuestionItem q = retreivequestion(tracks.get(i));
                String qbody = q.getQuestionBody();
                    Q.add(qbody);
                System.out.println(qbody);
                }

                CreatePDF(Q);
                Notification.show(" File saved in C:// Users// Public");


            }
        });
        // set up dashboard
        Dashboard dashboard = new Dashboard(navigator);
        addComponent(dashboard);

        //add components under each respective layout
        coursecode.addComponents(lblcoursecode,txtcoursecode);
        topic.addComponents(lbltopicname,txttopicname);
        date.addComponents(lbldate,txtdate);
        yos.addComponents(lblyos,txtyos);
        degree.addComponents(lbldegree,txtdegree);
        faculties.addComponents(lblfaculties,txtfaculties);
        internalexaminer.addComponents(lblinternalexaminer,txtinternalexaminer);
        externalexaminer.addComponents(lblexternalexaminer,txtexternalexaminer);
        material.addComponents(lblmaterial,txtmaterial);
        time.addComponents(lbltime,txttime);
        mark.addComponents(lblmark,txtmark);
        instructions.addComponents(lblinstructions,txtinstructions);
        content.addComponents(coursecode,topic,date,yos,degree,faculties,internalexaminer,externalexaminer,mark,material,time,instructions);

        // set content area
        //content.addComponent(exe);
        content.setSizeFull();
        addComponentsAndExpand(content,exe);
    }

    //methodfor retrieving question
    public QuestionItem retreivequestion(ExportServer.Track t){
        int id=t.getQuestionId();
        QuestionServer questionServer = new QuestionServer(connection);
        return questionServer.getQuestionItemById(id);
    }
    //method for retreiving tracks
    public ArrayList<ExportServer.Track> retreivetracks(){
        ExportServer exportServer = new ExportServer(connection);
        ArrayList<ExportServer.Track> tracks=exportServer.get(27);
        System.out.println("im here");
        return tracks;
    }

    @Override
    public void enter(ViewChangeListener.ViewChangeEvent event) {
        // Notification.show("Export View");
    }

    public PdfPCell getCell(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorder(PdfPCell.NO_BORDER);
        return cell;
    }
    public PdfPCell getCell2(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }

    public PdfPCell getCell3(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }

    public PdfPCell getCell4(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }
    public PdfPCell getCell5(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }
    public PdfPCell getCell6(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }
    public PdfPCell getCell7(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }
    public PdfPCell getCell8(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }
    public PdfPCell getCell9(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }
    public PdfPCell getCell10(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }
    public PdfPCell getCell11(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }

    public PdfPCell getCell12(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }
    public PdfPCell getCell13(String text, int alignment) {
        PdfPCell cell = new PdfPCell(new Phrase(text));
        cell.setPadding(0);
        cell.setHorizontalAlignment(alignment);
        cell.setBorderColor(BaseColor.BLACK);
        return cell;
    }

    public void CreatePDF(ArrayList<String> questions){


        Document document = new Document();
        PdfName pdfName = new PdfName(txttopicname.getValue() + txtdate.getValue());
        document.addTitle(pdfName.toString());
        try
        {
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("C:\\Users\\Public\\" + pdfName + ".pdf"));
            document.open();
            PdfPTable table = new PdfPTable(2);
            table.setWidthPercentage(50);
            table.setPaddingTop(100);
            table.setTotalWidth(100);
            table.setHorizontalAlignment(100);

            //code for creating exam page
            table.addCell(getCell(lblcoursecode.getValue() + ": ", PdfPCell.ALIGN_LEFT));
            table.addCell(getCell(txtcoursecode.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell2(lbltopicname.getValue() + ": ", PdfPCell.ALIGN_LEFT));
            table.addCell(getCell2(txttopicname.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell3(lbldate.getValue() + ": ", PdfPCell.ALIGN_LEFT));
            table.addCell(getCell3(txtdate.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell4(lblyos.getValue(), PdfPCell.ALIGN_LEFT));
            table.addCell(getCell4(txtyos.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell5(lbldegree.getValue(), PdfPCell.ALIGN_LEFT));
            table.addCell(getCell5(txtdegree.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell6(lblfaculties.getValue(),PdfPCell.ALIGN_LEFT));
            table.addCell(getCell6(txtfaculties.getValue(),PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell7(lblinternalexaminer.getValue(), PdfPCell.ALIGN_LEFT));
            table.addCell(getCell7(txtinternalexaminer.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell8(lblexternalexaminer.getValue(), PdfPCell.ALIGN_LEFT));
            table.addCell(getCell8(txtexternalexaminer.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell10(lblmaterial.getValue(), PdfPCell.ALIGN_LEFT));
            table.addCell(getCell10(txtmaterial.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell11(lbltime.getValue(), PdfPCell.ALIGN_LEFT));
            table.addCell(getCell11(txttime.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell12(lblmark.getValue(), PdfPCell.ALIGN_LEFT));
            table.addCell(getCell12(txtmark.getValue(), PdfPCell.ALIGN_MIDDLE));
            table.addCell(getCell13(lblinstructions.getValue(), PdfPCell.ALIGN_LEFT));
            table.addCell(getCell13(txtinstructions.getValue(), PdfPCell.ALIGN_MIDDLE));
            document.add(table);




            //adds questions to paper
            for(int i =0 ; i < questions.size(); i++){

                document.newPage();
                document.add(new Paragraph(questions.get(i) + " "));

            }


            document.close();
            writer.close();
        } catch (DocumentException e)
        {
            e.printStackTrace();
        } catch (FileNotFoundException e)
        {
            System.out.println(e.toString());
            e.printStackTrace();
        }
    }
}
