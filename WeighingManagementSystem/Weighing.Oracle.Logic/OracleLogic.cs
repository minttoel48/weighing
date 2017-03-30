using OanTech.Framework.OanTechHelper;
using System;
using System.Collections.Generic;
using System.Linq;
using Weighing.Entities;
using Weighing.Oracle.Models;
using Weighing.Preparation.Models;

namespace Weighing.Oracle.Logic
{
    public class OracleLogic
    {
        OanTechHelper entOracle = new OanTechHelper(MyEntities.Oracle);
        OanTechHelper entWMS = new OanTechHelper(MyEntities.Preparation);

        //ORACLE_1
        public List<string> GetListMO()
        {
            return entOracle.Resolve<XSHP_TIMBANG>().GetAll(x => x.IS_PROCESSED == false).Select(x => x.MO_NUMBER).Distinct().ToList();
        }
        //ORACLE_2
        public List<XSHP_TIMBANG> GetListMOHeader(string MONumber)
        {
            return entOracle.Resolve<XSHP_TIMBANG>().GetAll(x=> x.MO_NUMBER.Trim() == MONumber.Trim() && x.IS_PROCESSED == false);
        }
        //ORACLE_3
        public List<XSHP_TIMBANG_ALOKASI> GetListMoAllocation(Int64 MoLineId)
        {
            var query = from a in entOracle.Resolve<XSHP_TIMBANG_ALOKASI>().AsQueryable()
                        where a.MO_LINE_ID == MoLineId
                        select a.MO_LINE_ID;

            List<Int64> data = query.ToList();

            //var listLineId = entOracle.Resolve<XSHP_TIMBANG>().GetAll(x => x.MO_LINE_ID == MoLineId && x.IS_PROCESSED == false).Select(x=> x.MO_LINE_ID).ToList();
            return entOracle.Resolve<XSHP_TIMBANG_ALOKASI>().GetAll(x=> data.Contains(x.MO_LINE_ID) && x.IS_PROCESSED == false);
        }
        //ORACLE_4
        public void UpdateOracleStatus(string MONumber)
        {
            var xshpTimbang = entOracle.Resolve<XSHP_TIMBANG>().GetAll(x => x.MO_NUMBER == MONumber);
            xshpTimbang.ForEach(x => x.IS_PROCESSED = true);
            var xshpAlokasi = entOracle.Resolve<XSHP_TIMBANG_ALOKASI>().GetAll(x => xshpTimbang.Select(y=> y.MO_LINE_ID).ToList().Contains(x.MO_LINE_ID));
            xshpAlokasi.ForEach(x => x.IS_PROCESSED = true);

            entOracle.Save();
        }

        public void PushDataFromOracle(string MONumber)
        {
            List<XSHP_TIMBANG> dataHeader = GetListMOHeader(MONumber);

            foreach (XSHP_TIMBANG x in dataHeader)
            {
                OracleHeader oracleH = new OracleHeader();
                oracleH.MOHeaderId = x.MO_HEADER_ID;
                oracleH.MOLineId = x.MO_LINE_ID;
                oracleH.MoNumber = x.MO_NUMBER;
                oracleH.LineNumber = x.LINE_NUMBER;
                oracleH.FromSubInventoryCode = x.FROM_SUBINVENTORY_CODE;
                oracleH.ToSubInventoryCode = x.FROM_SUBINVENTORY_CODE;
                oracleH.DateRequired = x.DATE_REQUIRED;
                oracleH.SourceType = x.SOURCE_TYPE;
                oracleH.DocNumber = x.DOC_NUMBER;
                oracleH.Customer = x.SHIP_TO;
                oracleH.ShipTo = x.SHIP_TO;
                oracleH.Requestor = x.REQUESTOR;
                oracleH.ItemCode = x.ITEM_CODE;
                oracleH.ItemDesc = x.ITEM_DESC;
                oracleH.ItemDescAlias = x.ITEM_DESC_ALIAS;
                oracleH.UOM = x.UOM;
                oracleH.Qty = x.QTY;
                oracleH.UrutanTuang = x.URUTAN_TUANG;
                oracleH.QtyPerCharge = x.QTY_PER_CHARGE;
                oracleH.Activity = x.ACTIVITY;
                oracleH.CombineL1 = x.COMBINE_LV1;
                oracleH.CombineL2 = x.COMBINE_LV2;
                oracleH.PackingSize = x.PACKING_SIZE;
                oracleH.SelfLife = x.SELF_LIFE;
                oracleH.IsTimbang = x.IS_TIMBANG;
                oracleH.IsClosedCode = x.IS_CLOSED_CODE;
                oracleH.IsAllergen = x.IS_ALLERGEN;

                List<XSHP_TIMBANG_ALOKASI> dataDetail = GetListMoAllocation(x.MO_LINE_ID);

                foreach (XSHP_TIMBANG_ALOKASI y in dataDetail)
                {
                    OracleDetail oracleD = new OracleDetail();
                    oracleD.MOHeaderId = y.MO_HEADER_ID;
                    oracleD.MOLineId = y.MO_LINE_ID;
                    oracleD.MONumber = MONumber;
                    oracleD.ItemCode = y.ITEM_CODE;
                    oracleD.LotNo = y.LOT_NO;
                    oracleD.LotQty = y.LOT_QTY;
                    oracleD.ExpirationDate = y.EXPIRATION_DATE;
                    oracleH.OracleDetails.Add(oracleD);
                }

                entWMS.Resolve<OracleHeader>().Add(oracleH);
            }
            entWMS.Save();

            //Update Oracle Flag nya 1
            UpdateOracleStatus(MONumber);
        } 
    }
}
