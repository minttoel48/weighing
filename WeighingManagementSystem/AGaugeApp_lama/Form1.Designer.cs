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
            this.trackBar1 = new System.Windows.Forms.TrackBar();
            this.label1 = new System.Windows.Forms.Label();
            this.WeighingScale = new AGaugeApp.AGauge();
            this.lblInfo = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).BeginInit();
            this.SuspendLayout();
            // 
            // trackBar1
            // 
            this.trackBar1.Location = new System.Drawing.Point(12, 12);
            this.trackBar1.Maximum = 5000;
            this.trackBar1.Name = "trackBar1";
            this.trackBar1.Orientation = System.Windows.Forms.Orientation.Vertical;
            this.trackBar1.Size = new System.Drawing.Size(45, 342);
            this.trackBar1.TabIndex = 2;
            this.trackBar1.TickFrequency = 100;
            this.trackBar1.TickStyle = System.Windows.Forms.TickStyle.Both;
            this.trackBar1.ValueChanged += new System.EventHandler(this.trackBar1_ValueChanged);
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.Color.White;
            this.label1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(158, 318);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(304, 34);
            this.label1.TabIndex = 20;
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // WeighingScale
            // 
            this.WeighingScale.BaseArcColor = System.Drawing.Color.Green;
            this.WeighingScale.BaseArcRadius = 130;
            this.WeighingScale.BaseArcStart = 135;
            this.WeighingScale.BaseArcSweep = 270;
            this.WeighingScale.BaseArcWidth = 3;
            this.WeighingScale.Cap_Idx = ((byte)(1));
            this.WeighingScale.CapColors = new System.Drawing.Color[] {
        System.Drawing.Color.Black,
        System.Drawing.Color.Black,
        System.Drawing.Color.Black,
        System.Drawing.Color.Black,
        System.Drawing.Color.Black};
            this.WeighingScale.CapPosition = new System.Drawing.Point(127, 110);
            this.WeighingScale.CapsPosition = new System.Drawing.Point[] {
        new System.Drawing.Point(10, 10),
        new System.Drawing.Point(127, 110),
        new System.Drawing.Point(165, 200),
        new System.Drawing.Point(10, 10),
        new System.Drawing.Point(10, 10)};
            this.WeighingScale.CapsText = new string[] {
        "",
        "Kalbe Nutritionals",
        "in grams",
        "",
        ""};
            this.WeighingScale.CapText = "Kalbe Nutritionals";
            this.WeighingScale.Center = new System.Drawing.Point(200, 170);
            this.WeighingScale.Font = new System.Drawing.Font("Arial", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.WeighingScale.Location = new System.Drawing.Point(65, 12);
            this.WeighingScale.MaxValue = 5000F;
            this.WeighingScale.MinValue = 0F;
            this.WeighingScale.Name = "WeighingScale";
            this.WeighingScale.NeedleColor1 = AGaugeApp.AGauge.NeedleColorEnum.Green;
            this.WeighingScale.NeedleColor2 = System.Drawing.Color.DimGray;
            this.WeighingScale.NeedleRadius = 130;
            this.WeighingScale.NeedleType = 0;
            this.WeighingScale.NeedleWidth = 7;
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
            this.WeighingScale.ScaleLinesMajorOuterRadius = 135;
            this.WeighingScale.ScaleLinesMajorStepValue = 500F;
            this.WeighingScale.ScaleLinesMajorWidth = 3;
            this.WeighingScale.ScaleLinesMinorColor = System.Drawing.Color.Gray;
            this.WeighingScale.ScaleLinesMinorInnerRadius = 130;
            this.WeighingScale.ScaleLinesMinorNumOf = 4;
            this.WeighingScale.ScaleLinesMinorOuterRadius = 140;
            this.WeighingScale.ScaleLinesMinorWidth = 1;
            this.WeighingScale.ScaleNumbersColor = System.Drawing.Color.Black;
            this.WeighingScale.ScaleNumbersFormat = null;
            this.WeighingScale.ScaleNumbersRadius = 160;
            this.WeighingScale.ScaleNumbersRotation = 0;
            this.WeighingScale.ScaleNumbersStartScaleLine = 1;
            this.WeighingScale.ScaleNumbersStepScaleLines = 1;
            this.WeighingScale.Size = new System.Drawing.Size(399, 305);
            this.WeighingScale.TabIndex = 3;
            this.WeighingScale.Text = "WeighingScale";
            this.WeighingScale.Value = 0F;
            this.WeighingScale.ValueInRangeChanged += new AGaugeApp.AGauge.ValueInRangeChangedDelegate(this.WeighingScale_ValueInRangeChanged);
            // 
            // lblInfo
            // 
            this.lblInfo.BackColor = System.Drawing.Color.White;
            this.lblInfo.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblInfo.Enabled = false;
            this.lblInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblInfo.Location = new System.Drawing.Point(52, 318);
            this.lblInfo.Name = "lblInfo";
            this.lblInfo.Size = new System.Drawing.Size(100, 34);
            this.lblInfo.TabIndex = 21;
            this.lblInfo.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(474, 361);
            this.Controls.Add(this.lblInfo);
            this.Controls.Add(this.WeighingScale);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.trackBar1);
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(490, 400);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(490, 400);
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "TEST";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Form1_FormClosing);
            ((System.ComponentModel.ISupportInitialize)(this.trackBar1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.TrackBar trackBar1;
        private AGauge WeighingScale;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label lblInfo;
    }
}

