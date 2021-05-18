Return-Path: <SRS0=WrmZ=KN=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC3BC433B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:38:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4AC461108
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 May 2021 07:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4AC461108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:Cc:
	To:From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EwfbzFokqnso+dcwQWSiM0bFpZz3vn3mzzSPqYjE4iU=; b=PK069mCiEvTFZ6on4zLDLHNF9
	9+gqj0vV2x8e2e3w9d4Dv9cH/dP464Y6IJzAoVfp8you63i7UBWJcdBOyQKVr/M9YIaP1gxLl6FBv
	g8RPH0AVM3Tmx7Jr1HBCTsNNBvw72CQuVLndqukJScde9icPusDBqNcVxfpTyXjGmxA6/vXWP5wYO
	MRY6m3bmyE85zWC0GIHdCslKfgH6Jv3UJvEjRpzeEujT7IpCY/gz2mL8p0X4EWhzr2+2pYxIwKLiK
	XUREdD4TgR7f/CirRAAg7HM8LkMmaLAnPp6awlZv9hmuDBCqCQl2RI7hk7uj2c9mGV9paAgDt64qm
	dkEZEQuHA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liuId-00HOpr-9e; Tue, 18 May 2021 07:37:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liuIa-00HOpD-IZ
 for linux-amlogic@desiato.infradead.org; Tue, 18 May 2021 07:37:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Date:
 Message-ID:In-reply-to:Subject:Cc:To:From:References:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=n5szVkmDytzCFFysXlMeXwZdOmvmm3DgEonzhUe+NZs=; b=3+PtfDTRhWGqS7zsTXO/gJz2Nn
 8H1CZnpitP8TtkmppoIWrv802eDnF6/3zIdfSnXn3IJpNDg4nYDpI6p91kwjIyVGQT7WUTWxm3gbS
 TuGnfnC1ruGpCPFNk7sYj9qz0+6eaLDGMv9ZgmruTvxy/ib1Ps/6ei+eQJ99rkGGibE685RAJ4SGv
 lAbsq7Kmji11KT1FG4j+d3jKbjZP8NSpe96bWpT+afBDkTklNCZ4etzSWVlANdDQ1s2Z9/mskfMVX
 2D/K/DjADXIntVY/7Mcrff4dRpDHpBuwmzrehht302iclZDQDBG+ypOaZUpQ72uR1ICcYoK9xS6Xy
 QsKPrFOw==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liuIX-00EQ9Z-KK
 for linux-amlogic@lists.infradead.org; Tue, 18 May 2021 07:37:51 +0000
Received: by mail-wr1-x435.google.com with SMTP id a4so9046684wrr.2
 for <linux-amlogic@lists.infradead.org>; Tue, 18 May 2021 00:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=n5szVkmDytzCFFysXlMeXwZdOmvmm3DgEonzhUe+NZs=;
 b=E9wXKYF6dL0El8ZNRN65Z6CmACcbkRqJR3ZdX8ValaoldrM/XVIlDGsbcVc9xM+eIL
 qNvdHiv/6JBpkiFlAvlqvlZn1/nKz9+JP/QfDvqQSCqcgZ5rUSU+0wE0TH4SYRoHgMPJ
 bQE4TSBPniexesWLhEm+mpLR0LM1++5YwBNGa6bNyk073bQxgjhIllLpWRoHNFGNeggN
 zhjsU/phSkKoOOTRiq26uymQ1N5S2qjEtjSxxpX+nQRoEHt924OgQe2pz8DSg/mi8cDO
 wizZ6nWKkVlz19TbhpglLLQK9n3n+Jf82tptgiaIrqEAzsVBoITATd61rVnfLIr40eGe
 4rPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=n5szVkmDytzCFFysXlMeXwZdOmvmm3DgEonzhUe+NZs=;
 b=nJqzO64/2cvXYvNKI2ZD/WoHAc91YDCxlsF+NLE1IplTlLMneWTVztMofEHvho2I7Q
 vCtsBihFEm6H0mDbgvIsROimbdVqSXcFn4ODuHyC1GxGwY46C8qoBZjD6EqfVFiDvNy9
 LzTxR2hDzjvKH/VfnVS3bIH6S7zUQqwR2tKLSkFIsPyxwkol+TAVHTXCmcg2tFvbmQGI
 2ASskna2py9HHCjThLIIfl6zrnUDpk1jvZ2B/fWN2bJKythzGl9bXFCPyNVHin6VxWIV
 mLa+Xnw13yV80GRyM6QOwcIq+oVJgV9ESoK4HzWMY0NuI/vOmHhKe4wUt/Y03goEQCeq
 wf4g==
