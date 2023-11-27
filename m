Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7909C4167B
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Nov 2023 08:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p0ict16AjduMrpwNQ0ovNOYJnCNW2WErqJVjUUozASY=; b=W3FOGKq8m8t610
	pGir6oavLur+rlx2GdfQ+TyFNVj5YsR8rkL3iPH+8s+MbQD7CoYAqb1/vnJfiUO1XOb3/hpzQ+QYj
	aKtZ98EG0nUKDQTrdNCAcF+Hbs31NY3suGmtgHQvpQdFNEKaDG8ATsp7VbcrPICZDQtKD3N3K722n
	01QPYr0FyfG+iLiuWKVKGvnmHmaPyZhgU54Iwu871Opl97nEwpYqQciwgEgeaz0Wi/JO8f4t2DCRW
	CxD+TugnqWmufEwKOMYLa0O0HeI31EPhjhsB8JKSjlddOCre7fEZtpThotwmQA78GS51Yy62TOxpL
	uAlQIjvuFeb2gCgjG1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7WqD-001oa3-1P;
	Mon, 27 Nov 2023 08:19:41 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Wpc-001oNc-2Z
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Nov 2023 08:19:07 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2c875207626so47948251fa.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Nov 2023 00:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701073143; x=1701677943; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wu9Mk96O+s9apHEY/wkOo5PiW0m4TNq81XUGjVgZkHY=;
        b=nfxncbhWRSbWQ2a0k1YICvGyp0CIU0UmyOQwNe/oLXc00H84h7tM1Nnc0yDG4YSwf/
         X16DB8BIC/F5dSBrtq3d6p2Dr6HOxu4kDaqp6g6zJvFyicD+uYkEwTXWajEaBhqqioqE
         Fpbt0kiWESdPRtz8Jo5nykLideN14vV883basucxmfGQmGgl+yppxgnG21H8QTBFkkd9
         8+o8XNbHUvDSIrjY1vU8gsDjrk+LCVu7tQSzHEeW08UdlcDsr3o63pVPRD3BkBTpuS3J
         9Q385O66Sq0UZWPnR0YkcPwMECeEaHfDWFGnaS6OdZpkMhxV9mHtR3Xp2oVqYFNyfQGP
         DsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701073143; x=1701677943;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu9Mk96O+s9apHEY/wkOo5PiW0m4TNq81XUGjVgZkHY=;
        b=iN+OmfvS+pCm7PPu5Lg/OXUjV5B79vt6Rxyk9uj/yAE2oPQyjEEIdXCqKI08tDvQn2
         SwtbMsXZlXFFHFz1hJ4ZdN+KEJbFal4yhbr3HyahLumjUuhKw25H42ttKKwU2UBa7C2/
         0JoKrSongszhD7aDPN5s/gPjEzp4CVdmu4U/ZxZC39KPXBA35O2EL0KXcJgjp5BhVqB4
         tCp7GNq9kjwX4czta87DSxRbxevefM7JvVNrcAF050uEjraHPGfrl1FZASgZbRX3Ihov
         6qKIIMRHt0u3JPH68PD/aaXELFTqqa5bYd9skP8PpupHolccLhuXXjnaksZEwGp/2TlH
         lnvw==
X-Gm-Message-State: AOJu0YxvFBz0VKL4VM6nZMPYrZwht3wbiSfnVKp2tAz907/xrnSC+me4
	WvXQxuTj8vhdfeu/VJrmisf5ig==
X-Google-Smtp-Source: AGHT+IGDxcSkbC3AUO/tKAy4+hS1vqUZ4qPAywCnudeSjQUPPsFylnyIVh+mXWyWIPbyzr0UEtVDmA==
X-Received: by 2002:a2e:9d8c:0:b0:2c8:744e:dced with SMTP id c12-20020a2e9d8c000000b002c8744edcedmr6794598ljj.35.1701073143490;
        Mon, 27 Nov 2023 00:19:03 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id be7-20020a05600c1e8700b00405442edc69sm13516568wmb.14.2023.11.27.00.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:19:03 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231124094700.58071-1-krzysztof.kozlowski@linaro.org>
References: <20231124094700.58071-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: amlogic: minor whitespace cleanup around
 '='
Message-Id: <170107314264.1083800.3287643351535378638.b4-ty@linaro.org>
Date: Mon, 27 Nov 2023 09:19:02 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_001904_993963_4C4EE287 
X-CRM114-Status: GOOD (  10.28  )
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

On Fri, 24 Nov 2023 10:47:00 +0100, Krzysztof Kozlowski wrote:
> The DTS code coding style expects exactly one space before and after '='
> sign.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.8/arm64-dt)

[1/1] arm64: dts: amlogic: minor whitespace cleanup around '='
      https://git.kernel.org/amlogic/c/35b47cefe8955f4c34fe45e5a06cb3376d6a8aa6

These changes has been applied on the intermediate git tree [1].

The v6.8/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
