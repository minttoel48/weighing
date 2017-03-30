using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace AGaugeApp
{
    public partial class Form1 : Form
    {
        public Form1(float bawah = 0F, float atas = 0F, float max = 0F, float maxWeight = 5000F)
        {
            InitializeComponent();

            WeighingScale.MinValue = 2990F;
            WeighingScale.MaxValue = 3010F;
            WeighingScale.ScaleLinesMajorStepValue = 0.1F;

            WeighingScale.RangesStartValue = this.WeighingScale.RangesStartValue = new float[] { 0F, bawah, atas, 0F, 0F };
            WeighingScale.RangesEndValue = new float[] { bawah, atas, max, 0F, 0F };

            trackBar1.Maximum = int.Parse(maxWeight.ToString());
        }

        private void WeighingScale_ValueInRangeChanged(object sender, AGauge.ValueInRangeChangedEventArgs e)
        {
            if (e.valueInRange == 0)
            {
                label1.Text = "BELOW RANGE";
                label1.ForeColor = Color.FromArgb(255, 216, 0);
            }
            else if (e.valueInRange == 1)
            {
                label1.Text = "IN RANGE";
                label1.ForeColor = Color.FromArgb(0, 255, 0);
            }
            else if (e.valueInRange == 2)
            {
                label1.Text = "OVER RANGE!!!";
                label1.ForeColor = Color.FromArgb(255, 0, 0);
            }
        }

        private void trackBar1_ValueChanged(object sender, EventArgs e)
        {
            WeighingScale.Value = trackBar1.Value;
            lblInfo.Text = trackBar1.Value.ToString();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            this.Hide();
            Loading newForm = new Loading();
            newForm.ShowDialog();
            this.Close();
        }
    }
}