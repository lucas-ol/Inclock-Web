﻿//------------------------------------------------------------------------------
// <auto-generated>
//     O código foi gerado por uma ferramenta.
//     Versão de Tempo de Execução:4.0.30319.42000
//
//     As alterações ao arquivo poderão causar comportamento incorreto e serão perdidas se
//     o código for gerado novamente.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Library.Inclock.web.br.Autenticador {
    
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    [System.ServiceModel.ServiceContractAttribute(ConfigurationName="Autenticador.IAutenticador")]
    public interface IAutenticador {
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/Logar", ReplyAction="http://tempuri.org/IAutenticador/LogarResponse")]
        string Logar(string password, string login);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/Logar", ReplyAction="http://tempuri.org/IAutenticador/LogarResponse")]
        System.Threading.Tasks.Task<string> LogarAsync(string password, string login);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetLogin", ReplyAction="http://tempuri.org/IAutenticador/GetLoginResponse")]
        string GetLogin(string Email);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetLogin", ReplyAction="http://tempuri.org/IAutenticador/GetLoginResponse")]
        System.Threading.Tasks.Task<string> GetLoginAsync(string Email);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetPassword", ReplyAction="http://tempuri.org/IAutenticador/GetPasswordResponse")]
        string GetPassword(string Login);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetPassword", ReplyAction="http://tempuri.org/IAutenticador/GetPasswordResponse")]
        System.Threading.Tasks.Task<string> GetPasswordAsync(string Login);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetCheckPointDateInterval", ReplyAction="http://tempuri.org/IAutenticador/GetCheckPointDateIntervalResponse")]
        string GetCheckPointDateInterval(string InitialDate, string FinalDate);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetCheckPointDateInterval", ReplyAction="http://tempuri.org/IAutenticador/GetCheckPointDateIntervalResponse")]
        System.Threading.Tasks.Task<string> GetCheckPointDateIntervalAsync(string InitialDate, string FinalDate);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetCheckPointByDate", ReplyAction="http://tempuri.org/IAutenticador/GetCheckPointByDateResponse")]
        string GetCheckPointByDate(string InitialDate, string FinalDate, string id_funcionario);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetCheckPointByDate", ReplyAction="http://tempuri.org/IAutenticador/GetCheckPointByDateResponse")]
        System.Threading.Tasks.Task<string> GetCheckPointByDateAsync(string InitialDate, string FinalDate, string id_funcionario);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetCheckPointById", ReplyAction="http://tempuri.org/IAutenticador/GetCheckPointByIdResponse")]
        string GetCheckPointById(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetCheckPointById", ReplyAction="http://tempuri.org/IAutenticador/GetCheckPointByIdResponse")]
        System.Threading.Tasks.Task<string> GetCheckPointByIdAsync(int id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetUserById", ReplyAction="http://tempuri.org/IAutenticador/GetUserByIdResponse")]
        string GetUserById(string id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetUserById", ReplyAction="http://tempuri.org/IAutenticador/GetUserByIdResponse")]
        System.Threading.Tasks.Task<string> GetUserByIdAsync(string id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetListUsers", ReplyAction="http://tempuri.org/IAutenticador/GetListUsersResponse")]
        string GetListUsers();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetListUsers", ReplyAction="http://tempuri.org/IAutenticador/GetListUsersResponse")]
        System.Threading.Tasks.Task<string> GetListUsersAsync();
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/CheckPoint", ReplyAction="http://tempuri.org/IAutenticador/CheckPointResponse")]
        string CheckPoint(Classes.VO.Ponto ponto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/CheckPoint", ReplyAction="http://tempuri.org/IAutenticador/CheckPointResponse")]
        System.Threading.Tasks.Task<string> CheckPointAsync(Classes.VO.Ponto ponto);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetExpediente", ReplyAction="http://tempuri.org/IAutenticador/GetExpedienteResponse")]
        string GetExpediente(string semana, string funcionario_Id);
        
        [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IAutenticador/GetExpediente", ReplyAction="http://tempuri.org/IAutenticador/GetExpedienteResponse")]
        System.Threading.Tasks.Task<string> GetExpedienteAsync(string semana, string funcionario_Id);
    }
    
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public interface IAutenticadorChannel : Library.Inclock.web.br.Autenticador.IAutenticador, System.ServiceModel.IClientChannel {
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
    public partial class AutenticadorClient : System.ServiceModel.ClientBase<Library.Inclock.web.br.Autenticador.IAutenticador>, Library.Inclock.web.br.Autenticador.IAutenticador {
        
        public AutenticadorClient() {
        }
        
        public AutenticadorClient(string endpointConfigurationName) : 
                base(endpointConfigurationName) {
        }
        
        public AutenticadorClient(string endpointConfigurationName, string remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AutenticadorClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(endpointConfigurationName, remoteAddress) {
        }
        
        public AutenticadorClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
                base(binding, remoteAddress) {
        }
        
        public string Logar(string password, string login) {
            return base.Channel.Logar(password, login);
        }
        
        public System.Threading.Tasks.Task<string> LogarAsync(string password, string login) {
            return base.Channel.LogarAsync(password, login);
        }
        
        public string GetLogin(string Email) {
            return base.Channel.GetLogin(Email);
        }
        
        public System.Threading.Tasks.Task<string> GetLoginAsync(string Email) {
            return base.Channel.GetLoginAsync(Email);
        }
        
        public string GetPassword(string Login) {
            return base.Channel.GetPassword(Login);
        }
        
        public System.Threading.Tasks.Task<string> GetPasswordAsync(string Login) {
            return base.Channel.GetPasswordAsync(Login);
        }
        
        public string GetCheckPointDateInterval(string InitialDate, string FinalDate) {
            return base.Channel.GetCheckPointDateInterval(InitialDate, FinalDate);
        }
        
        public System.Threading.Tasks.Task<string> GetCheckPointDateIntervalAsync(string InitialDate, string FinalDate) {
            return base.Channel.GetCheckPointDateIntervalAsync(InitialDate, FinalDate);
        }
        
        public string GetCheckPointByDate(string InitialDate, string FinalDate, string id_funcionario) {
            return base.Channel.GetCheckPointByDate(InitialDate, FinalDate, id_funcionario);
        }
        
        public System.Threading.Tasks.Task<string> GetCheckPointByDateAsync(string InitialDate, string FinalDate, string id_funcionario) {
            return base.Channel.GetCheckPointByDateAsync(InitialDate, FinalDate, id_funcionario);
        }
        
        public string GetCheckPointById(int id) {
            return base.Channel.GetCheckPointById(id);
        }
        
        public System.Threading.Tasks.Task<string> GetCheckPointByIdAsync(int id) {
            return base.Channel.GetCheckPointByIdAsync(id);
        }
        
        public string GetUserById(string id) {
            return base.Channel.GetUserById(id);
        }
        
        public System.Threading.Tasks.Task<string> GetUserByIdAsync(string id) {
            return base.Channel.GetUserByIdAsync(id);
        }
        
        public string GetListUsers() {
            return base.Channel.GetListUsers();
        }
        
        public System.Threading.Tasks.Task<string> GetListUsersAsync() {
            return base.Channel.GetListUsersAsync();
        }
        
        public string CheckPoint(Classes.VO.Ponto ponto) {
            return base.Channel.CheckPoint(ponto);
        }
        
        public System.Threading.Tasks.Task<string> CheckPointAsync(Classes.VO.Ponto ponto) {
            return base.Channel.CheckPointAsync(ponto);
        }
        
        public string GetExpediente(string semana, string funcionario_Id) {
            return base.Channel.GetExpediente(semana, funcionario_Id);
        }
        
        public System.Threading.Tasks.Task<string> GetExpedienteAsync(string semana, string funcionario_Id) {
            return base.Channel.GetExpedienteAsync(semana, funcionario_Id);
        }
    }
}