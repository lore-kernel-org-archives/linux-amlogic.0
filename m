From: linus.luessing@c0d3.blue (Linus =?utf-8?Q?L=C3=BCssing?=)
Date: Thu, 25 Jan 2018 03:18:45 +0100
Subject: [PATCH v2 1/2] ARM: dts: meson8b: extend ethernet controller
 description
In-Reply-To: <62efe8a6912c5d6f2770c0f3b33d4829e9ee2606.1516326105.git.ingrassia@epigenesys.com>
References: <cover.1516326105.git.ingrassia@epigenesys.com>
 <62efe8a6912c5d6f2770c0f3b33d4829e9ee2606.1516326105.git.ingrassia@epigenesys.com>
Message-ID: <20180125021845.GD1756@otheros>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Jan 19, 2018 at 02:48:00AM +0100, Emiliano Ingrassia wrote:
> Enable S805 (aka Meson8b) ethernet pin multiplexing and
> extend the controller description.
> The programmable ethernet (PRG_ETHERNET) register address
> value (0xc1108108), contained in meson.dtsi, is overridden
> according to the value found in S805 SoC manual.
> This also required to switch to "amlogic,meson8b-dwmac" compatible
> to correctly configure that register.
> The two clock sources "clkin0" and "clkin1" are both equals
> to MPLL2 because, as reported in bit 9-7 register description,
> that is the only Meson8b ethernet clock source.
> 
> Signed-off-by: Emiliano Ingrassia <ingrassia@epigenesys.com>

Tested-by: Linus L?ssing <linus.luessing@c0d3.blue>
