Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 464DDEB64DD
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jul 2023 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxNZb5O3ipQO5Twi8UeRgjA6R4j+oyjMBR8Le+aOe0U=; b=EjxHewNI/UZG13
	A7SutvrhvU1Cjk9lvmmTmJqlUhAxCr+jvv27vB+e//iII+flI/n2Zt7cjhPI0XlEcJJLiIi0lmwBn
	aYTczeIPPlSiXKODZbixFf0BrscCtKIOsAiIhyR8GUcD3kr4RADMBmvjI9hzI6qPMrZuhfkbfA04d
	ebk03ZggwYaRnrJmDJKqXZcksCDWSbY96dMHdYJSD2L07LRf1m0B8BNSK1JmqiK/7y0supVsDRvgd
	Yq5isIgf7VXgN/7aDwjh/7Ae7SNztvobKUZ2MxRQMl4ocmbYek2WmGv+9C+Hu3ktLbK8z5eI+UV4b
	mRvkfcpu93EV0rNSPbww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjWM-00Dtmf-36;
	Tue, 04 Jul 2023 17:08:58 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGjWK-00Dtku-0P;
	Tue, 04 Jul 2023 17:08:57 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 40067120055;
	Tue,  4 Jul 2023 20:08:49 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 40067120055
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1688490529;
	bh=8d0OwtdWSpRCoapxDUbREP4MhLA/RupKH+dbf1QT6zs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=laDdvl0kA1WTKVR9c4wPGtqTYKqxsfWD/f5pLKXJwwySJe2000Slfm7gy0nTas0EN
	 JtvD0aWJG8YojgZ+YoPEhiveOSaa0+RnmFpOsIRnmESvG0v6vm0t5u0+fEyPeLFWF2
	 6nLnICI+wRxr5N2FwKYzMQ0Q/Jzd6P9Zf4H+e61TpYfAbIfRg3t7dDDr830TYVoWDT
	 c7HnZDtVhAfLk8rp2IFr861gPY8ULAVoAyFsqdgL1ztHdzVA371iIQQgIqjkhEGM7Q
	 DozFUaEV7RQg9zJTCDLu3bcNt0joGFJY+NbkFVLMS4uMRl7io2w6mwEXdnLuT5Q7DK
	 wEHHDjz27hYIQ==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  4 Jul 2023 20:08:49 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m01.sberdevices.ru
 (172.16.192.107) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Tue, 4 Jul
 2023 20:08:37 +0300
Date: Tue, 4 Jul 2023 20:08:43 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: Conor Dooley <conor@kernel.org>
CC: <gregkh@linuxfoundation.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
	<neil.armstrong@linaro.org>, <jbrunet@baylibre.com>, <jirislaby@kernel.org>,
	<khilman@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<kelvin.zhang@amlogic.com>, <xianwei.zhao@amlogic.com>,
	<kernel@sberdevices.ru>, <rockosov@gmail.com>,
	<linux-amlogic@lists.infradead.org>, <linux-serial@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 5/5] arm64: dts: meson: a1: change uart compatible
 string
Message-ID: <20230704170843.wksxekltre2ob4en@CAB-WSD-L081021>
References: <20230704135936.14697-1-ddrokosov@sberdevices.ru>
 <20230704135936.14697-6-ddrokosov@sberdevices.ru>
 <20230704-cannabis-cannon-19397cd806bc@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230704-cannabis-cannon-19397cd806bc@spud>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178431 [Jul 04 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: DDRokosov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 520 520 ccb018a655251011855942a2571029252d3d69a2, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 100.64.160.123:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;sberdevices.ru:5.0.1,7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/04 05:54:00 #21559896
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_100856_526991_E86DD776 
X-CRM114-Status: GOOD (  22.96  )
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

On Tue, Jul 04, 2023 at 06:02:58PM +0100, Conor Dooley wrote:
> On Tue, Jul 04, 2023 at 04:59:36PM +0300, Dmitry Rokosov wrote:
> > In the current implementation, the meson-a1 configuration incorporates a
> > unique compatibility tag "amlogic,meson-a1-uart' within the meson-uart
> > driver due to its usage of the new console device name "ttyS".
> > Consequently, the previous compatibility tag designated for the
> > 'amlogic,meson-gx-uart' configuration has become obsolete and is no
> > longer relevant to the current setup.
> 
> I don't really see why you would remove the gx-uart to be honest, and
> not use it as a fallback. Neil's platform though, so his call :)
> 

Because of amlogic,meson-gx-uart has legacy devname, we do not want to
use it in the A1.

> > 
> > Signed-off-by: Dmitry Rokosov <ddrokosov@sberdevices.ru>
> > ---
> >  arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> > index c5567031ba12..6273b9c862b3 100644
> > --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> > +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> > @@ -344,7 +344,7 @@ mux {
> >  			};
> >  
> >  			uart_AO: serial@1c00 {
> > -				compatible = "amlogic,meson-gx-uart",
> > +				compatible = "amlogic,meson-a1-uart",
> >  					     "amlogic,meson-ao-uart";
> >  				reg = <0x0 0x1c00 0x0 0x18>;
> >  				interrupts = <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>;
> > @@ -354,7 +354,7 @@ uart_AO: serial@1c00 {
> >  			};
> >  
> >  			uart_AO_B: serial@2000 {
> > -				compatible = "amlogic,meson-gx-uart",
> > +				compatible = "amlogic,meson-a1-uart",
> >  					     "amlogic,meson-ao-uart";
> >  				reg = <0x0 0x2000 0x0 0x18>;
> >  				interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
> > -- 
> > 2.36.0
> > 



-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
