using SwamiXitiz.Data.Models;
using System;
using System.Linq;

namespace YogiApekshit
{
    public class Worker
    {
        public void Start()
        {
            var timer = new System.Timers.Timer()
            {
                Interval = 120 * 60 * 1000,
                Enabled = true,
                AutoReset = true
            };

            timer.Elapsed += Execute;
            timer.Start();
        }

        protected void Execute(object sender, System.Timers.ElapsedEventArgs e)
        {

        }
    }
}