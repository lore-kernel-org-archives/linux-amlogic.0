Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE51D59D99
	for <linux-amlogic@archiver.kernel.org>; Mon, 15 Dec 2025 10:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qxuffqNWodq73hIt6UT5Jpy/GdsYG/eQb5dAbxPfUoM=; b=bRDITIG97IAdU/
	oXC5+A3tgyRhHnQ5uIPMTiYEA0KHofezQLU9mXKwWNo+npY77tpE03VnDaXplGEo4meZQyTpfyEuu
	5+xsl6XCvZlQDm7yjboeJlmFyzg0lkexSddDl4ClMUbfZE5KO0UwSaiCI//3sqY+DRrDCDdu2bXUs
	/aX/5T095FuVHcJzNtMsiuyNYnF721cinSV1B1F5qZRnHsbUyp9w2Z9BSV1yB4XEl6vwGGS7oHXiE
	iLIL+3Vq+bEthmeMd5Apqrg4zl/NWZOSthXI1lF5oCBaBvX56TU6jX6pNzmqYTa4DPPb85o8+W2j3
	vYUGJl2vPwK3MSeFD0WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6Aa-00000003Tmn-3J5G;
	Mon, 15 Dec 2025 10:51:12 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV6AW-00000003TlL-2OIf
	for linux-amlogic@lists.infradead.org;
	Mon, 15 Dec 2025 10:51:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-42fbab737f5so1384922f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 15 Dec 2025 02:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765795866; x=1766400666; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiAf1pob1P9A2hs+uuZimsbQclhxUB5vv2ZHT7m9wRk=;
        b=iuGFhm4HldWlFDqEi+YqvNY1RNCfBTdK7GaBLTtU3s2E5AsW7S72riWeMDeV4MSS44
         Ow78g764iE2pIvJTrWDtzCPoQn+MCqL+k5o55IgP8lMT//lTxqdK+fp26JVfqB+rpiPH
         lZQ8AtuCx0kS96fAiWzRW0wqIOugoc9GGHPQo+7zc2jLYNxulusQBlp/DPpLFx2W9d4U
         TGPUSZiJqobsMxHAwTa9b91jZ4LPcc7vRu7TW9/SSqSE+gwjriWzqNlg1GvtXUr1gdQ9
         JZI3TyqtVjdW7rSoQrSKDCfxixudDllP4wRAKHqQ45erl9A4iu4g+BMyNgiHzOnyDtNC
         xjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765795866; x=1766400666;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OiAf1pob1P9A2hs+uuZimsbQclhxUB5vv2ZHT7m9wRk=;
        b=F7EYjO6ap6GegUVyABT1nZvNr3WPUOCGExluSu1ta3MA8bhyxGuWJNpPXvALEpvVhL
         GFdMSHrSsMv1tT66PqnxqEdB+oRl5xh+3nnLQojqKsY9ZPe5RGQw20n9gs3kO1XJGpZ/
         pk5jKs8Q0up7sWbQ3aQKGl54Y+QQfmU6eXPtmOA3r6bzQ6bfJ5uE4K293vYyyfnPgiyZ
         5ldHnEgBuD4WbSC+EfnLef4zqrMkZeWNnq/90VaWT9JkM+RtPnWQf8gTyFVCshhfvlI3
         XrP97hhuSwcOlDCJ7W5qqfYwjVePdaHjjLg5aW8Yt6hSLXdhNPWD/OstjbW8V3huED8+
         Halg==
X-Forwarded-Encrypted: i=1; AJvYcCW5jsDMhSArtQPA7PQP/qKP0p/autkOCXGokFmErGtwMRmEImeL0IDuQzEEeSgVqGKrujkTmueJ76Su0BdV@lists.infradead.org
X-Gm-Message-State: AOJu0YxCvmTFGXoJpaEeXtAgvu4Z56zLoDiSNetXUYzvxlX+o3aejSCB
	yYxPoGA4+eskeaQfb1I8QW7rAkCoZUUoEsZ/OlUu3iSKHQc9AyqCCK7TSOoYkKWEbcQ=
X-Gm-Gg: AY/fxX6SSbDuUPwQRQeBnGDZ9G4jKeIJxqp/G7zGwvrQiuFzvOetPzc/Bci/7PpC9Xr
	bdBBSOUVfJyfXJjeEkyG53YLbUDh2h8ZO7dYIPn0eLkGQ7wCNh2A7d8yGgwnwRqcUG2Zn5iZcV6
	0u2UC8DWMwjvCrO7Pk2Hg060bsLzAcaljy2/b8DysJc/+jBEKuyriEegz4cLCTyk+PHNxYq0xDq
	LKW9tAd8nkbjOxN8cByFP/XR3PW8U/zZUjJslPUCjy4NExp+F3TPnOndOrOV1Aci32zBZIUPuXF
	IfoYhMWhSUh2N6h4igh75NJf9G0CYZHzb/BbO59uxrCbaI9iMyc33b78YfaMqSpZu7xbjBTwQYu
	TWeOceiVxiJ1IjTHejEdMGLnc68Xh4fyqwrKl9JJTHtvOIXeGY4Nxv8OzoFmKPfpFgc1QHK0Xsl
	d91mL/JL86YGjjZ7RyWKNxThRe
X-Google-Smtp-Source: AGHT+IEUCXZDYdW1Yaezuo8T8dArAq/O2/s2YiIYeQnjgQdgpxFuf1BEC+kk0V2dJ19iC+eLEyxuDQ==
X-Received: by 2002:a05:6000:26cf:b0:425:82b4:a099 with SMTP id ffacd0b85a97d-42fab1f9f67mr16105347f8f.0.1765795866090;
        Mon, 15 Dec 2025 02:51:06 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:3f77:1837:bfee:f255])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-430fb078e56sm7695439f8f.21.2025.12.15.02.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 02:51:05 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
In-Reply-To: <20251212022619.3072132-1-jian.hu@amlogic.com>
References: <20251212022619.3072132-1-jian.hu@amlogic.com>
Subject: Re: [PATCH v7 0/5] add support for T7 family clock controller
Message-Id: <176579586493.1510096.5256519771615298068.b4-ty@baylibre.com>
Date: Mon, 15 Dec 2025 11:51:04 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_025108_892163_54E3631F 
X-CRM114-Status: UNSURE (   4.41  )
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

[1/5] dt-bindings: clock: add Amlogic T7 PLL clock controller
      https://github.com/BayLibre/clk-meson/commit/5437753728ac
[2/5] dt-bindings: clock: add Amlogic T7 SCMI clock controller
      https://github.com/BayLibre/clk-meson/commit/f5d473e96fe0
[3/5] dt-bindings: clock: add Amlogic T7 peripherals clock controller
      https://github.com/BayLibre/clk-meson/commit/b4156204e0f5
[4/5] clk: meson: t7: add support for the T7 SoC PLL clock
      https://github.com/BayLibre/clk-meson/commit/140f074c3127
[5/5] clk: meson: t7: add t7 clock peripherals controller driver
      https://github.com/BayLibre/clk-meson/commit/fab4d651b592

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
