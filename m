Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8032C001DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jul 2023 11:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6sQd4Jb90W75ZUu73TC3boI1UsJus8S6bSjJU3JX2Y=; b=cpIhtLq7VmNO6o
	ayurg+kITk1WHR07jbnsiGHoCROXQn27kwHXJa2TVe4piWE71Z+XC9hFGbRGYEy+MuE364Gwnxk4m
	pbHugGEXcbzWTzGadg6lBbR9eM97Gp/qlHQBUFVzjcogs5Vc15rLNICZsPKPoljhfrtMmNf/vj5wZ
	wAH6cew4/KUyEbkzRvVIvx0L44SMJmmcN2nx7MVNhL6iDUxD+TF1BTd2q4zwQI50snqEqOAKvjad6
	rDcTjT73kmbgec26/TMDiB+QkKnXJbMoTqlEwpDNutY4xrWQ7f6BMaSHZL+eY6B+ZA+2TGLqph04Y
	BTqGaGcpJ+t3Uoo050Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd6O-00AFXv-0N;
	Wed, 26 Jul 2023 11:54:48 +0000
Received: from viti.kaiser.cx ([2a01:238:43fe:e600:cd0c:bd4a:7a3:8e9f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOd6I-00AFUV-1o;
	Wed, 26 Jul 2023 11:54:44 +0000
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1qOd63-0005Ck-Pc; Wed, 26 Jul 2023 13:54:27 +0200
Date: Wed, 26 Jul 2023 13:54:27 +0200
From: Martin Kaiser <lists@kaiser.cx>
To: Alexey Romanov <AVRomanov@sberdevices.ru>
Cc: "narmstrong@baylibre.com" <narmstrong@baylibre.com>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"olivia@selenic.com" <olivia@selenic.com>,
	"herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"hkallweit1@gmail.com" <hkallweit1@gmail.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 1/3] drivers: rng: add check status bit feature
Message-ID: <20230726115427.aigzl2wjgc6ccyt6@viti.kaiser.cx>
References: <20230725141252.98848-1-avromanov@sberdevices.ru>
 <20230725141252.98848-2-avromanov@sberdevices.ru>
 <20230725195901.n2klvgz7outqaatk@viti.kaiser.cx>
 <20230726075243.f37sjcurmog3eunh@cab-wsm-0029881>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230726075243.f37sjcurmog3eunh@cab-wsm-0029881>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230726_045442_743801_569EEB5F 
X-CRM114-Status: GOOD (  15.56  )
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

Hi Alexey,

Alexey Romanov (AVRomanov@sberdevices.ru) wrote:

> > > +static int meson_rng_wait_status(void __iomem *cfg_addr, int bit)
> > > +{
> > > +	u32 status;
> > > +	u32 cnt = 0;
> > > +
> > > +	do {
> > > +		status = readl_relaxed(cfg_addr) & BIT(bit);
> > > +		cpu_relax();
> > > +	} while (status && (cnt++ < RETRY_CNT));
> > > +

> > Could you use readl_relaxed_poll_timeout here instead of open coding the
> > loop?

> At first I also thought about this API. But later I came to the
> conclusion that it is inappropriate here:

> 1. We can't call rng_read from an atomic context.

Agreed. A hwrng read function may sleep (an example for this is
exynos_trng_do_read). But this doesn't prevent us from using
readl_relaxed_poll_timeout.

> 2. RNG for me looks like a very lightweight primitive to me that 
> should work quiclky.

> But, now I looked again at the API and realized that we can use
> readl_relaxed_poll_timeout_atomic() instead of
> readl_relaxed_poll_timeout(). What do you think?

Ok, if you know that your rng hardware won't need much time to set the
bit that you're checking, you may use readl_relaxed_poll_timeout_atomic.

stm32_rtc_set_alarm does something similar.

Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
