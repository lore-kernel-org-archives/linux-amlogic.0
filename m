Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F05C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gTCgQ1DiTeju85G4LfKR36FXLCE4wqBmbzZo19pfMAM=; b=cndbGDn8G5EX6m
	0ZNOZ/TH3I2zZjqYrUywbt5IvEjNYoMiiYxLJf2Hzsv7DFARgh8BuFn1Xve7wiTxr1wUJTrUhW4cw
	tubuQwO8pt2HHhvWl1Ip+9fRzALpLvfpQl4Y8dZfaSbxJeiWpFF4s/1T0zQIBtK1dyH0WFHvR1YDN
	oPQkgiafZU4uGhpw3Bfv0AgM0JaNnDUaBc+zMNEcREcKMkNX9NzGZq6IDoJqiimtM+AZRDCVYbiDq
	ad32oEkx3ylROxFPQ39EhUAJ80VnZI3CFGT0t+HuEqARsweI1JHDAfRLeYP3yXX7VqlosQQc/cWIE
	6+/MopzV4GhJBg+mTiiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhWjX-00DWu8-C6; Thu, 21 Apr 2022 13:20:31 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhWjR-00DWtJ-97
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 13:20:29 +0000
Received: by mail-wr1-x433.google.com with SMTP id p18so6675844wru.5
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Apr 2022 06:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=L7wte0C06azsXefSq415hFdMstkFvM22zlQgYtWO+cg=;
 b=AUrm1OTMT57lP9zR2YWItlE0dKnSg1BLMtlMv1ZIO6HK4oVMoDaYuT5t6BsPlwh9+V
 IhQhXJEIW0V82HowORKopGxyxnx6JvyCHVcsvQ0s6zjok7JTNP3WHs8FDrJ6EUr82Eny
 EKGzPccZ9en9NO3GBZjvRdkfSdY5sT0dY0zjCZn/LAYReLKYL/yPUwc65C32kxZasxCu
 reMf3hLpNA2s5NvEg1GuxVUVZ1I/XwIyIwswk8704HGAWzhIU1OWlNP2ie0VC+dBClQf
 Frj64DKiDPV4LJ/EPfqvij6c31Bx2TgarJGtSo3JgjU8l1htTLxYx9hf6Huv6eGLSmvN
 Fg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=L7wte0C06azsXefSq415hFdMstkFvM22zlQgYtWO+cg=;
 b=7BV+tfPk5l9WzE4p0U8sxbp/2g0NpveBbm0akmueoGRuq7WPBI6kYsQujY67OGeiqu
 6RI5M+8lkNLpMcRtKwvaJFGBVjv8oqi1Ita5IGVSrC4ihsZnTzRaDIhSFAzEarJJuHXU
 NIram7974QQRfXVPQwEG7q8mm5nrjfW07Wh8FvL0M6dqeBGMxY8V+eAMe0Uv6fE5Ph6l
 OoR27Qa4+kp62jDvcMtG8Gy2i2+C89nBMWLRAc1ab8f1DxWP6MStIlbEiUGopxBecCdF
 r9Ezhxf29LPrqTHGesfX/Zj7oV5qFqH7kiJ798P6rGxUCNbD6Az41c4675w13DN6Ootb
 igTA==
X-Gm-Message-State: AOAM5304m8ZrE9zEdKs3a0HZQo/WlZrgvjKrIfu6J9dJaBMRCFbYt+93
 hRIoXoOvI32OZCyjTFGGr31RVA==
X-Google-Smtp-Source: ABdhPJyBQ2yedSfoh50dtsVWiG2Gzt8Qe2nzOPVRbqAMstR05XSh0xou3worT9lubhfTrl9HuWr5VQ==
X-Received: by 2002:a5d:4306:0:b0:207:9e49:a1d3 with SMTP id
 h6-20020a5d4306000000b002079e49a1d3mr20582394wrq.188.1650547221697; 
 Thu, 21 Apr 2022 06:20:21 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31]) by smtp.gmail.com with ESMTPSA id
 r21-20020a05600c35d500b0039295759a55sm2098677wmq.12.2022.04.21.06.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 06:20:20 -0700 (PDT)
References: <20220421123803.292063-1-broonie@kernel.org>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v1 0/3] ASoC: meson: Fix mixer-test issues
Date: Thu, 21 Apr 2022 15:02:54 +0200
In-reply-to: <20220421123803.292063-1-broonie@kernel.org>
Message-ID: <1j1qxqzi7g.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_062025_549707_C211553A 
X-CRM114-Status: GOOD (  17.25  )
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


On Thu 21 Apr 2022 at 13:38, Mark Brown <broonie@kernel.org> wrote:

> These patches fix event generation issues in the custom controls in the
> Meson drivers detected by mixer-test and by inspection once I saw the
> pattern in these drivers.

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Thx !

> I'm also seeing other failures due to these
> controls having invalid values, eg:
>
> # # AIU ACODEC SRC.0 value 3 more than item count 3
>
> but without documentation I'm not sure how to interpret/fix these -
> either the value should be fixed up on startup or there should be an
> extra value there (disconnected possibly?).

Value 3 is an I2S input from a block we don't support.
If we did support it, it would be an hostless DPCM BE to BE link
I'm not sure how I would represent this in ASoC TBH :/

At the time, I thought it would be easier (for the users) to leave this
value out and not give the false impression that the path was somehow
supported.

I did not realize it was the reset value nor that it would be a problem.

I can add a element to the enum if you think it is better have it
regardless of the actual path support. What do you think ?

>
> Mark Brown (3):
>   ASoC: meson: Fix event generation for AUI ACODEC mux
>   ASoC: meson: Fix event generation for AUI CODEC mux
>   ASoC: meson: Fix event generation for G12A tohdmi mux
>
>  sound/soc/meson/aiu-acodec-ctrl.c | 2 +-
>  sound/soc/meson/aiu-codec-ctrl.c  | 2 +-
>  sound/soc/meson/g12a-tohdmitx.c   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
>
> base-commit: 3123109284176b1532874591f7c81f3837bbdc17


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
