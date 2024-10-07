function Mfiles2Latex(directory, outputFileName)
    % 获取目录下所有的.m和.mlx文件
    mFiles = dir(fullfile(directory, '*.m'));
    mlxFiles = dir(fullfile(directory, '*.mlx'));
    
    % 初始化内容字符串
    allContent = '';
    
    % 处理.m文件
    for i = 1:length(mFiles)
        fileName = mFiles(i).name;
        filePath = fullfile(directory, fileName);
        fileContent = fileread(filePath);
        allContent = [allContent, sprintf('%% File: %s\n', fileName), fileContent, '\n\n'];
    end
    
    % 处理.mlx文件
    for i = 1:length(mlxFiles)
        fileName = mlxFiles(i).name;
        filePath = fullfile(directory, fileName);
        % 将.mlx文件转换为临时.m文件
        tempMFilePath = fullfile(tempdir, [fileName, '.m']);
        matlab.internal.liveeditor.openAndConvert(filePath, tempMFilePath);
        % 读取临时.m文件内容
        fileContent = fileread(tempMFilePath);
        allContent = [allContent, sprintf('%% File: %s\n', fileName), fileContent, '\n\n'];
        % 删除临时.m文件
        delete(tempMFilePath);
    end
    
    % 将内容写入到一个文本文件中
    outputFile = fullfile(directory, outputFileName);
    fid = fopen(outputFile, 'w');
    fprintf(fid, '%s', allContent);
    
    fclose(fid);
    
    disp(['Files content saved to ', outputFile]);
end