Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B7CEB64DA
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 16:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGxyxN4sIPCtHMboor2elxFrPcdYA5hnVkuu8OBQ+74=; b=exPcO+tOl1Us1r
	+HQOIXPXuWOM3B48p83GAwzEAbNnelwZQq2i2eZkptHpUrviz5NGBMwxF7MubDIasGMi5gUD/kHFT
	ya5RId+hmDPHsFj2KyqVgDVmtg6f+Ssic5buc9b1dD+DWf8qJ4UZGhgCI6d7JSRHChP1O1xn9CEMD
	SIb/vCHoKB3019KrhplgjXOf7+M28uZr2JcXD2fvDbXio8X455mUfaIRJ0Oy3MPTIk7f8KVSe9KPb
	0zkyUbBL7fM3Mtd/V/+jdQQo90qfy5MLpNDIOItfPkY1bEY+qteZluwmlOLHrX7cS6mdf3zTzf5MX
	9dNR3oz8hbW3U2Ef5w5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGnc-0041qk-00;
	Fri, 30 Jun 2023 16:16:44 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFGnY-0041q3-0N;
	Fri, 30 Jun 2023 16:16:42 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 5DF9D100002;
	Fri, 30 Jun 2023 19:16:34 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 5DF9D100002
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688141794;
	bh=DYDUqZ5q1Q+sph6vsN5QJLQHBW12OVdZvTZa4RwFxxw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=pkn05C5Ytqa2b3cXCsR7wj5mahZr8wJnb942hV1b9vPD+uSJK3h7s+kSSgmKgZft/
	 4CHHvwGsW4sacX2udyfF+Ob9tu0gUGs4GXh6d6+3nekQ7C9OrS71U8Y1cDpXbRSGG9
	 eLc1oz6rn9ympSoRSHka1EmYqo2ezvcZG7NnjazTj4EwVJPpdHow7NsmZ1uBdzHI0Y
	 bNL2rdviD3DCcXoet/xkxdVk8itMxz7v9Egd6HuBhHx8mN/Fme9aQb+6A0HEmbkhSI
	 0cWZNFZcbbWIFYCjFidzG5gku3QkLoQFl0GZaRv/P6ypEQ6oN9FOiJBo+kV38EMzhA
	 2oshPxRDFjV3Q==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Fri, 30 Jun 2023 19:16:34 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 30 Jun
 2023 19:16:20 +0300
Date: Fri, 30 Jun 2023 19:16:33 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: zelong dong <zelong.dong@amlogic.com>
CC: <narmstrong@baylibre.com>, <p.zabel@pengutronix.de>,
	<khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	<martin.blumenstingl@googlemail.com>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<jbrunet@baylibre.com>, <devicetree@vger.kernel.org>,
	<kelvin.zhang@amlogic.com>
Subject: Re: [PATCH 3/3] arm64: dts: meson: add reset controller for Meson-C3
 SoC
Message-ID: <20230630161633.eym2dhxaffn2uxfv@CAB-WSD-L081021>
References: <20230630121059.28748-1-zelong.dong@amlogic.com>
 <20230630121059.28748-4-zelong.dong@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230630121059.28748-4-zelong.dong@amlogic.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178380 [Jun 30 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 517 517 b0056c19d8e10afbb16cb7aad7258dedb0179a79, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, lists.infradead.org:7.1.1;lore.kernel.org:7.1.1;p-i-exch-sc-m01.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;sberdevices.ru:7.1.1,5.0.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2023/06/30 15:49:00
X-KSMG-LinksScanning: Clean, bases: 2023/06/30 15:49:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/06/30 12:24:00 #21606311
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_091640_498841_B362DA07 
X-CRM114-Status: GOOD (  19.52  )
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

Hello Zelong,

Thanks a lot for the patch, please find my comments below.

On Fri, Jun 30, 2023 at 08:10:59PM +0800, zelong dong wrote:
> From: Zelong Dong <zelong.dong@amlogic.com>
> 
> Add the reset controller device of Meson-C3 SoC family
> 
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
> ---
>  arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> index 60ad4f3eef9d..62684b7a684c 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/reset/amlogic,meson-c3-reset.h>
>  
>  / {
>  	cpus {
> @@ -82,6 +83,12 @@ uart_b: serial@7a000 {
>  				clock-names = "xtal", "pclk", "baud";
>  			};
>  
> +			reset: reset-controller@0x2000 {
> +				compatible = "amlogic,meson-c3-reset";
> +				reg = <0x0 0x2000 0x0 0x98>;
> +				#reset-cells = <1>;
> +			};
> +

As Martin mentioned in the my review, internal apb entries should be
sorted by base reg offset. So reset-controller must be located before
uart_b.

Please refer to:

https://lore.kernel.org/linux-amlogic/CAFBinCAO14zcgY66UyJO9UxuCWf1N-Lsx=iYNTJL=cwXoJv__Q@mail.gmail.com/

>  		};
>  	};
>  };
> -- 
> 2.35.1
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
