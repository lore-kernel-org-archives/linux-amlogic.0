Return-Path: <SRS0=Lw6S=AT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D57BAC433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jul 2020 07:54:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A750F2067D
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Jul 2020 07:54:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0WK961m";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOnG/4u/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A750F2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SJ5Fexl9CaczJ8KtnQ8HdF+f7/GrxL0c43Jrqyg2k6I=; b=b0WK961mtj3f4nbSpkqIqOuc2
	lRXUUr95frXhjpAzNodU3QxglE4UnigVabqRSZOErD3gBohdtVwsXSXmOZz7eYPaNYqNHtXeMT9vm
	D4OLmg7LCvQI8Ox3T+s57R6OTFHOOp4QOqaWYVd1FOiZCIEbSxckooaNdz/EYuPxcX9yC00Fi2fVK
	fEijcKId/7B3nR9m/EWPniZmEMx4ut9SKCUH90c4XqgcMNpyWHTFFLOO8FJrnBfzuW2b0m0Eqw0Ad
	ZqeUMeK6JjQKvnJ+RWIOnPFZSylgu75GBFjvB1LRMMGT2P2aAfA38P4U1+EbkmvkqmAxSg+Qrg5MC
	KKB/RoQ7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jt4tk-0004UK-Gf; Wed, 08 Jul 2020 07:53:44 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt4tf-0004Sl-Jq; Wed, 08 Jul 2020 07:53:40 +0000
Received: by mail-wr1-x441.google.com with SMTP id b6so47795964wrs.11;
 Wed, 08 Jul 2020 00:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=z6+nuHAx7L8u/EGJ0fxzxH9P5Mn+J7bZgvUQH6/6JiE=;
 b=LOnG/4u/IfXDoZja+V359IRXUa777GMUh6ivYJbbH4q3X71H9TB+D6+zxVOIKeAXOE
 ysQynx6nYq1xfJZoWqOewlbDJ5HQFNvj3RoGGpPjcLqsdwC0MLehdixEZXIKMzcq448I
 ugQptdLNzyLveI+oqu/19JPhvmlUMTSYVcSjBbswKNMchb5dnwjx6NzGdH4I2jFZ8AHb
 SNz1Fcr3xkGONcAew1Rv2NS+JP4OnXpc4ch+v0wznqQELoUbiXnfLGSqUwz5lMgcMGMv
 CN0rjhB+xsaK1LbugknbJn3rSDAg8qm3XoGBDAaijqJAR6QW2rrZhLG0X97m0MhYeTcv
 h0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z6+nuHAx7L8u/EGJ0fxzxH9P5Mn+J7bZgvUQH6/6JiE=;
 b=dlaW82HE82XY+AO585SFy1fE/rSVaB2w4vGJx7tg2hT8CgA7vd1mBOhuFuZbBQCflL
 92q4J2kPROLiT26szEfAHwjAd41bwVgxUQ4mTb11pJgU9XJeyQo9aQsP3N7i+VNwiLYT
 nTI6UhUlcLdxfUmm6dTR9APppO3hHdPFjwcsiU1ehrM6tg9CSjZX22QbSgdcy3c9JMq1
 cJXN2a7wArThnW9/ekmDM6HKKeQHQWDikSHtVwnx0MymXP6+9kaoMNEwUJtHd82FjXD7
 o4Z3KGkfl5MHfpaORymkbQEygcv42EAP/XPLXeNG/BFBujdWV/PJHk3q0gJ/BhkGqDAf
 PATA==
X-Gm-Message-State: AOAM530UKe0mBGKLA1UPdApMbivdE3MIT+2o/bL4azB5+lG8lS6PLZsu
 aAxbPsjcK21y6U30sWaX9vfBIQcW
X-Google-Smtp-Source: ABdhPJz8A2muEKNqwpqnXdusputoDmaFnzX4LyW0vTh9d2EDx90cds41auLtb5xmTsdRuQdUAC7OMQ==
X-Received: by 2002:a5d:66ca:: with SMTP id k10mr46352817wrw.244.1594194818597; 
 Wed, 08 Jul 2020 00:53:38 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id u1sm5597306wrb.78.2020.07.08.00.53.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2020 00:53:37 -0700 (PDT)
Date: Wed, 8 Jul 2020 09:53:36 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v4 05/13] crypto: sun8i-ce - permit asynchronous skcipher
 as fallback
Message-ID: <20200708075336.GB19609@Red>
References: <20200707063203.5018-1-ardb@kernel.org>
 <20200707063203.5018-6-ardb@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200707063203.5018-6-ardb@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_035339_748610_E4CD85DE 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: Eric Biggers <ebiggers@google.com>, Ayush Sawal <ayush.sawal@chelsio.com>,
 Jamie Iles <jamie@jamieiles.com>, Fabio Estevam <festevam@gmail.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
 Rohit Maheshwari <rohitm@chelsio.com>, Chen-Yu Tsai <wens@csie.org>,
 NXP Linux Team <linux-imx@nxp.com>, Corentin Labbe <clabbe@baylibre.com>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 Maxime Ripard <mripard@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, John Allen <john.allen@amd.com>,
 Tero Kristo <t-kristo@ti.com>, linux-crypto@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Jul 07, 2020 at 09:31:55AM +0300, Ard Biesheuvel wrote:
> Even though the sun8i-ce driver implements asynchronous versions of
> ecb(aes) and cbc(aes), the fallbacks it allocates are required to be
> synchronous. Given that SIMD based software implementations are usually
> asynchronous as well, even though they rarely complete asynchronously
> (this typically only happens in cases where the request was made from
> softirq context, while SIMD was already in use in the task context that
> it interrupted), these implementations are disregarded, and either the
> generic C version or another table based version implemented in assembler
> is selected instead.
> 
> Since falling back to synchronous AES is not only a performance issue, but
> potentially a security issue as well (due to the fact that table based AES
> is not time invariant), let's fix this, by allocating an ordinary skcipher
> as the fallback, and invoke it with the completion routine that was given
> to the outer request.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 41 ++++++++++----------
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h        |  8 ++--
>  2 files changed, 25 insertions(+), 24 deletions(-)
> 

I finally took the time to rebase all my hash/xrng serie on top of this change and test this patch.

Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Tested-on: sun50i-h6-pine-h64
Tested-on: sun8i-h3-orangepi-pc

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
