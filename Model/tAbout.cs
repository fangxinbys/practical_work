using System;
namespace Maticsoft.Model
{
	/// <summary>
	/// tAbout:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class tAbout
	{
		public tAbout()
		{}
		#region Model
		private int _id;
		private string _title;
		private string _aboutcontent;
		private int? _sort;
		private string _editor;
		private DateTime? _updatetime;
		private int? _click;
		private string _remark;
		private string _fengmian;
		private int? _isenable;
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
		public string Title
		{
			set{ _title=value;}
			get{return _title;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string AboutContent
		{
			set{ _aboutcontent=value;}
			get{return _aboutcontent;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Sort
		{
			set{ _sort=value;}
			get{return _sort;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Editor
		{
			set{ _editor=value;}
			get{return _editor;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? UpdateTime
		{
			set{ _updatetime=value;}
			get{return _updatetime;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? Click
		{
			set{ _click=value;}
			get{return _click;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Remark
		{
			set{ _remark=value;}
			get{return _remark;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string FengMian
		{
			set{ _fengmian=value;}
			get{return _fengmian;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? IsEnable
		{
			set{ _isenable=value;}
			get{return _isenable;}
		}
		#endregion Model

	}
}

