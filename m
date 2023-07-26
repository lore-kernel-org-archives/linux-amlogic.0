Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03F3EC00528
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7DNzx2EPxhrMWDYTU3lfvqauhqTM7s/LEGVjEdOJkg=; b=WsrXGmV2MRYscL
	2Xs+epIn46LsMG/+ZGlTkFjoKSbZ2gVeGnyN/LpmWyV8B2bXcisoD/9qNUluXg2gUwRvBNRP6qz3l
	15rvte1TFyBO4s68jprMq3WLIslZlpJj1HGsX+stSX4ITpFfFdHJQ3RHoCfZsw3r5TKFzy58zMxKM
	wzmRrcPfPfA5QxEUmCO6zE9XvQngSIr0FCeygVHPJSJOYq3MPv634xwGNMhJjCPD4L+oABfl/DoHd
	dALyNr1HnvK3Dt6uF5XXS8u83G+m3Dl24DXbXJbVGO9kVDEoXYiC7Z+6RoUGVzitp48XE74QuBuTp
	rzGe67Yc1EP21E210aYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKQ-009Uug-2n;
	Wed, 26 Jul 2023 07:53:02 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOZKM-009UsY-2F;
	Wed, 26 Jul 2023 07:53:01 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 800F6100006;
	Wed, 26 Jul 2023 10:52:50 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 800F6100006
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1690357970;
	bh=vTUqR02g7CyzGcKZgu+ckB967aCBxpLWQ1Cp4fR5GdI=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=pcG+Peusb9E7FOmULN3LDYHt7fYVVlcAsgLW8ggdEqWHTiBjoOaw2BO9n+Hf7uWSK
	 5gavGbOwHqAv2oNew4cLJA7pTNW3hHANNoHySLymoHWmQfsGmj4xdz+jh6P++jTYXW
	 cXxYFgov4JCOVGddTQc8PU4JinFOG0t/HiteN5SjU8pmUb4j+RwJunFnc5Q/GOwwSn
	 GWxSXNsvDW/H5sTbQ7dvw9xeM6Xs+2QbnwHU2SJl49x2m1fhS9kTTkqavlfRhhLjUw
	 xeDl0/bgLvLcjY+MdKFteQzfMpQ/60Uq7KF2jqnzq7ooq88frKaWQE0puMS7VfWNgD
	 rlnRK89r5r17A==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 26 Jul 2023 10:52:50 +0300 (MSK)
Received: from p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 26 Jul 2023 10:52:43 +0300
Received: from p-i-exch-sc-m01.sberdevices.ru ([::1]) by
 p-i-exch-sc-m01.sberdevices.ru ([fe80::80e5:bab:4999:4480%7]) with mapi id
 15.02.1118.030; Wed, 26 Jul 2023 10:52:43 +0300
From: Alexey Romanov <AVRomanov@sberdevices.ru>
To: Martin Kaiser <lists@kaiser.cx>
CC: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "olivia@selenic.com"
	<olivia@selenic.com>, "herbert@gondor.apana.org.au"
	<herbert@gondor.apana.org.au>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "khilman@baylibre.com"
	<khilman@baylibre.com>, "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>, "hkallweit1@gmail.com"
	<hkallweit1@gmail.com>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>, kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 1/3] drivers: rng: add check status bit feature
Thread-Topic: [PATCH v1 1/3] drivers: rng: add check status bit feature
Thread-Index: AQHZvwIhgAdKkj3BKkSqydzslBnXI6/KtJqAgADHaIA=
Date: Wed, 26 Jul 2023 07:52:43 +0000
Message-ID: <20230726075243.f37sjcurmog3eunh@cab-wsm-0029881>
References: <20230725141252.98848-1-avromanov@sberdevices.ru>
 <20230725141252.98848-2-avromanov@sberdevices.ru>
 <20230725195901.n2klvgz7outqaatk@viti.kaiser.cx>
