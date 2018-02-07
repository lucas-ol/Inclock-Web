using System;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Autenticador_Host
{
    class Program
    {
        static void Main(string[] args)
        {
            ServiceHost host = new ServiceHost(typeof(Autenticador.Autenticador));

            while (true)
            {
                Console.Clear();
                Console.WriteLine("Hospedagem De serviço {0}\n{1}", nameof(Autenticador.Autenticador), host.BaseAddresses.FirstOrDefault());
                Console.WriteLine("Opçoes");
                Console.WriteLine("I - Iniciar Servidor");
                Console.WriteLine("F - Fecha Servidor");
                Console.WriteLine("C - Configurar Servidor");
                Console.WriteLine("S - Sair");

                ConsoleKey Opcao = Console.ReadKey().Key;
                Console.WriteLine("");
                switch (Opcao)
                {
                    case ConsoleKey.I:
                        try
                        {
                            Console.WriteLine("O servidor foi aberto");
                            host.Open();
                            Thread.Sleep(5000);
                        }
                        catch (Exception ex)
                        {
                            Console.Clear();
                            Console.WriteLine("Erro: " + ex.Message);
                            Thread.Sleep(5000);
                        }
                        break;
                    case ConsoleKey.F:

                        try
                        {
                            Console.Clear();
                            host.Close();
                            Console.WriteLine("Servidor encerrado");
                            Thread.Sleep(5000);
                        }
                        catch (Exception ex)
                        {
                            Console.Clear();
                            Console.WriteLine("Erro: " + ex.Message);
                            Thread.Sleep(5000);
                        }
                        break;
                    case ConsoleKey.C:
                        try
                        {
                            Console.Clear();
                            Console.Write("não implementado");
                            Console.Write("Infome A URL");
                            String url = Console.ReadLine();
                        }
                        catch (Exception ex)
                        {
                            Console.Clear();
                            Console.WriteLine("Erro: " + ex.Message);
                            Thread.Sleep(5000);
                        }
                        break;
                    case ConsoleKey.S:
                        if (host.State == CommunicationState.Opened || host.State == CommunicationState.Opening)
                            host.Close();
                        return;

                    default:
                        Console.Clear();
                        Console.WriteLine("Opção invalida");
                        Thread.Sleep(5000);
                        break;
                }
            }
        }
    }
}
