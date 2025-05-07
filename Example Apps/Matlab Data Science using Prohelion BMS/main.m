function main()
    % main.m - Clean Octave/MATLAB example for Prohelion BMS data science
    % Compatible with Octave 10+ and MATLAB (no Java, no extra packages)

    %% --- User Input Section ---
    defaultServerUrl = 'http://127.0.0.1:18080';
    prompt = ['Enter Prohelion API server URL [' defaultServerUrl ']: '];
    serverUrl = input(prompt, 's');
    if isempty(serverUrl)
        serverUrl = defaultServerUrl;
    end
    username = input('Enter your Prohelion API username: ', 's');
    password = input('Enter your Prohelion API password: ', 's');

    %% --- Authentication ---
    token = login(serverUrl, username, password);
    fprintf('Authenticated! Token received.\n');

    %% --- Fetch BMS Data ---
    bmsData = fetch_bms_data(serverUrl, token);
    disp('Top-level fields in BMS data:');
    disp(fieldnames(bmsData));

    %% --- TODO: Add your data processing and plotting here ---
    % Example: Display the structure
    % disp(bmsData);
end

function token = login(serverUrl, username, password)
    loginEndpoint = '/api/v2/Users/Authenticate';
    loginUrl = [serverUrl loginEndpoint];

    if exist('OCTAVE_VERSION', 'builtin')
        % Octave: use curl
        jsonData = jsonencode(struct('username', username, 'password', password));
        % Escape double quotes for Windows shell
        jsonDataWin = strrep(jsonData, '"', '\"');
        tmpFile = tempname;
        curlCmd = sprintf('curl -s -X POST -H "Content-Type: application/json" -d "%s" "%s" -o "%s"', jsonDataWin, loginUrl, tmpFile);
        status = system(curlCmd);
        if status ~= 0
            error('curl command failed to execute.');
        end
        raw = fileread(tmpFile);
        delete(tmpFile);
        loginResponse = jsondecode(raw);
    else
        % MATLAB: use webwrite with struct
        loginData = struct('username', username, 'password', password);
        options = weboptions( ...
            'MediaType', 'application/json', ...
            'ContentType', 'json', ...
            'Timeout', 20, ...
            'RequestMethod', 'post' ...
        );
        loginResponse = webwrite(loginUrl, loginData, options);
    end

    disp('Decoded login response:');
    disp(loginResponse);

    if isfield(loginResponse, 'token')
        token = loginResponse.token;
    else
        error('No token received from server.');
    end
end

function bmsData = fetch_bms_data(serverUrl, token)
    bmuEndpoint = '/api/v2/Data/Prohelion%20BMU';
    bmuUrl = [serverUrl bmuEndpoint];

    if exist('OCTAVE_VERSION', 'builtin')
        % Octave: use curl for GET with Bearer token
        tmpFile = tempname;
        curlCmd = sprintf('curl -s -H "Authorization: Bearer %s" "%s" -o "%s"', token, bmuUrl, tmpFile);
        status = system(curlCmd);
        if status ~= 0
            error('curl command failed to execute.');
        end
        raw = fileread(tmpFile);
        delete(tmpFile);
        bmsData = jsondecode(raw);
    else
        % MATLAB: use webread with Bearer token
        options = weboptions( ...
            'HeaderFields', {'Authorization', ['Bearer ' token]}, ...
            'ContentType', 'json', ...
            'Timeout', 20 ...
        );
        bmsData = webread(bmuUrl, options);
    end
end

main;
