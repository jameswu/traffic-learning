package com.trafficanalyzer.learning;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.tensorflow.SavedModelBundle;
import org.tensorflow.Session.Runner;
import org.tensorflow.Tensor;
import org.tensorflow.Tensors;

import com.trafficanalyzer.streams.entity.PayloadCount;

public class MLModel {

    private static Logger logger = LoggerFactory.getLogger(MLModel.class);

    private static float LEARNING_LOSS = 0.001546f;
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
        float[][] vector1 = { { 0.50049800796812749f, 0.49950199203187251f, 0.0f, 0.13157894736842105f } };
        float[][] vector2 = { { 0.50346534653465347f, 0.49653465346534653f, 0.0f, 0.22807017543859651f } };
        float[][] vector3 = { { 0.51522474625422909f, 0.48477525374577091f, 0.0f, 0.65789473684210531f } };

        logger.info("vector1 is normal? {}", model.predict(vector1));
        logger.info("vector2 is normal? {}", model.predict(vector2));
        logger.info("vector3 is normal? {}", model.predict(vector3));
    }

    public void close() {
        this.modelBundle.close();
    }
}