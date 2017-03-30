using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Weighing.Oracle.Logic;
using Weighing.Oracle.Models;
using Weighing.Preparation.Logic;
using Weighing.Terminal.Logic;

namespace UnitTesting
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void btnGetDataFromOracle_Click(object sender, EventArgs e)
        {
            OracleLogic obj = new OracleLogic();

            //1.Get All MO List dari Oracle
            List<string> xx = obj.GetListMO();
        }

        private void btnViewMOData_Click(object sender, EventArgs e)
        {
            OracleLogic obj = new OracleLogic();
            //2. Get MO Header
            List<XSHP_TIMBANG> result = obj.GetListMOHeader("MO_SHP_1");

            //Dari List ini nanti bisa diberi Checkbox untuk check list memastikan barang ready untuk diproses ke timbangan
            //List<XSHP_TIMBANG_ALOKASI> data = obj.GetListMoAllocation("MO_SHP_1");

        }

        private void btnPushDataFromOracle_Click(object sender, EventArgs e)
        {
            OracleLogic obj = new OracleLogic();
            //Ketika Sudah check ok semua, push ke table timbangan
            //3.Push dari oracle ke table di timbangan
            obj.PushDataFromOracle("MO_SHP_1");
        }

        private void btnGenerateTaskTimbang_Click(object sender, EventArgs e)
        {
            PreparationLogic obj = new PreparationLogic();
            obj.GenerateTaskTimbang("MO_SHP_1", DateTime.Now.Date, true);
            MessageBox.Show("Done");
        }

        private void btnGetTaskTimbang_Click(object sender, EventArgs e)
        {
            TerminalLogic obj = new TerminalLogic();
            obj.RequestTask(cboTerminal.SelectedItem.ToString(), 123);
            MessageBox.Show("Done");
        }
    }
}
