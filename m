Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F0DC001DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U2QsuAf4P15wRw2/DKmuMi0TQ4zSx0gFwJgw41lIciI=; b=sWJpJxQ3FddISJ
	RLhAh3jwTayT6tOsx+lM7Sopq1MUmpkaOtYVf5Dpu7MLv+3APd/gNUvCq7WYrSCgz6dcsCZO5XOQM
	F13N0PxWS1UePZWH914ffCFyVqqWM9TT38z/D8a2IgDr8Gl+xTAhUoaG3knhsYJejQZ7K3SItKD3s
	zZUkk/gcmB3p5r5CfmmGaicq5QOU8AeUt/NHZMexXYBBz1vceg6PWDG+cSCrpNv2ydGpNnCskELMR
	94wMO0tZtndVcor3/GtKkAZQ+VDRATSHl9KqRu89rb4hhuUySdgJSl0XJkWmKWVaPTXcAXyJKobxO
	oSZegz/3rz21mQr//Kww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPVQ-00EpBu-0K;
	Mon, 31 Jul 2023 09:48:00 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPUa-00Eouq-1I
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:47:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3fbc244d307so47167625e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796825; x=1691401625;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NAl2fAmeLK7v8jeOjXAM9Im6T80pzlX2872jJ9ooxQg=;
        b=ddol+HfsOqAeoaUJW+6b1004uCV99ldu9gXwPlEqLzDDDzBr0jgA6y05HpRIjmQA84
         ypR7Tf1zF7E+8fTjXwucCOYQZkybryy2dHC18aZDgfiy06ygo1nK59QDGHTdttTvqkMQ
         rx64WsTpsFRy5SFlX2O78Dmi+KSCwKsjXy6jEaNUW0yh3257sORVWELFezeW0C5zKeOa
         CLR8YQDYMbkfYQ2J12d0BhhS2E0uO2168SR2TP0QBq8dS/yAma+YaWj1+Mt0mBo6qimq
         kDtLRheC+kTguXNFoypuG47A69tI7mK2hiVrtnJ0OG0+rRVoNshYtIwyqXp3UZB9OGOh
         UffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796825; x=1691401625;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NAl2fAmeLK7v8jeOjXAM9Im6T80pzlX2872jJ9ooxQg=;
        b=EqTGAszaaYAyH3UWBGxdFfamymn7dXtj3ZRYQZ2svIXAFaX/W96PrPsxSSmi64KHfC
         lWTYdm7/HC7lgC4ZwpD36fRT9zNo8psx8PMmGs1vRHW9Yx2yKUIr1RVAV/n6HI4+6Bou
         eIAWrXDrXNm0dqWN+e8UmBbt4vmaZQgJrqDpWiUncGO2Wwd8MqHhLOucw8azriwj5JuF
         vI5/xTlvs9SUzM2m+rpw8sQxe5rU4456216IuEKJ37aPAA1QAgZgAKegXAbWvA20Aybn
         qjAyAjPPG6RAyVbsf5o6ViFTZVteq2FarDPkgUOci2UzUOr5hMGM9RuGFLQDXun+KQeB
         Rl6g==
X-Gm-Message-State: ABy/qLbVXvECiEUjKXbspaDYAbYgpGpW7iJ/MDsr4v3jZ0nOYhCLLhpJ
	79z+HZ0XBcokNPS/80xL8pOpCQ==
X-Google-Smtp-Source: APBJJlHg2vtNWlg6yP5U99HmeGF+jcWS21EQ/z4CZR4xWJgc03pK6mCEBXO+hfddwRa9kvtHMGMRRg==
X-Received: by 2002:a1c:ed02:0:b0:3fa:8c68:4aba with SMTP id l2-20020a1ced02000000b003fa8c684abamr7857704wmh.25.1690796824720;
        Mon, 31 Jul 2023 02:47:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d48c9000000b0031433443265sm12556878wrs.53.2023.07.31.02.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:47:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230725142703.157547-1-krzysztof.kozlowski@linaro.org>
References: <20230725142703.157547-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: meson-g12b-bananapi: switch to
 enable-gpios
Message-Id: <169079682340.186625.9070463566453438311.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 11:47:03 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024708_497958_2E7EEBF0 
X-CRM114-Status: GOOD (  11.38  )
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

On Tue, 25 Jul 2023 16:27:03 +0200, Krzysztof Kozlowski wrote:
> The recommended name for enable GPIOs property in regulator-gpio is
> enable-gpios.  This is also required by bindings:
> 
>   meson-g12b-bananapi-cm4-cm4io.dtb: regulator-vddio-c: Unevaluated properties are not allowed ('enable-gpio' was unexpected)
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/arm64-dt)

[1/1] arm64: dts: amlogic: meson-g12b-bananapi: switch to enable-gpios
      https://git.kernel.org/amlogic/c/01457f6fd40b45b6dd394c75317da812bf585a97

These changes has been applied on the intermediate git tree [1].

The v6.6/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
