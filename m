Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83BACD11C2
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Apr 2024 08:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQfirKTeWQ14f0fxsQBFtFUekV8yGrs7U5p0S2RPtMQ=; b=bpIxvMhon+4gFX
	aInRiiKiyE/+Cv3u4Y4tAvG0rjmuCvGS9UBQ7beWpHUqk90ZcMWf57z018kHDBNA036zSdTJuGi2W
	c3BXu1WvDwEcF8Zgc9ssgWvQ3KmRa8k6c1e7VRLOiNzrjs0PIQ3df+Fve73xyKVt8rqt/xPuQgc27
	hxoIvIE/x9fpmi6PWR8/3hwJ9BUXJaThJkRyNF0VebzEJtlmy55VKd3RsS0NsUEm5chILeczeUi6k
	d/GOhGgzaAeim3vaA6T1TPE/BcHzh5khQgqPWp3PcoKvmZ1fj4kRCauVcQnTSN/KZeCgEsrAf2u6t
	S53qc81JkngR0vPRuUWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTjQ-0000000602s-0IXG;
	Wed, 10 Apr 2024 08:55:00 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTjL-00000005zzK-2XcD
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Apr 2024 08:54:58 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-516cbf3fd3dso7493298e87.2
        for <linux-amlogic@lists.infradead.org>; Wed, 10 Apr 2024 01:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712739292; x=1713344092; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q9n9bIdxiQcPgRyTX+n58GNtmNfwkau4b2336NlqK0w=;
        b=w8D3jD3rMWqM1wnrKmujNQFvMBjaLv6Is4X0EOO3waZdlwdAGTFNDR10KF6UdGA0uS
         fe/yzQGPq5QUszJ/YD4c4aVc3y4ssUpB/9ZY3Ms/5tvtoyDnUPTE5mYO1uhC74E8oMB8
         Gsk+xqloIazi5RFXVKNVksSV/o+zQDglapyPM8GuH0jZRfm8VaRgVb0mphuS0our4ugu
         gK+NCQ5Qy8gBDQdhqzQzwiPlshCxCChxOBWrN2Fr9rkHYKZ0c5UKpukB/ya1NsCedXq3
         d8BVYAiHfaoRReDCKZ4NY89sZ8PPm9pgVr3c59sCwBmj/6X9AjWhw+KCOpUmQC3SNlqK
         iouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712739292; x=1713344092;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q9n9bIdxiQcPgRyTX+n58GNtmNfwkau4b2336NlqK0w=;
        b=lO3++KDuxDLuW1hr6TV/DR7hrdS3eJcutVMIh2J8tjmMz1Y2aAPiTh/F6EgZPHo8ue
         MkIxsbctkTO4TznStsidbGJP5M5xLfufZDrS+w+CgNWoqvo6qY/YGEZj/G65WNQBUmbu
         wNCjT0nuVOFUcxTP77Q8vtiMeqk2owaueHfJjlAURKWTM89Ll9+jeS4fmfrZxoIpmul1
         8hxLM7/MIlGVT/lbFGagaEWP2PtXQVIDdUPk9Sp+Ix5LFRyMa48UXlu1vmd8xtFs1ZS7
         joVsR6ff9GKDavDeq6UUv5dE9pwWPiDs5t0rGuUl8GxTnjrILPM/nd7ewah14MaNZUxf
         IuCw==
X-Forwarded-Encrypted: i=1; AJvYcCVbHLR3ero1yfQAp6Vo0yWtUFKThIBiLKfzQ+u36WtYPDoMsl1O1WHVpiSGpFGE84Q6S5Mk9ZfI3SB7QJjzHhmk0wCZ8PR/92HF6DJm7QjJuao=
X-Gm-Message-State: AOJu0YyUIYYAmf/EBu9g/1LDsyUEqlO483SihT+S/kXsFAB2wAjfH3gC
	hB01rLXaem+rCefDaiVOMG09jV8MgQGzlFqLJtELJtFFjZRZFiAbI2KCq13Ttpg=
X-Google-Smtp-Source: AGHT+IFNFRt4eMSzQqZ/7NkG1db8x/cM2BTv+GM3c/HklSBaajG7sctnDL9a2AdHlmfF903QzBJ7Tw==
X-Received: by 2002:ac2:47f0:0:b0:516:d30c:7236 with SMTP id b16-20020ac247f0000000b00516d30c7236mr1322034lfp.18.1712739292455;
        Wed, 10 Apr 2024 01:54:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j1-20020a05600c1c0100b00417be508e44sm408832wms.34.2024.04.10.01.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 01:54:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 "Lukas F. Hartmann" <lukas@mntre.com>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
Subject: Re: (subset) [PATCH v12 0/7] drm/meson: add support for MIPI DSI
 Display
Message-Id: <171273929144.3191460.10788273510731412114.b4-ty@linaro.org>
Date: Wed, 10 Apr 2024 10:54:51 +0200
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_015455_718978_9AD8DAF6 
X-CRM114-Status: GOOD (  12.54  )
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

On Wed, 03 Apr 2024 09:46:31 +0200, Neil Armstrong wrote:
> The Amlogic G12A, G12B & SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
> glue on the same Amlogic SoCs.
> 
> This is a follow-up of v5 now the DRM patches are applied, the clk & DT changes
> remains for a full DSI support on G12A & SM1 platforms.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.10/arm64-dt)

[1/7] dt-bindings: arm: amlogic: Document the MNT Reform 2 CM4 adapter with a BPI-CM4 Module
      https://git.kernel.org/amlogic/c/ef5a84d716042871599ff7c8ff571a6390b99718
[5/7] arm64: meson: g12-common: add the MIPI DSI nodes
      https://git.kernel.org/amlogic/c/6f1c2a12ed1138c3e680935718672d361afee372
[6/7] arm64: meson: khadas-vim3l: add TS050 DSI panel overlay
      https://git.kernel.org/amlogic/c/2a885bad5ba4d553758d3f1689000cee8e6dae87
[7/7] arm64: dts: amlogic: meson-g12b-bananapi-cm4: add support for MNT Reform2 with CM4 adaper
      https://git.kernel.org/amlogic/c/fde2d69c1626bebb3a8851909c912e582db1ca95

These changes has been applied on the intermediate git tree [1].

The v6.10/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
