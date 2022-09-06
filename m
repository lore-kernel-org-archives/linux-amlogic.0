Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8BDECAAD5
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Sep 2022 16:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFbroc/8RTx0vocaGkpR/6wHqy3zseKCrDjt1tu02bM=; b=E5hutr5za7eKmF
	YYnS0take692PIPhbXf4GQtdvSaVHb+4qrb088QIltXGYFh6Dt8lAt7n1rzRM3RlAiT5o5QArEPiS
	h1jrT/ext12zdXt/7Ja0xsC4P1zc0qL15/xGs0sx368YnWVQcWhoFeaqLc0Hd+xMScP8dFmlwWluK
	GX3UyA18jd0az1IVWBO5/VA1DqfF7iq60r1xUIDV6rZZN5UBII4ulSE0LEdXFqxUwtzkNzNvWwatC
	5P/U1OSMw7xnLNMDpjamKLPFlyOjL+7/Sa2tP9qnQs+NAMkbRsPgPWrn3EfSmcGbI2mqgBWjEjUmc
	hEcnXMPc/lqtu9uPK5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVb4c-00FB9w-EE; Tue, 06 Sep 2022 16:05:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVaZo-00EqKZ-25
	for linux-amlogic@lists.infradead.org; Tue, 06 Sep 2022 15:33:26 +0000
Received: by mail-wm1-x332.google.com with SMTP id s23so7086602wmj.4
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Sep 2022 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date;
        bh=8dfsxuLQkwhGof/iBTeTnMKCWk0wegl/kZDWDKnjl0w=;
        b=5WpliFAJbWGKf4kORR8xbjCcjX54KQMghE3FyyPPlAfwyhFe1u7U4EBBMxgqwSn0wa
         hkWcPsF/UCAjwXvDfLnwkZaB9uBFnm7NZd4clDdVNd9OMmZnN3ZhTuEI/+WoOdsOKT48
         XZhtw+P25AIH4dFPTe/9bqS5KMWPCUcoX26f1CunU/w3ysBuD6Ea9k1lIXvfJXqkAcVi
         Ry5dSgBKv9OdLNeOUF7Jl+ZVi8tDS/BmVapFxQc+Fdhdce3jop/atNiPPRFG7RW/hInu
         gNrzystqWRYHNfXWNhD4Gu+B2TA4aIf/vGynugDuaPg4+JTChHlJRoykEEVELDh6SHSW
         baYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date;
        bh=8dfsxuLQkwhGof/iBTeTnMKCWk0wegl/kZDWDKnjl0w=;
        b=E5tgdo5FX8egKyJ+KeeM7IZimk3H0M3+zYzYIKQV3bEDNTyqYm8GfyokI7wW3Uw27M
         moYNSLAtqJf7pRBwUcz9T6NLRezom073Y5p2p3mH74ERjrJ5UTI9p3xdz3lGg+JTBToK
         CW9Rm3mrWSJw4Q8ZeKz4Xn0mM+NHbmgHhFQfUoCbpp5vJqNQgN35KIrZkTg1XlsUY7eD
         7RQI/vXLbBcgn/4czRZFnHXKsjRu02u4inTG+Gsu/nPGqgpEtU1unJhVe+X88N/yvM8v
         aMEFRZUWck+YcYHjl6cu9MMImJ9KC/OWQrSoU2DbdxYqFzw/UpEmqQAWov/OhwxJlRPs
         pgsg==
X-Gm-Message-State: ACgBeo0Mbv2uZQnD1bssqSdJGsVK4qXDpRhimUNQx95200Smjn66tIct
	rNKDIaRW8IM2jelEd5vdFRaGrQ==
X-Google-Smtp-Source: AA6agR5tEfmioxS2Hie3WY0cth/zuqR4PwJ8gLnBsFEAJ0jXcN8QX0pmR1E7iwT0IL6ZnYqjahILbQ==
X-Received: by 2002:a1c:7315:0:b0:3a5:ff61:4080 with SMTP id d21-20020a1c7315000000b003a5ff614080mr14079094wmb.196.1662478399600;
        Tue, 06 Sep 2022 08:33:19 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q11-20020a1cf30b000000b003a8434530bbsm20268437wmq.13.2022.09.06.08.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Sep 2022 08:33:18 -0700 (PDT)
References: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
Date: Tue, 06 Sep 2022 17:29:03 +0200
In-reply-to: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
Message-ID: <1jk06gwm9u.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_083324_244994_FE215053 
X-CRM114-Status: UNSURE (   6.04  )
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


On Mon 29 Aug 2022 at 20:52, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Currently we loop over meson_parm_read() up to 24mln times.
> This results in a unpredictable timeout period. In my case
> it's over 5s on a S905X4-based system. Make the timeout
> period predictable and set it to 100ms.

Nitpick: next time please try to make commit not about your system, but
about the system and the codebase.

For example: In my case -> on an S905X4 platform (even better if you
precise the platform here). Thx.

>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
