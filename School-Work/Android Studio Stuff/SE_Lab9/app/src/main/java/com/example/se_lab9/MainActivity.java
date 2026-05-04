package com.example.se_lab9;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.google.android.gms.tasks.OnCompleteListener;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    /**
     * Read data from Firebase Database
     */
    //Create an instance of DatabaseReference
    FirebaseDatabase database;
    DatabaseReference databaseReference;
    private List<Task> itemsList = new ArrayList<Task>();
    ArrayAdapter<Task> itemsAdapter;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        // Login to Firebase project and get instance of the DB and point to the root
// node of the DB
        database = FirebaseDatabase.getInstance("https://se-lab8-database-default-rtdb.firebaseio.com/");
// Set reference to the Tasks table
        databaseReference = database.getReference("tasks");
        itemsAdapter = new ArrayAdapter<Task>(this, android.R.layout.simple_list_item_1, itemsList);
        ListView listView = (ListView) findViewById(R.id.simpleListView);
        listView.setAdapter(itemsAdapter);
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
                    StringBuilder datalist = new StringBuilder();
                    itemsAdapter.clear();
//Looping over all children
                    for (DataSnapshot taskSnapshot : dataSnapshot.getChildren()) {
                        Task task = taskSnapshot.getValue(Task.class);
//Setting adapter
                        itemsAdapter.add(task);
//Logging the data from database
                        Log.d("Main activity", "Task value is: " + task.getDescription());
                        datalist.append(task.getTaskID()).append(" ").append(task.getDescription()).append("\n");                    }
                    TextView show = findViewById(R.id.textView);
                    show.setText(datalist);
                    System.out.println(datalist);
                }
            }
            @Override
            public void onCancelled(DatabaseError error) {
// Failed to read value
                Log.w("Main activity", "Failed to read value.", error.toException());
            }
        });
    }
    public void search(View view) {
        DatabaseReference ref;
        EditText tskDescription = findViewById(R.id.txtTaskID);
        String taskid = tskDescription.getText().toString();
        TextView myview = findViewById(R.id.textView);
        ref = FirebaseDatabase.getInstance().getReference("tasks");
        databaseReference.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()) {
                    for (DataSnapshot taskSnapshot : dataSnapshot.getChildren()) {
                        Task task = taskSnapshot.getValue(Task.class);
                        itemsAdapter.add(task);
                    }
                }
            }
            @Override
            public void onCancelled(DatabaseError error) {
                }
            });


            ref.child(taskid).get().addOnCompleteListener(new OnCompleteListener<DataSnapshot>() {
                @Override
            public void onComplete(@NonNull com.google.android.gms.tasks.Task<DataSnapshot> task) {
                if (task.isSuccessful()) {
                    if (task.getResult().exists()) {
                        Toast.makeText(MainActivity.this, "Successful",
                                Toast.LENGTH_SHORT).show();
                        DataSnapshot mydata = task.getResult();
                        String id =
                                String.valueOf(mydata.child("taskID").getValue());
                        String des =
                                String.valueOf(mydata.child("description").getValue());
                        myview.setText(id + " " + des);
                    }
                } else {
                    Toast.makeText(MainActivity.this, "Test failed",
                            Toast.LENGTH_SHORT).show();
                }
            }

        });
    }


}