In-Reply-To: <20230725195901.n2klvgz7outqaatk@viti.kaiser.cx>
Accept-Language: ru-RU, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.18.93]
Content-ID: <5A8C49A7B982AD4AA50B334FB89BE21D@sberdevices.ru>
MIME-Version: 1.0
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178796 [Jul 22 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: AVRomanov@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 525 525 723604743bfbdb7e16728748c3fa45e9eba05f7d, {Track_E25351}, {Tracking_internal2}, {Tracking_from_domain_doesnt_match_to}, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/23 08:49:00 #21663637
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_005259_424393_AD4AB2C4 
X-CRM114-Status: GOOD (  26.50  )
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

Hi Martin,

On Tue, Jul 25, 2023 at 09:59:01PM +0200, Martin Kaiser wrote:
> Alexey Romanov (avromanov@sberdevices.ru) wrote:
> 
> > For some Amlogic SOC's, mechanism to obtain random number
> > has been changed. For example, S4 now uses status bit waiting algo.
> 
> > Signed-off-by: Alexey Romanov <avromanov@sberdevices.ru>
> > ---
> >  drivers/char/hw_random/meson-rng.c | 77 ++++++++++++++++++++++++++++--
> >  1 file changed, 74 insertions(+), 3 deletions(-)
> 
> > diff --git a/drivers/char/hw_random/meson-rng.c b/drivers/char/hw_random/meson-rng.c
> > index a4eb8e35f13d..c6d7349630a1 100644
> > --- a/drivers/char/hw_random/meson-rng.c
> > +++ b/drivers/char/hw_random/meson-rng.c
> > @@ -14,19 +14,65 @@
> >  #include <linux/of.h>
> >  #include <linux/clk.h>
> 
> > -#define RNG_DATA 0x00
> > +struct meson_rng_priv {
> > +	bool check_status_bit;
> > +	unsigned int data_offset;
> > +	unsigned int cfg_offset;
> > +};
> 
> >  struct meson_rng_data {
> >  	void __iomem *base;
> >  	struct hwrng rng;
> > +	struct device *dev;
> > +	const struct meson_rng_priv *priv;
> >  };
> 
> > +#define RUN_BIT			0
> > +#define SEED_READY_STS_BIT	31
> > +#define RETRY_CNT		100
> > +
> > +static int meson_rng_wait_status(void __iomem *cfg_addr, int bit)
> > +{
> > +	u32 status;
> > +	u32 cnt = 0;
> > +
> > +	do {
> > +		status = readl_relaxed(cfg_addr) & BIT(bit);
> > +		cpu_relax();
> > +	} while (status && (cnt++ < RETRY_CNT));
> > +
> 
> Could you use readl_relaxed_poll_timeout here instead of open coding the
> loop?

At first I also thought about this API. But later I came to the
conclusion that it is inappropriate here:

1. We can't call rng_read from an atomic context.
2. RNG for me looks like a very lightweight primitive to me that 
should work quiclky.

But, now I looked again at the API and realized that we can use 
readl_relaxed_poll_timeout_atomic() instead of
readl_relaxed_poll_timeout(). What do you think?

> 
> > +	if (status)
> > +		return -EBUSY;
> > +
> > +	return 0;
> > +}
> > +
> >  static int meson_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
> >  {
> >  	struct meson_rng_data *data =
> >  			container_of(rng, struct meson_rng_data, rng);
> > +	const struct meson_rng_priv *priv = data->priv;
> > +
> > +	if (priv->check_status_bit) {
> > +		void __iomem *cfg_addr = data->base + priv->cfg_offset;
> > +		int err;
> > +
> > +		writel_relaxed(readl_relaxed(cfg_addr) | BIT(SEED_READY_STS_BIT), cfg_addr);
> 
> > -	*(u32 *)buf = readl_relaxed(data->base + RNG_DATA);
> > +		err = meson_rng_wait_status(cfg_addr, SEED_READY_STS_BIT);
> > +		if (err) {
> > +			dev_err(data->dev, "Seed isn't ready, try again\n");
> > +			return err;
> > +		}
> > +
> > +		err = meson_rng_wait_status(cfg_addr, RUN_BIT);
> > +		if (err) {
> > +			dev_err(data->dev, "Can't get random number, try again\n");
> > +			return err;
> > +		}
> > +	}
> > +
> > +	*(u32 *)buf = readl_relaxed(data->base + priv->data_offset);
> 
> >  	return sizeof(u32);
> >  }
> > @@ -41,6 +87,10 @@ static int meson_rng_probe(struct platform_device *pdev)
> >  	if (!data)
> >  		return -ENOMEM;
> 
> > +	data->priv = device_get_match_data(&pdev->dev);
> > +	if (!data->priv)
> > +		return -ENODEV;
> > +
> >  	data->base = devm_platform_ioremap_resource(pdev, 0);
> >  	if (IS_ERR(data->base))
> >  		return PTR_ERR(data->base);
> > @@ -53,11 +103,32 @@ static int meson_rng_probe(struct platform_device *pdev)
> >  	data->rng.name = pdev->name;
> >  	data->rng.read = meson_rng_read;
> 
> > +	data->dev = &pdev->dev;
> > +
> >  	return devm_hwrng_register(dev, &data->rng);
> >  }
> 
> > +static const struct meson_rng_priv meson_rng_priv = {
> > +	.check_status_bit = false,
> > +	.data_offset = 0x0,
> > +	.cfg_offset = 0x0,
> > +};
> > +
> > +static const struct meson_rng_priv meson_rng_priv_s4 = {
> > +	.check_status_bit = true,
> > +	.data_offset = 0x8,
> > +	.cfg_offset = 0x0,
> > +};
> > +
> >  static const struct of_device_id meson_rng_of_match[] = {
> > -	{ .compatible = "amlogic,meson-rng", },
> > +	{
> > +		.compatible = "amlogic,meson-rng",
> > +		.data = (void *)&meson_rng_priv,
> > +	},
> > +	{
> > +		.compatible = "amlogic,meson-rng-s4",
> > +		.data = (void *)&meson_rng_priv_s4,
> > +	},
> >  	{},
> >  };
> >  MODULE_DEVICE_TABLE(of, meson_rng_of_match);
> > -- 
> > 2.38.1
> 

-- 
Thank you,
Alexey
_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
