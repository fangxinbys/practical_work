using System;
namespace Maticsoft.Model
{
	/// <summary>
	/// tReg:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class tReg
	{
		public tReg()
		{}
		#region Model
		private int _id;
		private string _tname;
		private string _tadress;
		private string _tcode;
		private string _tmoney;
		private string _ttype;
		private string _tpeo;
		private string _tem;
		private string _tphone;
		private string _tip;
		private DateTime? _ttime;
		private string _tdo;
		/// <summary>
		/// 
		/// </summary>
		public int Id
		{
			set{ _id=value;}
			get{return _id;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tName
		{
			set{ _tname=value;}
			get{return _tname;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tAdress
		{
			set{ _tadress=value;}
			get{return _tadress;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tCode
		{
			set{ _tcode=value;}
			get{return _tcode;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tMoney
		{
			set{ _tmoney=value;}
			get{return _tmoney;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tType
		{
			set{ _ttype=value;}
			get{return _ttype;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tPeo
		{
			set{ _tpeo=value;}
			get{return _tpeo;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tEm
		{
			set{ _tem=value;}
			get{return _tem;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tPhone
		{
			set{ _tphone=value;}
			get{return _tphone;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tIp
		{
			set{ _tip=value;}
			get{return _tip;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? tTime
		{
			set{ _ttime=value;}
			get{return _ttime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string tDo
		{
			set{ _tdo=value;}
			get{return _tdo;}
		}
		#endregion Model

	}
}

