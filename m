Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B5DC05027
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 08:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GDlQNSQPuKbmjTykP+4jbDy8+VsMMBkIQkEDkEpH5RU=; b=P/Si6iX0eWBLxF
	9jJKD5hqmIcrqJLBnHNMzCT7sSMgW0kXfxEDhp1ufuc6IK7xz/hxcx26GoFMt3YalmGDgdcuqvna/
	YXEFBBY/PWHHW7AVbNIh2YtRJekOGFiYnxJRCebZ2sZye7cjtG/tSt9zIoyv29RZb9LUj8obtfVcR
	EmUbc3SfCu8RvOPI9Z8Df9r0/KBf/tsmII8pB8Oh5retjFm8cT3h6JW+92EDdUmkt+s2/ZHiQwWna
	D9irM0Oo85xfd1I74Ku/oRl7p3YRtEPyRBpE7gep/UYJnrjEja+Ohp3t887jbcMkofCCVb1bTvtDP
	HD7GWPIoxeo95NjHz5wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxoi-00A32D-P3; Thu, 26 Jan 2023 08:41:08 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKxhs-009zln-Pv
	for linux-amlogic@lists.infradead.org; Thu, 26 Jan 2023 08:34:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so625635wmq.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Jan 2023 00:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9Aqz9ow0096NYVpMVct4LsgcvHoqSMpUjeGW88ptQc=;
        b=vHPTMynsbnrZC9C3R+6zY5NRfqAAcSsw2x5wvGFFqW5V/vJAWxG6YRjJxYnfqDHh1G
         wqXLMz15+Z5PE1OsIuAINaxSivTkC3bv02/vzVoHj3RgGaB6uHTbHtM9g7gHXMaU+fQE
         qHXzi6KLYhBH1Dtnb/8yFhgaXUQzH+us19ZVZzfmA4EA93yZTbmmnjls7QhqaEJ6JJ2N
         AKXadY0YvPzbEoOn7hp9fdFi0F/ukl4BGpd4IBX6AMDZ+xbuU9BZ/VrcDouL7tVapNGw
         IeiF9Nx5j2iiVe1PGujtdCJ/aB05Ryc5/Nw7ja/HqthGCIGedXpHTji8658+h8cI3xkm
         RnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9Aqz9ow0096NYVpMVct4LsgcvHoqSMpUjeGW88ptQc=;
        b=q4COWxurlebiXce+e2NYqlOU5kg/FfUYu/p1dlNFxSI1Vi3aNCSoV7F7qjTQG/W4Ti
         fSDVG4gndqXTri04quRecoHhbjKoi4/129SLZu2dscT8j2UHtMJS5miJZJpQzpIzi1XP
         JJQe9uHrvqPDDlf/8euMT42i/ITpRTWAWJvCwgnVqYG2W3nrEHMo7EfO2kZ8Am7EqN5U
         u2Yj6mwPBLgl+cxFxY+FT4rmKWdlNo7qu/Xr2ovdKUCje3YSN3PBkv4zyuH4sFoG97dF
         sutMg95cRYwldxnmHYK9IcdkhztrXYi6lYuDRi95/dQ1BCmLSXJwdKsS3mJwg8tlVnat
         46iw==
X-Gm-Message-State: AFqh2koVdCO6QYhzO75RnnghCLZ1+81cWP8TbpDapWo4d0sWYTRHxWxZ
	rhKRYkiCuYuiPCRPVqXuTViILLgVLjWwl/Uo5Zg=
X-Google-Smtp-Source: AMrXdXtdHWb1Hu57UY2Fx3spWKuK8REEt5FDqslm9OxT4gnSFLkU+EulXG8ozOVLCNMOe1Bz0s4SAw==
X-Received: by 2002:a05:600c:4347:b0:3da:fc2c:cda8 with SMTP id r7-20020a05600c434700b003dafc2ccda8mr35154325wme.6.1674722040962;
        Thu, 26 Jan 2023 00:34:00 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c328a00b003d9a86a13bfsm757709wmp.28.2023.01.26.00.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 00:34:00 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20230123065504.2669769-1-christianshewitt@gmail.com>
References: <20230123065504.2669769-1-christianshewitt@gmail.com>
Subject: Re: [PATCH 0/3] arm64: dts: meson: add WiFi to P212 and cleanup
 VIM1
Message-Id: <167472204014.456104.18412997475456067152.b4-ty@linaro.org>
Date: Thu, 26 Jan 2023 09:34:00 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_003404_868835_1A5A4D1F 
X-CRM114-Status: GOOD (  11.42  )
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

On Mon, 23 Jan 2023 06:55:01 +0000, Christian Hewitt wrote:
> This small series adds WiFi support to the P212 dtsi then removes the
> corresponding node from the VIM1 dts (as it's now inherited). Also
> move the pwm_ef node in the dtsi to alpha-sort correctly.
> 
> Christian Hewitt (3):
>   arm64: dts: meson: add Broadcom WiFi to P212 dtsi
>   arm64: dts: meson: move pwm_ef node in P212 dtsi
>   arm64: dts: meson: remove WiFi/BT nodes from Khadas VIM1
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.3/arm64-dt)

[1/3] arm64: dts: meson: add Broadcom WiFi to P212 dtsi
      https://git.kernel.org/amlogic/c/ac714d0925b4fae6a2a8c03da743a91d559f2b5c
[2/3] arm64: dts: meson: move pwm_ef node in P212 dtsi
      https://git.kernel.org/amlogic/c/81351d2f0b006302a72310c95203a767cf68631e
[3/3] arm64: dts: meson: remove WiFi/BT nodes from Khadas VIM1
      https://git.kernel.org/amlogic/c/3384645fb6cf31542650b89ecabe1fb04d0662fd

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
