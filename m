Return-Path: <SRS0=dvnd=OV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B81C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Oct 2021 06:44:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEF5E615A4
	for <linux-amlogic@archiver.kernel.org>; Fri,  1 Oct 2021 06:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BEF5E615A4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gondor.apana.org.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qu+OG6w2nWixFKsotSw7xKzmYgwWQX/rNQMeGxzvVvw=; b=qGBtCQD+zwBZUy
	zQzNelB0/dWNeDBfXWt+EgpGtGMtJnPQ40DRZre0wuX5igvZm9WkvJ/7jKR5cshhcehUWwumrwRJw
	x/yprBw4Cwu8abM4t9/8wDClqBGiRikxlZwj+TaVOMDzPUMShbh4QTVTh/SA9UjrQ0WXAkxXQXLB3
	u8ME1LGv8555p/LwQLN0yRCeqBTph3po3ydqAYvfS47qPNvaclYMNH2lUQ3SYHBOjchsX8R6M94+K
	koArziomEXKZ/7rBsNumZbmOTbzmcMusawakoS3uTy5dhfHpK+pda2WYjG1rtrpiE4K4mlKy1U7h0
	42uTM1tY0KnYdtJxK19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWCHP-00GpDb-Ca; Fri, 01 Oct 2021 06:44:23 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=deadmen.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWCHN-00GpCi-6D; Fri, 01 Oct 2021 06:44:22 +0000
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
 by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
 id 1mWCH7-0006js-1O; Fri, 01 Oct 2021 14:44:05 +0800
Received: from herbert by gondobar with local (Exim 4.92)
 (envelope-from <herbert@gondor.apana.org.au>)
 id 1mWCH0-0003VN-Sy; Fri, 01 Oct 2021 14:43:58 +0800
Date: Fri, 1 Oct 2021 14:43:58 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Matt Mackall <mpm@selenic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-crypto@vger.kernel.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2] hwrng: meson - Improve error handling for core clock
Message-ID: <20211001064358.GA13451@gondor.apana.org.au>
References: <20210920074405.252477-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210920074405.252477-1-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_234421_278545_67B00A29 
X-CRM114-Status: GOOD (  15.69  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Sep 20, 2021 at 09:44:05AM +0200, Uwe Kleine-K=F6nig wrote:
> -ENOENT (ie. "there is no clock") is fine to ignore for an optional
> clock, other values are not supposed to be ignored and should be
> escalated to the caller (e.g. -EPROBE_DEFER). Ignore -ENOENT by using
> devm_clk_get_optional().
> =

> While touching this code also add an error message for the fatal errors.
> =

> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> =

> compared to (implicit) v1
> (https://lore.kernel.org/r/20210914142428.57099-1-u.kleine-koenig@pengutr=
onix.de)
> this used dev_err_probe() as suggested by Martin Blumenstingl.
> =

> v1 got a "Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>", I didn'=
t add
> that because of the above change.
> =

> (Hmm, my setup is broken, the b4 patch signature was done before I added =
this
> message. I wonder if this will break the signature ...)
> =

> Best regards
> Uwe
> =

>  drivers/char/hw_random/meson-rng.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Patch applied.  Thanks.
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
