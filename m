Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57A0C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Mar 2022 22:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IboJQ1BUkrfQ++xkWZ6yF/4PvA9+z4a7NwwLeRT9OgQ=; b=KWBpI5vU42bXb8
	VtRp2dwOvk9wQwEbVFr458VZ8E2gkU8jbTArBlgLotHRIRlJwXg15P53DNkf5x2aLvOQBF4dD4tqC
	N7JT8x8L+AtglwpjRcrmcmIItQ84O/a1Idxnea+ouZt7rWcvTFFjNoo0rp6mZU5oqxEYRDVjMRRdc
	tKmLJh01bBTYC8gISWalgc2mRBxOCOU6qDGUYj7OCjTD/1uZltKVroA82NuQwKqR+2PlX/Ws1K2ae
	59cCxQBJaYI8wPsesO/0u93DysECMDjJQGHFhZDhom4Q0SoFceV3p3V/Gni3gUAkn057M2wcSokLS
	oBe1PTffMjQx6wiGBR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPXva-004f3r-FU; Wed, 02 Mar 2022 22:58:38 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPXvX-004f35-8r; Wed, 02 Mar 2022 22:58:36 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
 id 1nPXvM-0006CD-2F; Thu, 03 Mar 2022 09:58:25 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Thu, 03 Mar 2022 10:58:24 +1200
Date: Thu, 3 Mar 2022 10:58:23 +1200
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Corentin Labbe <clabbe@baylibre.com>
Cc: jernej.skrabec@gmail.com, linus.walleij@linaro.org,
 narmstrong@baylibre.com, ulli.kroll@googlemail.com, wens@csie.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/5] crypto: completion should be ran with BH disabled
Message-ID: <Yh/2j+hxUs/+1BXB@gondor.apana.org.au>
References: <20220221120833.2618733-1-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220221120833.2618733-1-clabbe@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_145835_335651_0DD2163B 
X-CRM114-Status: GOOD (  12.61  )
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

On Mon, Feb 21, 2022 at 12:08:28PM +0000, Corentin Labbe wrote:
> Hello
> 
> This is the follow up of https://lore.kernel.org/lkml/Yd1SIHUNdLIvKhzz@Red/
> and https://patchwork.kernel.org/project/linux-crypto/patch/20220127133332.4011509-1-clabbe@baylibre.com/
> This serie fix all drivers which do not call completion with BH disabled
> and add the check in crypto/engine asked by Herbert.
> I have verified that this check does not generate warnings on all other crypto
> hardware I got (omap, ccree, rockchip)
> 
> Regards
> 
> Corentin Labbe (5):
>   crypto: sun8i-ss: call finalize with bh disabled
>   crypto: sun8i-ce: call finalize with bh disabled
>   crypto: amlogic: call finalize with bh disabled
>   crypto: gemini: call finalize with bh disabled
>   crypto: engine: check if BH is disabled during completion
> 
>  crypto/crypto_engine.c                              | 1 +
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 +++
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 3 +++
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c | 3 +++
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-hash.c   | 3 +++
>  drivers/crypto/amlogic/amlogic-gxl-cipher.c         | 2 ++
>  drivers/crypto/gemini/sl3516-ce-cipher.c            | 2 ++
>  7 files changed, 17 insertions(+)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
