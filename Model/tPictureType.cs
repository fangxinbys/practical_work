using System;
namespace Maticsoft.Model
{
	/// <summary>
	/// tPictureType:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class tPictureType
	{
		public tPictureType()
		{}
		#region Model
		private int _id;
		private string _name;
		private int? _sort;
		private string _remark;
		private int? _fatherid;
		/// <summary>
		/// 
		/// </summary>
		public int id
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
		public string Remark
		{
			set{ _remark=value;}
			get{return _remark;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? FatherId
		{
			set{ _fatherid=value;}
			get{return _fatherid;}
		}
		#endregion Model

	}
}

