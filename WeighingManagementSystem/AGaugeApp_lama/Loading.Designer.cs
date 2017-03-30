namespace AGaugeApp
{
    partial class Loading
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
            this.txtBatasAtas = new System.Windows.Forms.TextBox();
            this.txtBatasBawah = new System.Windows.Forms.TextBox();
            this.btnSet = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // txtBatasAtas
            // 
            this.txtBatasAtas.Location = new System.Drawing.Point(85, 12);
            this.txtBatasAtas.Name = "txtBatasAtas";
            this.txtBatasAtas.Size = new System.Drawing.Size(67, 20);
            this.txtBatasAtas.TabIndex = 26;
            // 
            // txtBatasBawah
            // 
            this.txtBatasBawah.Location = new System.Drawing.Point(12, 12);
            this.txtBatasBawah.Name = "txtBatasBawah";
            this.txtBatasBawah.Size = new System.Drawing.Size(67, 20);
            this.txtBatasBawah.TabIndex = 25;
            // 
            // btnSet
            // 
            this.btnSet.Location = new System.Drawing.Point(158, 12);
            this.btnSet.Name = "btnSet";
            this.btnSet.Size = new System.Drawing.Size(75, 20);
            this.btnSet.TabIndex = 24;
            this.btnSet.Text = "SET";
            this.btnSet.UseVisualStyleBackColor = true;
            this.btnSet.Click += new System.EventHandler(this.btnSet_Click);
            // 
            // Loading
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(244, 46);
            this.Controls.Add(this.txtBatasAtas);
            this.Controls.Add(this.txtBatasBawah);
            this.Controls.Add(this.btnSet);
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(260, 85);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(260, 85);
            this.Name = "Loading";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Loading";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.Loading_FormClosing);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtBatasAtas;
        private System.Windows.Forms.TextBox txtBatasBawah;
        private System.Windows.Forms.Button btnSet;
    }
}