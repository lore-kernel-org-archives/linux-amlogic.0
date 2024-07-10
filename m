Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F964C3DA42
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Jul 2024 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nzlJckRYCNEV82iT63WdJkssjmo9pmLtGdO9wx59dfM=; b=yyMlBuSaHzz8RR
	F26gZHxHJYYZdadI0QBAZ9b2jpzXzjcmP8CjXU1hZO++v3P3CdvZgIoPjDTkgjYH0higNbGdUkVO6
	lnWj+Jctyp7PWSAFvutHoZQ7azM7N5SYF4DAS0e2c3kbukrSmu6KMbcvEdZig+0/qzYkIv0qXWt4W
	MHUhw0QGNtD9VJ7nYBQsT4NYJede1ftrn+iY/yJi03hJASU65ug8PJE3HA1XhoVIMA0c6wbfaNC40
	6L8/cUX2YGM2zvAhOapY8IxMGt93Zj/7HXe8RKSiAwBO0rTdOPonBppEMRWCM8GTf8XRExUAfqjeA
	bf3sdbEkROigEmtOXe0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWdO-0000000AWO9-3a36;
	Wed, 10 Jul 2024 12:41:22 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRWd7-0000000AWHa-0YKy
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Jul 2024 12:41:07 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-426526d30aaso35442605e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Jul 2024 05:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720615263; x=1721220063; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQLVDFNoFuKRZg7eJdxMfqN4N8nKsyXTgSDfnf3uLGM=;
        b=CkmN/lR0LFd62Az2AgFmxrWg/cmSGPhNoHGrbUnqHptqp2EvRJJGGk7dayH0Kx48/A
         ec+b8zzUrVNoo6gllJc/vuGrbHSBZDmYgpwCEVQbNiJYNcON6k4vUPrWPDMEEOjnh9qU
         BTQaGMOwaJjgS7blTp0a/YKV7PZoypy0zCuz9kPCIXisTzfMCGLKPHho0/iLoshC7gZF
         HA82hUIMuRgrL/rRJV6A5ylriAACKw8oD8f6XssSLH4+KhJ4VDMJB1rI4tZNvzCLlRNT
         305mgrqYJFdYjPtvSiEwYGLIwyupOqeDpDZ/HKwYG54GgKYzILZzS00noN9T+SgRRkQh
         xnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720615263; x=1721220063;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MQLVDFNoFuKRZg7eJdxMfqN4N8nKsyXTgSDfnf3uLGM=;
        b=p8rXuRw5qbx+IXtFIaPvj3jdV5zVyIk3c7drNaGJXCbj3C5lPRWsu4zSHrxrvkfPnE
         Z7b2CfbargqyfAUC+VwawfMfIKt7i9bcgyzJJa5EPwjVppmvXqSwfIi3NeWznbm4/6gL
         HjNWvKJl0zsbHUMsJ/kOO8gZgZoFi2Zu0umeI6wtnhb43bh3emLEhlabasTOytyLYbIk
         GOhBGu4dtBm5ghQXFAMa4MEjnknijjP3AuEO0kBeoKGZOaYW6HmX0I9vMtHo9xJhzocx
         SyMja08dBiIKHLoHlIFWJYtZ3/9pf9Gd0tPXhs8pQCZ7Vvj70QdvLjHv/GaWzHlKN9HY
         lSuQ==
X-Gm-Message-State: AOJu0Ywb6dIPJt3YUg7t1CMyi2WcJ8zE6xeBw6tLJTedmWJ0EOVUhtSe
	Hlkn0VfCH1tXNNP9IdUW7y+CGTMv6dAfiYYSuGK6ZoQx8l2Qeian810+lAUgYY0=
X-Google-Smtp-Source: AGHT+IGT5ilXJSn/KNzsrB9+RCqhsbkJiqU3dqpEBIzoFB+Fcmer/Kih8Fhroy2GBRX27ac1gAp6gw==
X-Received: by 2002:a05:600c:6c51:b0:426:51e8:5192 with SMTP id 5b1f17b1804b1-426709fac0bmr30666695e9.41.1720615262749;
        Wed, 10 Jul 2024 05:41:02 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:f3cc:df72:f495:3b49])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-367cde890f6sm5214025f8f.53.2024.07.10.05.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 05:41:02 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Bjorn Andersson <andersson@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Michal Simek <michal.simek@amd.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
References: <20240703-clk-const-regmap-v1-0-7d15a0671d6f@gmail.com>
Subject: Re: (subset) [PATCH 00/10] clk: constify struct regmap_config
Message-Id: <172061526145.2117005.2499091095196670705.b4-ty@baylibre.com>
Date: Wed, 10 Jul 2024 14:41:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_054105_325879_ACE0EFE6 
X-CRM114-Status: UNSURE (   3.98  )
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

Applied to clk-meson (clk-meson-next), thanks!

[01/10] clk: meson: a1: peripherals: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/4a7665b885b6
[02/10] clk: meson: a1: pll: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/5c6ffe3537d5
[03/10] clk: meson: c3: peripherals: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/af3e4505e6bc
[04/10] clk: meson: c3: pll: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/11c7c1b94059
[05/10] clk: meson: s4: peripherals: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/02cc1df92d75
[06/10] clk: meson: s4: pll: Constify struct regmap_config
        https://github.com/BayLibre/clk-meson/commit/3d0e8b6edd6b

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
