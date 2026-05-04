package com.example.se_lab8_2;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

public class MainActivity extends AppCompatActivity {
    /** Link to the root node in the DB */
    FirebaseDatabase database; int initialID = 0;
    /** Creating a reference variable for database*/
    DatabaseReference databaseReference;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
// Login to Firebase project and get instance of the DB and point to the root node of the DB
        database = FirebaseDatabase.getInstance("https://se-lab8-database-default-rtdb.firebaseio.com/");
// Set reference to the Tasks table
        databaseReference = database.getReference("tasks");
    }

    public void addTask(View view) {
        // Read the txt from the input text
        @SuppressLint("WrongViewCast")
        EditText taskEditText = findViewById(R.id.taskDescription);
        String taskDescription = taskEditText.getText().toString(); initialID ++;
        Task newTask = new Task(String.valueOf(initialID), taskDescription);
        // Login to Firebase project and get instance of the DB and point to the root node of the DB
        database = FirebaseDatabase.getInstance("https://se-lab8-database-default-rtdb.firebaseio.com/");
                // Set reference to the Tasks table
                databaseReference = database.getReference("tasks");
        databaseReference.child(newTask.toString()).setValue(newTask);
        taskEditText.getText().clear(); // Wipe the text field when complete
    }
    public void loadData(View view) {
// Add the new task to DB
// databaseReference.child(newTask.toString()).setValue(newTask);
// Read from the database
        databaseReference.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
// This method is called once with the initial value and again
// whenever data at this location is updated.
                if (dataSnapshot.exists()) {
//Check if data read correctly and display message
                    Toast.makeText(MainActivity.this, "Successful", Toast.LENGTH_SHORT).show();
                    String datalist="";
//Looping over all children
                    for (DataSnapshot taskSnapshot : dataSnapshot.getChildren()) {
                        Task task = taskSnapshot.getValue(Task.class);
                        datalist = datalist + " " + task.getTaskID() + ". " + task.getDescription() + "\n";
                    }
                    TextView show = findViewById(R.id.dataView);
                    show.setText(datalist);
                }
            }

            @Override
            public void onCancelled(DatabaseError error) {
// Failed to read value
                Log.w("Main activity", "Failed to read value.", error.toException());
            }
        });
    }
}