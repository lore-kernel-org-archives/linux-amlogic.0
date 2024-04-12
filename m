Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B16C4345F
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2024 08:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YFNYu8ODmVdKYUsQEDx/BLRj2K+VyTgnr7eFCGkNGP4=; b=QieXlQL8x6oxwH
	0B2ncGnFGOLqgQ6Nc3HV144/ppSpcqdJkxaDBQusvN/CWxw7pzWZYG8P8PebrLyd25XRKQe2GOL4B
	s47b9vKTCaBdqa38+NhSaaQGgvdKmRplQU89fAqd8JMWFzp9H/1bcOpupd3ze3+TNNYS77udj5s4l
	WabCG8zI09ameFjNl3CBn0uIQXkL7ofbb/yjPabebQzIfMqS6bqTkEvK+DNcRvBl6RyaVgh40ISDb
	soJXbJt8FKN8g/fVWF/VunOXH8IXpyKjGR9CrYKQTwFhDc7S6xNZo9VZ9BN0qX/jItPjuPbpo613r
	GbVG30rgmCEg/PpchNvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCB0-0000000G3Qq-0As5;
	Fri, 12 Apr 2024 08:22:26 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvCAx-0000000G3OZ-0pIB;
	Fri, 12 Apr 2024 08:22:25 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1rvCAN-000n5W-DN; Fri, 12 Apr 2024 16:21:48 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 12 Apr 2024 16:22:04 +0800
Date: Fri, 12 Apr 2024 16:22:04 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"clabbe@baylibre.com" <clabbe@baylibre.com>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>,
	"jbrunet@baylibre.com" <jbrunet@baylibre.com>,
	"martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
	"vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	kernel <kernel@sberdevices.ru>
Subject: Re: [PATCH v7 00/23] Support more Amlogic SoC families in crypto
 driver
Message-ID: <ZhjvLMcMXKNmlCZ7@gondor.apana.org.au>
References: <20240411133832.2896463-1-avromanov@salutedevices.com>
 <ZhiiPVckOYH9dFQ/@gondor.apana.org.au>
 <20240412081931.3s2fw6hds3hh5cwg@cab-wsm-0029881.sigma.sbrf.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240412081931.3s2fw6hds3hh5cwg@cab-wsm-0029881.sigma.sbrf.ru>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240412_012223_264218_56CCAC0B 
X-CRM114-Status: UNSURE (   8.49  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 12, 2024 at 08:19:36AM +0000, Alexey Romanov wrote:
>
> Old Amlogic Soc's for crypto HW used a BLKMV engine, which required
> a clk input and a second interrupt line. New SoC's uses DMA engine
> and don't need this.
> 
> I spoke with vendor, and they confirmed that AXG, G12A, G12B, SM1,
> A1, S4 and GXL is using DMA engine and crypto HW is not connected
> to clk / second interrupt line.

Sorry I'm just asking you to ensure that you've tested the whole
patch-series with CRYPTO_MANAGER_EXTRA_TESTS enabled and there are
no errors reported.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
