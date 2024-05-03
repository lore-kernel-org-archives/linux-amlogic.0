Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88AFEC4345F
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 May 2024 13:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDjrOEgBs9asd5gxQdGU/nR9Vkx2edEI3II/OPUeEEw=; b=kCVcZYl7y2K5V4
	HTBhJmR+hyWq27DO/47kir36EyrF9NV412NDBHWbncbrhYOs1tk9+ENsZ9z4mYZ2sCa7EQanpmSh2
	Dd1wwKXMfC2eq60o1s8jQFiipteqmdDAImF+ekUURxBuivQ9k3s2UUKumpB8zivNGgnljEyczIKUd
	N6QG5QPLI67XRAWDJhrK7gy1b6ixMDN2XJJVZoBjhILoMQQfpcRgJDs2EClN5Weep2xKYv3XUXD9z
	ZWuzAN0cduxld7ObtytibgcqYej7oTBMG9Hi90BHWkdRxUzcsoUw4ZUbslNVcw3Bi55LBmF1C3bh/
	3w5kcCqMsGfv0dxIFh4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ss3-0000000GeJU-0MNw;
	Fri, 03 May 2024 13:22:39 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2srz-0000000GeIK-2uCK
	for linux-amlogic@lists.infradead.org;
	Fri, 03 May 2024 13:22:38 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-41a1d88723bso65065195e9.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 May 2024 06:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714742554; x=1715347354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kit1TBFVgyt1sxkCYLtPtBHsm3h3unJNtgT/eeVBYto=;
        b=YuJXeZSh0C/PILWzUJ8vC/orFaJid4mfxrZJFM0fdTYGtxwoVE/ZqubO14pY1B6s8a
         BNoAsMdopS1pTczS0jrcZren1mXbPjFrYrGKi7PBSZHYsVzsg3cEdreGN4CNvNEQERva
         hjWeu7I3NPXpjVbX/oq0gJ+xXwmESTRh1Cw+2GQphju679fMtqFeTFt8B+aBRcWFuWpc
         o7vgUYYFmFCzPr4hRVYHP/pdROTxUU1pMHnZfXZo2DGEEVUAtNVmcF6daS1tmxyaxreb
         dqVWyrHKCuICzebTZZuJnkDQyb22F63mCM7B2Vf7uCF5A6bIyamnreT7uLYmtJFjlCuU
         +XVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714742554; x=1715347354;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kit1TBFVgyt1sxkCYLtPtBHsm3h3unJNtgT/eeVBYto=;
        b=L2jfxDktBJ3753kzwUdgCnZUwCzdCEmM93klhZPmPPaMDF9zFTMxtamOX0z3iWjcd/
         PrSCpggNxbD31tLNS+NeFLc7oExPZYcAhQ501KKp0sP0NWUHs1ohOkf0M39lMjNSImhx
         mTaRdi3guQ5hjFcV4feNNU8VfYsfBkRaR2v6lNZUle2k2fKRsVHs0ijNh9RitlO1dUHT
         GKfjLr+8p+8Xv9CiANjU1K/lT9xYpq8wYu1ILo3gyiV1i1NgMLJN/HNP0hFgj3Cyq/mb
         lfN9ze9a9OyTfOi70WQZi4VSGuhoJDGRoDIwHL/ueZneAjStFVBpdo/jCOxFftE+bgmr
         Za1w==
X-Forwarded-Encrypted: i=1; AJvYcCXQXQG4y4BqGz07CjKztfYsBH6Osx65nBRo1HeSsKT7qug2dfPSg5L0bRI72IVvpVATZa+GdtJuoTPvLTfbTOJxDjuCkEHKXsx5lRgkkwZCJJk=
X-Gm-Message-State: AOJu0YwJTPpTkBlEgVR68+2t5k/0qiyIwa6K1YxdYyh8jhqxfsAKfQkb
	+rjDApmMe3632G8TRc9IOKCauqXlWzUEaghF1acAdKdbznDsjgk1EZhyaTMRagA=
X-Google-Smtp-Source: AGHT+IFMN7kbGVdBfJ7UT+4XcxNE33ol941/vCrMnxSahE6k9NpvMQZvsFEr8R/ZH3PzSShRqGZkew==
X-Received: by 2002:a05:600c:4e8a:b0:419:f088:249c with SMTP id f10-20020a05600c4e8a00b00419f088249cmr2174709wmq.12.1714742553772;
        Fri, 03 May 2024 06:22:33 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:1b85:e590:355b:9957])
        by smtp.googlemail.com with ESMTPSA id g21-20020adfa495000000b003437a76565asm3803713wrb.25.2024.05.03.06.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 06:22:33 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20240410155406.224128-1-krzk@kernel.org>
References: <20240410155406.224128-1-krzk@kernel.org>
Subject: Re: [PATCH] clk: meson: s4: fix module autoloading
Message-Id: <171474255291.1335139.15327121235218632635.b4-ty@baylibre.com>
Date: Fri, 03 May 2024 15:22:32 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_062236_116068_4A77D83F 
X-CRM114-Status: UNSURE (   3.60  )
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

Applied to clk-meson (v6.10/drivers), thanks!

[1/1] clk: meson: s4: fix module autoloading
      https://github.com/BayLibre/clk-meson/commit/11981485e27c

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
