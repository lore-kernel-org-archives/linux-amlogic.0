Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B77CC61DA4
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Feb 2023 18:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V1mtUMuFp0rjGzDsrMi/E8vgUCOavkuaFV1lajCfTTw=; b=IuAQE6T+PmulMj
	QrvcP0i7bRzFGwLHVRz97D6Ch9RmkzTT+5H1mbrt8TudK9N1/DDaGeCU1rx2VdR7RMv0PSHR8JOJt
	2P+GiWqqrqwu+zyWanITIgJ3GYH4mZLEgYRpLolqpPU/jN6V5IPbymNbkXHc+2X1oPl1vdvVi1k2r
	9OnpEvtZ/DLBpOQ90n+3BfF9CIYLPWSRonHPq+lk0b1I6QSyS74y7btHJVzTBwseIkcY/LgDxNnRv
	VUA9BgsLLNyKgQFDVnJhSbhh4ZxDs/t1lMCPxWJI+MLb7hKec4m7jSww/jjfqjgW6yEmcDvFcUxEH
	bkMEZGQxbknsSM2bh5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSh-00Gy22-QN; Thu, 02 Feb 2023 18:37:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNeSd-00Gy1G-HR
	for linux-amlogic@lists.infradead.org; Thu, 02 Feb 2023 18:37:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id bk16so2534958wrb.11
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Feb 2023 10:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H85BNtbicOdZEb38uhjtGBMxJZW5JkXIotuHsx7Jfnk=;
        b=IbFgd4TJ33+H4SaOwRyEWu6cWJiQiPeX9lhQApCcR7ems5iUP2ftxi1ogXy60RDAH3
         EQB5FEo0lzHU016yPfz3Gl0swVHOUsKVKlXteWQI40qYhCT6YWBM/ZZtLck1TpU+HdJF
         oiUWrOki6KugGbsRQ0bo0aUuADU2QZEr3VUD58M8KhGjy5GPcDjaHUFnxEFJuyrDEqZh
         rL6IHIAKB6OGmXwnjw1Qc7KXXM4YXNuKQzn6x1yT52ZA+Temm2XxFL+dxOV9dacF22Y8
         EIsPjJlVBSVT4QNR/qfs5kNDYvzjK8dcFTjsZ5ThvMYirB+641tpIWORaVrYJDGGjwiN
         bGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H85BNtbicOdZEb38uhjtGBMxJZW5JkXIotuHsx7Jfnk=;
        b=muP43fiba7sVxyzlpgQd5i73AG2eDKtB9+w9MmUfZr5nWbxWRBaL/ah6+vb4r6DvOf
         dUNPXlaRFOtIeWMCw64XL3s2//fhFiX9f0yUktN2jsWSrLBvoOfNNf+PSsr9+pMctDIX
         9Ao6RcJcVRt8pPhVsQ2m4FGNC6eVP7qXxIkMbjBMt5zX9+E55u2czTJQ3Ydn575LYxXp
         WnR+buio9dr2JpLEaO0Rx7lKE046yqWV0JVtOJ0zJdaqieMKUHLuNy3+NFhUJVKCqTFA
         v6npRt/zSu5sKGTVtEM9gSAsErlJx/6+6kCAUTiQE+WDSBF02+hXUqVsJiWkdFoG8oK8
         BYaA==
X-Gm-Message-State: AO0yUKV1j+XizwHgbb1DjmH4/golhcEKY00Vun8EmA6tRsifHsjT/zOT
	fWbV9qKksIk90rYt6Sh+3ag7UPFqj2Q3kLe9
X-Google-Smtp-Source: AK7set+VKQzzzrAghb4KlHvOyHw5gRfGxFCvlSyBRvRuD7rBtzhM9j1p4cLIk2Ze/JvU6OPDnwyIHw==
X-Received: by 2002:a05:6000:188f:b0:2bf:bd69:234b with SMTP id a15-20020a056000188f00b002bfbd69234bmr8166688wri.32.1675363043086;
        Thu, 02 Feb 2023 10:37:23 -0800 (PST)
Received: from localhost.localdomain (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id p12-20020a5d48cc000000b00241fab5a296sm164664wrs.40.2023.02.02.10.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 10:37:22 -0800 (PST)
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
Subject: [PATCH 0/9] ASoC: dt-bindings: meson: covert axg audio to schema
Date: Thu,  2 Feb 2023 19:36:44 +0100
Message-Id: <20230202183653.486216-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_103727_824072_A8B4E82F 
X-CRM114-Status: UNSURE (   9.64  )
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

Jerome Brunet (9):
  ASoC: dt-bindings: create component common schema
  ASoC: dt-bindings: meson: fix gx-card codec node regex
  ASoC: dt-bindings: meson: convert axg tdm interface to schema
  ASoC: dt-bindings: meson: convert axg tdm formatters to schema
  ASoC: dt-bindings: meson: convert axg pdm to schema
  ASoC: dt-bindings: meson: convert axg fifo to schema
  ASoC: dt-bindings: meson: convert axg spdif input to schema
  ASoC: dt-bindings: meson: convert axg spdif output to schema
  ASoC: dt-bindings: meson: convert axg sound card control to schema

 .../bindings/sound/amlogic,axg-fifo.txt       |  34 ----
 .../bindings/sound/amlogic,axg-fifo.yaml      | 116 +++++++++++
 .../bindings/sound/amlogic,axg-pdm.txt        |  29 ---
 .../bindings/sound/amlogic,axg-pdm.yaml       |  86 +++++++++
 .../bindings/sound/amlogic,axg-sound-card.txt | 124 ------------
 .../sound/amlogic,axg-sound-card.yaml         | 182 ++++++++++++++++++
 .../bindings/sound/amlogic,axg-spdifin.txt    |  27 ---
 .../bindings/sound/amlogic,axg-spdifin.yaml   |  90 +++++++++
 .../bindings/sound/amlogic,axg-spdifout.txt   |  25 ---
 .../bindings/sound/amlogic,axg-spdifout.yaml  |  83 ++++++++
 .../sound/amlogic,axg-tdm-formatters.txt      |  36 ----
 .../sound/amlogic,axg-tdm-formatters.yaml     |  90 +++++++++
 .../bindings/sound/amlogic,axg-tdm-iface.txt  |  22 ---
 .../bindings/sound/amlogic,axg-tdm-iface.yaml |  59 ++++++
 .../bindings/sound/amlogic,gx-sound-card.yaml |   2 +-
 .../bindings/sound/component-common.yaml      |  21 ++
 .../devicetree/bindings/sound/dai-common.yaml |  11 +-
 17 files changed, 731 insertions(+), 306 deletions(-)
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
 create mode 100644 Documentation/devicetree/bindings/sound/component-common.yaml

-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
