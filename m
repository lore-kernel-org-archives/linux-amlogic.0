Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0A9C38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 17:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gtC5mCarOKCdctEbwoVdZnUtK7+hGSa0KN3vgNj31iQ=; b=lnwKT3Y6aGTP79
	7weDp5+DnqnN2973+Nh9aPbxKt3rE+MuLgAMmqM+vBICzZfamNiVQI6hQT4PZngreUfVsvJUbdihi
	I+094IIKOCFsUlYLUW27yOIasEhNWsbSypFOkPp/HEMBp8VYrhtz6tjx5hdDPkShoBOdYQZUnXUFE
	nntRT4z+7R6G/+kv7W3G5szTvqS2SVsM8BAJlCnjxRv6xrqOyQs9jcq1kz9jE02TDhtX/niiN90aw
	W4fCPoNQzNnIsaM4Pu8LsGSVJVnuCa0OgYH5JRGGtcW9V7R8f91ouC+QYouWenPexihwV3qpcAOWu
	FOiFfXGkwZsqBulwPmpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLS7j-00FrYz-G5; Fri, 27 Jan 2023 17:02:47 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLS7T-00FrUE-OA
	for linux-amlogic@lists.infradead.org; Fri, 27 Jan 2023 17:02:33 +0000
Received: by mail-wm1-x32a.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso3945050wms.3
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Jan 2023 09:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=74RYKXADYiWuMtd1iDXR46UqUxe2kZuhY4va9NHmRgw=;
        b=sftt/w4VLfphRnNORfESsr3LME9gLjhtV6Na3+8e3+UcB+ePTF8lVHMMrTJlROLAMx
         BTzeq+4dIfLiK0XzuQGpBAx0/C3Y7kjugNFmH9ihf8bwaHJn37MKD7j0/Gg49d8aJAEi
         PlBaxu2GPd2lnn+NQjhqFUyHCFJMvzP0dCRyWbWaGmutrbGa/tlxTDl++SwiwevX9x75
         Eoy9mh3SBsUNHyp5Uq9Yf/aIeLu2pVdgAExiN0de44JVkAP7uj5nt4pWSk788i42rSxL
         apV8ByJ1HpEClYySlJut+SbiATLnHNDZr36zIBieB//l6VE6aV9fBMPT3Gi+rl5prxOy
         nrbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=74RYKXADYiWuMtd1iDXR46UqUxe2kZuhY4va9NHmRgw=;
        b=v2YWltK0f0KsA+x93+2PQNO89FKMQFd4It874ODSscOnJ2o7165urAcZNbYGmDMEks
         PoguwJkzSsCNsg1Aqe2g0g+Ak1TO/xCgAIXp+6tEjv5K28PXq9PFX4YcAWNmjr9tCJMR
         qHiwmSoMuVF51jUAijplAQk5BpQ6LRR2tengz/i7bxI9AbX4YHfGD2k92uTad1Bd0+sQ
         whDrWuCPZaqLL5JItOlrjCOIDPM3mxoDm7vEdxBjcoAYwwgZSJgaVtQDl8yxhF7/w9Pm
         vpQxFPCikJMRRVMCvC/PN37aV/VJbwqApInR68wFQIfU53PNDIPJ3onUkx4LcR/Jt6XV
         CT1A==
X-Gm-Message-State: AFqh2kqhyOG6Df0I/YX80jqVDZWMsAPoztJVBy3v2sN5oC+y91eXhktl
	5/t2R6CBGZvFgMFxPif+G+4yOQ==
X-Google-Smtp-Source: AMrXdXsL1Hr0yZEA0/ZyJzgSBTvzReIJkdTSMyNhsF6vOWDcuTJ7XyKdsh1A5LroidB30T6W4Q+mHA==
X-Received: by 2002:a05:600c:b54:b0:3c6:e60f:3f6f with SMTP id k20-20020a05600c0b5400b003c6e60f3f6fmr40944390wmr.38.1674838949712;
        Fri, 27 Jan 2023 09:02:29 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v10-20020a05600c12ca00b003d9df9e59c4sm7925935wmd.37.2023.01.27.09.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 09:02:28 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230127142221.3718184-1-christianshewitt@gmail.com>
References: <20230127142221.3718184-1-christianshewitt@gmail.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: meson: fix BPI-M5 and add
 BPI-M2-PRO
Message-Id: <167483894832.2238401.307745303107295003.b4-ty@linaro.org>
Date: Fri, 27 Jan 2023 18:02:28 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_090231_797238_027963F6 
X-CRM114-Status: GOOD (  13.92  )
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

On Fri, 27 Jan 2023 14:22:16 +0000, Christian Hewitt wrote:
> The first patch in this series fixes an SD card (re)boot issue on the
> BPI-M5. The second removes a redundant status from the sound node so
> we don't carry it forward when subsequent patches convert the (fixed)
> dts into a common dtsi, then add support for BPI-M2-PRO which is based
> on the BPI-M5 board design.
> 
> Changes from v1:
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/5] arm64: dts: meson: bananapi-m5: switch VDDIO_C pin to OPEN_DRAIN
      https://git.kernel.org/amlogic/c/856968e066bd77b113965f1a355ec7401edff65f
[2/5] arm64: dts: meson: bananapi-m5: remove redundant status from sound node
      https://git.kernel.org/amlogic/c/31752ffeece8b8dc2cf2be36614c8a4e8e8dcf57
[3/5] arm64: dts: meson: bananapi-m5: convert dts to dtsi
      https://git.kernel.org/amlogic/c/ca8dac3a019ac190c39365c99a632c0748c72f58
[4/5] dt-bindings: arm: amlogic: add support for BananaPi M2-Pro
      https://git.kernel.org/amlogic/c/bd2529aa41ccb93c2ffcb045ac97121711277fe0
[5/5] arm64: dts: meson: add support for BananaPi M2-Pro
      https://git.kernel.org/amlogic/c/5bcfbee7d58d8512493b03b1d1622fe138d0aaee

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
