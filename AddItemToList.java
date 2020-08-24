public final class AddIsIdempotent {
  public static void main(String[] args) throws Err {
    // Chooses the Alloy4 options
    A4Options opt = new A4Options();
    opt.solver = A4Options.SatSolver.SAT4J;

    PrimSig item = new PrimSig("item");
    PrimSig product = new PrimSig("product");
    PrimSig list = new PrimSig("list");

    Expr items = list.addField("items" , item.any_arrow_one(product));
    
    Func addItemToList = new Func(null, "addItemToList", null, null, Product.one());

    List<Sig> sigs = Arrays.asList(new Sig[]{product, item, list});
    Expr expr1 = addItemToList.call();
    Command cmd1 = new Command(false, 3, 3, 3, expr1);
    A4Solution sol1 = TranslateAlloyToKodkod.execute_command(NOP, sigs, cmd1, opt);
    System.out.println("[Solution1]:");
    System.out.println(sol1.toString());

    while (sol1.satisfiable()) {
        System.out.println("[Solution1]:");
        System.out.println(sol1.toString());
        sol1 = sol1.next();
    }
  }
}
