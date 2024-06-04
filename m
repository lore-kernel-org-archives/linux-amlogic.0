Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F2C7C25B78
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 09:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IdSUcAY6cCGnOy/8h0F7b6PIOgDXl6n6ilKdFe0emM=; b=FpcoZbKXVYzXh8
	EmuCAdcbFCKnAn8N2KPt+a41CIB3Iuaw8mLb8ypcfCdTO4jAbDIuId8BS8P9+q4KfdrozWLkCwuJ0
	XbXrf4P2ImNoYrLS/wGsnvstGGhrHY7MsnfIw9SwnRoZshd4vwszHZ01O5Yt8TYVb+/0yXo5oeCV3
	h2r/HQhfviEm1kADEpsyX+YAuFBnENYizLL2NoGNcsQJ/el7la4cRvMQ8eTZvonhRpuY6em2uebBX
	2mVvFi+kQnwSboosJm0U7Rcmi7GDx/KEBXmPwSfvNXCdp5cu/rsTJ7pttEnVG+d/MH4OMnbGh/rTs
	U3V5r2IQuGT6na6JYMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEQsh-00000001vhn-2PkK;
	Tue, 04 Jun 2024 09:55:03 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEQsc-00000001vgV-1zaq
	for linux-amlogic@lists.infradead.org;
	Tue, 04 Jun 2024 09:55:01 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-42148c0cb1aso7970945e9.3
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Jun 2024 02:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1717494894; x=1718099694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eqG33BTlDFY1JTtCCY4mtc8hNwHOOmvwm9Q2v4L26W0=;
        b=s0ENRH5ZnGYy0rzO4v7TT1oQD8+3hcAsvpOiSTrRKMkIP7MrMyaMo3vYnaYXrjFWD2
         dwBHR6JUvDsSr/zAxzIkMTL11a4yXROEAFRqQSRov5ZAzucOzEH1Zk5gvtk6GVwkxBy9
         z60drtPHvs5ylU0F7ErafmBvJhko1CztHsLzDDaz1cewHro9khgDi13e8UxIAZcOlXoP
         AS3yP2D4TgIxwMa8HDfvg3TDDVkxULewV6FmH4cB4rO3BCqXPaHCfoHwzWb2t4RzEE5h
         uPRvwm4Q/k8OL1DShSlRaqoZODtD4+1fGNWwkgVgEASO+w5K+P0Crmls0VhNwjU3o+/I
         MT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717494894; x=1718099694;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eqG33BTlDFY1JTtCCY4mtc8hNwHOOmvwm9Q2v4L26W0=;
        b=FdhMKpn5PUJi5gGxjyWIv9d9N4UbDO7UF7DGdqraQ7Hf9fexrDfN2x3kGPePEJPUfe
         jk9ZUx3zT+KWz8zFPCcK+B3bIbl/760y7EmFmNjGZiQoU3WHMzMJJhXumnXLbrMnU7eI
         BwipqPJo32oHiqQPrl7pUBx4FxNmwtjaFMFcfGyq5FiRzO6nAS4N5bFRpQYM8fWByOz7
         rOVk0kQbNW0zYhiFYRgbpljzqlxukAZdRReU8oM1J3CVMgfiE4K4zwPJLjxhuBj1cZZP
         6A0abDUqeriHxegyh+sgNW+g5HsurYtZzDujO0E0gvLyXfqizeZ8hunK5Z9qq/jUvUKq
         Teyw==
X-Gm-Message-State: AOJu0Yw2N6sZjjiMm4oX1pwkkQFSmJJtfErCYHgaqXhLp/8lXavL5RUA
	aQdZVZJj7mmluNoRNoLFshZLDbh0nGoOhAP/FXjFbX5yYZXkbNouvWXy8phMTcDydH5KO8g+31D
	M
X-Google-Smtp-Source: AGHT+IFuWoB4BQKHWujuBNN/tLqUteBjiY6L1E/xsaU6QhnEcgVTXAv++hch3aOpdGEUYNU8pLbWlw==
X-Received: by 2002:a05:600c:46cb:b0:41a:a521:9699 with SMTP id 5b1f17b1804b1-4212e045342mr108000555e9.4.1717494894440;
        Tue, 04 Jun 2024 02:54:54 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:60ea:fe6c:6bbc:4888])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4212f9b9ef1sm136678955e9.9.2024.06.04.02.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:54:53 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v9 0/5] Add C3 SoC PLLs and Peripheral clock
Date: Tue,  4 Jun 2024 11:53:49 +0200
Message-ID: <171749479841.590656.11363124184470308378.b4-ty@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522082727.3029656-1-xianwei.zhao@amlogic.com>
References: <20240522082727.3029656-1-xianwei.zhao@amlogic.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_025458_838174_18F92F6C 
X-CRM114-Status: UNSURE (   6.16  )
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

Applied to clk-meson (v6.11/drivers), thanks!

[1/5] dt-bindings: clock: add Amlogic C3 PLL clock controller
      https://github.com/BayLibre/clk-meson/commit/0e6be855a96d
[2/5] dt-bindings: clock: add Amlogic C3 SCMI clock controller support
      https://github.com/BayLibre/clk-meson/commit/d309989a0a0a
[3/5] dt-bindings: clock: add Amlogic C3 peripherals clock controller
      https://github.com/BayLibre/clk-meson/commit/fc1c7f941c71
[4/5] clk: meson: c3: add support for the C3 SoC PLL clock
      https://github.com/BayLibre/clk-meson/commit/8a9a129dc565
[5/5] clk: meson: c3: add c3 clock peripherals controller driver
      https://github.com/BayLibre/clk-meson/commit/f06ac3ed04e8

Best regards,
--
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
