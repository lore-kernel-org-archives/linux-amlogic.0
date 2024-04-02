Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4A0CD1284
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Apr 2024 15:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uBKlnleQCEQTppFW77lJQX9Nxxo9Q+DXfy07+bBTg4E=; b=e3yeTwKiT7BpoV
	tMmb2fMiNdP4O1IBZR29C0ragNrX04IRQYS6vfLVsx8z5q7LcfgIvCmO/M4kMkBOpmrcdbCvYd8p7
	2MllSjdhIPf8YvwRUx+FypjNHYDB9z54aKYzeWCXvfPY/O6XHjH8JmrY+jAklu2qI1Tkx2V7ZdFqH
	VoJ1uJ3+IOcPTlUgd2VNE8YMjLAOC+xfSm/2B+Roa7TIoHCCItUhcu0wGoRrSblxS3FWTFwlAcBoe
	Gp2itzKIFZi7xpmfR0Vv1S6bmH1hFLdgJ8Efq1CRqK800fBcQw5klgD6yR7h52scyxzSgn7iYwKMo
	fRglt6i0DH8Gg1onF4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrfcs-0000000Bii1-3KWw;
	Tue, 02 Apr 2024 15:00:38 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrfco-0000000BifX-3eYn;
	Tue, 02 Apr 2024 15:00:37 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 086F4100008;
	Tue,  2 Apr 2024 18:00:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 086F4100008
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1712070028;
	bh=jBFRAbcdr1AzYHPitiXnnWqvqH1LyjSLBccDvymWK8M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=FO0HCuQ5B87ozq5xGqK+E/OxZ2gprNssoVQXHSsQntdL8Qqs76BCagZJ/BdESmU9R
	 Pvha/UmvKLm5sAlxvcL3kU7yd+BEJPFw8/1wIukohJUFHSBEziZJZecS6TdBaFf3AM
	 PZWc8kjOuYh39ahOBmkZ8dIjDknhH8hfiprTRv7jxfBoC9bpUMhELIu0Cu7TYgkgtA
	 U6ThHfcnl5mDKydujNUmd43bxpijwSs9ZWJnDx/+TtOyoeddWdYPGG3kXYsAbiP01Y
	 19pLZ2MpuYiBb0D6RftliEMOvSGQQqqyjDUSBAlDnXow3RjS8Gw0y+y/tK9zkQPUlf
	 NaBxbpB802neA==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue,  2 Apr 2024 18:00:27 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 2 Apr
 2024 18:00:27 +0300
Date: Tue, 2 Apr 2024 18:00:27 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: <neil.armstrong@linaro.org>, <mturquette@baylibre.com>,
	<sboyd@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <kernel@salutedevices.com>,
	<rockosov@gmail.com>, <linux-amlogic@lists.infradead.org>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v1 2/6] clk: meson: a1: pll: support 'syspll'
 general-purpose PLL for CPU clock
Message-ID: <20240402150027.fptfvov74zwed6vb@CAB-WSD-L081021>
References: <20240329205904.25002-1-ddrokosov@salutedevices.com>
 <20240329205904.25002-3-ddrokosov@salutedevices.com>
 <1j4jckjftk.fsf@starbuckisacylon.baylibre.com>
 <20240402121546.qrrc7r5un75464pb@CAB-WSD-L081021>
 <1jmsqbj0md.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1jmsqbj0md.fsf@starbuckisacylon.baylibre.com>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 184537 [Apr 02 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 14 0.3.14 5a0c43d8a1c3c0e5b0916cc02a90d4b950c01f96, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:5.0.1,7.1.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/04/02 07:07:00 #24571916
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_080035_612822_77135ADF 
X-CRM114-Status: GOOD (  37.39  )
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

On Tue, Apr 02, 2024 at 04:27:17PM +0200, Jerome Brunet wrote:
> 
> On Tue 02 Apr 2024 at 15:15, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
> 
> > On Tue, Apr 02, 2024 at 11:00:42AM +0200, Jerome Brunet wrote:
> >> 
> >> On Fri 29 Mar 2024 at 23:58, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:
> >> 
> >> > The 'syspll' PLL, also known as the system PLL, is a general and
> >> > essential PLL responsible for generating the CPU clock frequency.
> >> > With its wide-ranging capabilities, it is designed to accommodate
> >> > frequencies within the range of 768MHz to 1536MHz.
> >> >
> >> > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> >> > ---
> >> >  drivers/clk/meson/a1-pll.c | 78 ++++++++++++++++++++++++++++++++++++++
> >> >  drivers/clk/meson/a1-pll.h |  6 +++
> >> >  2 files changed, 84 insertions(+)
> >> >
> >> > diff --git a/drivers/clk/meson/a1-pll.c b/drivers/clk/meson/a1-pll.c
> >> > index 60b2e53e7e51..02fd2d325cc6 100644
> >> > --- a/drivers/clk/meson/a1-pll.c
> >> > +++ b/drivers/clk/meson/a1-pll.c
> >> > @@ -138,6 +138,81 @@ static struct clk_regmap hifi_pll = {
> >> >  	},
> >> >  };
> >> >  
> >> > +static const struct pll_mult_range sys_pll_mult_range = {
> >> > +	.min = 32,
> >> > +	.max = 64,
> >> > +};
> >> > +
> >> > +/*
> >> > + * We assume that the sys_pll_clk has already been set up by the low-level
> >> > + * bootloaders as the main CPU PLL source. Therefore, it is not necessary to
> >> > + * run the initialization sequence.
> >> > + */
> >> 
> >> I see no reason to make such assumption.
> >> This clock is no read-only, it apparently is able to re-lock so assuming
> >> anything from the bootloader is just asking from trouble
> >> 
> >
> > Indeed, I have implemented the following initialization sequence. I have
> > dumped the bootloader setup and included it in the definition of my
> > sys_pll. However, I have encountered an issue with the enable bit. If I
> > leave the enable bit switched on by default, there is a possibility that
> > the bootloader selects a fixed CPU clock while the sys_pll should be
> > switched off. On the other hand, if I keep the enable bit switched off
> > by default, the bootloader might configure the CPU clock to use sys_pll,
> > resulting in the execution halting when the initialization sequence is
> > run. This situation has led me to assume that we should place our trust
> > in the bootloader setup.
> >
> > If you believe it is necessary to include the initialization sequence, I
> > can prepare it with the sys_pll enabled by default.
> 
> I just noted your initial comment is misleading.
> 
> You could submit a patch to apply the init sequence only if the PLL is
> not already enabled. Maybe even condition that to flag in the pll data
> to avoid applying it to the other platforms for now.
> 

Ah, I see. Okay, no problem, I will prepare such patch to common meson
clk-pll.

[...]

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
