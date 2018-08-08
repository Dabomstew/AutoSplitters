state("CyberdimensionNeptunia4GoddessesOnline-Win64-Shipping")
{
    float gameTime : 0x2800A70, 0x120, 0x7B8;
}
init
{
    print("Welcome to 4GO IGT reader");
}
gameTime
{
    // lazy way that overflows after 596(!) hours but who really cares
    return new TimeSpan(0, 0, 0, 0, (int)(current.gameTime*1000));
}
isLoading
{
    return true;
}