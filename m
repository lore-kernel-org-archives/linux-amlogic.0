Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACED3C04A94
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Jul 2023 09:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fOvWhh7/y4W3V2Wi3tLjPU7QW9dAGXUxMbtEDq5M/yA=; b=oMCtwHkbkt0yAZ
	BidXTDnP9dSseLUPrqUk74ILRHUFkyr3VToOTSbZ38701dFcZmi6WKRpu1wbbxEsFhGA+dHOxMcZj
	eVsSJPJJXmdXwHgEHls4kRgIqNPzxPaRvgKGwmIKm/s3SPk7gbZjqZ3+/km2c0wYDjstZMA30QjYg
	2EEuZSVXcLz3B6i5nfMBS5BlmAepebSVyFhzbq7J2A8WmgN1WyGRbNl94hr6UYAnGJFfj6G8D4ovM
	lYr4M/ONDKPmVPyQmWJWXNZoLcU4QghvoFTQSrXvcrPv/rcZ1mo9GpNpFDGW5xPRreoH2I0gBZN27
	YI40UG5wDaCcL3ZaZdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPUa-00Eowg-0n;
	Mon, 31 Jul 2023 09:47:08 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQPUV-00Eotj-2N
	for linux-amlogic@lists.infradead.org;
	Mon, 31 Jul 2023 09:47:05 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-316feb137a7so4550201f8f.1
        for <linux-amlogic@lists.infradead.org>; Mon, 31 Jul 2023 02:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690796822; x=1691401622;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxDsWVGn8/NwuT4OxCGgs3WFSadNfLfmBL1C6HxSVLg=;
        b=jP8t+EmdY/W4O3SmujOD845Q+ns9HxWJCNeYGg0MI3+yjrJK+5A3PYQ+0hTBw/kKuP
         6+je4MniZC0iq4binVCA6cfnBZ5+Odauwh1Z8UkXpqBUKDgouhXgBMK4ORM5egpPTLMP
         6wp8Uv8EduZXsZM3yR+yOGFh4T3NosJHzS8ZJORXddie58lS92dD0KUCEzzo+ZBOacuq
         FaCIU7G+GRR8BU9u2bMbzm5o6qstrsNPJKyICOQPCSX8DeeOdqRAbAeWaIjT1/XQod2y
         rrmlnfKb0kmsRwzbIONoeq02MaSfkac6ogTJBXZYw5Wp8XS1THsJqIRwM3IWb9LL0qiK
         u6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690796822; x=1691401622;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxDsWVGn8/NwuT4OxCGgs3WFSadNfLfmBL1C6HxSVLg=;
        b=dEYwYv8SreCCsa1+Iuxbw1CuC/FoTV1Dv7MDEFoqhg1pDO9jqRgQ62VtBiGtCjzPyj
         CHQFB42t6xfTtcb3r02uIfKarGRJaKLGmtsP+vQROUnWiMbUZ2zficoIML1mPG7XlctL
         ufarz4YGFI3ubbGhKsRv+lohlrtCegv/4/BTb6+F+c0sM8hfuXl8yQ7rIqWuWkkuI6pT
         A66nJHuXJSRqgmSEks1+vgH2EXUguwlL5ZzAYX27L1NLbADITmcmmg1snoxLMu/2Z6k5
         Jm39+k5JySozIORTlq9IjSS6Pr8TkDH+zu1KpAeY+KnPZcNZhbCnFxegVz1diuIIXu0X
         24Tw==
X-Gm-Message-State: ABy/qLZWxJewez32VfV9j/OqSnIwQ7/ja44pUCJTgkAnFhabsXxJEFwn
	/mqkKUyCp4ZNWh1ibL1dj7sav79FSRckj1Gm9/FFSEk2
X-Google-Smtp-Source: APBJJlFuGlL1NmqvGsLXjELI7YezZ6XW63R0SDXpX2GfbbX/iyB7Bw3CNl7zqXYoOtUVkfT80ZwTgA==
X-Received: by 2002:adf:f7d1:0:b0:317:61d8:3c7e with SMTP id a17-20020adff7d1000000b0031761d83c7emr8833827wrq.26.1690796822234;
        Mon, 31 Jul 2023 02:47:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id p9-20020a5d48c9000000b0031433443265sm12556878wrs.53.2023.07.31.02.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 02:47:01 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 Huqiang Qin <huqiang.qin@amlogic.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20230720114639.833436-1-huqiang.qin@amlogic.com>
References: <20230720114639.833436-1-huqiang.qin@amlogic.com>
Subject: Re: [PATCH V2] arm64: dts: Add gpio_intc node and pinctrl node for
 Amlogic C3 SoCs
Message-Id: <169079682106.186625.3975138620226263746.b4-ty@linaro.org>
Date: Mon, 31 Jul 2023 11:47:01 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_024703_773044_01593BF3 
X-CRM114-Status: UNSURE (   9.39  )
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

Hi,

On Thu, 20 Jul 2023 19:46:39 +0800, Huqiang Qin wrote:
> Add gpio interrupt controller device and pinctrl device.
> 
> 

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.6/arm64-dt)

[1/1] arm64: dts: Add gpio_intc node and pinctrl node for Amlogic C3 SoCs
      https://git.kernel.org/amlogic/c/cac34b2b3f5a9d4471a2660ec52599b6015bfc51

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
