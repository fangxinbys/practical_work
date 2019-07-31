using System;
namespace Maticsoft.Model
{
	/// <summary>
	/// tArticleType:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class tArticleType
	{
		public tArticleType()
		{}
		#region Model
		private int _id;
		private string _name;
		private int? _sort;
		private int? _fatherid;
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
		public string Name
		{
			set{ _name=value;}
			get{return _name;}
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
		public int? FatherID
		{
			set{ _fatherid=value;}
			get{return _fatherid;}
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

