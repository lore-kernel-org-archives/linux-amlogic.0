Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96ED1C27C53
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2024 09:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SQLIT9WSGghNt9PbLVXJYtoIMnp3T//hhKRjcPJ/mg=; b=zi4VhVUNLsXwTS
	S0k1w01/7hBNI6jV+yWYePfO7uvAuaP5qiYtLlBFt/coXxecM6rHtH4GckdlFxUuAUihFKzLKkXmr
	GU1NqavoaQ+AODtAhQtAwSAswiOWaVo2vrn39q03cD040WiqrhOIO3vCX2SVCOEM7YlaY5VIR44uM
	2FVJrDQFJarOBspy8Q7TJnVH6CwRx93HRJNO2pvbmVwXY9rwq0R4jxv04kqm2DhN9/xNlHJg1KlEt
	ejqCWBZxsS01YUb/LIwSpSb8MfQ3mJMwK5qV6ha6asyyphnwAN7wSZ7yYB3qUsW7P4B7O3oA7ytet
	Q4kZSDlggwKHRwp6fCEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVkG-0000000DH9O-2Mcm;
	Fri, 07 Jun 2024 09:18:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFVkD-0000000DH8c-1zdE
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Jun 2024 09:18:47 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-35dcd34a69bso1638027f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2024 02:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717751923; x=1718356723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc1anBJkTUjNMfHbklFybf/ydEv1AmoaOOCKkC7EYg0=;
        b=KPse+51d38LwLh3sPjckV+4lAmsZcG5OAADckiv6hCNOW5AXMLXtsohogyE2t5waSH
         3oe9ST3ZlNpqsuBTgXcb4n8F0Yjjejxn7bUFzQk7SGTXpTXB9nVnnrOc8aXlHdzCxg+5
         7dUHI6sffPNRgmyJw78MMXJ1KogTXMbnq4YF0WqCchkgBVIKaRHKPZhJCRHSkdfa6Z9n
         lUjiqVASYey77bPwCTXPaAGvwlKqyQzN+4vU8vhlMKtHCsQdbLTuE8A8+jJImik3V0VM
         gUhXON86mlb4VssE7RFsYlGKRpqK8j/vaa9wYT3W4/njQENshrAWFMLIypfaC9pnmdOh
         Irxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717751923; x=1718356723;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lc1anBJkTUjNMfHbklFybf/ydEv1AmoaOOCKkC7EYg0=;
        b=NbV+dLcVPEb7H3xM93Zdf8xc/oiVoS85VfvZif1hvtweKXpqcoNJyxVrZWnABDx2t0
         GwsmkpKoXM4izYFpIyNfUp97Puuj+HQstoVn+7KVmxc0UTPRa7Smp0Ky92oNyVO7Itl8
         AqREEE8aLQRkFSFL6ZOsBnMJng1JzgJprWuSUd/wCp03mqNEDTIfYVEVo9m7hCwt9cQR
         ouDRIGZLaaMH5KddW76hgVk0Gx62HAn0lXmu/rOzR9wE1EdkgyK3TRcTjzufAyAOYgeO
         iwhdH/pBtV7fG9vF+Q3v/yPiD8dsxXNuElCG4z9KqU6JgmRSxSWFwjaMA+Y2vJv2+Fuj
         Twhw==
X-Forwarded-Encrypted: i=1; AJvYcCXEVxdZ8GC0Z5ZHXd26tEGZlLjOVmGWWDsMdnOUOpdUl46yjonnB7IsGotA+iZTTXQmmbBwbvGU0s2O6/7M2+5FPto8jbnmRJNINdW3sbwYjk4=
X-Gm-Message-State: AOJu0YxGs8y7mKsYDvTDaDlsCwSYwjsXO8D3Nc5FCRT+UX28Um7vCxmx
	0GQaLc+C/Su0Z3GuNAowXkUNrBYWb37v1r2chACbTDf9AQNsFc8LqWVIpYxsGgw=
