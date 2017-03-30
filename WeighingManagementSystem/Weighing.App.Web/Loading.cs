using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace AGaugeApp
{
    public partial class Loading : Form
    {
        public Loading()
        {
            InitializeComponent();
        }

        private void btnSet_Click(object sender, EventArgs e)
        {
            float weight = float.Parse(txtWeight.Text);

            this.Hide();
            Form1 newForm = new Form1(weight);
            newForm.ShowDialog();
            this.Close();
        }

        private void Loading_FormClosing(object sender, FormClosingEventArgs e)
        {
            Form1 form1 = new Form1();
            Loading loading = new Loading();
            form1.Close();
            loading.Close();
        }
    }
}
