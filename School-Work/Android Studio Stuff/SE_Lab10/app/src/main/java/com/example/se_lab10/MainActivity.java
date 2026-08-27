package com.example.se_lab10;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.ListView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    // Instantiate the given firebase w/ references
    private FirebaseDatabase database;
    private DatabaseReference databaseReference;
    
    // The adapter & list on the main menu here
    private List<Task> itemsList = new ArrayList<>();
    private ArrayAdapter<Task> itemsAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        // The Firebase is referenced via the link I keep reusing for everything
        database = FirebaseDatabase.getInstance("https://se-lab8-database-default-rtdb.firebaseio.com/");
        // The reference is that sub-folder in the firebase named 'tasks'
        databaseReference = database.getReference("tasks");
        
        // Start by showing the Main Menu layout
        showMainMenu();
    }

    // To start, we set our initial view to the main menu here
    private void showMainMenu() {
        setContentView(R.layout.activity_main);

        // Initialize the listview that's just ham-fisted in here
        itemsAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1, itemsList);
        ListView listView = findViewById(R.id.simpleListView);
        listView.setAdapter(itemsAdapter);

        // Also assign the button variables to go to the associated menu or do the task for the loader
        Button addViewerBtn = findViewById(R.id.addViewer);
        Button editViewerBtn = findViewById(R.id.editViewer);
        Button loadViewerBtn = findViewById(R.id.loadViewer);
        Button exitBtn = findViewById(R.id.exitButton);

        // Go to the data adder screen
        addViewerBtn.setOnClickListener(v -> showAddData());

        // Go to the data editor screen
        editViewerBtn.setOnClickListener(v -> showEditData());

        // And just load the data present
        loadViewerBtn.setOnClickListener(v -> loadData());

        // Bonus: This cool exit button that just closes the app altogether.
        exitBtn.setOnClickListener(v -> finish());
    }

    // First menu: Adding the data literally all in one big function
    private void showAddData() {
        // Go to activity view
        setContentView(R.layout.activity_adddata);
        // Again, define all the assets present
        EditText addTaskBox = findViewById(R.id.addTaskBox);
        Button addTaskButton = findViewById(R.id.addTaskButton);
        ImageButton backButton = findViewById(R.id.backButton2);

        // And this is the logic to add data to the firebase
        addTaskButton.setOnClickListener(v -> {
            String description = addTaskBox.getText().toString().trim();
            // Ensure that the user actually inputted something
            if (!description.isEmpty()) {
                // Fetch the current tasks to determine the next ID (task1, task2, etc.)
                databaseReference.addListenerForSingleValueEvent(new ValueEventListener() {
                    @Override
                    public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                        // Basically: Go through all the tasks present to NOT overlap over with an existing one
                        int maxId = 0;
                        // Iterate through all children to find the highest existing task number
                        for (DataSnapshot snapshot : dataSnapshot.getChildren()) {
                            String key = snapshot.getKey();
                            if (key != null && key.startsWith("task")) {
                                try {
                                    // Concatenate the number after the term "task"
                                    int idNum = Integer.parseInt(key.substring(4));
                                    if (idNum > maxId) {
                                        maxId = idNum;
                                    }
                                } catch (NumberFormatException e) {
                                    // Ignore any keys that don't fit the expected 'taskN' format
                                }
                            }
                        }

                        // Logic to add data with the split ID format
                        int nextId = maxId + 1;
                        String firebaseKey = "task" + nextId; // e.g., "task1"
                        String taskNumericID = String.valueOf(nextId); // e.g., "1"

                        // Create the task object
                        Task newTask = new Task(taskNumericID, description);

                        // Push to Firebase under the 'taskN' key
                        databaseReference.child(firebaseKey).setValue(newTask).addOnSuccessListener(aVoid -> {
                                Toast.makeText(MainActivity.this, "Task Added! ID: " + firebaseKey, Toast.LENGTH_LONG).show();
                                // And wipe the text box
                                addTaskBox.setText("");
                            })
                            .addOnFailureListener(e -> Toast.makeText(MainActivity.this, "Error adding task", Toast.LENGTH_SHORT).show());
                    }

                    @Override
                    public void onCancelled(@NonNull DatabaseError error) {
                        Toast.makeText(MainActivity.this, "Failed to check existing tasks", Toast.LENGTH_SHORT).show();
                    }
                });
            } else {
                Toast.makeText(this, "Please enter a task description", Toast.LENGTH_SHORT).show();
            }
        });

        // And the back button
        backButton.setOnClickListener(v -> showMainMenu());
    }

    // Next view: The entire edit data menu (oh boy)
    private void showEditData() {
        setContentView(R.layout.activity_editdata);
        // Declare all of our lovely assets
        EditText searchTaskBox = findViewById(R.id.searchTaskBox);
        EditText updateTaskBox = findViewById(R.id.updateTaskBox);
        Button searchButton = findViewById(R.id.searchButton);
        Button updateButton = findViewById(R.id.updateButton);
        ImageButton backButton = findViewById(R.id.backButton);

        // How to search for a task based on its ID
        searchButton.setOnClickListener(v -> {
            // Get the user input
            String input = searchTaskBox.getText().toString().trim();
            if (!input.isEmpty()) {
                databaseReference.child(input).get().addOnCompleteListener(task -> {
                    // Check that a task matches the input
                    if (task.isSuccessful() && task.getResult().exists()) {
                        Task foundTask = task.getResult().getValue(Task.class);
                        if (foundTask != null) {
                            // When found and NOT null, we input it into the text box
                            updateTaskBox.setText(foundTask.getDescription());
                            Toast.makeText(MainActivity.this, "Task Found", Toast.LENGTH_SHORT).show();
                        }
                    } else {
                        Toast.makeText(MainActivity.this, "Task not found with that ID", Toast.LENGTH_SHORT).show();
                    }
                });
            } else {
                Toast.makeText(this, "Enter a Task ID to search", Toast.LENGTH_SHORT).show();
            }
        });

        // And now, the logic to update the given task from before
        updateButton.setOnClickListener(v -> {
            // Lazy solution: We take the task ID that is present in the search box, assuming it's still there
            String taskID = searchTaskBox.getText().toString().trim();
            // And whatever new description wants to be made
            String newDescription = updateTaskBox.getText().toString().trim();

            // Provided everything exists
            if (!taskID.isEmpty() && !newDescription.isEmpty()) {
                // Just update the 'description' part
                databaseReference.child(taskID).child("description").setValue(newDescription)
                    // And just make the 'Toast' cases for if it succeeds or not.
                    .addOnSuccessListener(aVoid -> Toast.makeText(MainActivity.this, "Task Updated", Toast.LENGTH_SHORT).show())
                    .addOnFailureListener(e -> Toast.makeText(MainActivity.this, "Update Failed", Toast.LENGTH_SHORT).show());
            } else {
                Toast.makeText(this, "Please make sure you have the task ID in your 'search' box above, and that you're actually inputting a description.", Toast.LENGTH_SHORT).show();
            }
        });

        // Again, back button
        backButton.setOnClickListener(v -> showMainMenu());
    }

    // Last; the data loader. Literally just load it on the main page
    private void loadData() {
        databaseReference.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                if (dataSnapshot.exists()) {
                    itemsAdapter.clear();
                    // Just load every single task present in the 'tasks' folder of the firebase
                    for (DataSnapshot snapshot : dataSnapshot.getChildren()) {
                        Task task = snapshot.getValue(Task.class);
                        if (task != null) {
                            itemsAdapter.add(task);
                        }
                    }
                    itemsAdapter.notifyDataSetChanged();
                }
                else {
                    // Otherwise, output that there is no database, somehow
                    Toast.makeText(MainActivity.this, "No data found in database", Toast.LENGTH_SHORT).show();
                }
            }

            // Mandatory function for the 'ValueEventListener', if it manages to fail
            @Override
            public void onCancelled(@NonNull DatabaseError error) {
                Toast.makeText(MainActivity.this, "Error: Database is catastrophically broken.", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
