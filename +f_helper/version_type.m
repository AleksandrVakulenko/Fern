

classdef version_type

    methods (Access = public)

        % NOTE: f_helper.version_type must be always constuctible by uint32
        %     MMMmmmuuu (M for major, m for minor, u for micro version)
        function Version = version_type(arg)
            if class(arg) == "string" || class(arg) == "char"
                V_line = string(arg);
                [Data, N] = sscanf(V_line, '# Fern V%i.%i.%i');
                if N ~= 3
                    [Data, N] = sscanf(V_line, 'V%i.%i.%i');
                    if N ~= 3
                        error('Wrong version_type constructor argument')
                    end
                end
            elseif class(arg) == "double" && numel(arg) == 3
                Data = arg;
            elseif class(arg) == "uint32"
                Data(1) = arg/1000000;
                Data(2) = mod(arg/1000, 1000);
                Data(3) = mod(arg, 1000);
            else
                error('Wrong version_type constructor argument')
            end
            
            Version.major = Data(1);
            Version.minor = Data(2);
            Version.micro = Data(3);
            Version.str = [num2str(Data(1)) '.' num2str(Data(2)) '.' num2str(Data(3))];
            Version.int = Data(1)*1000000 + Data(2)*1000 + Data(3);

        end

        function int_v = get_int_version(obj)
            int_v = obj.int;
        end

        function tf = lt(v1, v2)
            arguments
                v1 f_helper.version_type;
                v2 f_helper.version_type;
            end
            tf = v1.int < v2.int;
        end

        function tf = le(v1, v2)
            arguments
                v1 f_helper.version_type;
                v2 f_helper.version_type;
            end
            tf = v1.int <= v2.int;
        end

        function tf = gt(v1, v2)
            arguments
                v1 f_helper.version_type;
                v2 f_helper.version_type;
            end
            tf = v1.int > v2.int;
        end

        function tf = ge(v1, v2)
            arguments
                v1 f_helper.version_type;
                v2 f_helper.version_type;
            end
            tf = v1.int >= v2.int;
        end

        function tf = eq(v1, v2)
            arguments
                v1 f_helper.version_type;
                v2 f_helper.version_type;
            end
            tf = v1.int == v2.int;
        end

        function tf = ne(v1, v2)
            arguments
                v1 f_helper.version_type;
                v2 f_helper.version_type;
            end
            tf = v1.int ~= v2.int;
        end

    end

properties (Access = public)
    major uint8
    minor uint8
    micro uint8
    str string
end

properties (Access = private)
    int uint32
end

end