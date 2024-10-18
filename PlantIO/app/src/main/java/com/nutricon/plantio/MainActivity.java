package com.nutricon.plantio;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Bundle;
import android.provider.MediaStore;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import org.tensorflow.lite.Interpreter;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.List;

public class MainActivity extends AppCompatActivity {

    private static final int REQUEST_IMAGE_CAPTURE = 1;
    private ImageView imageView;
    private Button btnCamera;
    private Interpreter tflite;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        imageView = findViewById(R.id.imageView);
        btnCamera = findViewById(R.id.btnCamera);

        try {
            tflite = new Interpreter(loadModelFile());
        } catch (IOException e) {
            e.printStackTrace();
        }

        btnCamera.setOnClickListener(v -> dispatchTakePictureIntent());
    }

    private void dispatchTakePictureIntent() {
        Intent takePictureIntent = new Intent(MediaStore.ACTION_IMAGE_CAPTURE);
        if (takePictureIntent.resolveActivity(getPackageManager()) != null) {
            startActivityForResult(takePictureIntent, REQUEST_IMAGE_CAPTURE);
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode == REQUEST_IMAGE_CAPTURE && resultCode == Activity.RESULT_OK) {
            Bundle extras = data.getExtras();
            Bitmap imageBitmap = (Bitmap) extras.get("data");
            imageView.setImageBitmap(imageBitmap);

            // Process image and run inference
            processImageAndInference(imageBitmap);
        }
    }

    private void processImageAndInference(Bitmap imageBitmap) {
        // Convert Bitmap to ByteBuffer
        ByteBuffer inputBuffer = ByteBuffer.allocateDirect(4 * 224 * 224 * 3);
        inputBuffer.order(ByteOrder.nativeOrder());
        int[] pixels = new int[224 * 224];
        imageBitmap.getPixels(pixels, 0, imageBitmap.getWidth(), 0, 0, imageBitmap.getWidth(), imageBitmap.getHeight());
        for (int pixelValue : pixels) {
            inputBuffer.putFloat((pixelValue >> 16) & 0xFF);
            inputBuffer.putFloat((pixelValue >> 8) & 0xFF);
            inputBuffer.putFloat(pixelValue & 0xFF);
        }

        // Run inference
        float[][] output = new float[1][NUM_CLASSES];
        tflite.run(inputBuffer, output);

        // Display results
        displayResults(output);
    }

    private void displayResults(float[][] output) {
        // Process output and display results
        // Example: You can use a TextView to display the predicted disease.
        // For simplicity, let's just display a toast message.
        Toast.makeText(this, "Predicted Disease: " + getPredictedDisease(output), Toast.LENGTH_SHORT).show();
    }

    private String getPredictedDisease(float[][] output) {
        // Example method to get the predicted disease from the model output
        // You need to implement this based on your model's output format
        // For simplicity, let's assume the output contains the probability of each class
        // and the class names are stored in a list.
        List<String> classNames = ...; // List of class names
        int maxIndex = 0;
        for (int i = 1; i < output[0].length; i++) {
            if (output[0][i] > output[0][maxIndex]) {
                maxIndex = i;
            }
        }
        return classNames.get(maxIndex);
    }

    private MappedByteBuffer loadModelFile() throws IOException {
        // Load the model file from assets folder
        AssetFileDescriptor fileDescriptor = this.getAssets().openFd("model.tflite");
        FileInputStream inputStream = new FileInputStream(fileDescriptor.getFileDescriptor());
        FileChannel fileChannel = inputStream.getChannel();
        long startOffset = fileDescriptor.getStartOffset();
        long declaredLength = fileDescriptor.getDeclaredLength();
        return fileChannel.map(FileChannel.MapMode.READ_ONLY, startOffset, declaredLength);
    }
}
