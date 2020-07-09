Return-Path: <SRS0=70lv=AU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22E7C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jul 2020 17:16:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6433F2077D
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Jul 2020 17:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WT/dGq6F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kdFWAGk0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6433F2077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iWcTUNjHDrFwOGngw3a7W6da8Gdeh+XFaYjJ4l4x9gQ=; b=WT/dGq6FQ2GUdRiKWGjP55wZa
	e27Y6wniA7I7viZ+3ziQKCZBb1R6rUJEFaR+fTJOVjdRzha6jefv21jrTLJSWzMtjpaHVLO6EkhYi
	fD1MqsHJFfUl5uaWActb6PjsKrufNgTWiEJ48h8j2optEUGbw/wHqopMjJV4XlUvT2a3+PiEUXB+d
	pVJoG9T+QGClMlYBW0OwKxlO62XhrFzDd0z5sdLokKXjhgoClI/Uqh4GXAUSErtZl9zZ3ofA1e/ZB
	5DGeUu7Rx1xW7owlBG8FXIWm97IEEY3av5eSqL7cVzh+F9pK9TxiF/zebde1u0NmQ+eNUSjqgcIC5
	PWA/DYiYQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtaA1-0002zp-6a; Thu, 09 Jul 2020 17:16:37 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jta9x-0002yc-Ub
 for linux-amlogic@lists.infradead.org; Thu, 09 Jul 2020 17:16:34 +0000
Received: by mail-wm1-x343.google.com with SMTP id g10so6682888wmc.1
 for <linux-amlogic@lists.infradead.org>; Thu, 09 Jul 2020 10:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=hmI2pr2O9KFjOijImT0+FbwAxpzgzTC7FzYN5zC+JMs=;
 b=kdFWAGk0iUZjedKRxztU8bWiH5sKHhTAW2YDVKwD0F4snsgNQbd7zDLFvbt/82x6v/
 VH1bMVKIQDTNUk6wRU09AL4x949Kvdk8Fmy7jJfhaCgoAi1Oeb2oNn2ZDZQQOMoN/XzS
 z6kVLGhD+PUMmrjZhruiAd1VNsJvMHq3ra6DhjOP/+DFzGt7VECEJFvxMpk/44knnKOA
 bgMRnTP7942Eg9Vbn6StDNLbyB/Ry5kzQvGOpKZc6hJKnxS2JoSPonOfOHxSenJT2SE9
 5OQXVdPkvF8hkOV5keFg7XHUveIvwJn8r+6yDyv6pP4aHQYaINL8izDOd7s17Ae0glYq
 bNlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=hmI2pr2O9KFjOijImT0+FbwAxpzgzTC7FzYN5zC+JMs=;
 b=djB6rsfAkPsMaUfNdxDptuCJwBIbJghrqrar+izY3iDnzYdUvRlCA8EvRrzrq4Ux21
 tP9OsFb3ELkj2gOiJBDMCFGW7O+puiYEDLjyHYFqluwfDoEfKAnMu/1QEZp/U9Ua0zfA
 AZmyg3HnglqcY0r79Pj2eaFWOnS4pSF9JlYvH3i9JNqdz48Oa4UpkbBc0fC0DrKQ1YSr
 NszY+q3vOoRh9UsbI6rWelws5yLkM0fiS5P8U3DhZRyMWMCQieQ6F3D/A6pJ2Yi5K8ln
 xw6F5L7KvL96ZQeLZfX8hYzf7zfW/XNVdjNWHiTVxz2ZIO/w8BdoIeRQdXIlx0C1tJPw
 TIZw==
X-Gm-Message-State: AOAM531po9Ky5pWT9gDf8T7sIjgksphWRnmzD3RMoQ1CHjIEM/9v/+IL
 vvCuqf3qF5MkKZjrZHZY3wojOA==
X-Google-Smtp-Source: ABdhPJxoDnl4uLj+qPytb0Ar31Lq542I0abu2UkCil0ADdhflQlq17LPcs+qSc6RV6scXxwjkK5nZA==
X-Received: by 2002:a1c:a74c:: with SMTP id q73mr1006135wme.96.1594314990921; 
 Thu, 09 Jul 2020 10:16:30 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f197sm6043371wme.33.2020.07.09.10.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 10:16:30 -0700 (PDT)
References: <20200629203904.2989007-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 0/2] clk: meson8b: add two missing gate clocks
In-reply-to: <20200629203904.2989007-1-martin.blumenstingl@googlemail.com>
Date: Thu, 09 Jul 2020 19:16:29 +0200
Message-ID: <1jk0zcip76.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_131634_013763_22467635 
X-CRM114-Status: UNSURE (   9.40  )
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
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 29 Jun 2020 at 22:39, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> While trying to figure out how to set up the video clocks on the 32-bit
> SoCs I found that the current clock tree is missing two gates. This adds
> the missing gates based on evidence found in the public S805 datasheet,
> the GXBB clock driver and 3.10 vendor kernel.
>
> I didn't add any Fixes tag because this clock tree is still read-only
> and the HDMI PLL (the top-most clock in this tree) needs more work as
> well.
>
>
> Martin Blumenstingl (2):
>   clk: meson: meson8b: add the vclk_en gate clock
>   clk: meson: meson8b: add the vclk2_en gate clock
>
>  drivers/clk/meson/meson8b.c | 60 ++++++++++++++++++++++++++++++-------
>  drivers/clk/meson/meson8b.h |  4 ++-
>  2 files changed, 53 insertions(+), 11 deletions(-)

Applied Thx.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
