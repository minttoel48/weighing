namespace AGaugeApp
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.data = new System.Windows.Forms.TrackBar();
            this.txtWeightDigit = new System.Windows.Forms.TextBox();
            this.txtStartScale = new System.Windows.Forms.TextBox();
            this.WeighingScale = new AGaugeApp.AGauge();
            ((System.ComponentModel.ISupportInitialize)(this.data)).BeginInit();
            this.SuspendLayout();
            // 
            // data
            // 
            this.data.Location = new System.Drawing.Point(12, 357);
            this.data.Maximum = 5000;
            this.data.Name = "data";
            this.data.Size = new System.Drawing.Size(362, 45);
            this.data.TabIndex = 2;
            this.data.TickStyle = System.Windows.Forms.TickStyle.Both;
            this.data.ValueChanged += new System.EventHandler(this.trackBar1_ValueChanged);
            // 
            // txtWeightDigit
            // 
            this.txtWeightDigit.Enabled = false;
            this.txtWeightDigit.Font = new System.Drawing.Font("Digital-7", 27.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtWeightDigit.Location = new System.Drawing.Point(319, 12);
            this.txtWeightDigit.Name = "txtWeightDigit";
            this.txtWeightDigit.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.txtWeightDigit.Size = new System.Drawing.Size(128, 44);
            this.txtWeightDigit.TabIndex = 10;
            this.txtWeightDigit.Text = "0.00";
            // 
            // txtStartScale
            // 
            this.txtStartScale.Enabled = false;
            this.txtStartScale.Location = new System.Drawing.Point(27, 177);
            this.txtStartScale.Name = "txtStartScale";
            this.txtStartScale.RightToLeft = System.Windows.Forms.RightToLeft.Yes;
            this.txtStartScale.Size = new System.Drawing.Size(50, 20);
            this.txtStartScale.TabIndex = 11;
            // 
            // WeighingScale
            // 
            this.WeighingScale.BaseArcColor = System.Drawing.Color.Gray;
            this.WeighingScale.BaseArcRadius = 130;
            this.WeighingScale.BaseArcStart = 180;
            this.WeighingScale.BaseArcSweep = 180;
            this.WeighingScale.BaseArcWidth = 2;
            this.WeighingScale.Cap_Idx = ((byte)(2));
            this.WeighingScale.CapColors = new System.Drawing.Color[] {
        System.Drawing.Color.Black,
        System.Drawing.Color.Black,
        System.Drawing.Color.Black,
        System.Drawing.Color.Black,
        System.Drawing.Color.Black};
            this.WeighingScale.CapPosition = new System.Drawing.Point(148, 200);
            this.WeighingScale.CapsPosition = new System.Drawing.Point[] {
        new System.Drawing.Point(10, 10),
        new System.Drawing.Point(120, 120),
        new System.Drawing.Point(148, 200),
        new System.Drawing.Point(10, 10),
        new System.Drawing.Point(10, 10)};
            this.WeighingScale.CapsText = new string[] {
        "",
        "Kalbe Nutritionals",
        "in Grams",
        "",
        ""};
            this.WeighingScale.CapText = "in Grams";
            this.WeighingScale.Center = new System.Drawing.Point(170, 170);
            this.WeighingScale.Font = new System.Drawing.Font("Arial Narrow", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(162)));
            this.WeighingScale.Location = new System.Drawing.Point(47, 18);
            this.WeighingScale.MaxValue = 5000F;
            this.WeighingScale.MinValue = 0F;
            this.WeighingScale.Name = "WeighingScale";
            this.WeighingScale.NeedleColor1 = AGaugeApp.AGauge.NeedleColorEnum.Blue;
            this.WeighingScale.NeedleColor2 = System.Drawing.Color.LimeGreen;
            this.WeighingScale.NeedleRadius = 130;
            this.WeighingScale.NeedleType = 0;
            this.WeighingScale.NeedleWidth = 8;
            this.WeighingScale.Range_Idx = ((byte)(1));
            this.WeighingScale.RangeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(255)))), ((int)(((byte)(0)))));
            this.WeighingScale.RangeEnabled = true;
            this.WeighingScale.RangeEndValue = 0F;
            this.WeighingScale.RangeInnerRadius = 100;
            this.WeighingScale.RangeOuterRadius = 130;
            this.WeighingScale.RangesColor = new System.Drawing.Color[] {
        System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(216)))), ((int)(((byte)(0))))),
        System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(255)))), ((int)(((byte)(0))))),
        System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(0)))), ((int)(((byte)(0))))),
        System.Drawing.SystemColors.Control,
        System.Drawing.SystemColors.Control};
            this.WeighingScale.RangesEnabled = new bool[] {
        true,
        true,
        true,
        false,
        false};
            this.WeighingScale.RangesEndValue = new float[] {
        0F,
        0F,
        0F,
        0F,
        0F};
            this.WeighingScale.RangesInnerRadius = new int[] {
        100,
        100,
        100,
        70,
        70};
            this.WeighingScale.RangesOuterRadius = new int[] {
        130,
        130,
        130,
        80,
        80};
            this.WeighingScale.RangesStartValue = new float[] {
        0F,
        0F,
        0F,
        0F,
        0F};
            this.WeighingScale.RangeStartValue = 0F;
            this.WeighingScale.ScaleLinesInterColor = System.Drawing.Color.Black;
            this.WeighingScale.ScaleLinesInterInnerRadius = 130;
            this.WeighingScale.ScaleLinesInterOuterRadius = 140;
            this.WeighingScale.ScaleLinesInterWidth = 2;
            this.WeighingScale.ScaleLinesMajorColor = System.Drawing.Color.Black;
            this.WeighingScale.ScaleLinesMajorInnerRadius = 130;
            this.WeighingScale.ScaleLinesMajorOuterRadius = 142;
            this.WeighingScale.ScaleLinesMajorStepValue = 1000F;
            this.WeighingScale.ScaleLinesMajorWidth = 1;
            this.WeighingScale.ScaleLinesMinorColor = System.Drawing.Color.Gray;
            this.WeighingScale.ScaleLinesMinorInnerRadius = 130;
            this.WeighingScale.ScaleLinesMinorNumOf = 0;
            this.WeighingScale.ScaleLinesMinorOuterRadius = 140;
            this.WeighingScale.ScaleLinesMinorWidth = 1;
            this.WeighingScale.ScaleNumbersColor = System.Drawing.Color.Black;
            this.WeighingScale.ScaleNumbersFormat = null;
            this.WeighingScale.ScaleNumbersRadius = 160;
            this.WeighingScale.ScaleNumbersRotation = 0;
            this.WeighingScale.ScaleNumbersStartScaleLine = 1;
            this.WeighingScale.ScaleNumbersStepScaleLines = 1;
            this.WeighingScale.Size = new System.Drawing.Size(349, 301);
            this.WeighingScale.TabIndex = 3;
            this.WeighingScale.Text = "WeighingScale";
            this.WeighingScale.Value = 0F;
            this.WeighingScale.ValueInRangeChanged += new AGaugeApp.AGauge.ValueInRangeChangedDelegate(this.WeighingScale_ValueInRangeChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(459, 331);
            this.Controls.Add(this.txtStartScale);
            this.Controls.Add(this.txtWeightDigit);
            this.Controls.Add(this.WeighingScale);
            this.Controls.Add(this.data);
            this.Name = "Form1";
            this.Text = "Weighing Scale";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            ((System.ComponentModel.ISupportInitialize)(this.data)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.TrackBar data;
        private AGauge WeighingScale;
        private System.Windows.Forms.TextBox txtWeightDigit;
        private System.Windows.Forms.TextBox txtStartScale;
    }
}

