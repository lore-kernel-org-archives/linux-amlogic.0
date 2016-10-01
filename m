From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat, 1 Oct 2016 22:26:25 +0200
Subject: stmmac/RTL8211F/Meson GXBB: TX throughput problems
In-Reply-To: <ce15ad26-2d07-655d-b813-947ad86696ac@st.com>
References: <CAFBinCALSL_-izJ2tEsAjevAw90kGNTrQ3na3D1YV8f1dS1=Xg@mail.gmail.com>
 <ce15ad26-2d07-655d-b813-947ad86696ac@st.com>
Message-ID: <CAFBinCC0ihYvf9xYkS3cvLFURs5=gynWoLUnNjeVxA0t0u_f1A@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Sep 14, 2016 at 5:30 PM, Giuseppe CAVALLARO
<peppe.cavallaro@st.com> wrote:
> as rule of thumb, I can only suggest you to see the RXDLY and TXDLY
> and if you have (or need!) the resistor on PCB to have the 2ns of
> extra delay. This can impact on RGMII case (1G).
> Indeed, if this is true, I should expect some problem also when ping.
I did a simple ping-test:

device to computer:
50 packets transmitted, 50 received, 0% packet loss, time 50170ms
rtt min/avg/max/mdev = 0.457/0.659/0.779/0.083 ms

computer to device:
50 packets transmitted, 50 received, 0% packet loss, time 49001ms
rtt min/avg/max/mdev = 0.483/0.629/1.356/0.114 ms

both running simultaneously, device to computer:
51 packets transmitted, 50 received, 1% packet loss, time 51182ms
rtt min/avg/max/mdev = 0.459/0.648/0.729/0.082 ms

both running simultaneously, computer to device:
50 packets transmitted, 38 received, 24% packet loss, time 48997ms
rtt min/avg/max/mdev = 0.482/0.594/0.640/0.053 ms
