namespace UnitTesting
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
            this.btnGetDataFromOracle = new System.Windows.Forms.Button();
            this.btnPushDataFromOracle = new System.Windows.Forms.Button();
            this.btnGenerateTaskTimbang = new System.Windows.Forms.Button();
            this.btnViewMOData = new System.Windows.Forms.Button();
            this.btnGetTaskTimbang = new System.Windows.Forms.Button();
            this.cboTerminal = new System.Windows.Forms.ComboBox();
            this.SuspendLayout();
            // 
            // btnGetDataFromOracle
            // 
            this.btnGetDataFromOracle.Location = new System.Drawing.Point(13, 13);
            this.btnGetDataFromOracle.Name = "btnGetDataFromOracle";
            this.btnGetDataFromOracle.Size = new System.Drawing.Size(156, 23);
            this.btnGetDataFromOracle.TabIndex = 0;
            this.btnGetDataFromOracle.Text = "Get Data From Oracle";
            this.btnGetDataFromOracle.UseVisualStyleBackColor = true;
            this.btnGetDataFromOracle.Click += new System.EventHandler(this.btnGetDataFromOracle_Click);
            // 
            // btnPushDataFromOracle
            // 
            this.btnPushDataFromOracle.Location = new System.Drawing.Point(13, 71);
            this.btnPushDataFromOracle.Name = "btnPushDataFromOracle";
            this.btnPushDataFromOracle.Size = new System.Drawing.Size(156, 23);
            this.btnPushDataFromOracle.TabIndex = 1;
            this.btnPushDataFromOracle.Text = "Push Data From Oracle";
            this.btnPushDataFromOracle.UseVisualStyleBackColor = true;
            this.btnPushDataFromOracle.Click += new System.EventHandler(this.btnPushDataFromOracle_Click);
            // 
            // btnGenerateTaskTimbang
            // 
            this.btnGenerateTaskTimbang.Location = new System.Drawing.Point(13, 100);
            this.btnGenerateTaskTimbang.Name = "btnGenerateTaskTimbang";
            this.btnGenerateTaskTimbang.Size = new System.Drawing.Size(156, 23);
            this.btnGenerateTaskTimbang.TabIndex = 2;
            this.btnGenerateTaskTimbang.Text = "Generate Task Timbang";
            this.btnGenerateTaskTimbang.UseVisualStyleBackColor = true;
            this.btnGenerateTaskTimbang.Click += new System.EventHandler(this.btnGenerateTaskTimbang_Click);
            // 
            // btnViewMOData
            // 
            this.btnViewMOData.Location = new System.Drawing.Point(13, 42);
            this.btnViewMOData.Name = "btnViewMOData";
            this.btnViewMOData.Size = new System.Drawing.Size(156, 23);
            this.btnViewMOData.TabIndex = 3;
            this.btnViewMOData.Text = "View MO Data";
            this.btnViewMOData.UseVisualStyleBackColor = true;
            this.btnViewMOData.Click += new System.EventHandler(this.btnViewMOData_Click);
            // 
            // btnGetTaskTimbang
            // 
            this.btnGetTaskTimbang.Location = new System.Drawing.Point(72, 169);
            this.btnGetTaskTimbang.Name = "btnGetTaskTimbang";
            this.btnGetTaskTimbang.Size = new System.Drawing.Size(156, 23);
            this.btnGetTaskTimbang.TabIndex = 4;
            this.btnGetTaskTimbang.Text = "Get Task Timbang";
            this.btnGetTaskTimbang.UseVisualStyleBackColor = true;
            this.btnGetTaskTimbang.Click += new System.EventHandler(this.btnGetTaskTimbang_Click);
            // 
            // cboTerminal
            // 
            this.cboTerminal.FormattingEnabled = true;
            this.cboTerminal.Items.AddRange(new object[] {
            "T01",
            "T02",
            "T03",
            "T04",
            "T05",
            "T06",
            "T07",
            "T08",
            "T09",
            "T10"});
            this.cboTerminal.Location = new System.Drawing.Point(13, 169);
            this.cboTerminal.Name = "cboTerminal";
            this.cboTerminal.Size = new System.Drawing.Size(53, 21);
            this.cboTerminal.TabIndex = 5;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(364, 447);
            this.Controls.Add(this.cboTerminal);
            this.Controls.Add(this.btnGetTaskTimbang);
            this.Controls.Add(this.btnViewMOData);
            this.Controls.Add(this.btnGenerateTaskTimbang);
            this.Controls.Add(this.btnPushDataFromOracle);
            this.Controls.Add(this.btnGetDataFromOracle);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnGetDataFromOracle;
        private System.Windows.Forms.Button btnPushDataFromOracle;
        private System.Windows.Forms.Button btnGenerateTaskTimbang;
        private System.Windows.Forms.Button btnViewMOData;
        private System.Windows.Forms.Button btnGetTaskTimbang;
        private System.Windows.Forms.ComboBox cboTerminal;
    }
}

