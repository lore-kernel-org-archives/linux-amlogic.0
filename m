Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D745C636D3
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Feb 2023 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Keaeq+dTQserTo/+r7ygPPO0el0F1AzFT4uqQmV1QTs=; b=hBdmK7zQzMpuLo
	A4tGdUJxkwPktc0atMSa3+1bsOq+B6o9rRzeiQILkpa5rEhdBFvC8+7fzDCQ7dU5/450yNY0jbnEw
	Luqn3w++EiED1IbSbBQ9XVBchUDIIq617x/GWADzB6TH4V9hCzt01sSNHW9X2QPoQ8gFcueeml30c
	zGKFL7+8jtt3D/RqDAPnZ9QSE4pTR5CDViOSd0vXFMAEk5bt3bYrzpNAwBf2kXP5Z+pSVcxNJxXzh
	HVVICoZbz84pAm1TTUK5HvW775sYbHE9kWmz4W8kztWtxqTpLHXJRWbgJiutWZHQ94btO4oTPwfN3
	RGBh1M28C+45gcZ0CnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP41t-009C3n-Dt; Mon, 06 Feb 2023 16:07:41 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pP3WF-008wYS-SD
	for linux-amlogic@lists.infradead.org; Mon, 06 Feb 2023 15:35:02 +0000
Received: by mail-wr1-x42c.google.com with SMTP id h3so2924038wrp.10
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Feb 2023 07:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pmo77UKoMzXJKQUoQ1g2vDSwLCWdCS5ldkpiJoejADo=;
        b=EmRe6OclOanTEHjba9UzNYrndAHNwQl+yKbKfLh/5PMne20zgrSKN1FV49IGkc5iz6
         qR2HJl8y5sGzInCMlnrLmSn6wxJTfbZImIPB7qhNUxD0iJJmSKruPrjjpOBAwqUa+HtM
         YMix0G2KJDeK8vu/BIOnWLeNUcBDMW5ZXiczIDR3hOOknTXjG26VoLur/VfHALQlba9G
         kKzcVKRb90kC2bM328TYUdLGkaVD62IPETxEjSa8RwhdDf6pOFSMiY7bLpCH9RpMP/Cr
         w4GySQt+OhjaEHNgUFmiW6DDSGGxgXLTleAsZ7K7N6vkKErW8E7qmBCftHw20hc9umjL
         ZtQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pmo77UKoMzXJKQUoQ1g2vDSwLCWdCS5ldkpiJoejADo=;
        b=iv9umOQxKgBR2L1lBUqQ9Qn/oRqDhU9gsNuNhLkRb3vTa9nMnw9PThTBlSaWtUeAjR
         EYhFs4PH57ZzpTWoQMNA3mqyDifEWaVREm2OCzEuI8i6FMoFR6fm0zZHkbqsQbG7IGqA
         wDJW7gYhINXHv04XNnf9AKY6d4S+VbD0/O15MZGSCAT0fRc9emMS9leFZB2Rx+8pQ0dU
         uAyUoOGdgZZxVdDQLCayiKWRQHkVzSJ26LiYpKY9rRLt0aE715c+kGNg9nIuKRgQ8N7L
         cB7T1N5Hh/f0T22VMhv99KozH47STGZqm7oE1ZuMdeEhAKbjWFRrSviK5WMddOgFOFx7
         kMpg==
X-Gm-Message-State: AO0yUKU66tq8zeZpwCPlU3LtqavYiQd2hQlRU0B//RwuBYXfq2TVXU85
	sR3UjT/bqVbt27wTkTRbL7LvyA==
X-Google-Smtp-Source: AK7set8VgB8x+u2fKo/xUB5QQ/nIAphdD6XyVN1SVaEXvN+z54+kI6GdvhBPc7hl+Iv0AoY2gWQUMQ==
X-Received: by 2002:a05:6000:14c:b0:2c3:dceb:4743 with SMTP id r12-20020a056000014c00b002c3dceb4743mr62208wrx.57.1675697697416;
        Mon, 06 Feb 2023 07:34:57 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e12-20020a5d500c000000b002c3ea9655easm2197317wrt.108.2023.02.06.07.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Feb 2023 07:34:56 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] ASoC: dt-bindings: meson: covert axg audio to schema
Date: Mon,  6 Feb 2023 16:34:42 +0100
Message-Id: <20230206153449.596326-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_073500_136506_DE8F9281 
X-CRM114-Status: UNSURE (   7.95  )
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

Convert AXG audio dt-binding documentation to schema

Changes since v1:
* Drop 2 patches applied with v1
* Drop node name patterns
* Fix examples indentation
* Yaml fixups requested by Krzysztof

Jerome Brunet (7):
  ASoC: dt-bindings: meson: convert axg tdm interface to schema
  ASoC: dt-bindings: meson: convert axg tdm formatters to schema
  ASoC: dt-bindings: meson: convert axg pdm to schema
  ASoC: dt-bindings: meson: convert axg fifo to schema
  ASoC: dt-bindings: meson: convert axg spdif input to schema
  ASoC: dt-bindings: meson: convert axg spdif output to schema
  ASoC: dt-bindings: meson: convert axg sound card control to schema

 .../bindings/sound/amlogic,axg-fifo.txt       |  34 ----
 .../bindings/sound/amlogic,axg-fifo.yaml      | 112 +++++++++++
 .../bindings/sound/amlogic,axg-pdm.txt        |  29 ---
 .../bindings/sound/amlogic,axg-pdm.yaml       |  82 ++++++++
 .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
 .../sound/amlogic,axg-sound-card.yaml         | 183 ++++++++++++++++++
 .../bindings/sound/amlogic,axg-spdifin.txt    |  27 ---
 .../bindings/sound/amlogic,axg-spdifin.yaml   |  86 ++++++++
 .../bindings/sound/amlogic,axg-spdifout.txt   |  25 ---
 .../bindings/sound/amlogic,axg-spdifout.yaml  |  79 ++++++++
 .../sound/amlogic,axg-tdm-formatters.txt      |  36 ----
 .../sound/amlogic,axg-tdm-formatters.yaml     |  88 +++++++++
 .../bindings/sound/amlogic,axg-tdm-iface.txt  |  22 ---
 .../bindings/sound/amlogic,axg-tdm-iface.yaml |  55 ++++++
 14 files changed, 685 insertions(+), 297 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-pdm.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-sound-card.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifout.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-formatters.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.txt
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-tdm-iface.yaml

-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
