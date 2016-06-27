From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Mon, 27 Jun 2016 12:44:13 +0200
Subject: [PATCH RFC 3/3] ARM64: dts: meson-gxbb: use the new meson8b DWMAC
 glue
In-Reply-To: <20160627092448.GA3275@localhost>
References: <20160625165013.15917-1-martin.blumenstingl@googlemail.com>
 <20160625165013.15917-4-martin.blumenstingl@googlemail.com>
 <20160627092448.GA3275@localhost>
Message-ID: <CAFBinCB6i2-ZUDupAXUZkQO9y93rtCvguD_avdY=Ze72wxQKpw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Jun 27, 2016 at 11:24 AM, Carlo Caione <carlo@caione.org> wrote:
> A syscon is a region containing a set of miscellaneous registers used
> for several reasons by several devices [1]. It this case there is really
> no need to define a new syscon node since those two registers are only
> used by your driver.
I can easily change it back if that's the way to go.
Before I do that: could you please confirm that "mp2_clk_out" (which
is controlled by PRG_ETH0/offset 0x0 bits 7-9) is not something which
has to be available through the common clk framework?
