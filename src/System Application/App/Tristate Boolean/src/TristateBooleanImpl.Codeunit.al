/// <summary>
/// Provides a tristate boolean implementation with True, False, and Undefined states.
/// </summary>
codeunit 10002 "Tristate Boolean"
{

    var
        impl: Codeunit "Tristate Boolean Impl.";


    /// <summary>
    /// Set the internal state to `value`.
    /// </summary>
    /// <param name="value">The boolean value to set</param>
    procedure Set(value: Boolean)
    begin
        impl.Set(value);
    end;

    /// <summary>
    /// Set the internal state to same state of `other`.
    /// </summary>
    /// <param name="other">The other Tristate Boolean codeunit</param>
    procedure Set(other: Codeunit "Tristate Boolean")
    begin
        if (other.IsUndefined()) then
            SetUndefined()
        else
            Set(other.IsTrue());
    end;

    /// <summary>
    /// Set the internal state to an integer-based `value`. 1 = False, 2 = True, otherwise Undefined.
    /// </summary>
    /// <param name="value">The integer value to set</param>
    procedure Set(value: Integer)
    begin
        case value of
            1:
                SetFalse();
            2:
                SetTrue();
            else
                SetUndefined();
        end;
    end;

    /// <summary>
    /// Set the internal state to `True`.
    /// </summary>
    procedure SetTrue()
    begin
        impl.Set(true);
    end;

    /// <summary>
    /// Check if the internal state is `True`.
    /// </summary>
    /// <returns>>Boolean indicating if the state is True</returns>
    procedure IsTrue(): Boolean
    begin
        exit(impl.IsTrue());
    end;

    /// <summary>
    /// Check if the internal state is `True` or `Undefined`.
    /// </summary>
    /// <returns>>Boolean indicating if the state is True or Undefined</returns>
    procedure IsTrueOrUndefined(): boolean
    begin
        exit(impl.IsTrue() or impl.IsUndefined());
    end;


    /// <summary>
    /// Set the internal state to `False`.
    /// </summary>
    procedure SetFalse()
    begin
        impl.Set(false);
    end;

    /// <summary>
    /// Check if the internal state is `False`.
    /// </summary>
    /// <returns>>Boolean indicating if the state is False</returns>
    procedure IsFalse(): Boolean
    begin
        exit(impl.IsFalse());
    end;

    /// <summary>
    /// Check if the internal state is `False` or `Undefined`.
    /// </summary>
    /// <returns>>Boolean indicating if the state is False or Undefined</returns>
    procedure IsFalseOrUndefined(): boolean
    begin
        exit(impl.IsFalse() or impl.IsUndefined());
    end;


    /// <summary>
    /// Set the internal state to `Undefined`.
    /// </summary>
    procedure SetUndefined()
    begin
        Clear(impl);
    end;

    /// <summary>
    /// Check if the internal state is `Undefined`.
    /// </summary>
    /// <returns>>Boolean indicating if the state is Undefined</returns>
    procedure IsUndefined(): Boolean
    begin
        exit(impl.IsUndefined());
    end;

}