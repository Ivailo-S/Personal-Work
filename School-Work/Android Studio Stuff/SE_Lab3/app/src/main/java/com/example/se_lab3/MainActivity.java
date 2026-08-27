package com.example.se_lab3;

import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

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
    }
    public void LoginMsg(View view) {
        Button btnLogin = findViewById(R.id.btnLogin); // Finds the button we're modifying
        TextView txtUid = findViewById(R.id.txtUid); // And the text field as well
        TextView txtPass = findViewById(R.id.txtPass); // And the text field as well
        String uid = txtUid.getText().toString(); // When found, get the input field data and check it
        String pass = txtPass.getText().toString(); // For both the Password and User ID
        if (uid.equals("User") && pass.equals("123")) { // The least secure password checker
            Toast.makeText(this, "Successful", Toast.LENGTH_LONG).show(); // If correct
        }
        else {
            Toast.makeText(this, "Invalid", Toast.LENGTH_LONG).show(); // Otherwise, it's wrong.
        }
    }
}