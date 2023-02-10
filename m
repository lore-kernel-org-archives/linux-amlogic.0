Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BB2C636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 08:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxIWrR1AXdEr3kgZwaNPYx9K6S/Ibh4/rXxFd+xiuiI=; b=l7A4pc6L2oTRDQ
	aOfCLi1LE0R2/eu3ivgw2UX6afK9s3fK1FN40aFldgBfK3HwIAIWThZ1JBy0Jb22Oxlf20FDSKGzU
	yD95hbRRQDCm62/bjENT5/HaRuYuTjq6HLB+21IYU9aZz+kZ3byp0SmAL/4BXblOrQlu1MT6brbVR
	rI7hsm+8hIWDyOnHPoE7Nh0qu3GJ8hSLD2R0J5K8agVhc0FABnNtqMSvK5ufcw+cNlaELPIC4zgly
	wEgmRrRSd724RNGJgMx3Ap0v7OYFFBqjontWdvNButE3YUrVJbLghpPXlJp0yfT1gABtpZeUCUcYF
	79rIkYLpeIZbfuEle2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOPs-004ibb-HR; Fri, 10 Feb 2023 08:05:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQOPh-004iVW-Hr
	for linux-amlogic@lists.infradead.org; Fri, 10 Feb 2023 08:05:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id u10so3187762wmj.3
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Feb 2023 00:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRxo67T25+0gjEyyraFdudNI5jjD/ABVgQ3aCUXeUik=;
        b=pbT2mUJO+lF/78vhJ0LJ8+oAVak7mpDcARTg57+pKBCUFm38i2yNnno14mOBVLjoCI
         gwFTvIKjx04FaMiqA3G6tWU01sgnQEcbHFJGDG+vIKqpnkAsaRVI/RQ3XjfGIPlQVklC
         7qRqA3SqNJFcagLFjOlj8Rq9wrYC2tFhiLqhXgHEz5buZZ0Qo0VzZYnfA3w5LyAP9cKU
         47qYScrBTr3ZuxdFDBdV+HnMMoLQPvdohReT5GmvlpBNjeYrIvh+QAkganaHiPVILALy
         02z1D6dJZcP07rPHi3lETeMJ0Y7YcWoTnKCeV+ja4W1XglMHllShMsYPBGM3Z0xwJvTw
         e+Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRxo67T25+0gjEyyraFdudNI5jjD/ABVgQ3aCUXeUik=;
        b=dJ15zArB3+nnxw5MwfJ4stBw7eoR5xZf1dunwqFyBamg0livzE0KXFK8xN4phiWdEX
         uU2gCnJcEE3ZhRgxQoJbGTfB70CDGR6j5XRNkVHZLGa1x25ZZu40i2y08fv6YelioBsU
         STGy7vBDFyLC82W2MCq0gWBuGJqSf604T9tgCUO7Q9CQsoIpkbPNqYFPYqYKV1st8/xD
         PWw16ek0Gj/fUQGHBBFngyXILYS05N4OF1KXDmJ4oB+bV4TUnoW761seyuX1woWNy0hH
         twJk5ATMOhxrrFxDgNp2sRA1JeMnxGldSGwrO2djgO3RV2j9nhl6AvJsP9lO9A9jZO72
         7HbQ==
X-Gm-Message-State: AO0yUKXibeZKls0XFPkltdRN3qawcLAzRYFo6J/aX5TbNocMnXogwOlP
	mKctwiJ/+4rO65hGzoWcessCsA==
X-Google-Smtp-Source: AK7set/20j1icqVn7U9Btadx5iyr0po7qpEg944rGdW8LSC9mxlQHBjpp8IrLVqYCOBDZiAt1dPvNQ==
X-Received: by 2002:a05:600c:1894:b0:3de:1d31:1048 with SMTP id x20-20020a05600c189400b003de1d311048mr12234734wmp.29.1676016340171;
        Fri, 10 Feb 2023 00:05:40 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c2-20020a05600c0a4200b003de664d4c14sm4642196wmq.36.2023.02.10.00.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 00:05:39 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Nan Li <nan.li@amlogic.com>, Vyacheslav Bocharov <adeep@lexina.in>
In-Reply-To: <8a99341b-8546-8f90-c9a5-087d927cac48@gmail.com>
References: <8a99341b-8546-8f90-c9a5-087d927cac48@gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: amlogic: Make mmc host controller
 interrupts level-sensitive
Message-Id: <167601633914.2233184.2742706111229690687.b4-ty@linaro.org>
Date: Fri, 10 Feb 2023 09:05:39 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_000545_630100_2316746F 
X-CRM114-Status: GOOD (  12.22  )
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

On Thu, 09 Feb 2023 21:09:25 +0100, Heiner Kallweit wrote:
> The usage of edge-triggered interrupts lead to lost interrupts under load,
> see [0]. This was confirmed to be fixed by using level-triggered
> interrupts.
> The report was about SDIO. However, as the host controller is the same
> for SD and MMC, apply the change to all mmc controller instances.
> 
> [0] https://www.spinics.net/lists/linux-mmc/msg73991.html
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/fixes)

[1/3] arm64: dts: meson-axg: Make mmc host controller interrupts level-sensitive
      https://git.kernel.org/amlogic/c/d182bcf300772d8b2e5f43e47fa0ebda2b767cc4
[2/3] arm64: dts: meson-g12-common: Make mmc host controller interrupts level-sensitive
      https://git.kernel.org/amlogic/c/ac8db4cceed218cca21c84f9d75ce88182d8b04f
[3/3] arm64: dts: meson-gx: Make mmc host controller interrupts level-sensitive
      https://git.kernel.org/amlogic/c/66e45351f7d6798751f98001d1fcd572024d87f0

These changes has been applied on the intermediate git tree [1].

The v6.2/fixes branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
