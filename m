Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB257C38A2D
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Oct 2022 14:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nyOdMV+cihaTD2gWIuWhdjbB7gu/6LAGIFm1IvPw/4=; b=GOFpn66A6/+wmP
	WslbH6lQWcYpawx/kmiZ++bDS5ACSipJEgBGRI/eOi6lDg3hY03I221JMz256AcOtaLrq69BQkVij
	2nEh/lBSEo2D1uIDnwbg/IR789rcLVdysjyFXdHjDwfYTDox47LoSBQIFpoeY0s6R2pdi1eaNLpN3
	ofatiGf5hE0KXGPTSG5V/Z9yW9b6WImH4i7tQEpBOk5E0MWujAp8b5E4kQgB9/V+uCZDW6r7owNOz
	AolqcQHLIRFdJRV1ORQCcLSzcDlaYMpdTuDa31i5eqbBRLA5UzSX+YohiANIYMpe4PbdRZoMPMrkf
	dN9fEMhIDodwWAhLVhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLD3-005tsg-H0; Tue, 25 Oct 2022 14:47:17 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onLCZ-005tdy-H4
	for linux-amlogic@lists.infradead.org; Tue, 25 Oct 2022 14:46:50 +0000
Received: by mail-wr1-x433.google.com with SMTP id y16so11033702wrt.12
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Oct 2022 07:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pa3LKMnS7r2iizMPoaQLt3RtRARTx6E2qBv41qZjic=;
        b=H4kfTg7okgWeVf3kp2Q7eAN/5rfwwa/tYWNvYrsAGY9WtLGueTmpAexjoQIbcR8k5r
         x0qIwXP56AlMxCsaQD0gE8weUnMtX3YCf/J/GI5AVi9QqiiQHIQ21qevEmlQg+vhacdy
         KCxHxbv7UonuC1HramRi9UDMaOZEzEQHHXA3JjjFGCTPqp8y4OZadkeh4kR3sleJzTA3
         CtNwm8zZtc9OVMIGlKwILdocLBZ61mEJq+t2hVofDbOyeQix8A6T97vYykbqLSB4iyC/
         EpvnwwjODU+ewysJxN2dpybP+8RSub07Kiqtz4JhNdkHWZHyHkZ0v/fhxjrDmuBYrXbc
         xBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pa3LKMnS7r2iizMPoaQLt3RtRARTx6E2qBv41qZjic=;
        b=fp2eWRSLJeKEcsc0bIACNEJuvrLe1x1eirTtAIvO9qvF39Y6zXzWh/22XgxKx9cWin
         9GBLC933fUuO97eEhF+5+CgoMegvSsJCrXv8X3/+k/On3fI/Lo0145lhCVsXnMt/eOaW
         DDQDRaX3kJtkPPGMjNz5+n9Q2uh79AJ/I+INyn+eHW9nYuJhqBqxDTxo4j+ChPhTDK7F
         Nhx0aKApU03KbyjF5fLSshq2AjjF6N9u3O8VVm1YoDGRf9MjHWoqONgodw4pHbr7Dhco
         Af7p079BhtSZS2J6ScvtvOER3W13mI3znxC3ceCWu9qoItrNVj9rVD0grp7dA5y7pXOI
         tR6Q==
X-Gm-Message-State: ACrzQf2TVzAV8voeqFgSlCIhdozXYVifRnr2N1aRDXH8Usesltx4NZjV
	HuL7Vk69f+knjLWNgBF75ZT3fw==
X-Google-Smtp-Source: AMsMyM74VwSpJCoWC2zVCGEqLRGsDpzeeKL1SFMSQiwRWOMtutgpfbdYbYzCfH9vE5eANnHqPUN/rA==
X-Received: by 2002:adf:e8cb:0:b0:236:7ae2:918e with SMTP id k11-20020adfe8cb000000b002367ae2918emr4418583wrn.613.1666709204473;
        Tue, 25 Oct 2022 07:46:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q6-20020a1ce906000000b003c6d0f8c377sm2498670wmc.7.2022.10.25.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 07:46:44 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Da Xue <da@libre.computer>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com>
Subject: Re: (subset) [PATCH v4 0/4] spi: amlogic: meson-spicc: Use pinctrl to drive CLK line when idle
Message-Id: <166670920358.4012520.5560439627049911254.b4-ty@linaro.org>
Date: Tue, 25 Oct 2022 16:46:43 +0200
MIME-Version: 1.0
X-Mailer: b4 0.10.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_074647_633189_803F5021 
X-CRM114-Status: GOOD (  16.23  )
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

On Fri, 21 Oct 2022 15:31:24 +0200, Amjad Ouled-Ameur wrote:
> Between SPI transactions, all SPI pins are in HiZ state. When using the SS
> signal from the SPICC controller it's not an issue because when the
> transaction resumes all pins come back to the right state at the same time
> as SS.
> 
> The problem is when we use CS as a GPIO. In fact, between the GPIO CS
> state change and SPI pins state change from idle, you can have a missing or
> spurious clock transition.
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/arm64-dt)

[3/4] arm64: dts: meson-gxl: add SPI pinctrl nodes for CLK
      https://git.kernel.org/amlogic/c/2ba370bb98b53b7565493083699d82da5ef2cec8
[4/4] arm64: dts: meson-gxbb: add SPI pinctrl nodes for CLK
      https://git.kernel.org/amlogic/c/ce759829b8fffac891780611b54a6be26a2d5a5f

These changes has been applied on the intermediate git tree [1].

The v6.2/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
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
