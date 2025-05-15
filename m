Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5CBC2D0CD
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 May 2025 13:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QL11GvBuZX2FwY9IhpbJRML1nnyjyPAbzE2W9WTe0pM=; b=r5TAEcc0MEBagD
	eZb9WPkxgPEERaUENgp+rp1KmG7Le35EvWdkKvvB6TdFycAtuLRNhy4ZUW1UGyj9+55s0YIaDyw0e
	0Pa9xhqcT1qXIWmKqILNznAUMtz2pmsqYfQfD4oBSJKW6up8HNzhez1UyStvpHaXu4w5iG20Drm3q
	gaeacHfSpBvtJ7mjoSFDA6Gl4gxJQDw5+YN1dG7JIdpbV+HH7Hq3GbK7rT0FNcLVTcG+9CI7QCrdq
	4SDVanbt5Fp4nRlowLgLNQYTwU6VMsYLo8SACr+s7dhPJBRyRfP4N3jZwGG29zt3dL/hwe2r9vj+U
	w8EkvEDY0jAb3S3LfDXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYJX-00000000g7n-2b4g;
	Thu, 15 May 2025 13:07:55 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYB9-00000000ek6-0DQT
	for linux-amlogic@lists.infradead.org;
	Thu, 15 May 2025 12:59:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso8563585e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 15 May 2025 05:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747313954; x=1747918754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=gnzYfAw2Q5Ft8eOQx7Ti8qgwOtJI/fYyd0X2C4214uSit838HV7Xl9MRgXyG5atKZw
         K5iBj2K/d62xiCpdD2+1yubQTQTTWOsyqoCRC7ZeiE/uFwG/HqlRJlBlGs0g/NNztgYR
         nB2pOXLuz8viniok9wTP3gobxTomMHFVH7uyhVc46yQZMs1Ia6d7FVsiV5y0hTjz8D3m
         mSGnf9FBfx+3UG5PZa8IVtSZHJydlrJRYE1vPKD03rUGrfL9BaxWf3BDqhNV1mbGqlmW
         M+sIvzGMC0G3FhvQwcof5iPlzxknT7b8JcocLr9fVRecbHG+uO5FkVPmV+rmzMvXtuqT
         8xcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747313954; x=1747918754;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Qawhlvmv36yrM5PLXHrynEKEEyc5YE0PdfccMvrE2Y=;
        b=Vu9CooYbCc5ISDFWJ4BM0R2aqUzVweicyfEXHQmu51QGRH8RwbI7Jd3AaqD7DHAcpk
         pYog88RAhxGj+m473aVwTSv3e+55/WTtRdw5p3nUXOgEqJz0bRu1tPFohn6xxu8OrI4I
         vgvioFLu1AdBqX/8/0tmxSxIdY276sqJ0jzog+LI8jeD4T/pmZ8oz7BuJnI4Pe08HrUQ
         jUA0zQMSXKzVYhQsLfwWW6CJUgnov9yXdVUXVF6tE8tbXSJOOxpN5l8S6FS5QLmQRZVr
         ANMtPgsa1bEzwePJsb5Xui29DOUrxRn8yq49R9Ht/BuXKvTkp2Uo+6h0itzloj1EI1il
         9ykw==
X-Gm-Message-State: AOJu0Yx9o7vwelbS9scZUBY9W7xOPTBgFs85f3AqEe5t4sbok26bmQ/O
	JdAuwdZi0r+pSCmoV+WYojTlmxWx1xZvYwLu5SN3Swk95ppw2ONbnhynpAvW5v0=
X-Gm-Gg: ASbGncs1jYhgPoLXAGYZrlZJzJlhvkNtZ3ca9I/18lVxsIWK5lNa83JPT3U2Hd7qSxN
	X3+7eBcpuI06xl+NbSMzcJx70aMNbytN43Vcfobj8iN7dTKa7DpOSqe9tksAUcgLduZyIPpIECJ
	DoaA2F7cAO0M81fH2Uyt5NpgqLbh7KzLbx+JSWjLcn1OKq06jd0xmrrkaX/HFYbxGQHE1JOZo8E
	LckYFMFpk2HS9uXUKuakhRErObjbzp23XrFi7lKTlQVhHBz7Mruv98uRmSYg6RAc+Id0o19aIQ6
	+FejibsDbQNWgBDJCgo3vyeTfmsYiBkQiGTwC5gieTT1eczaYz8pa57UzB10PFKVOg==
X-Google-Smtp-Source: AGHT+IFyeqD0A0IScg3QZihC1XrEVTucJipRcuMxEvf1pQxV8DR8pNFyFAx+gn85sF514EVzZ/V3/Q==
X-Received: by 2002:a05:600c:3554:b0:442:e109:3032 with SMTP id 5b1f17b1804b1-442f970a9bfmr25956895e9.24.1747313953125;
        Thu, 15 May 2025 05:59:13 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:82b8:c32f:4d8c:199e])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-442f39e8578sm71180475e9.29.2025.05.15.05.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 05:59:12 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev
In-Reply-To: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org>
Subject: Re: (subset) [PATCH 0/5] clk: Do not enable by default during
 compile testing
Message-Id: <174731395227.3761659.8617180462546520115.b4-ty@baylibre.com>
Date: Thu, 15 May 2025 14:59:12 +0200
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_055915_105683_5E7DF2AD 
X-CRM114-Status: UNSURE (   3.92  )
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

[1/5] clk: meson: Do not enable by default during compile testing
      https://github.com/BayLibre/clk-meson/commit/0afce85ed26c

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
