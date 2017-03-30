using SerialPortListener.Serial;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO.Ports;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace AGaugeApp
{
    public partial class Form1 : Form
    {
        double weightFinal = 0;
        //SerialPortManager _spManager;
        System.Windows.Forms.Timer timer = new System.Windows.Forms.Timer();
        int resultData = 0;
        float weightMax = 0;

        public Form1(float weight = 0F)
        {
            InitializeComponent();
            //UserInitialization();

            float rangeStart = 0F;
            float rangeEnd = 0F;

            if (weight != 0F)
            {
                double val = double.Parse(weight.ToString());
                double inRangeStart = val - 0.03;
                double inRangeEnd = val + 0.03;

                weightFinal = val;

                float maxValue = float.Parse((val + 0.2).ToString());
                float minValue = float.Parse((val - 1).ToString());

                txtStartScale.Text = (decimal.Parse((minValue * 100).ToString()) / 100).ToString();

                rangeStart = float.Parse((inRangeStart * 100).ToString());
                rangeEnd = float.Parse((inRangeEnd * 100).ToString());

                WeighingScale.Value = 0; //defaul awal 0
                WeighingScale.MaxValue = maxValue * 100;
                WeighingScale.MinValue = minValue * 100;

                weightMax = maxValue * 100;

                WeighingScale.RangeEndValue = rangeEnd;
                WeighingScale.RangeStartValue = rangeStart;

                WeighingScale.RangesStartValue = new float[] { minValue * 100, rangeStart, rangeEnd, 0F, 0F };
                WeighingScale.RangesEndValue = new float[] { rangeStart, rangeEnd, maxValue * 100, 0F, 0F };

                this.WeighingScale.ScaleLinesMajorStepValue = 10;

                data.Minimum = 0;
                data.Maximum = int.Parse((maxValue * 100).ToString());

                //_spManager.StartListening();

                SerialPort mySerialPort = new SerialPort("COM3");

                mySerialPort.BaudRate = 1200;
                mySerialPort.Parity = Parity.Odd;
                mySerialPort.StopBits = StopBits.One;
                mySerialPort.DataBits = 7;
                mySerialPort.Handshake = Handshake.RequestToSend;
                mySerialPort.RtsEnable = true;
                mySerialPort.DtrEnable = true;
                mySerialPort.DataReceived += new SerialDataReceivedEventHandler(DataReceivedHandler);

                mySerialPort.Open();

                timer.Tick += new EventHandler(timer_Tick); // Everytime timer ticks, timer_Tick will be called
                timer.Interval = (500) * (1);              // Timer will tick evert second
                timer.Enabled = true;                       // Enable the timer
                timer.Start();
            }

        }
        void timer_Tick(object sender, EventArgs e)
        {
            if (resultData < int.Parse(weightMax.ToString())) //batas atas maximum timbangan
            {
                data.Value = resultData;
            }
            else
            {
                data.Value = int.Parse(weightMax.ToString()); //batas atas maximum
            }
        }

        private void DataReceivedHandler(
                        object sender,
                        SerialDataReceivedEventArgs e)
        {
            SerialPort sp = (SerialPort)sender;

            for (Int64 i = 0; i < Int64.MaxValue; i++)
            {
                string indata = sp.ReadExisting().Trim().TrimStart().TrimEnd();

                int a = indata.IndexOf('N');
                if (a >= 0 && indata.Length > 13)
                {
                    indata = indata.Substring(a);

                    if (indata.StartsWith("N") && indata.Length > 13)
                    {
                        indata = indata.Substring(9, 7);

                        try
                        {
                            double decIndata = double.Parse(indata) * 100;
                            //data ke trackbar harus int
                            int trackBarData = int.Parse(decIndata.ToString());
                            resultData = trackBarData;
                        }
                        catch
                        { }

                    }
                    //string result = indata;
                }

                //for (int y = 0; y < indata.Length; y++)
                //{
                //    if (indata[y].ToString() == "N" && indata.Length >= 7)
                //    {
                //        indata = indata.Substring(y + 9, 7);
                //        break;
                //    }
                //}
                //StringBuilder str = new StringBuilder();
                //str.AppendLine(indata);
                //CreateLog(str);
                ////Console.WriteLine(indata);
                Thread.Sleep(500);
            }

            //for (int i = 0; i < int.MaxValue; i++)
            //{
            //    string indata = sp.ReadExisting().Trim().TrimStart().TrimEnd();



            //for (int y = 0; y < indata.Length; y++)
            //{
            //    if (indata[y].ToString() == "N" && indata.Length >= 7)
            //    {
            //        indata = indata.Substring(y + 9, 7);

            //        //=============================================
            //        decimal a = decimal.Parse(indata);
            //        a = a * 100;
            //        int b = Convert.ToInt32(a);

            //        if (b < 300040)
            //        {
            //            data.Value = b;
            //        }
            //        else
            //        {
            //            data.Value = 300040; //batas atas maximum
            //        }
            //        //=============================================

            //        resultData = indata;
            //        break;
            //    }
            //}

            //    StringBuilder str = new StringBuilder();
            //    str.AppendLine(indata);
            //    CreateLog(str);
            //    //Console.WriteLine(indata);
            //    Thread.Sleep(500);
            //}

            //indata = indata.Trim().TrimStart().TrimEnd();

            //StringBuilder str = new StringBuilder();
            //str.AppendLine(indata);
            //CreateLog(str);
            //Console.WriteLine(str);
        }

        private void aGauge1_ValueInRangeChanged(object sender, AGauge.ValueInRangeChangedEventArgs e)
        {
            if (e.valueInRange == 0)
            {
                //pictureBox1.BackColor = Color.Green;
            }
            else
            {
                //pictureBox1.BackColor = Color.Red;
            }
        }
        private void WeighingScale_ValueInRangeChanged(object sender, AGauge.ValueInRangeChangedEventArgs e)
        {
            if (e.valueInRange == 1)
            {
                //label1.Text = "WARNING!--OBJECTS IN MIRROR MAY APPEAR SLOWER THAN THEY USED TO.";
                //txtWeightDigit.BackColor = Color.Lime;
            }
            else if (e.valueInRange == 2)
            {
                //label1.Text = "IF THIS GAUGE DISPLAYS YOUR CURRENT SPEED AND YOU STILL CAN SEE THIS THEN SOMTHING IS WRONG ;-)";
                //txtWeightDigit.BackColor = Color.Red;
            }
            else
            {
                //label1.Text = "";
                //txtWeightDigit.BackColor = Color.White;
            }
        }
        private void trackBar1_ValueChanged(object sender, EventArgs e)
        {
            WeighingScale.Value = data.Value;

            decimal valueConvert = decimal.Parse(data.Value.ToString());

            txtWeightDigit.Text = (valueConvert / 100).ToString();

            double scaleStart = ((weightFinal - 0.5)) * 100;
            double rangeStart = ((weightFinal - 0.03)) * 100;
            double rangeEnd = ((weightFinal + 0.03)) * 100;


            if (data.Value > 0 && data.Value < scaleStart)
            {
                txtWeightDigit.BackColor = Color.White;
            }
            else if (data.Value >= scaleStart && data.Value < rangeStart)
            {
                txtWeightDigit.BackColor = Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(216)))), ((int)(((byte)(0)))));
            }
            else if (data.Value >= rangeStart && data.Value <= rangeEnd)
            {
                txtWeightDigit.BackColor = Color.Lime;
            }
            else if (data.Value > rangeEnd)
            {
                txtWeightDigit.BackColor = Color.Red;
            }
        }
        private void button1_Click(object sender, EventArgs e)
        {
            if (WeighingScale.NeedleType == 0)
            {
                WeighingScale.NeedleType = 1;
            }
            else
            {
                WeighingScale.NeedleType = 0;
            }
        }
        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            //_spManager.StopListening();
            //_spManager.Dispose();
        }
        //private void UserInitialization()
        //{
        //    _spManager = new SerialPortManager();
        //    SerialSettings mySerialSettings = _spManager.CurrentSerialSettings;
        //    //serialSettingsBindingSource.DataSource = mySerialSettings;
        //    //portNameComboBox.DataSource = mySerialSettings.PortNameCollection;
        //    //baudRateComboBox.DataSource = mySerialSettings.BaudRateCollection;
        //    //dataBitsComboBox.DataSource = mySerialSettings.DataBitsCollection;
        //    //parityComboBox.DataSource = Enum.GetValues(typeof(System.IO.Ports.Parity));
        //    //stopBitsComboBox.DataSource = Enum.GetValues(typeof(System.IO.Ports.StopBits));

        //    _spManager.NewSerialDataRecieved += new EventHandler<SerialDataEventArgs>(_spManager_NewSerialDataRecieved);
        //    this.FormClosing += new FormClosingEventHandler(Form1_FormClosing);
        //}

        //void _spManager_NewSerialDataRecieved(object sender, SerialDataEventArgs e)
        //{
        //    if (this.InvokeRequired)
        //    {
        //        // Using this.Invoke causes deadlock when closing serial port, and BeginInvoke is good practice anyway.
        //        this.BeginInvoke(new EventHandler<SerialDataEventArgs>(_spManager_NewSerialDataRecieved), new object[] { sender, e });
        //        return;
        //    }

        //    string indata = Encoding.ASCII.GetString(e.Data);
        //    lblINFO.Text = indata;
        //    Thread.Sleep(1000);
        //    //string test = Testing(indata);
        //    //lblINFO.Text = test.ToString();

        //    //Thread.Sleep(500);
        //    //lblINFO.Text = indata;

        //    //indata = indata.Trim().TrimStart().TrimEnd();

        //    //for (int y = 0; y < indata.Length; y++)
        //    //{
        //    //    if (indata[y].ToString() == "N" && indata.Length >= 7)
        //    //    {
        //    //        indata = indata.Substring(y + 9, 7);
        //    //        lblINFO.Text = indata;
        //    //    }
        //    //}

        //    //int maxTextLength = 1000; // maximum text length in text box
        //    //if (tbData.TextLength > maxTextLength)
        //    //    tbData.Text = tbData.Text.Remove(0, tbData.TextLength - maxTextLength);

        //    // This application is connected to a GPS sending ASCCI characters, so data is converted to text


        //    //tbData.AppendText(str);
        //    //tbData.ScrollToCaret();

        //}
        private string Testing(string indata)
        {
            string result = "0";
            if (indata.Length > 8)
            {
                int a = indata.IndexOf('N');

                if (a > 0)
                {
                    string newInData = indata.Substring(a);

                    if (newInData.Length > 8 && newInData[6].ToString() == "+" && newInData.StartsWith("N"))
                    {
                        if (newInData.Length >= 16)
                        {
                            result = newInData.Substring(9, 7);
                        }
                    }
                }




                //int b = newInData.IndexOf('g');
                //if (b == 17)
                //{
                //    result = newInData.Substring(9, 7);
                //    //WeighingScale.Value = float.Parse(xxx);

                //    //double valueConvert = double.Parse(xxx);

                //    //txtWeightDigit.Text = (valueConvert / 100).ToString();

                //    //double scaleStart = ((weightFinal - 0.5)) * 100;
                //    //double rangeStart = ((weightFinal - 0.03)) * 100;
                //    //double rangeEnd = ((weightFinal + 0.03)) * 100;

                //    //double datanya = double.Parse(xxx);

                //    //if (valueConvert > 0 && valueConvert < scaleStart)
                //    //{
                //    //    txtWeightDigit.BackColor = Color.White;
                //    //}
                //    //else if (valueConvert >= scaleStart && valueConvert < rangeStart)
                //    //{
                //    //    txtWeightDigit.BackColor = Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(216)))), ((int)(((byte)(0)))));
                //    //}
                //    //else if (valueConvert >= rangeStart && valueConvert <= rangeEnd)
                //    //{
                //    //    txtWeightDigit.BackColor = Color.Lime;
                //    //}
                //    //else if (valueConvert > rangeEnd)
                //    //{
                //    //    txtWeightDigit.BackColor = Color.Red;
                //    //}
                //}
            }
            return result;
        }

        private static void CreateLog(StringBuilder str)
        {
            string fileName = "D:\\TimbanganKecil_" + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString().PadLeft(2, '0') + DateTime.Now.Day.ToString().PadLeft(2, '0') + ".txt";

            str.AppendLine();
            using (System.IO.FileStream fs = System.IO.File.Open(fileName, System.IO.FileMode.Append, System.IO.FileAccess.Write))
            {
                using (System.IO.StreamWriter sw = new System.IO.StreamWriter(fs))
                {
                    sw.Write(str);
                }
            }
        }
    }
}