X-Gm-Message-State: AOAM530vIZ6TMCnO2W4SaMJfZkdhR1b9sGLyKF/DdgkrsAguut3pwiHy
 O+noURelHGty2t44YlcbXaLU/w==
X-Google-Smtp-Source: ABdhPJxPm4kXQ/GUstw9/tmCmcx/mApmQsELG0ZEwn97QcrRxaG2c/FQ3PsX076/9/osBLg+SZV2eQ==
X-Received: by 2002:a5d:63c1:: with SMTP id c1mr5049978wrw.71.1621323467412;
 Tue, 18 May 2021 00:37:47 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id p6sm5037371wma.4.2021.05.18.00.37.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:37:47 -0700 (PDT)
References: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.4.15; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 mturquette@baylibre.com, sboyd@kernel.org, narmstrong@baylibre.com,
 linux-clk@vger.kernel.org
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v1 0/3] clk: meson: rounding for fast clocks on
 32-bit SoCs
In-reply-to: <20210517203724.1006254-1-martin.blumenstingl@googlemail.com>
Message-ID: <1jwnrw1ohh.fsf@starbuckisacylon.baylibre.com>
Date: Tue, 18 May 2021 09:37:46 +0200
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_003749_752544_CD3C51C5 
X-CRM114-Status: GOOD (  19.09  )
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


On Mon 17 May 2021 at 22:37, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> On the 32-bit Amlogic Meson8/8b/8m2 SoCs we run into a problem with the
> fast HDMI PLL and it's OD (post-dividers). This clock tree can run at
> up to approx. 3GHz.
> This however causes a problem, because these rates require BIT(31) to
> be usable. Unfortunately this is not the case with clk_ops.round_rate
> on 32-bit systems. BIT(31) is reserved for the sign (+ or -).
>
> clk_ops.determine_rate does not suffer from this limitation. It uses
> an int to signal any errors and can then take all availble 32 bits for
> the clock rate.
>
> I am sending this as RFC to start a discussion whether:
> - this is a good way to solve it?

.determine_rate() was meant to replace .round_rate() so I guess it is
good to do it :)

> - what are the alternatives?

I don't see any ATM. Even with determine_rate(), 4.29GHz limitation
seems a bit low nowadays. In AML SoC, most PLLs should be able to reach
6GHz ... hopefully we won't need that on the 32bits variant ;)

> - getting some feedback on areas that need to be improved
>
>
> As always: any feedback is welcome!
>

Overall, looks good to me.

>
> Thank you!
> Martin
>
>
> Martin Blumenstingl (3):
>   clk: divider: Add re-usable determine_rate implementations
>   clk: meson: regmap: switch to determine_rate for the dividers
>   clk: meson: pll: switch to determine_rate for the PLL ops
>
>  drivers/clk/clk-divider.c      | 39 +++++++++++++++++++++++++++++++++-
>  drivers/clk/meson/clk-pll.c    | 26 +++++++++++++----------
>  drivers/clk/meson/clk-regmap.c | 19 ++++++++---------
>  include/linux/clk-provider.h   |  6 ++++++
>  4 files changed, 68 insertions(+), 22 deletions(-)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
