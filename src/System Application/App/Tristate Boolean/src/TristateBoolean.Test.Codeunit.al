codeunit 10003 "Tristate Boolean Test"
{

    Subtype = Test;

    var
        Assert: Codeunit "Library Assert";

    [Test]
    procedure CopyValue()
    var
        v1: Codeunit "Tristate Boolean";
        v2: Codeunit "Tristate Boolean";
    begin
        Assert.IsTrue(v1.IsUndefined(), 'Initial value should be undefined.');
        Assert.IsTrue(v2.IsUndefined(), 'Initial value should be undefined.');

        v1.SetTrue();
        Assert.IsTrue(v1.IsTrue(), 'v1 should be true.');
        Assert.IsFalse(v1.IsFalse(), 'v1 should not be false.');
        Assert.IsFalse(v1.IsUndefined(), 'v1 should not be undefined.');

        v2.Set(v1);
        Assert.IsTrue(v2.IsTrue(), 'v1 should be true.');
        Assert.IsFalse(v2.IsFalse(), 'v1 should not be false.');
        Assert.IsFalse(v2.IsUndefined(), 'v1 should not be undefined.');
    end;

    [Test]
    procedure FromInteger()
    var
        tsb: Codeunit "Tristate Boolean";
    begin
        tsb.Set(0);
        Assert.IsTrue(tsb.IsUndefined(), '0 should map to Undefined.');
        Assert.IsFalse(tsb.IsFalse(), '1 should map to False.');
        Assert.IsFalse(tsb.IsTrue(), '2 should map to True.');

        tsb.Set(1);
        Assert.IsFalse(tsb.IsUndefined(), '0 should map to Undefined.');
        Assert.IsTrue(tsb.IsFalse(), '1 should map to False.');
        Assert.IsFalse(tsb.IsTrue(), '2 should map to True.');

        tsb.Set(2);
        Assert.IsFalse(tsb.IsUndefined(), '0 should map to Undefined.');
        Assert.IsFalse(tsb.IsFalse(), '1 should map to False.');
        Assert.IsTrue(tsb.IsTrue(), '2 should map to True.');
    end;

    [Test]
    procedure FromIntegerOutOfRange()
    var
        tsb: Codeunit "Tristate Boolean";
    begin
        tsb.Set(-1);
        Assert.IsTrue(tsb.IsUndefined(), 'Out of range should map to Undefined.');

        tsb.Set(200);
        Assert.IsTrue(tsb.IsUndefined(), 'Out of range should map to Undefined.');
    end;

    [Test]
    procedure TrueOrUndefined()
    var
        tsb: Codeunit "Tristate Boolean";
    begin
        tsb.SetTrue();
        Assert.IsTrue(tsb.IsTrueOrUndefined(), 'Value should be True or Undefined.');
        tsb.SetUndefined();
        Assert.IsTrue(tsb.IsTrueOrUndefined(), 'Value should be True or Undefined.');
        tsb.SetFalse();
        Assert.IsFalse(tsb.IsTrueOrUndefined(), 'Value should NOT be True or Undefined.');
    end;

    [Test]
    procedure FalseOrUndefined()
    var
        tsb: Codeunit "Tristate Boolean";
    begin
        tsb.SetFalse();
        Assert.IsTrue(tsb.IsFalseOrUndefined(), 'Value should be False or Undefined.');
        tsb.SetUndefined();
        Assert.IsTrue(tsb.IsFalseOrUndefined(), 'Value should be False or Undefined.');
        tsb.SetTrue();
        Assert.IsFalse(tsb.IsFalseOrUndefined(), 'Value should NOT be False or Undefined.');
    end;

}