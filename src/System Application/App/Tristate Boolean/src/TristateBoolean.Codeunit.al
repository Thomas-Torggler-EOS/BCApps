codeunit 10001 "Tristate Boolean Impl."
{

    Access = Internal;

    var
        _state: Integer;

    procedure Set(value: Boolean)
    begin
        _state := value ? 2 : 1;
    end;

    procedure IsUndefined(): Boolean
    begin
        exit(_state = 0);
    end;

    procedure IsFalse(): Boolean
    begin
        exit(_state = 1);
    end;

    procedure IsTrue(): Boolean
    begin
        exit(_state = 2);
    end;

}