package xyz.foo.hello;

import org.ballerinalang.compiler.plugins.AbstractCompilerPlugin;
import org.ballerinalang.compiler.plugins.SupportedAnnotationPackages;
import org.ballerinalang.model.elements.PackageID;
import org.ballerinalang.model.tree.AnnotationAttachmentNode;
import org.ballerinalang.model.tree.FunctionNode;
import org.ballerinalang.util.diagnostic.Diagnostic;
import org.ballerinalang.util.diagnostic.DiagnosticLog;
import org.wso2.ballerinalang.compiler.tree.BLangAnnotationAttachment;
import org.wso2.ballerinalang.compiler.tree.expressions.BLangLiteral;
import org.wso2.ballerinalang.compiler.tree.expressions.BLangRecordLiteral;
import org.wso2.ballerinalang.compiler.tree.expressions.BLangRecordLiteral.BLangRecordKeyValue;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.List;

/**
 * Compiler extension to generate greetings.
 */
// This annotation specifies that this compiler extension should only be enabled when the mentioned module is used.
@SupportedAnnotationPackages(
        value = "roland/hello:0.1.0"
)
public class HelloPlugin extends AbstractCompilerPlugin {

    private DiagnosticLog dlog;

    @Override
    public void init(DiagnosticLog diagnosticLog) {
        this.dlog = diagnosticLog;
    }

    // The annotation is attached to functions. Therefore, the process() method is overridden for functions.
    @Override
    public void process(FunctionNode functionNode, List<AnnotationAttachmentNode> annotations) {
        // Iterate through the annotations attached to the service.
        for (AnnotationAttachmentNode annotation : annotations) {
            // The `annotations` list contains all the annotations attached to the service.
            // Since only the `@hello:Greeting` annotation is considered, skip the other annotations.
            if (!"Greeting".equals(annotation.getAnnotationName().getValue())) {
                continue;
            }

            // Retrieve the fields of the annotation value.
            List<BLangRecordKeyValue> annotFields =
                    ((BLangRecordLiteral) ((BLangAnnotationAttachment) annotation).expr).getKeyValuePairs();

            // In this particular case, there is no need to iterate through the list since the `@hello:Greeting` annotation only has
            // one field. Therefore, take the first element of the fields list.
            BLangRecordKeyValue salutationField = annotFields.get(0);
            String annotFieldValue = ((BLangLiteral) salutationField.getValue()).getValue().toString();
            String greeting = String.format("%s from %s()\n", annotFieldValue, functionNode.getName().getValue());
            HelloModel.getInstance().setGreeting(greeting);
        }
    }

    // The `codeGenerated()` method gets invoked once the executable is built. The greeting is written to a text file
    // with the same name as the executable and in the same directory as the executable.
    @Override
    public void codeGenerated(PackageID packageID, Path binaryPath) {
        String fileName = binaryPath.getFileName().toString().replace(".jar", ".txt");
        Path greetingsPath = Paths.get("target", "greetings", fileName);
        String greeting = HelloModel.getInstance().getGreetings();
        try {
            System.out.println("\nGenerating greetings");
            System.out.println("\t" + greetingsPath.toString());
            writeToFile(greeting, greetingsPath);
        } catch (IOException e) {
            dlog.logDiagnostic(Diagnostic.Kind.ERROR, null, e.getMessage());
        }
    }

    private void writeToFile(String greetings, Path targetFilePath) throws IOException {
        File newFile = targetFilePath.toFile();

        if (newFile.exists()) {
            Files.write(targetFilePath, greetings.getBytes(StandardCharsets.UTF_8), StandardOpenOption.APPEND);
            return;
        }

        if (newFile.getParentFile().mkdirs()) {
            Files.write(targetFilePath, greetings.getBytes(StandardCharsets.UTF_8));
            return;
        }
        Files.write(targetFilePath, greetings.getBytes(StandardCharsets.UTF_8));
    }
}