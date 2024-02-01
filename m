Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7983AC4828D
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Feb 2024 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gWZZF14UbyjRTUbe/OU/pnOfFVec+7M+eSc0l7aUB08=; b=E7aHRvaO4lTBaX
	fmEVF5SlGGkTdZKp5t3+n032gxyi/JL/XQAnZT1IZJCEDo+XIBNz81Aw+0S0p3IzlzXf8QKrmdHhE
	7lC6eou5zGEzSDEeW4gpn2TLXXX1AERyVUqQ9he8cjxErDEESDJ+YQypeJAPd/xeIng6jQJOjh5n8
	gJ2JjRsgNprtvThNE3jnC5mlK8OyDNVL9PBIAuiDqhZHvPs3TMBbiMPg17+ZYGQpi0L99+JeQwQ7r
	u2edL7+7OqwOFcNAqf4MIgI3P8qVo0m5NaLTOIfBMuB4Bn5AsONPLBDiGVDNT2F9jZ+kXl0PvqaqE
	RrvQ3vOxmndj4Tr55ZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVadb-00000008ktp-18Ia;
	Thu, 01 Feb 2024 17:14:07 +0000
Received: from mx2.sberdevices.ru ([45.89.224.132] helo=mx1.sberdevices.ru)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVadX-00000008ks5-2z3s;
	Thu, 01 Feb 2024 17:14:06 +0000
Received: from p-infra-ksmg-sc-msk02 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 6B283120006;
	Thu,  1 Feb 2024 20:13:57 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 6B283120006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1706807637;
	bh=mPZuNvTkk/N4kF/J6YO7atqu/SZxpPBkvHjvXTITUwk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=qJ1SNigqY3gzQ3z/ccnM7nODjl9MI3bUgeQizfpEsOHM1lLX13CLHDP5hiSBDOwWb
	 7lbf9eylMBXQzqnCGEogmLszsYIuZZ7ECl2L05ZhkH/L/DtdbdCUfYvvxZQu3WQg7O
	 4pnAr7QaprBCClo0ewrE8J6zrQO65lpbx/P7EpxK7Qjhr+5Yu6p/aJoOPTHW0DRe/m
	 4BsKgLlCNAdc8z6Ca+eLxGl5WW7QdsO2dOgFssQdmjiQ5qC3SDH5VLkvDWDV2B7ICZ
	 1WwQqHe1PU4bzGpd5m1wBlSYTM+dgyOJXPg1mwD+Z2k8VHDJygpfI/74UhKd83+Dgg
	 oAe/UVqnHeI2A==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Thu,  1 Feb 2024 20:13:57 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) by
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 1 Feb 2024 20:13:56 +0300
Received: from p-i-exch-sc-m01.sberdevices.ru ([fe80::25de:2e74:8821:eb9a]) by
 p-i-exch-sc-m01.sberdevices.ru ([fe80::25de:2e74:8821:eb9a%7]) with mapi id
 15.02.1118.040; Thu, 1 Feb 2024 20:13:56 +0300
From: Alexey Romanov <avromanov@salutedevices.com>
To: Corentin Labbe <clabbe.montjoie@gmail.com>
CC: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v2 03/20] drviers: crypto: meson: add platform data
Thread-Topic: [PATCH v2 03/20] drviers: crypto: meson: add platform data
Thread-Index: AQHaTh1s2/zZexXjGk+hgEk0Ax0wPrDoX/oAgA01jwA=
Date: Thu, 1 Feb 2024 17:13:56 +0000
Message-ID: <20240201171352.ut5xhw3u2b77v33d@cab-wsm-0029881>
References: <20240123165831.970023-1-avromanov@salutedevices.com>
 <20240123165831.970023-4-avromanov@salutedevices.com> <ZbC8qLXogjxJD8LD@Red>
In-Reply-To: <ZbC8qLXogjxJD8LD@Red>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <E74E91B6684D234DA5CB2A0551E4FAC0@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 183130 [Feb 01 2024]
X-KSMG-AntiSpam-Version: 6.1.0.3
X-KSMG-AntiSpam-Envelope-From: avromanov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 7 0.3.7 6d6bf5bd8eea7373134f756a2fd73e9456bb7d1a, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;127.0.0.199:7.1.2;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/02/01 13:26:00 #23335101
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_091404_499074_76A340A2 
X-CRM114-Status: GOOD (  26.85  )
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

Hello,

