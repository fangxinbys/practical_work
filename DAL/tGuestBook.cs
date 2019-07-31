using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace Maticsoft.DAL
{
	/// <summary>
	/// 数据访问类:tGuestBook
	/// </summary>
	public partial class tGuestBook
	{
		public tGuestBook()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("Id", "tGuestBook"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int Id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from tGuestBook");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			return DbHelperSQL.Exists(strSql.ToString(),parameters);
		}


		/// <summary>
		/// 增加一条数据
		/// </summary>
		public int Add(Maticsoft.Model.tGuestBook model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into tGuestBook(");
			strSql.Append("Leave_name,Email,Telphone,Address,QQ,Title,GuestContent,Leave_time,Leave_ip,ReplayContent,Replay_ip,Replay_time)");
			strSql.Append(" values (");
			strSql.Append("@Leave_name,@Email,@Telphone,@Address,@QQ,@Title,@GuestContent,@Leave_time,@Leave_ip,@ReplayContent,@Replay_ip,@Replay_time)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@Leave_name", SqlDbType.NVarChar,500),
					new SqlParameter("@Email", SqlDbType.VarChar,50),
					new SqlParameter("@Telphone", SqlDbType.VarChar,30),
					new SqlParameter("@Address", SqlDbType.NVarChar,100),
					new SqlParameter("@QQ", SqlDbType.Int,4),
					new SqlParameter("@Title", SqlDbType.NVarChar,50),
					new SqlParameter("@GuestContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Leave_time", SqlDbType.DateTime),
					new SqlParameter("@Leave_ip", SqlDbType.VarChar,30),
					new SqlParameter("@ReplayContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Replay_ip", SqlDbType.VarChar,30),
					new SqlParameter("@Replay_time", SqlDbType.DateTime)};
			parameters[0].Value = model.Leave_name;
			parameters[1].Value = model.Email;
			parameters[2].Value = model.Telphone;
			parameters[3].Value = model.Address;
			parameters[4].Value = model.QQ;
			parameters[5].Value = model.Title;
			parameters[6].Value = model.GuestContent;
			parameters[7].Value = model.Leave_time;
			parameters[8].Value = model.Leave_ip;
			parameters[9].Value = model.ReplayContent;
			parameters[10].Value = model.Replay_ip;
			parameters[11].Value = model.Replay_time;

			object obj = DbHelperSQL.GetSingle(strSql.ToString(),parameters);
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 更新一条数据
		/// </summary>
		public bool Update(Maticsoft.Model.tGuestBook model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update tGuestBook set ");
			strSql.Append("Leave_name=@Leave_name,");
			strSql.Append("Email=@Email,");
			strSql.Append("Telphone=@Telphone,");
			strSql.Append("Address=@Address,");
			strSql.Append("QQ=@QQ,");
			strSql.Append("Title=@Title,");
			strSql.Append("GuestContent=@GuestContent,");
			strSql.Append("Leave_time=@Leave_time,");
			strSql.Append("Leave_ip=@Leave_ip,");
			strSql.Append("ReplayContent=@ReplayContent,");
			strSql.Append("Replay_ip=@Replay_ip,");
			strSql.Append("Replay_time=@Replay_time");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Leave_name", SqlDbType.NVarChar,500),
					new SqlParameter("@Email", SqlDbType.VarChar,50),
					new SqlParameter("@Telphone", SqlDbType.VarChar,30),
					new SqlParameter("@Address", SqlDbType.NVarChar,100),
					new SqlParameter("@QQ", SqlDbType.Int,4),
					new SqlParameter("@Title", SqlDbType.NVarChar,50),
					new SqlParameter("@GuestContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Leave_time", SqlDbType.DateTime),
					new SqlParameter("@Leave_ip", SqlDbType.VarChar,30),
					new SqlParameter("@ReplayContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Replay_ip", SqlDbType.VarChar,30),
					new SqlParameter("@Replay_time", SqlDbType.DateTime),
					new SqlParameter("@Id", SqlDbType.Int,4)};
			parameters[0].Value = model.Leave_name;
			parameters[1].Value = model.Email;
			parameters[2].Value = model.Telphone;
			parameters[3].Value = model.Address;
			parameters[4].Value = model.QQ;
			parameters[5].Value = model.Title;
			parameters[6].Value = model.GuestContent;
			parameters[7].Value = model.Leave_time;
			parameters[8].Value = model.Leave_ip;
			parameters[9].Value = model.ReplayContent;
			parameters[10].Value = model.Replay_ip;
			parameters[11].Value = model.Replay_time;
			parameters[12].Value = model.Id;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}

		/// <summary>
		/// 删除一条数据
		/// </summary>
		public bool Delete(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from tGuestBook ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			int rows=DbHelperSQL.ExecuteSql(strSql.ToString(),parameters);
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		/// <summary>
		/// 批量删除数据
		/// </summary>
		public bool DeleteList(string Idlist )
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("delete from tGuestBook ");
			strSql.Append(" where Id in ("+Idlist + ")  ");
			int rows=DbHelperSQL.ExecuteSql(strSql.ToString());
			if (rows > 0)
			{
				return true;
			}
			else
			{
				return false;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Maticsoft.Model.tGuestBook GetModel(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 Id,Leave_name,Email,Telphone,Address,QQ,Title,GuestContent,Leave_time,Leave_ip,ReplayContent,Replay_ip,Replay_time from tGuestBook ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			Maticsoft.Model.tGuestBook model=new Maticsoft.Model.tGuestBook();
			DataSet ds=DbHelperSQL.Query(strSql.ToString(),parameters);
			if(ds.Tables[0].Rows.Count>0)
			{
				return DataRowToModel(ds.Tables[0].Rows[0]);
			}
			else
			{
				return null;
			}
		}


		/// <summary>
		/// 得到一个对象实体
		/// </summary>
		public Maticsoft.Model.tGuestBook DataRowToModel(DataRow row)
		{
			Maticsoft.Model.tGuestBook model=new Maticsoft.Model.tGuestBook();
			if (row != null)
			{
				if(row["Id"]!=null && row["Id"].ToString()!="")
				{
					model.Id=int.Parse(row["Id"].ToString());
				}
				if(row["Leave_name"]!=null)
				{
					model.Leave_name=row["Leave_name"].ToString();
				}
				if(row["Email"]!=null)
				{
					model.Email=row["Email"].ToString();
				}
				if(row["Telphone"]!=null)
				{
					model.Telphone=row["Telphone"].ToString();
				}
				if(row["Address"]!=null)
				{
					model.Address=row["Address"].ToString();
				}
				if(row["QQ"]!=null && row["QQ"].ToString()!="")
				{
					model.QQ=int.Parse(row["QQ"].ToString());
				}
				if(row["Title"]!=null)
				{
					model.Title=row["Title"].ToString();
				}
				if(row["GuestContent"]!=null)
				{
					model.GuestContent=row["GuestContent"].ToString();
				}
				if(row["Leave_time"]!=null && row["Leave_time"].ToString()!="")
				{
					model.Leave_time=DateTime.Parse(row["Leave_time"].ToString());
				}
				if(row["Leave_ip"]!=null)
				{
					model.Leave_ip=row["Leave_ip"].ToString();
				}
				if(row["ReplayContent"]!=null)
				{
					model.ReplayContent=row["ReplayContent"].ToString();
				}
				if(row["Replay_ip"]!=null)
				{
					model.Replay_ip=row["Replay_ip"].ToString();
				}
				if(row["Replay_time"]!=null && row["Replay_time"].ToString()!="")
				{
					model.Replay_time=DateTime.Parse(row["Replay_time"].ToString());
				}
			}
			return model;
		}

		/// <summary>
		/// 获得数据列表
		/// </summary>
		public DataSet GetList(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select Id,Leave_name,Email,Telphone,Address,QQ,Title,GuestContent,Leave_time,Leave_ip,ReplayContent,Replay_ip,Replay_time ");
			strSql.Append(" FROM tGuestBook ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获得前几行数据
		/// </summary>
		public DataSet GetList(int Top,string strWhere,string filedOrder)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select ");
			if(Top>0)
			{
				strSql.Append(" top "+Top.ToString());
			}
			strSql.Append(" Id,Leave_name,Email,Telphone,Address,QQ,Title,GuestContent,Leave_time,Leave_ip,ReplayContent,Replay_ip,Replay_time ");
			strSql.Append(" FROM tGuestBook ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			strSql.Append(" order by " + filedOrder);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/// <summary>
		/// 获取记录总数
		/// </summary>
		public int GetRecordCount(string strWhere)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) FROM tGuestBook ");
			if(strWhere.Trim()!="")
			{
				strSql.Append(" where "+strWhere);
			}
			object obj = DbHelperSQL.GetSingle(strSql.ToString());
			if (obj == null)
			{
				return 0;
			}
			else
			{
				return Convert.ToInt32(obj);
			}
		}
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("SELECT * FROM ( ");
			strSql.Append(" SELECT ROW_NUMBER() OVER (");
			if (!string.IsNullOrEmpty(orderby.Trim()))
			{
				strSql.Append("order by T." + orderby );
			}
			else
			{
				strSql.Append("order by T.Id desc");
			}
			strSql.Append(")AS Row, T.*  from tGuestBook T ");
			if (!string.IsNullOrEmpty(strWhere.Trim()))
			{
				strSql.Append(" WHERE " + strWhere);
			}
			strSql.Append(" ) TT");
			strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
			return DbHelperSQL.Query(strSql.ToString());
		}

		/*
		/// <summary>
		/// 分页获取数据列表
		/// </summary>
		public DataSet GetList(int PageSize,int PageIndex,string strWhere)
		{
			SqlParameter[] parameters = {
					new SqlParameter("@tblName", SqlDbType.VarChar, 255),
					new SqlParameter("@fldName", SqlDbType.VarChar, 255),
					new SqlParameter("@PageSize", SqlDbType.Int),
					new SqlParameter("@PageIndex", SqlDbType.Int),
					new SqlParameter("@IsReCount", SqlDbType.Bit),
					new SqlParameter("@OrderType", SqlDbType.Bit),
					new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
					};
			parameters[0].Value = "tGuestBook";
			parameters[1].Value = "Id";
			parameters[2].Value = PageSize;
			parameters[3].Value = PageIndex;
			parameters[4].Value = 0;
			parameters[5].Value = 0;
			parameters[6].Value = strWhere;	
			return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
		}*/

		#endregion  BasicMethod
		#region  ExtensionMethod

		#endregion  ExtensionMethod
	}
}

