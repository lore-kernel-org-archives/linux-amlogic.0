Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF25FC61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 12:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrpUCCqcAfiQ0kDMkFfbBGomrh+tWKmJWNJ9joe8tl4=; b=ajHJ5L4f1cqNFf
	krb2/hmmpPWmyzHaTcG84lJGJUJLB8AO9y+YfS82/KDe71mPfyCD3fuNYVXd3tLviuAJQKrjZNAPL
	Bdab81EFgTbbO8qXEBe7Y5xnUmfy2JYMiQ5bI2O1sMUXVUcl9xFAflXuHeacq+WGh5Qhh8Z/LnXKb
	105CnF6wBNzKEcxMZ8bSCtft5EdHy30Xy8Ef6DtlQY27Dj1IDCf9jCygLpsPzeorb51u+j82fNpGv
	DPRHSmP656mpYh3/2OwwRdK6UClenM0CiKQFwqDKZ5aD8GY8UF6yZnwN8c/AeRuJO/i4SgllhWv8L
	CpLE4SSAD5GnvhL+76Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZA53-00CiZo-Ll; Mon, 06 Mar 2023 12:36:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZA51-00CiZZ-Tl
	for linux-amlogic@bombadil.infradead.org; Mon, 06 Mar 2023 12:36:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=c4q5bpu843lZ9fXgZMzu4vosZM9fn7Qexe0ALutwzh0=; b=D2e3i1Qvg6x4bxmoWWQljfCq85
	O1ZOIC0i4EaOOYNShIMoP6F56TidtJ3Xn6CDMgaWhFp06iOZKmEEnp8jbSfyKKfhGUoelb+5DiESr
	KkIG2Yg6H52cN1gjzioSseUhe6ic+okWqdKM3m2MBcIKLfysadl4puHGqdUFCVUg+Ysu4prRgtrVT
	EprxeGQ657jTy+3oUP2AugF5EPzXIakIxPkWc56iu/bCvZG0B82YC81g0618CbhAJS1dewiY+g4nq
	ODmuL/WDjIklvaoeKFMZ52MWzqpWgM/8oQC/DWs9xEvsRLjjsPz4sE3bsSfBP5iDvDjgeRwW5yKhA
	gBfLWkvw==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pZA4v-00Gfa9-0n
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Mar 2023 12:36:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id e13so8608551wro.10
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 04:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678106189;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4q5bpu843lZ9fXgZMzu4vosZM9fn7Qexe0ALutwzh0=;
        b=mI/itH8/YSW7HKGYHfd0EwDMQAWbbDWioZXBPE3R8FKXboUr9t3t/yOQylf0NVAhNj
         KRx1F5YqYUL25o0Y2pfTALSBVnsCxQ7gCY6KALa1sjIg/eMzBE/jM4cfKL3nJVjxJUZq
         n3/+5N3LYCoZrqrbmsU4UH4QAo2nc8eLxIGBotZsc6wTvps9tU1pC9HCdVvlxsqr6VtB
         6kkc/PUJJbbI5GZCDMjknod1aps1A4uormt8MorBz9L/jG4u+Tnacy0geAOvao6WB/ti
         mwwKyRoki9/cKg2AViXFxhwfhXo1c5DtjykADrANPUyX0CFCp75KTWCjRxsIJ7zoUjOa
         ogmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678106189;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c4q5bpu843lZ9fXgZMzu4vosZM9fn7Qexe0ALutwzh0=;
        b=0IUVmeDYcVZZj1LDCPjKhEIQalFwTpOSvn6ZEJSCh4PTlNVwSGXF/kBUEdDuZSn55a
         irCN2e3j3XbxYD9iIIKhnnjI7/KmqT/uW93CXGlPbyvTzcyKFpevxU7zmonkLiR1DF7n
         A92k1fgIVlbR97KzArqG9afvkkDugfOalSZH/2LfvbpPaDl33QQkVtzF5I/8jzxZiAoZ
         QzSrCSeqwyMGWEsofW/Q7V70mgKvR7IOkVJCqaxgdyAbcHype2hx2859/gHUGasPFPzg
         IGkc9yiEFlR11rJzpidhQwjyx60QDfmiZRx3l/GIz8sMSUyTxgPPvDMbOhR5gKVdZ20l
         CMkQ==
X-Gm-Message-State: AO0yUKVMqBkIA7gS+MJCB8EVmlux3pEDyAE2aE1lyy0NGJPLabvUk3Pr
	zic3PBKiglLxTs3QkgNLBS8tow==
X-Google-Smtp-Source: AK7set+HiFqxGxqUbEePaG1GauuZizw+B+A2wTEHisyvMnLYXeI6P9TLO/3lnKFQqiXalKC4PHuH6w==
X-Received: by 2002:a5d:6a12:0:b0:2bf:ee7d:5369 with SMTP id m18-20020a5d6a12000000b002bfee7d5369mr6191618wru.59.1678106189165;
        Mon, 06 Mar 2023 04:36:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id k5-20020adfe8c5000000b002c56179d39esm9890545wrn.44.2023.03.06.04.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 04:36:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230306121351.1606360-1-christianshewitt@gmail.com>
References: <20230306121351.1606360-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: meson: gxbb-kii-pro: device-tree
 updates
Message-Id: <167810618845.421911.1072624515654199610.b4-ty@linaro.org>
Date: Mon, 06 Mar 2023 13:36:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_123635_519557_15413A5B 
X-CRM114-Status: GOOD (  11.56  )
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

On Mon, 06 Mar 2023 12:13:48 +0000, Christian Hewitt wrote:
> First we sort nodes in the current dts and remove some blank lines. Then we
> add the remaining bits needed for Bluetooth to work. And finally we add the
> AIU audio card to have HDMI and S/PDIF audio output.
> 
> Changes since v2:
> - Rebase on linux-amlogic/for-next
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.4/arm64-dt)

[1/3] arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
      https://git.kernel.org/amlogic/c/815ad625ec4ea5de655f9c02ccf7f65ecf5e6e29
[2/3] arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
      https://git.kernel.org/amlogic/c/dae485f52a65ce939b045cf480c401d434cacf2d
[3/3] arm64: dts: meson: gxbb-kii-pro: add initial audio support
      https://git.kernel.org/amlogic/c/914a3aa644cf50947a2dbb97738502ca9f025a10

These changes has been applied on the intermediate git tree [1].

The v6.4/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
