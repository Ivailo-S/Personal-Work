package com.example.se_lab7_2;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class OrderActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_order);
        Intent intent = getIntent();
        String message = intent.getStringExtra(MainActivity.MSG);
        TextView textView = findViewById(R.id.orderText);
        textView.setText(message);

        Button button = findViewById(R.id.returnButton);
        button.setOnClickListener(v -> {
            getOnBackPressedDispatcher().onBackPressed();
        });
    }
}