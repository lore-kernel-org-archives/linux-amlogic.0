Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA92C77B7C
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 May 2023 20:25:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esA/lNt86xOyAXD0MR9Ufl+MqiHpQFrKv46vjGZdIbc=; b=Wr3PNIHCg1tLo2
	15tkxFkseuck3cWppNbQfakv2+23iO/MZH2ocMgxA+A2iBmnkRs7T6fP3hiageakHSDpG6m8WI4Lv
	54pm9dVHhEsf8RQNGIL4LoxYLyzctHMKeAMQgO55PBA27iU5Yut9aVr34WsExcXKfBEWAsx5Rd0LZ
	I10azxxCRE/cEKhcrUSoG6/hOC2SK4FprZOofpZEkiXNkrT0gCRmQ8co7AeIASw48o0OR7kU8Xtbv
	AMtZ07uzRgwf+PI+E3Le1nUxdIFKc4Ciee6sIQHsGD+sfn2hHuE1zrFhYVGId8TFAqnb7O46iDRfr
	dBEWU0o5XW4ekBCqovBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxCqY-009uTb-3C;
	Thu, 11 May 2023 20:25:07 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxCqU-009uRs-0m;
	Thu, 11 May 2023 20:25:05 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 625025FD0C;
	Thu, 11 May 2023 23:24:56 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1683836696;
	bh=n7ZPfQp/f4Zm25naSUvNeGBtMhZly0O1U2udb0eukZ0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=i+hfQz5vTmyq1iVpPBzP3vRD1UTEDN5hBNFu8nsnZc7aZ7AS/gBut5spSku2Re5DH
	 mjlgri0tZzqCwa+nQR116o1H4if84xqu1zZ7JDEcdfeyiBGnulFgcNpmE3eoSOK7pS
	 XmEKQ0e6t25tblI3vWMrX7HqilGd7oIxP/I/V38enId+3H1ScF+WwKA9fIIJx3+Lpf
	 DYTgCbLwpHVTIMrKTfLAyh3ywS3iN92uefVLeVnQa0J4XTz1+U8FGIcZGh9+QCV1B1
	 KUH1Fmw0EZfHYNh1+gLiulEX6NhV+wSygOR7G6LebV4aixlp3TwSiis/aWfnSuQkxz
	 bZw/nhW9QnPwA==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Thu, 11 May 2023 23:24:54 +0300 (MSK)
Date: Thu, 11 May 2023 23:24:54 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
CC: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<mturquette@baylibre.com>, <vkoul@kernel.org>, <kishon@kernel.org>,
	<hminas@synopsys.com>, <Thinh.Nguyen@synopsys.com>, <yue.wang@amlogic.com>,
	<hanjie.lin@amlogic.com>, <kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: meson: a1: support USB controller in
 OTG mode
Message-ID: <20230511202454.m7zjwthjotzl26ms@CAB-WSD-L081021>
References: <20230426102922.19705-1-ddrokosov@sberdevices.ru>
 <20230426102922.19705-6-ddrokosov@sberdevices.ru>
 <acc5eb75-c6ed-98c7-6d69-f8b0f024c744@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <acc5eb75-c6ed-98c7-6d69-f8b0f024c744@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH01.sberdevices.ru (172.16.1.4) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/05/11 10:21:00 #21259776
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_132502_994082_E482EE84 
X-CRM114-Status: GOOD (  17.86  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Neil,

I apologize for the delayed response, as I did not have access to my laptop
for a few days.

On Tue, May 09, 2023 at 09:44:33AM +0200, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 26/04/2023 12:29, Dmitry Rokosov wrote:
> > Amlogic A1 SoC family has USB2.0 controller based on dwc2 and dwc3
> > heads. It supports otg/host/peripheral modes.
> > 
> > Signed-off-by: Yue Wang <yue.wang@amlogic.com>
> > Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >   arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 59 +++++++++++++++++++++++
> >   1 file changed, 59 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> > index ae7d39cff07a..5588ee602161 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> > @@ -8,6 +8,8 @@
> >   #include <dt-bindings/gpio/meson-a1-gpio.h>
> >   #include <dt-bindings/clock/amlogic,a1-pll-clkc.h>
> >   #include <dt-bindings/clock/amlogic,a1-clkc.h>
> > +#include <dt-bindings/power/meson-a1-power.h>
> > +#include <dt-bindings/reset/amlogic,meson-a1-reset.h>
> >   / {
> >   	compatible = "amlogic,a1";
> > @@ -169,6 +171,17 @@ gpio_intc: interrupt-controller@0440 {
> >   				amlogic,channel-interrupts =
> >   					<49 50 51 52 53 54 55 56>;
> >   			};
> > +
> > +			usb2_phy1: phy@4000 {
> > +				compatible = "amlogic,a1-usb2-phy";
> > +				clocks = <&clkc CLKID_USB_PHY_IN>;
> > +				clock-names = "xtal";
> > +				reg = <0x0 0x4000 0x0 0x60>;
> > +				resets = <&reset RESET_USBPHY>;
> > +				reset-names = "phy";
> > +				#phy-cells = <0>;
> > +				power-domains = <&pwrc PWRC_USB_ID>;
> > +			};
> >   		};
> >   		gic: interrupt-controller@ff901000 {
> > @@ -192,6 +205,52 @@ spifc: spi@fd000400 {
> >   			#size-cells = <0>;
> >   			status = "disabled";
> >   		};
> > +
> > +		usb: usb@fe004400 {
> > +			status = "disabled";
> > +			compatible = "amlogic,meson-a1-usb-ctrl";
> > +			reg = <0x0 0xfe004400 0x0 0xa0>;
> > +			interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>;
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +
> > +			clocks = <&clkc CLKID_USB_CTRL>,
> > +				 <&clkc CLKID_USB_BUS>,
> > +				 <&clkc CLKID_USB_CTRL_IN>;
> > +			clock-names = "usb_ctrl", "usb_bus", "xtal_usb_ctrl";
> > +			resets = <&reset RESET_USBCTRL>;
> > +			reset-name = "usb_ctrl";
> > +
> > +			dr_mode = "otg";
> > +
> > +			phys = <&usb2_phy1>;
> > +			phy-names = "usb2-phy1";
> > +
> > +			dwc2: usb@ff500000 {
> > +				compatible = "amlogic,meson-a1-usb", "snps,dwc2";
> > +				reg = <0x0 0xff500000 0x0 0x40000>;
> > +				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
> > +				phys = <&usb2_phy1>;
> > +				phy-names = "usb2-phy";
> > +				clocks = <&clkc CLKID_USB_PHY>;
> > +				clock-names = "otg";
> > +				dr_mode = "peripheral";
> > +				g-rx-fifo-size = <192>;
> > +				g-np-tx-fifo-size = <128>;
> > +				g-tx-fifo-size = <128 128 16 16 16>;
> > +			};
> > +
> > +			dwc3: usb@ff400000 {
> > +				compatible = "snps,dwc3";
> > +				reg = <0x0 0xff400000 0x0 0x100000>;
> > +				interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>;
> > +				dr_mode = "host";
> > +				snps,dis_u2_susphy_quirk;
> > +				snps,quirk-frame-length-adjustment = <0x20>;
> > +				snps,parkmode-disable-ss-quirk;
> > +			};
> > +		};
> >   	};
> >   	timer {
> 
> This patcj is fine, but depends on clock bindings & dt, so now Vinod took the PHY
> patch, please resend this wiyhout patches 1 & 5, then resend the DT patch later when
> the clock bindings is merged.
> 
> Thanks,
> Neil

Sure, not a problem. I will resend the 3 patchsets in different series.

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
