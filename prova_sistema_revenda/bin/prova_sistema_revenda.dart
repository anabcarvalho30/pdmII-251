import 'dart:convert';
import '../lib/prova_sistema_revenda.dart';
import '../bin/email_sender.dart';

void main() {
  var cliente = Cliente(codigo: 1, nome: 'Ana Beatriz', tipoCliente: 0);
  var vendedor = Vendedor(codigo: 101, nome: 'Vendedor Enzo', comissao: 0.1);
  var veiculo = Veiculo(
    codigo: 201,
    descricao: 'Fiat Uno 2010',
    valor: 15000.0,
  );

  var itens = [
    ItemPedido(
      sequencial: 1,
      descricao: 'Documentação',
      quantidade: 1,
      valor: 500.0,
    ),
    ItemPedido(
      sequencial: 2,
      descricao: 'Seguro',
      quantidade: 1,
      valor: 1200.0,
    ),
  ];

  var pedido = PedidoVenda(
    codigo: 'PV001',
    data: DateTime.now(),
    valorPedido: 0.0,
    cliente: cliente,
    vendedor: vendedor,
    veiculo: veiculo,
    items: itens,
  );

  final jsonPedido = const JsonEncoder.withIndent('  ').convert(pedido.toJson());
  print(jsonPedido);
  enviarEmail(jsonPedido);
}


