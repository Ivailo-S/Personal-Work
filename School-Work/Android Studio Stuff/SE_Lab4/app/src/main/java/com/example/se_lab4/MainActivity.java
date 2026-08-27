package com.example.se_lab4;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import java.util.ArrayList;
import java.util.Random;

public class MainActivity extends AppCompatActivity {

    private Button buttonGenerate;
    private ArrayList<String> quoteList;

    private ArrayList<String> displayedQuotes;

    private ArrayAdapter<String> quoteAdapter;

    @Override

    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        // And here's where all our quotes are:
        quoteList = new ArrayList<>();
        quoteList.add("The best way to predict the future is to invent it. – Alan Kay");
        quoteList.add("Code is like humor. When you have to explain it, it’s bad. – Cory House");
        quoteList.add("Simplicity is the soul of efficiency. – Austin Freeman");
        quoteList.add("First, solve the problem. Then, write the code. – John Johnson");
        quoteList.add("Experience is the name everyone gives to their mistakes. – Oscar Wilde");
        quoteList.add("Hideo game. – Hideo Kojima");

        // And for the ListView display to not immediately show the list above:
        displayedQuotes = new ArrayList<>();

        quoteAdapter = new ArrayAdapter<String>(this,
                android.R.layout.simple_list_item_1, displayedQuotes);
        ListView quoteView = findViewById(R.id.quoteView); // In order to actually get the ListView to cooperate
        quoteView.setAdapter(quoteAdapter);
    }
    // Now: for the button to randomly pick one of the above:
    public void GenerateRandomQuote (View view) {
        ListView getNewQuote = findViewById(R.id.quoteView);
        Random random = new Random(); // What an insane line of code
        int index = random.nextInt(quoteList.size()); // Literally just restrict the randomizer to however long the quote array is
        String randomQuote = quoteList.get(index);
        quoteAdapter.add(randomQuote);
    }

    // Next part: Making it so that you are able to add new quotes
    // (Just a rehash from the previous lab, with a few key differences)
    public void addQuotes(View view) {
        EditText getNewItem = (EditText) findViewById(R.id.newItemField);
        String itemText = getNewItem.getText().toString();
        quoteList.add(itemText);
        getNewItem.setText("");
    }

}