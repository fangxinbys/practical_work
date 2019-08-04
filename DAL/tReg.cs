using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using Maticsoft.DBUtility;//Please add references
namespace Maticsoft.DAL
{
	/// <summary>
	/// 数据访问类:tReg
	/// </summary>
	public partial class tReg
	{
		public tReg()
		{}
		#region  BasicMethod

		/// <summary>
		/// 得到最大ID
		/// </summary>
		public int GetMaxId()
		{
		return DbHelperSQL.GetMaxID("Id", "tReg"); 
		}

		/// <summary>
		/// 是否存在该记录
		/// </summary>
		public bool Exists(int Id)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select count(1) from tReg");
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
		public int Add(Maticsoft.Model.tReg model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("insert into tReg(");
			strSql.Append("tName,tAdress,tCode,tMoney,tType,tPeo,tEm,tPhone,tIp,tTime,tDo)");
			strSql.Append(" values (");
			strSql.Append("@tName,@tAdress,@tCode,@tMoney,@tType,@tPeo,@tEm,@tPhone,@tIp,@tTime,@tDo)");
			strSql.Append(";select @@IDENTITY");
			SqlParameter[] parameters = {
					new SqlParameter("@tName", SqlDbType.NVarChar,50),
					new SqlParameter("@tAdress", SqlDbType.NVarChar,500),
					new SqlParameter("@tCode", SqlDbType.NVarChar,50),
					new SqlParameter("@tMoney", SqlDbType.NVarChar,50),
					new SqlParameter("@tType", SqlDbType.NVarChar,50),
					new SqlParameter("@tPeo", SqlDbType.NVarChar,50),
					new SqlParameter("@tEm", SqlDbType.NVarChar,50),
					new SqlParameter("@tPhone", SqlDbType.NVarChar,50),
					new SqlParameter("@tIp", SqlDbType.NVarChar,50),
					new SqlParameter("@tTime", SqlDbType.DateTime),
					new SqlParameter("@tDo", SqlDbType.NVarChar,50)};
			parameters[0].Value = model.tName;
			parameters[1].Value = model.tAdress;
			parameters[2].Value = model.tCode;
			parameters[3].Value = model.tMoney;
			parameters[4].Value = model.tType;
			parameters[5].Value = model.tPeo;
			parameters[6].Value = model.tEm;
			parameters[7].Value = model.tPhone;
			parameters[8].Value = model.tIp;
			parameters[9].Value = model.tTime;
			parameters[10].Value = model.tDo;

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
		public bool Update(Maticsoft.Model.tReg model)
		{
			StringBuilder strSql=new StringBuilder();
			strSql.Append("update tReg set ");
			strSql.Append("tName=@tName,");
			strSql.Append("tAdress=@tAdress,");
			strSql.Append("tCode=@tCode,");
			strSql.Append("tMoney=@tMoney,");
			strSql.Append("tType=@tType,");
			strSql.Append("tPeo=@tPeo,");
			strSql.Append("tEm=@tEm,");
			strSql.Append("tPhone=@tPhone,");
			strSql.Append("tIp=@tIp,");
			strSql.Append("tTime=@tTime,");
			strSql.Append("tDo=@tDo");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@tName", SqlDbType.NVarChar,50),
					new SqlParameter("@tAdress", SqlDbType.NVarChar,500),
					new SqlParameter("@tCode", SqlDbType.NVarChar,50),
					new SqlParameter("@tMoney", SqlDbType.NVarChar,50),
					new SqlParameter("@tType", SqlDbType.NVarChar,50),
					new SqlParameter("@tPeo", SqlDbType.NVarChar,50),
					new SqlParameter("@tEm", SqlDbType.NVarChar,50),
					new SqlParameter("@tPhone", SqlDbType.NVarChar,50),
					new SqlParameter("@tIp", SqlDbType.NVarChar,50),
					new SqlParameter("@tTime", SqlDbType.DateTime),
					new SqlParameter("@tDo", SqlDbType.NVarChar,50),
					new SqlParameter("@Id", SqlDbType.Int,4)};
			parameters[0].Value = model.tName;
			parameters[1].Value = model.tAdress;
			parameters[2].Value = model.tCode;
			parameters[3].Value = model.tMoney;
			parameters[4].Value = model.tType;
			parameters[5].Value = model.tPeo;
			parameters[6].Value = model.tEm;
			parameters[7].Value = model.tPhone;
			parameters[8].Value = model.tIp;
			parameters[9].Value = model.tTime;
			parameters[10].Value = model.tDo;
			parameters[11].Value = model.Id;

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
			strSql.Append("delete from tReg ");
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
			strSql.Append("delete from tReg ");
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
		public Maticsoft.Model.tReg GetModel(int Id)
		{
			
			StringBuilder strSql=new StringBuilder();
			strSql.Append("select  top 1 Id,tName,tAdress,tCode,tMoney,tType,tPeo,tEm,tPhone,tIp,tTime,tDo from tReg ");
			strSql.Append(" where Id=@Id");
			SqlParameter[] parameters = {
					new SqlParameter("@Id", SqlDbType.Int,4)
			};
			parameters[0].Value = Id;

			Maticsoft.Model.tReg model=new Maticsoft.Model.tReg();
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
		public Maticsoft.Model.tReg DataRowToModel(DataRow row)
		{
			Maticsoft.Model.tReg model=new Maticsoft.Model.tReg();
			if (row != null)
			{
				if(row["Id"]!=null && row["Id"].ToString()!="")
				{
					model.Id=int.Parse(row["Id"].ToString());
				}
				if(row["tName"]!=null)
				{
					model.tName=row["tName"].ToString();
				}
				if(row["tAdress"]!=null)
				{
					model.tAdress=row["tAdress"].ToString();
				}
				if(row["tCode"]!=null)
				{
					model.tCode=row["tCode"].ToString();
				}
				if(row["tMoney"]!=null)
				{
					model.tMoney=row["tMoney"].ToString();
				}
				if(row["tType"]!=null)
				{
					model.tType=row["tType"].ToString();
				}
				if(row["tPeo"]!=null)
				{
					model.tPeo=row["tPeo"].ToString();
				}
				if(row["tEm"]!=null)
				{
					model.tEm=row["tEm"].ToString();
				}
				if(row["tPhone"]!=null)
				{
					model.tPhone=row["tPhone"].ToString();
				}
				if(row["tIp"]!=null)
				{
					model.tIp=row["tIp"].ToString();
				}
				if(row["tTime"]!=null && row["tTime"].ToString()!="")
				{
					model.tTime=DateTime.Parse(row["tTime"].ToString());
				}
				if(row["tDo"]!=null)
				{
					model.tDo=row["tDo"].ToString();
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
			strSql.Append("select Id,tName,tAdress,tCode,tMoney,tType,tPeo,tEm,tPhone,tIp,tTime,tDo ");
			strSql.Append(" FROM tReg ");
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
			strSql.Append(" Id,tName,tAdress,tCode,tMoney,tType,tPeo,tEm,tPhone,tIp,tTime,tDo ");
			strSql.Append(" FROM tReg ");
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
			strSql.Append("select count(1) FROM tReg ");
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
			strSql.Append(")AS Row, T.*  from tReg T ");
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
			parameters[0].Value = "tReg";
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

