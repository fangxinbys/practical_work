using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace Maticsoft.DAL
{
	/// <summary>
	/// 数据访问类:tAbout
	/// </summary>
	public partial class tAbout
	{
		public tAbout()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("Id", "tAbout"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int Id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from tAbout");
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
		public int Add(Maticsoft.Model.tAbout model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into tAbout(");
			strSql.Append("Title,AboutContent,Sort,Editor,UpdateTime,Click,Remark,FengMian,IsEnable)");
			strSql.Append(" values (");
			strSql.Append("@Title,@AboutContent,@Sort,@Editor,@UpdateTime,@Click,@Remark,@FengMian,@IsEnable)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@Title", SqlDbType.NVarChar,100),
					new SqlParameter("@AboutContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Sort", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@UpdateTime", SqlDbType.DateTime),
					new SqlParameter("@Click", SqlDbType.Int,4),
					new SqlParameter("@Remark", SqlDbType.NVarChar,-1),
					new SqlParameter("@FengMian", SqlDbType.NVarChar,500),
					new SqlParameter("@IsEnable", SqlDbType.Int,4)};
			parameters[0].Value = model.Title;
			parameters[1].Value = model.AboutContent;
			parameters[2].Value = model.Sort;
			parameters[3].Value = model.Editor;
			parameters[4].Value = model.UpdateTime;
			parameters[5].Value = model.Click;
			parameters[6].Value = model.Remark;
			parameters[7].Value = model.FengMian;
			parameters[8].Value = model.IsEnable;

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
		public bool Update(Maticsoft.Model.tAbout model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update tAbout set ");
			strSql.Append("Title=@Title,");
			strSql.Append("AboutContent=@AboutContent,");
			strSql.Append("Sort=@Sort,");
			strSql.Append("Editor=@Editor,");
			strSql.Append("UpdateTime=@UpdateTime,");
			strSql.Append("Click=@Click,");
			strSql.Append("Remark=@Remark,");
			strSql.Append("FengMian=@FengMian,");
			strSql.Append("IsEnable=@IsEnable");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Title", SqlDbType.NVarChar,100),
					new SqlParameter("@AboutContent", SqlDbType.NVarChar,-1),
					new SqlParameter("@Sort", SqlDbType.Int,4),
					new SqlParameter("@Editor", SqlDbType.NVarChar,50),
					new SqlParameter("@UpdateTime", SqlDbType.DateTime),
					new SqlParameter("@Click", SqlDbType.Int,4),
					new SqlParameter("@Remark", SqlDbType.NVarChar,-1),
					new SqlParameter("@FengMian", SqlDbType.NVarChar,500),
					new SqlParameter("@IsEnable", SqlDbType.Int,4),
					new SqlParameter("@Id", SqlDbType.Int,4)};
			parameters[0].Value = model.Title;
			parameters[1].Value = model.AboutContent;
			parameters[2].Value = model.Sort;
			parameters[3].Value = model.Editor;
			parameters[4].Value = model.UpdateTime;
			parameters[5].Value = model.Click;
			parameters[6].Value = model.Remark;
			parameters[7].Value = model.FengMian;
			parameters[8].Value = model.IsEnable;
			parameters[9].Value = model.Id;

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
			strSql.Append("delete from tAbout ");
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
			strSql.Append("delete from tAbout ");
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
		public Maticsoft.Model.tAbout GetModel(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 Id,Title,AboutContent,Sort,Editor,UpdateTime,Click,Remark,FengMian,IsEnable from tAbout ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			Maticsoft.Model.tAbout model=new Maticsoft.Model.tAbout();
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
		public Maticsoft.Model.tAbout DataRowToModel(DataRow row)
		{
			Maticsoft.Model.tAbout model=new Maticsoft.Model.tAbout();
			if (row != null)
			{
				if(row["Id"]!=null && row["Id"].ToString()!="")
				{
					model.Id=int.Parse(row["Id"].ToString());
				}
				if(row["Title"]!=null)
				{
					model.Title=row["Title"].ToString();
				}
				if(row["AboutContent"]!=null)
				{
					model.AboutContent=row["AboutContent"].ToString();
				}
				if(row["Sort"]!=null && row["Sort"].ToString()!="")
				{
					model.Sort=int.Parse(row["Sort"].ToString());
				}
				if(row["Editor"]!=null)
				{
					model.Editor=row["Editor"].ToString();
				}
				if(row["UpdateTime"]!=null && row["UpdateTime"].ToString()!="")
				{
					model.UpdateTime=DateTime.Parse(row["UpdateTime"].ToString());
				}
				if(row["Click"]!=null && row["Click"].ToString()!="")
				{
					model.Click=int.Parse(row["Click"].ToString());
				}
				if(row["Remark"]!=null)
				{
					model.Remark=row["Remark"].ToString();
				}
				if(row["FengMian"]!=null)
				{
					model.FengMian=row["FengMian"].ToString();
				}
				if(row["IsEnable"]!=null && row["IsEnable"].ToString()!="")
				{
					model.IsEnable=int.Parse(row["IsEnable"].ToString());
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
			strSql.Append("select Id,Title,AboutContent,Sort,Editor,UpdateTime,Click,Remark,FengMian,IsEnable ");
			strSql.Append(" FROM tAbout ");
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
			strSql.Append(" Id,Title,AboutContent,Sort,Editor,UpdateTime,Click,Remark,FengMian,IsEnable ");
			strSql.Append(" FROM tAbout ");
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
			strSql.Append("select count(1) FROM tAbout ");
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
			strSql.Append(")AS Row, T.*  from tAbout T ");
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
			parameters[0].Value = "tAbout";
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

