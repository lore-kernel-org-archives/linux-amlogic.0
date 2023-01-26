Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99853C54E94
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 08:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EvI5EfqLS3huSxVwmitBPZSaJhy8/YowtUbl6Tz42IA=; b=chyxYiAelmtxA7
	oTvaN/SX/isJ0i/ji0yirCML55mvJK6yqfGqD0FutChnpgo6+0JmOl3Y4Ugunt0CktUCTm4NwqEcV
	hbncMCakW2QPGTL+78dFgQZfzZR99jL+MUXjbF2Qdn21WHHmrIfETeIryQv/080KfGQLZ48G9517X
	4Q2SFPe+bpIxeetwxpl7YxkY0CVEutNnZIVwR+betMf+G9AMi8wvAlzGqtFkZ45LXZU+8LpteCg8l
	i2IpWiLFB/O8kOg+0uzlejI38PNbVAy+8xzkZTDSlKgLsY8bWK0AKXz6yY1Q+YXS2MdV2BT7DThFC
	0IAWW/XgkoK/bWkdwXRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxoj-00A32h-R7; Thu, 26 Jan 2023 08:41:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxht-009znk-HU
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 08:34:08 +0000
Received: by mail-wm1-x336.google.com with SMTP id fl24so617781wmb.1
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 00:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wy4JH/8Y4BIAqhpj+kNbuq2a/U7ZJXTkwi3YphKX6wA=;
        b=zlsDK5voMRPUM4nKKt8QdmuD/57HzrklVqIviWeVdmAUDSQHHG9qHKk6moGlFoJSU+
         W3mNtyLXv/QFP3lq2iEDvU9aN6z39Y5Zz897R3RctRM0tSX2AUgj1APgIFfO2bKt9ut5
         K59U68pcfApeOVdflYbF7J/W0eBWiRh2e0WWuOWDyc5dMaGu0Dd3zkruR/Ou/c/PuZoJ
         OdSLzHfPtqrEJQCU5W2x4meDJjm8wsxRp7FudyzwrY/4wS4ZoW8M5WDJ1MzPQet8vPT9
         /2FKWXPwkDb2N3vLIce6gzppJPYKl6svm92TSv0p3c/5kLv4TZYY8YdNgdd8Km+BeFFe
         +z7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wy4JH/8Y4BIAqhpj+kNbuq2a/U7ZJXTkwi3YphKX6wA=;
        b=Fj1A+vA1yK/MJNfnpwIiHFqspzE6cYB5ElFh1MH4pJtiuyqaHCluA0nNRUh3n8q+I0
         Vk3t2xOV97FuYGh03N09tHVWIGq4CzuzokX7Sncph90HdjS/ppEyjSMllntpajyqeJu/
         MV0F4zgNkPaH8xq4+SOdCELDjsrJLTcpzzr3pTteK3nJNfAOOHyKmQCcM9cSnvSq4jOK
         1Y4U/N+JkXPWTGO79jzkC8dHi2gWVaQI8uAtuaZW6UOETeGZoHWqE3W0lEcO8RxH3uHD
         UDs+hUpVobe8DdEMTR6TIzozcvgUuTQBfHpAo0fY+4agdpLtDeH4fvkjXYyyNtoV/s7c
         KzOQ==
X-Gm-Message-State: AFqh2kqv3QcHinGxqwnYa8DpSBdoDsdJwXbe39T3EYxyFF/6+qcAkPR0
	WIq+4ONYLNL4ATZOL/n/7bOMZRLjsLHqYPxfARg=
X-Google-Smtp-Source: AMrXdXvspuhNLwRUh/Je30Th3z3ZFJPNoD133B5ZmcSE3V09vHaqsUnF+CdOZNBK74w+4MfPzJhCgw==
X-Received: by 2002:a05:600c:3556:b0:3db:331b:bd2d with SMTP id i22-20020a05600c355600b003db331bbd2dmr23729081wmq.18.1674722043741;
        Thu, 26 Jan 2023 00:34:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c328a00b003d9a86a13bfsm757709wmp.28.2023.01.26.00.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 00:34:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Dongjin Kim <tobetter@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122-topic-odroid-n2l-upstream-initial-v2-0-8d3fea6d403d@linaro.org>
References: <20230122-topic-odroid-n2l-upstream-initial-v2-0-8d3fea6d403d@linaro.org>
Subject: Re: [PATCH v2 0/3] arm64: meson-g12b: add initial support for
 Odroid-N2L
Message-Id: <167472204279.456104.140123192066740782.b4-ty@linaro.org>
Date: Thu, 26 Jan 2023 09:34:02 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_003405_686212_527ED6D5 
X-CRM114-Status: GOOD (  15.08  )
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

Hi,

On Wed, 25 Jan 2023 09:18:36 +0100, Neil Armstrong wrote:
> ODROID-N2L is a variant SBC in small form factor and some peripherals
> are removed from ODROID-N2PLUS based on S922X SoC.
> 
> - On-board ethernet is removed
> - On-board RTC is removed
> - USB 3.0 hub is removed, so one USB 2.0 and one USB 3.0 host ports
> are available
> - Huge heatsink is replaced with 40x40mm heatsink, 5V active heatsink
> is recommended or a tall passive sink is optional
> - 3.5mm earjack is removed
> - IR remote receiver is removed
> - MIPI DSI port is added
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/3] dt-bindings: arm: amlogic: document Odroid-N2L
      https://git.kernel.org/amlogic/c/8280a4ea1d7dd1d635c1ecdb9375b156e83358b9
[2/3] arm64: dts: meson-g12b: move common node into new odroid.dtsi
      https://git.kernel.org/amlogic/c/379ae64609c7a3301b60483eb65bd8bc78f76328
[3/3] arm64: dts: meson-g12b-odroid: Add initial support for Hardkernel ODROID-N2L
      https://git.kernel.org/amlogic/c/f1193c5c09b1bb6e214c804c7dd1c7fb07046631

These changes has been applied on the intermediate git tree [1].

The v6.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
