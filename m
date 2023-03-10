Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 353B1C6FD1E
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 11:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yt52fijaOeEQwOSWwf4+6Qy51Tr2smSC+69AhylYmPU=; b=NluZFfU3LrMPaT
	+EzYkOHVCQdXT0tFDLbFybpoKfpIgC1VtAc/wtK5lzJ8HSPJH+85zdnj5NsoMAlyZUfj/vP1lbr2s
	ldCkyhYT8elj8LZMumUe+tEK9jum3S+RuLinwU+WS+WvBAG2h1GxEQ4S/NYmO4lYaerKOrq5a2Emu
	kywKQi9H7zN/iR0rsleQSUkhopLqtsVHeFMUY9Q+8bVYbDdO0xn7o27xjJhOfFZa0n5Z9R1kOA5ly
	bRsDPZoDowCc9ATc5kBmC9BNa+xrt8WPclziuhFknvHjfjNGvQaXhN15HRMCOxZEOHmFgkvJiPDKh
	1NEUSWwwIgXl2lKcHKfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paau4-00ELu4-9P; Fri, 10 Mar 2023 11:27:16 +0000
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net ([167.179.156.38])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paatt-00ELpn-HG; Fri, 10 Mar 2023 11:27:07 +0000
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1paate-002Xw7-Tc; Fri, 10 Mar 2023 19:26:51 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 10 Mar 2023 19:26:50 +0800
Date: Fri, 10 Mar 2023 19:26:50 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Olivia Mackall <olivia@selenic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Subject: Re: [PATCH 0/5] hwrng: meson: simplify driver
Message-ID: <ZAsT+mlr4ij69RNs@gondor.apana.org.au>
References: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <26216f60-d9b9-f40c-2c2a-95b3fde6c3bc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_032705_591046_ED999A6D 
X-CRM114-Status: UNSURE (   9.07  )
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

On Sat, Feb 18, 2023 at 09:54:25PM +0100, Heiner Kallweit wrote:
> This series simplifies the driver. No functional change intended.
> 
> Heiner Kallweit (5):
>   hwrng: meson: remove unused member of struct meson_rng_data
>   hwrng: meson: use devm_clk_get_optional_enabled
>   hwrng: meson: remove not needed call to platform_set_drvdata
>   hwrng: meson: use struct hw_random priv data
>   hwrng: meson: remove struct meson_rng_data
> 
>  drivers/char/hw_random/meson-rng.c | 59 +++++++++---------------------
>  1 file changed, 17 insertions(+), 42 deletions(-)
> 
> -- 
> 2.39.2

Patches 1-3 applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
