Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B380C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Oct 2022 11:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:MIME-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KWxxRkZQvEUSx+Dkqsorj7QUq8jSBLkQKesK6q5xaqM=; b=CapuTR6gt5l+A/
	2uu+qQoYoZ2/WIQAocXdFEosiu9MAoSEM2Zvo1Ug/7xvYPMe2Qd6PbYk5okkjD1uxxh6ZLxwA10eA
	3CUKacHuIAEEI1jZmlnjPlXP3MOQFLiwvfDeK7dveSgHUvBNlS/AmHI8S7hsWBP4y3NCjeWWUFvh1
	6UuSl6wwpHmEAqpizC+LSCperuS/WhbqoWnOxv5ITmYyNQMviu9GjVA0bTHe2g5oXwr9ktfYKRm+m
	UigmdcNVq99jU6wZN820cz1uFP4COomGH+PQ6wzb5AfnCtobe7EcYp05X42AER9oY47KonV2FegvK
	usp+Ji6EiuQa5aw2L+iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offpx-009T5P-8M; Tue, 04 Oct 2022 11:11:45 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1offpk-009Syf-LH
	for linux-amlogic@lists.infradead.org; Tue, 04 Oct 2022 11:11:34 +0000
Received: by mail-wr1-x42b.google.com with SMTP id b4so13821995wrs.1
        for <linux-amlogic@lists.infradead.org>; Tue, 04 Oct 2022 04:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date;
        bh=boai9yZBL2P3WLQEzqTpGDWA2OXYb+9F6V6hMQaxTO4=;
        b=qcSULwnYUWfWfK+/CWN6FhD0ft+HVrgH2MjLrCl4/8X26hGsoKUEko8BJUflng2NDg
         YHljMWVhOnnVXHF16ulV50TS+6ZoafYEpANU1bL9eErJ44mMN7W7lJmmEG4ClWAFVcDh
         Au9WjsyGbl/WoUC3PAxhpUaZkE+66Dzw5OyY+anPtH9YDecjAkmOFjNoCgrH7NKvwsDh
         uURDYlxV8qHtCBBwcCq6rQJgD9QByMBRpb5IW1nnZcAPluvzPcHdpmuQ1noJiR+eguBZ
         254qSpDQsEXjQhmFTIKiyjyWWWWAzoJdzCgfEqvlDbPPFJ/E3heb+lAsZmbNWFAs07EI
         /WYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=boai9yZBL2P3WLQEzqTpGDWA2OXYb+9F6V6hMQaxTO4=;
        b=WKSbMbdHJjZD/krPWV9Ay9QOgBIFEK+XK3co7PLjaGO++k2MbmsKqDadRkjpKeoq6Q
         noVeRGv4N0xFGnzgoPas8n7Ayf44GNwXmVspVQ4sQxLuQ+e9KA0/3loLx4JQFSDqPden
         Ock6+fDDiuLtqV9Hr+CbZZs1gizpqSLRlDsPg1paX45A4F1Rp6wNHkwrIG9X2xs8tpi/
         xch8B059CDpKAPxbBxf12Bmd5DLrhwvu7YJwbgY/aBNrngGwwHrbfT1xK6tjMSJ8KTiX
         elJMXdR0WtZZ/6kueon6SDZnMsq5NVBJtShfATAOWM7C5ZOq/nIDku7j2eG6HH3dTs7X
         uukQ==
X-Gm-Message-State: ACrzQf3oT7fEyI91y+s78GUzGDcJBgYLDb3uA3RxuHzXKmxg/fbQTYJh
	ZKLqTTbW8tF4PkUAghmIwGBQqQ==
X-Google-Smtp-Source: AMsMyM7LrjmdzE7DPjflps2//LAVEW5x/L43i+8FZTIeNnOpLfFQVgoEbCMGgNkX2uNQWe1c3HA+TA==
X-Received: by 2002:adf:c713:0:b0:22a:3670:b08d with SMTP id k19-20020adfc713000000b0022a3670b08dmr16144462wrg.175.1664881888930;
        Tue, 04 Oct 2022 04:11:28 -0700 (PDT)
Received: from [127.0.1.1] (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id j2-20020adfd202000000b002285f73f11dsm15361698wrh.81.2022.10.04.04.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 04:11:28 -0700 (PDT)
Subject: [PATCH v2 0/2] spi: amlogic: meson-spicc: Use pinctrl to drive CLK line when idle
MIME-Version: 1.0
X-b4-tracking: H4sIAKsUPGMC/w3LwQqAIAwA0F+JnRvYior+Rm3VwEwcRRD+ex7f4X2gnIUVluaDzI+oXLGC2gb8Ye
 POKGs1kCHqjBnwTmjPgJu8qEnQk3MTTzOPpoeanFVGl230R23xDqGUH44k59JlAAAA
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Tue, 04 Oct 2022 13:10:35 +0200
Message-Id: <20221004-up-aml-fix-spi-v2-0-3e8ae91a1925@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Da Xue <da@libre.computer>, linux-kernel@vger.kernel.org,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-spi@vger.kernel.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1664881888; l=1309;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=VwbFnbT4s6Zrq8loadTmY7dJAn4b8cAtpYSq0vCjfk8=;
 b=ALRqw7Ymk81F+EKD98wzP8n0lqz1SXA+1jpgAkhjGD0bKd/c1hNj/+juRTPx5/ijY35GLd8dETKn
 nYvLSD/PAPPoxiqap46KsYni9nHo3VvHdH69c3fyHkfj5lzvZMR1
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221004_041132_699677_A81C2507 
X-CRM114-Status: GOOD (  11.20  )
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
Amjad Ouled-Ameur (2):
      spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names for SPI signal states
      spi: meson-spicc: Use pinctrl to drive CLK line when idle

 .../bindings/spi/amlogic,meson-gx-spicc.yaml       | 15 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         | 14 ++++++++
 drivers/spi/spi-meson-spicc.c                      | 39 +++++++++++++++++++++-
 3 files changed, 67 insertions(+), 1 deletion(-)
---
base-commit: 725737e7c21d2d25a4312c2aaa82a52bd03e3126
change-id: 20221004-up-aml-fix-spi-c2bb7e78e603

Best regards,
-- 
Amjad Ouled-Ameur <aouledameur@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
