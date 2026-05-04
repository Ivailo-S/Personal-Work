package com.example.se_lab7;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.se_lab7.model.Task;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private List<Task> itemsList = new ArrayList<Task>();

    ArrayAdapter<Task> itemsAdapter;
    int numberOfTasks = 0;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);

        itemsAdapter = new ArrayAdapter<Task>(this, android.R.layout.simple_list_item_1, itemsList);
        ListView listView = (ListView) findViewById(R.id.simpleListView);
        listView.setAdapter(itemsAdapter);

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
    }

    public void addTask(View view) {
        numberOfTasks++;
        EditText editText=findViewById(R.id.txtTask);
        String currentTaskDescription = editText.getText().toString();
        Task newTask = new Task(numberOfTasks, currentTaskDescription);
        itemsAdapter.add(newTask);
    }
}