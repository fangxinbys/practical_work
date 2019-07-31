using System;
namespace Maticsoft.Model
{
	/// <summary>
	/// tGuestBook:实体类(属性说明自动提取数据库字段的描述信息)
	/// </summary>
	[Serializable]
	public partial class tGuestBook
	{
		public tGuestBook()
		{}
		#region Model
		private int _id;
		private string _leave_name;
		private string _email;
		private string _telphone;
		private string _address;
		private int? _qq;
		private string _title;
		private string _guestcontent;
		private DateTime? _leave_time;
		private string _leave_ip;
		private string _replaycontent;
		private string _replay_ip;
		private DateTime? _replay_time;
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
		public string Leave_name
		{
			set{ _leave_name=value;}
			get{return _leave_name;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Email
		{
			set{ _email=value;}
			get{return _email;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Telphone
		{
			set{ _telphone=value;}
			get{return _telphone;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Address
		{
			set{ _address=value;}
			get{return _address;}
		}
		/// <summary>
		/// 
		/// </summary>
		public int? QQ
		{
			set{ _qq=value;}
			get{return _qq;}
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
		public string GuestContent
		{
			set{ _guestcontent=value;}
			get{return _guestcontent;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? Leave_time
		{
			set{ _leave_time=value;}
			get{return _leave_time;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Leave_ip
		{
			set{ _leave_ip=value;}
			get{return _leave_ip;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string ReplayContent
		{
			set{ _replaycontent=value;}
			get{return _replaycontent;}
		}
		/// <summary>
		/// 
		/// </summary>
		public string Replay_ip
		{
			set{ _replay_ip=value;}
			get{return _replay_ip;}
		}
		/// <summary>
		/// 
		/// </summary>
		public DateTime? Replay_time
		{
			set{ _replay_time=value;}
			get{return _replay_time;}
		}
		#endregion Model

	}
}

