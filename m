Return-Path: <SRS0=91Jp=YS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 299E5CA9EA0
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 15:21:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F24FC21D7B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Oct 2019 15:21:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Op+NQCgJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F24FC21D7B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Jp7nL9bt/160Q8CcllVIk/A/MgRKA1J8gI+iPXNzfc=; b=Op+NQCgJTDySWy
	5dlHN0JCQmm89x2NW9VmD7B3N8ukmW8G68XOt9nNFhSqpGn5EhOLa3t7NbxFl9xL1rYWvwW4qJoy3
	ieyBLWuHLrmFg8hSh8hLTqtUsE8GejfsQPvsWEgrZaXgHmOqm84sWhDKNXXNAEshfN4wS0tPZMvFM
	TH0wBw0wJIls8a+J4KAFeO6BtmJLdHM3Ifokhn76Mk+uSudi7ZVAx3lTgP5gSebCN6DXAUrIYkNUC
	S1nfT2MPKnJTF8el3mgD9KmhOjHtRzlGR4OIszHa22L9uwVC7rTtt2iRRL+r/WzOsc4TL597PQJbb
	b4GWaK2cfC2bSKKfuFJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iO1Oy-0006W8-Af; Fri, 25 Oct 2019 15:21:20 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=deadmen.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iO1Oi-0006JC-10; Fri, 25 Oct 2019 15:21:05 +0000
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
 id 1iO1OE-0001hu-6D; Fri, 25 Oct 2019 23:20:34 +0800
Received: from herbert by gondobar with local (Exim 4.89)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1iO1O5-0007pN-BO; Fri, 25 Oct 2019 23:20:25 +0800
Date: Fri, 25 Oct 2019 23:20:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: YueHaibing <yuehaibing@huawei.com>
Subject: Re: [PATCH -next 00/13] hwrng: use devm_platform_ioremap_resource()
 to simplify code
Message-ID: <20191025152025.qudqaupecsgwkn32@gondor.apana.org.au>
References: <20191016104621.26056-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191016104621.26056-1-yuehaibing@huawei.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191025_082104_287428_1DC03C74 
X-CRM114-Status: UNSURE (   5.90  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com, eric@anholt.net,
 f.fainelli@gmail.com, khilman@baylibre.com, krzk@kernel.org,
 ludovic.desroches@microchip.com, kgene@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-crypto@vger.kernel.org,
 dsaxena@plexity.net, arnd@arndb.de, rjui@broadcom.com, l.stelmach@samsung.com,
 linux-samsung-soc@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 mpm@selenic.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, sbranden@broadcom.com,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 patrice.chotard@st.com, wahrenst@gmx.net, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 06:46:08PM +0800, YueHaibing wrote:
> devm_platform_ioremap_resource() internally have platform_get_resource()
> and devm_ioremap_resource() in it. So instead of calling them separately
> use devm_platform_ioremap_resource() directly.
> 
> YueHaibing (13):
>   hwrng: atmel - use devm_platform_ioremap_resource() to simplify code
>   hwrng: bcm2835 - use devm_platform_ioremap_resource() to simplify code
>   hwrng: exynos - use devm_platform_ioremap_resource() to simplify code
>   hwrng: hisi - use devm_platform_ioremap_resource() to simplify code
>   hwrng: ks-sa - use devm_platform_ioremap_resource() to simplify code
>   hwrng: meson - use devm_platform_ioremap_resource() to simplify code
>   hwrng: npcm - use devm_platform_ioremap_resource() to simplify code
>   hwrng: omap - use devm_platform_ioremap_resource() to simplify code
>   hwrng: pasemi - use devm_platform_ioremap_resource() to simplify code
>   hwrng: pic32 - use devm_platform_ioremap_resource() to simplify code
>   hwrng: st - use devm_platform_ioremap_resource() to simplify code
>   hwrng: tx4939 - use devm_platform_ioremap_resource() to simplify code
>   hwrng: xgene - use devm_platform_ioremap_resource() to simplify code
> 
>  drivers/char/hw_random/atmel-rng.c   | 4 +---
>  drivers/char/hw_random/bcm2835-rng.c | 5 +----
>  drivers/char/hw_random/exynos-trng.c | 4 +---
>  drivers/char/hw_random/hisi-rng.c    | 4 +---
>  drivers/char/hw_random/ks-sa-rng.c   | 4 +---
>  drivers/char/hw_random/meson-rng.c   | 4 +---
>  drivers/char/hw_random/npcm-rng.c    | 4 +---
>  drivers/char/hw_random/omap-rng.c    | 4 +---
>  drivers/char/hw_random/pasemi-rng.c  | 4 +---
>  drivers/char/hw_random/pic32-rng.c   | 4 +---
>  drivers/char/hw_random/st-rng.c      | 4 +---
>  drivers/char/hw_random/tx4939-rng.c  | 4 +---
>  drivers/char/hw_random/xgene-rng.c   | 4 +---
>  13 files changed, 13 insertions(+), 40 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