X-Google-Smtp-Source: AGHT+IE0A5LvzXh/9B0zg4BZupJ8VQsgR+oICmqezeGO79jFKoxLUaz0F68c7mLS+i9vKZRr2GtwdA==
X-Received: by 2002:a05:6000:e01:b0:35d:a567:4dda with SMTP id ffacd0b85a97d-35efedf2a13mr1356563f8f.49.1717751923108;
        Fri, 07 Jun 2024 02:18:43 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5fc169fsm3573066f8f.94.2024.06.07.02.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 02:18:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
References: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
Subject: Re: (subset) [PATCH 00/12] arm64: meson: bunch of DT fixes, take 4
 (final one ??)
Message-Id: <171775192240.1064805.3116303977641331374.b4-ty@linaro.org>
Date: Fri, 07 Jun 2024 11:18:42 +0200
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_021845_640806_BD305BFC 
X-CRM114-Status: UNSURE (   9.88  )
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

On Thu, 06 Jun 2024 10:48:07 +0200, Neil Armstrong wrote:
> Along with the following:
> - https://lore.kernel.org/all/20240422-t7-reset-v2-1-cb82271d3296@amlogic.com/
> - https://lore.kernel.org/all/20240513224552.800153-1-jan.dakinevich@salutedevices.com/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-spifc-v1-1-380f29ba4a16@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-convert-spdif-receiver-v1-1-262465adbac2@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-v1-1-4acbb8cc2626@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-phy-v1-1-c819b0ecd8c8@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-rng-v1-1-0a55a7ba55e4@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org/
> - https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-v1-1-40a8de6baa59@linaro.org/
> - https://lore.kernel.org/all/20240606-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-v2-1-70d44fa30790@linaro.org/
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)

[01/12] arm64: dts: amlogic: meson-g12b-bananapi: remove invalid fan on wrong pwm_cd controller
        https://git.kernel.org/amlogic/c/1095ad0e92175d19cb7f0b5256af300c921a2d63
[02/12] arm64: dts: amlogic: move ao_pinctrl into aobus
        https://git.kernel.org/amlogic/c/cf42ea27fd7f087b43da27b709267211e7e0e8c4
[04/12] arm64: dts: amlogic: sm1: fix tdm audio-controller clock order
        https://git.kernel.org/amlogic/c/2478d7bee215cdf6a3a581239d12a17407e30771
[05/12] arm64: dts: amlogic: sm1: fix tdm controllers compatible
        https://git.kernel.org/amlogic/c/94befcb819d47b155554997ccfac52354d1b4380
[06/12] arm64: dts: amlogic: g12a-u200: drop invalid sound-dai-cells
        https://git.kernel.org/amlogic/c/4b7df533684032233f65ea1157ec94215ab3f3da
[07/12] arm64: dts: amlogic: g12a-u200: add missing AVDD-supply to acodec
        https://git.kernel.org/amlogic/c/5dab35f183b30c40fb7fb99015811edde96f90d6
[08/12] arm64: dts: amlogic: axg: fix tdm audio-controller clock order
        https://git.kernel.org/amlogic/c/0cb2a3b0d10a3938df546913d738bca121667455
[09/12] arm64: dts: amlogic: c3: use correct compatible for gpio_intc node
        https://git.kernel.org/amlogic/c/e5d4d006a8c5504dfebce7f090ddfb75444491ba
[10/12] arm64: dts: amlogic: a1: use correct node name for mmc controller
        https://git.kernel.org/amlogic/c/ea99706a438f19cf352242ffabab46bbc76a03d3
[11/12] arm64: dts: amlogic: a1: drop the invalid reset-name for usb@fe004400
        https://git.kernel.org/amlogic/c/edc15ee0e43948568fa5380c9147feb9a767ae67
[12/12] arm64: dts: amlogic: gxbb-odroidc2: fix invalid reset-gpio property
        https://git.kernel.org/amlogic/c/e822ce43968daf9da4368617d2c948c22ccf93f9

These changes has been applied on the intermediate git tree [1].

The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
