package com.trafficanalyzer.learning;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tensorflow.SavedModelBundle;
import org.tensorflow.Session.Runner;

import com.trafficanalyzer.streams.entity.PayloadCount;

import org.tensorflow.Tensor;
import org.tensorflow.Tensors;

public class MLModel {

    private static Logger logger = LoggerFactory.getLogger(MLModel.class);

    private static float LEARNING_LOSS = 0.000262f;
    private static float PREDICTION_TRESHOLD = 1.5f;

    private String modelDir;

    private SavedModelBundle modelBundle;

    private boolean determine(float loss) {
        return loss <= LEARNING_LOSS * PREDICTION_TRESHOLD;
    }

    public MLModel(String modelDir) {
        this.modelDir = modelDir;
    }

    public void init() {
        modelBundle = SavedModelBundle.load(modelDir, "serve");
    }

    public boolean predict(PayloadCount count, float max) {
        float[][] vector = { { (float) count.getMtCount() / count.getTotalCount(),
                (float) count.getMoCount() / count.getTotalCount(),
                (float) count.getErrorCount() / count.getTotalCount(), max } };
        return predict(vector);
    }

    private boolean predict(float[][] vector) {
        final Runner runner = modelBundle.session().runner();
        final Tensor<Float> input = Tensors.create(vector);
        final Tensor<?> result = runner.feed("Input/Placeholder", input).fetch("accuracy/Mean").run().get(0);
        logger.debug("{}", result.floatValue());
        return determine(result.floatValue());
    }

    public static void main(final String[] args) throws Exception {

        if (args.length != 1) {
            System.out.println("usage: test-model [model]");
            return;
        }

        final String modelDir = args[0];

        final MLModel model = new MLModel(modelDir);
        model.init();

        // Prepare input
        float[][] vector1 = { { 0.66885245901639345f, 0.33114754098360655f, 0.0f, 0.11222780569514237f } };
        float[][] vector2 = { { 0.66612244897959183f, 0.33387755102040817f, 0.0f, 0.11222780569514237f } };
        float[][] vector3 = { { 0.6810007818608288f, 0.3189992181391712f, 0.0f, 0.59798994974874364f } };

        logger.info("vector1 is normal? {}", model.predict(vector1));
        logger.info("vector2 is normal? {}", model.predict(vector2));
        logger.info("vector3 is normal? {}", model.predict(vector3));
    }

    public void close() {
        this.modelBundle.close();
    }
}