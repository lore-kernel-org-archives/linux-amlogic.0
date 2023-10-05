Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134B7E8FDC8
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Oct 2023 10:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukjCJ2S+7k7Hcm0AhsKoD4zyJG6hsbxFDFZUV8mOy8M=; b=Ydu4TNfyNadEkM
	El1BXLM4Dbil/Mq3x3KrVQuxPsDoGSZ7lXTj9bPmkg9CLV7/OqhQ86/M/lzlz3tgIiGGRdEkDr9ay
	A3jZNfoT3NxK+W02pHeh0ZksaO8cAU/rrd/mwSq6G1se1JDJG7/HYgMPHwz1YLHkuFgEyEWWdukuT
	7XQJ/M7PwZAo59S6JdiJ1iNIdCZ2E52ry6bE+CiH56WrddzIGaUgSjhuz5/icwPJegqi2nE6MBNuD
	l7yz1Qqq+wrvD67QXvD3Yfy4scnv+Pga1QDCYP2wwJd9RBb0qbQtmiAI5iFkLx1zV+15U5kIfGooY
	VEbc7NqTyJbbCwtD65Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLaU-001tNn-28;
	Thu, 05 Oct 2023 10:28:10 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoLaR-001tMF-13;
	Thu, 05 Oct 2023 10:28:08 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qoLZu-003lA3-Le; Thu, 05 Oct 2023 18:27:35 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 05 Oct 2023 18:27:38 +0800
Date: Thu, 5 Oct 2023 18:27:38 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Alexey Romanov <avromanov@salutedevices.com>
Cc: narmstrong@baylibre.com, neil.armstrong@linaro.org, olivia@selenic.com,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, conor@kernel.org, khilman@baylibre.com,
	jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
	f.fainelli@gmail.com, hkallweit1@gmail.com, lists@kaiser.cx,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-crypto@vger.kernel.org,
	kernel@sberdevices.ru
Subject: Re: [PATCH v5 0/3] Meson S4 HW RNG Support
Message-ID: <ZR6PmiHLLVdKAROb@gondor.apana.org.au>
References: <20230929102942.67985-1-avromanov@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230929102942.67985-1-avromanov@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_032807_382341_CCEE9CDA 
X-CRM114-Status: GOOD (  13.34  )
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

On Fri, Sep 29, 2023 at 01:29:35PM +0300, Alexey Romanov wrote:
> Hello!
> 
> This patch series adds hwrng support for Amlogic S4-series.
> Now, S4 uses a new random number generation algorithm.
> This changes implemnents new algo and also adds description
> to meson-s4.dtsi.
> 
> V2:
> 
> - Use readl_relaxed_poll_timeout_atomic() function instead of loop.
> - Use two different functions: meson_rng_read() and meson_s4_rng_read().
> - Fix naming in DT schema (meson-s4-hwrng instead of meson-hwrng-s4).
> - A little code style fixes.
> 
> V3:
> 
> - Fix commit message in patch with dt-bindings schema changes.
> 
> V4:
> 
> - Drop struct meson_rng_priv field from struct meson_rng_data.
> 
> V5:
> 
> - Rebased over v6.7/arm64-dt (Amlogic repo).
> 
> Alexey Romanov (3):
>   drivers: rng: meson: add support for S4
>   dt-bindings: rng: meson: add meson-rng-s4 compatible
>   arch/arm64: dts: meson-s4: add hwrng node
> 
>  .../bindings/rng/amlogic,meson-rng.yaml       |  1 +
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  5 ++
>  drivers/char/hw_random/meson-rng.c            | 80 ++++++++++++++++++-
>  3 files changed, 83 insertions(+), 3 deletions(-)
> 
> -- 
> 2.25.1

Patches 1-2 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