On Wed, Jan 24, 2024 at 08:30:48AM +0100, Corentin Labbe wrote:
> Le Tue, Jan 23, 2024 at 07:58:14PM +0300, Alexey Romanov a 'ecrit :
> > To support other Amlogic SoC's we have to
> > use platform data: descriptors and status registers
> > offsets are individual for each SoC series.
> > 
> > Signed-off-by: Alexey Romanov <avromanov@salutedevices.com>
> > ---
> >  drivers/crypto/amlogic/amlogic-gxl-cipher.c |  2 +-
> >  drivers/crypto/amlogic/amlogic-gxl-core.c   | 31 +++++++++++++++------
> >  drivers/crypto/amlogic/amlogic-gxl.h        | 11 ++++++++
> >  3 files changed, 35 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> > index b19032f92415..7eff3ae7356f 100644
> > --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> > +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> > @@ -225,7 +225,7 @@ static int meson_cipher(struct skcipher_request *areq)
> >  
> >  	reinit_completion(&mc->chanlist[flow].complete);
> >  	mc->chanlist[flow].status = 0;
> > -	writel(mc->chanlist[flow].t_phy | 2, mc->base + (flow << 2));
> > +	writel(mc->chanlist[flow].t_phy | 2, mc->base + ((mc->pdata->descs_reg + flow) << 2));
> >  	wait_for_completion_interruptible_timeout(&mc->chanlist[flow].complete,
> >  						  msecs_to_jiffies(500));
> >  	if (mc->chanlist[flow].status == 0) {
> > diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
> > index a58644be76e9..2be381e157c4 100644
> > --- a/drivers/crypto/amlogic/amlogic-gxl-core.c
> > +++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
> > @@ -18,6 +18,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > +#include <linux/of_device.h>
> >  #include <linux/platform_device.h>
> >  
> >  #include "amlogic-gxl.h"
> > @@ -30,9 +31,10 @@ static irqreturn_t meson_irq_handler(int irq, void *data)
> >  
> >  	for (flow = 0; flow < mc->flow_cnt; flow++) {
> >  		if (mc->chanlist[flow].irq == irq) {
> > -			p = readl(mc->base + ((0x04 + flow) << 2));
> > +			p = readl(mc->base + ((mc->pdata->status_reg + flow) << 2));
> >  			if (p) {
> > -				writel_relaxed(0xF, mc->base + ((0x4 + flow) << 2));
> > +				writel_relaxed(0xF, mc->base +
> > +					      ((mc->pdata->status_reg + flow) << 2));
> >  				mc->chanlist[flow].status = 1;
> >  				complete(&mc->chanlist[flow].complete);
> >  				return IRQ_HANDLED;
> > @@ -245,15 +247,34 @@ static void meson_unregister_algs(struct meson_dev *mc)
> >  	}
> >  }
> >  
> > +static const struct meson_pdata meson_gxl_pdata = {
> > +	.descs_reg = 0x0,
> > +	.status_reg = 0x4,
> > +};
> > +
> > +static const struct of_device_id meson_crypto_of_match_table[] = {
> > +	{
> > +		.compatible = "amlogic,gxl-crypto",
> > +		.data = &meson_gxl_pdata,
> > +	},
> > +	{},
> > +};
> > +
> >  static int meson_crypto_probe(struct platform_device *pdev)
> >  {
> > +	const struct of_device_id *match;
> >  	struct meson_dev *mc;
> >  	int err;
> >  
> > +	match = of_match_device(meson_crypto_of_match_table, &pdev->dev);
> > +	if (!match)
> > +		return -EINVAL;
> > +
> >  	mc = devm_kzalloc(&pdev->dev, sizeof(*mc), GFP_KERNEL);
> >  	if (!mc)
> >  		return -ENOMEM;
> >  
> > +	mc->pdata = match->data;
> >  	mc->dev = &pdev->dev;
> >  	platform_set_drvdata(pdev, mc);
> >  
> > @@ -312,12 +333,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
> >  	clk_disable_unprepare(mc->busclk);
> >  }
> >  
> > -static const struct of_device_id meson_crypto_of_match_table[] = {
> > -	{ .compatible = "amlogic,gxl-crypto", },
> > -	{}
> > -};
> > -MODULE_DEVICE_TABLE(of, meson_crypto_of_match_table);
> 
> Hello
> 
> This patch breaks bisection, since it removes MODULE_DEVICE_TABLE.
> After applying patchs 1,2,3 the driver does not load anymore on lepotato board.

Please, give more information. 

I applied the first 3 patches and the driver probes correctly.

> 
> Regards

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
