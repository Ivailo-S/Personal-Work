package com.example.deliverable2;

import android.app.Notification;
import android.content.Intent;
import android.os.Bundle;
import android.view.MenuItem;
import android.widget.Button;
import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.annotation.RequiresPermission;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;
import com.example.deliverable2.R;

public class MainActivity extends AppCompatActivity {

    // I love instantiating things in such an easy to read way
    BottomNavigationView bottomNavigationView;

    HomeFragment homeFragment = new HomeFragment();
    RecommenderFragment recommenderFragment = new RecommenderFragment();
    ReadListFragment readListFragment = new ReadListFragment();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        bottomNavigationView = findViewById(R.id.bottom_navigation);

        getSupportFragmentManager().beginTransaction().replace(R.id.container,homeFragment).commit();
        bottomNavigationView.setOnItemSelectedListener(new NavigationBarView.OnItemSelectedListener() {
            @Override
            public boolean onNavigationItemSelected(@NonNull MenuItem menuItem) {
                /* This code just doesn't work, switch cases suck so we're using an if-else statement instead
                switch (menuItem.getItemId())
                {
                    case R.id.home:
                        getSupportFragmentManager().beginTransaction().replace(R.id.container,homeFragment).commit();
                        return true;
                    case R.id.recommender:
                        getSupportFragmentManager().beginTransaction().replace(R.id.container,recommenderFragment).commit();
                        return true;
                    case R.id.readlist:
                        getSupportFragmentManager().beginTransaction().replace(R.id.container,readListFragment).commit();
                        return true;

                }*/
                if (menuItem.getItemId() == R.id.home)
                {
                    getSupportFragmentManager().beginTransaction().replace(R.id.container,homeFragment).commit();
                    return true;
                }
                else if (menuItem.getItemId() == R.id.recommender)
                {
                    getSupportFragmentManager().beginTransaction().replace(R.id.container,recommenderFragment).commit();
                    return true;

                }
                else if (menuItem.getItemId() == R.id.readlist)
                {
                    getSupportFragmentManager().beginTransaction().replace(R.id.container,readListFragment).commit();
                    return true;
                }
                else
                {
                    return false;
                }
            }
        });

        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
    }
}