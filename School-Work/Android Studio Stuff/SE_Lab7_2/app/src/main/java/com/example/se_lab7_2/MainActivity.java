package com.example.se_lab7_2;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

public class MainActivity extends AppCompatActivity {

    public static final String MSG = "com.codewithharry.multiscreen.ORDER";

    public static int size = 0;

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
    public void placeOrder(View view) {
        Intent intent = new Intent(this, OrderActivity.class);
        EditText editText1 = findViewById(R.id.textBox1);
        EditText editText2 = findViewById(R.id.textBox2);
        EditText editText3 = findViewById(R.id.textBox3);

        if (!editText1.getText().toString().isEmpty())
        {
            size++;
        }

        if (!editText2.getText().toString().isEmpty())
        {
            size++;
        }

        if (!editText3.getText().toString().isEmpty())
        {
            size++;
        }

        String message = "Something should appear here";

        if (size == 3 || size == 2)
        {
            message = "Order for " + editText1.getText().toString()
                    + editText2.getText().toString() + " & "
                    + editText3.getText().toString() + " has been successfully placed";
        }
        else if (size == 1)
        {
            message = "Order for " + editText1.getText().toString() + editText2.getText().toString() + editText3.getText().toString();
        }
        else
        {
            message = "No order was placed.";
        }

        intent.putExtra(MSG, message);
        startActivity(intent);

        size = 0;
    }
}