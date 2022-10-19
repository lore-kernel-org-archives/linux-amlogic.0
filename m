Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECDFC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:MIME-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oSspGKo7ZMWPzDvNQqjbPzHGugKS6MK5LCwtccpeYj8=; b=YetsApcFaJy/qj
	ZGqhvAsJ1XaWkoeJa6lRW4gyhJD3swy+KWCspUIMEFUBTy07ZxYv9EHX9lP0PGzuBB+LrusUSpAXy
	5klGaz+8ZXcsqE+HzpzpEZyiLqviWi4GFXU94ZVpJdQHgqTnGCzwODs+FCd5FAh64IgdRHqIEOYru
	bWrsxuZXwO4nbpj2XwJiyMLPvlAKnGo4BE0Lao63N2GOkNEG/D6uzLyVPrOKm0aV/ewhxoVSWOeNF
	4NdsImKKEjaNSGBME4BPcM6bRrl5APGb2fMljKCK5rp0Vh7D1zV1k6vFlNRQshKacNYJHKNqnoMXq
	5MmnhXfvjuRI/YUL5usw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9fT-002V03-2k; Wed, 19 Oct 2022 14:03:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9fE-002UiV-UG
	for linux-amlogic@lists.infradead.org; Wed, 19 Oct 2022 14:03:25 +0000
Received: by mail-wm1-x331.google.com with SMTP id t4so12969738wmj.5
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Oct 2022 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=PVj2DAdfLIU/pX3XZE26BCq9oqHkdH2P1yACg55ATYc=;
        b=QlA9FYPVLD1k0zfaUSwjLI8Q83sBFeoAzC7eQuA8Vn4Dp8rjm78gQg6ZSYljWFaYI7
         +EDL8mVklujMsDG8GH9sEfGXq2u99dWf+2LcmapexNQMysE0Gk9TzJ7RJR9XciOpt60T
         v2f7F0XsTAOUDv9oH+0tpL/amAfarJmdENSkKa5Fmhky74UWZjAH3KB+l6inFESY5V1f
         aNjyQ0JZwMql16HhSJGSg149q426+rWzciTmWU7Ja794brJrFd4gv8Mq63R3zu2Skj0B
         bJKMfYLkoBFcz8AsXb9NzPVITJMOIhiV15K+OlEVdt/gbPnIOGmsPEGVwyHC61oOIOBn
         bN5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVj2DAdfLIU/pX3XZE26BCq9oqHkdH2P1yACg55ATYc=;
        b=aiJP1xAPoCB2aEo+fksYsfFC11qICZdgOkS9VgHxysMv8MYI3CGSQqTzNF2XjZQfMS
         blIv1HZJnRJhCCIS8c6v2yqbCzcTD+h7NywHwANvgSagCM2iaWsTBDNZMk1hAWShhfS4
         PoGpNL7YcqgYjGIMkIl+4pnceyphj/1Kn9kgK+EsH0/US0vaiNeu0H3nMiZVFH9ll/Wo
         i8rRgACJVSVXca1cTmNlVhNmpSVwvv4QRYQn43qr4hf7oJuyEXQ0utLTBK9GUBasLEFV
         TrK7+Bd9WWS74GY9hXeUdRQXFsoTtffj9gMWvtETE7mCzYVBI1oA8fMNhlK2Ga4zAwqk
         EkUQ==
X-Gm-Message-State: ACrzQf3KIsqMPXoMy9bWm4GVvkpOMExkiglqLmiWbWFlX/P45cbtR8Hu
	dPTPvA92P/sAhPGoN7Q7gFglcA==
X-Google-Smtp-Source: AMsMyM5VncASy5bf6AEIZVI0iOwpTrGuyy+Dcp8M8CChiqgXYaA84TGEqw0ITPNidhlKL1DMQ9mdMg==
X-Received: by 2002:a05:600c:468f:b0:3c6:f85c:25a1 with SMTP id p15-20020a05600c468f00b003c6f85c25a1mr5696138wmo.60.1666188197604;
        Wed, 19 Oct 2022 07:03:17 -0700 (PDT)
Received: from [127.0.1.1] (rtr.23.90.200.126.unyc.it. [23.90.200.126])
        by smtp.googlemail.com with ESMTPSA id o5-20020a5d62c5000000b00228cbac7a25sm13998628wrv.64.2022.10.19.07.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:03:17 -0700 (PDT)
Subject: [PATCH v3 0/2] spi: amlogic: meson-spicc: Use pinctrl to drive CLK line when idle
MIME-Version: 1.0
X-b4-tracking: H4sIAB4DUGMC/3WNzQrCMBCEX6Xs2ZV0q/bn5HuIh01c7UKalsQWS+m7G7x7Gr6Bb2aDJFElQVdsEG
 XRpGPIUB0KcD2Hl6A+MgMZotKYE84T8uDxqR9Mk6Ija2upG7mYCrJkOQnayMH1WQuz97nsNb3HuP5O
 Fspx+7u3EBqspGFpSy5bOl8tr15tlKMbB7jv+/4FlmtKQLQAAAA=
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 19 Oct 2022 16:01:02 +0200
Message-Id: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Kevin Hilman <khilman@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Da Xue <da@libre.computer>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666188196; l=1508;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=/olsUtwOJnRswdLM6doMxbVMNoGB8qZCnkiNegDbh1w=;
 b=aFPV+HsjpwaTDlj7ngssvgjXRK+U0pQ5Yu0g/7m9QFR2MBhDYQYr2iRBsvSx6x+PD6M/5IKDkRss
 MTCh+avjCw3BKpkSwtHHwbLoGKJbXu2qDxoOXZfjOz5/8jYPCtQC
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_070321_259220_648277C9 
X-CRM114-Status: GOOD (  12.06  )
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

Between SPI transactions, all SPI pins are in HiZ state. When using the SS
signal from the SPICC controller it's not an issue because when the
transaction resumes all pins come back to the right state at the same time
as SS.

The problem is when we use CS as a GPIO. In fact, between the GPIO CS
state change and SPI pins state change from idle, you can have a missing or
spurious clock transition.

Set a bias on the clock depending on the clock polarity requested before CS
goes active, by passing a special "idle-low" and "idle-high" pinctrl state
and setting the right state at a start of a message.

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
Changes in v3:
- Fixed documentation by removing pinctrl states as they are not mandatory.
- Link to v2: https://lore.kernel.org/r/20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com

---
Amjad Ouled-Ameur (2):
      spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names for SPI signal states
      spi: meson-spicc: Use pinctrl to drive CLK line when idle

 .../bindings/spi/amlogic,meson-gx-spicc.yaml       | 67 ++++++++++++++--------
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         | 14 +++++
 drivers/spi/spi-meson-spicc.c                      | 39 ++++++++++++-
 3 files changed, 94 insertions(+), 26 deletions(-)
---
base-commit: aae703b02f92bde9264366c545e87cec451de471
change-id: 20221004-up-aml-fix-spi-c2bb7e78e603

Best regards,
-- 
Amjad Ouled-Ameur <aouledameur@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
