Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D133C27C55
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ijOiXWtsEPoJjnrRBME1g8R7tL9LQEjo9iVIpQHSESo=; b=QaYI6EBEbDk4oc
	ZwjS8Qs9N2DILLDp+37yO2ODBhMfRPmwu9ZsvT5QnEux9pLdsJD6BWV5/y3dxvxcLTdnZXcRpLyFC
	sPVn6TLl0NU4bSsNzku+MWJaPvHm0EmJgxtYMvDlBVb+JDn+P9BcUbYp/skzv9nzhFAIIzJqT4vWl
	+EQFqfV12Rvnfq+clRk7rvUP8yU3L6p68Y5WahU/hL6hIYFCd6Z6cZ2BSRVj/TnZzNmGBlPb1EsJW
	uSLTYAqwlfxHLQoQJheLsMzwI1/VtLuVabh871v2hR4V5GZf5cFCaP6lyVQKNPjXZh0e/FcWKJtqX
	TfdkkVBIe6p0kVOcglqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nG-00000008uIW-1mSO;
	Thu, 06 Jun 2024 08:48:22 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8nC-00000008uEr-1PkF
	for linux-amlogic@lists.infradead.org;
	Thu, 06 Jun 2024 08:48:19 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52962423ed8so856151e87.2
        for <linux-amlogic@lists.infradead.org>; Thu, 06 Jun 2024 01:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717663696; x=1718268496; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=clNoI1HZOlvZDlF+a49KVrl+gXHl7hyV1SfXg3I8Hww=;
        b=HgI8LgVrCSG/avOdsb790a52JAcEpuQcPI4bYxSPAwWu/YfxVb31FxL6RJxgr8SlTo
         8NUQ5IdwNkq86Ls9SC24MOuQLkwN12hw5PX9e1csSzNb7fpEb3vjYmnGCyfZB5wb3c71
         dGMv5E8OV6trZ1gyhEm7Tr/Q7Xpnkq44GjRUlT6Cx0AGxGEK6RfxTQoD1pM1M3hLSGJ1
         5hMZHsXkrz8F64ZRTASnVKWQ+sT6GcNtPT+IFmiL4vmhL9+jrIi0SVtDNjdxkB1YLDie
         RqlfVl36AdhOguaxhU73zSEwveVwpx8+9YAnNIf3XUpSOVLn6GD2r/pNON8AfxCXpWSm
         7GqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717663696; x=1718268496;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=clNoI1HZOlvZDlF+a49KVrl+gXHl7hyV1SfXg3I8Hww=;
        b=lgLY1R8wH/zedyBi2M+Ewu55Egh1Z5TT3JwMGDwFHfJHBypb39cwxfqDVu+Utv7Dfn
         Y1a50PUZDXh5vTvoPbhCk4VPbesQmKKd19pn9cYJN4/J06ERy8o5twnLS9Q0eDNVn8NT
         vVCtDZ2NVwEow1O5b65vV175I+Ar8f0/5nNq2qbosoG+sonAzH3KzERO7PXCuQrxdDrZ
         idTeSX91rup74ypH5oiBpSdryiMh9Pyi/0etve6eHqQcxhzq/uo2/Zi36Z8ocGS4Ogyr
         f6RjFRKx6Xc71GpGJ/H8LQVehRjkt+LfDqiBDB9ZgO78lkPhKnp1aAScqhNEj4S8GkkM
         QU+A==
X-Forwarded-Encrypted: i=1; AJvYcCU7oQOQheVahm/CVXw9FUMPKvVuYPYS7Ft1DmJlPFZ6uiIc0/gaE9Py4W01heqihx93LmO72iu8SQVboiyab5gPsmJiOR6Ha9miHC+1Z5T91EY=
X-Gm-Message-State: AOJu0YxG+ex5J+S3AA8AzhfJ441qpqAIua0QBL2ZoQjdnAyP0/rD+9sF
	it1C6VDgO70mJPZt07iMHYjfG5HWlZtm9gKrOSix1w/8H4BAmK0aMIB1m17SL4A=
X-Google-Smtp-Source: AGHT+IG/yuLE8o9z5rgP9gmN4unUSaVfCH4FIg5olqMGVJEGljKPXUFa/spz1zuCEqFtz/oo7RbWcQ==
X-Received: by 2002:a05:6512:614:b0:52b:8610:a7e9 with SMTP id 2adb3069b0e04-52bab509c6cmr2931872e87.62.1717663696062;
        Thu, 06 Jun 2024 01:48:16 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215c2c690dsm14227445e9.34.2024.06.06.01.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:48:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 00/12] arm64: meson: bunch of DT fixes, take 4 (final one
 ??)
Date: Thu, 06 Jun 2024 10:48:07 +0200
Message-Id: <20240606-topic-amlogic-upstream-bindings-fixes-dts-v1-0-62e812729541@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMd3YWYC/x2MQQoCMQwAv7LkbKDWbgW/Ih7iNtaA25amirDs3
 w2ehmFgNlDuwgqXaYPOH1GpxeR4mGB5UsmMkszBOx9cdBFHbbIgra+aje+mozOteJeSpGTFh3x
 ZMQ3FSPPZU5rDyQewX+v8j7a73vb9ByxXC697AAAA
To: Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6130;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Z0NNIzHhaWZJ143ndEEsLQVnT+L4J/ae06XwwJbYU10=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmYXfJOh1HVavEBIRhO4ENEnVQkyDOfpbdd/oGJ13K
 kSxAAcmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmF3yQAKCRB33NvayMhJ0c4lD/
 9TuwdUpGz16RXXBi7HFVOXHBvWhlCIdtkewCvf/dxxRj+RGof6VXA9ekyfV3xZ+xMaOomyebezNkEy
 yCUPsVz4Y1gfxmT+A+8uJZujmflqTEABsMQCuhTXLVLQz3HiK6i8Mz+QbWSBGWAu14MnIupvQ94cZG
 dZrukB4XCed/JKJofENpcCPUz3Wvskz/7w/+n7WkApQymXtziTbj8RPmznHGrD5rfeYYrHR9SDX/n0
 jdoVzCqCI5C1U6Jkkn8njJAFCSEm/sP0m+3Kr76KTaTKhNzqMp1GWCAa9Pd4Sn4DOPIPRZ5x754Dp1
 zfoTHtmz6h7+7gGMYp24mlgMUmeR2RGFt5hJpDa/t0+vKnpzlm9UdPefLfQKmqFblHBvVKApPnfYKt
 fjpWMP/y1BJjKKeixTu7LhV8h9BYo52AHek88qE7OzaRDk19NGkF5lAV63fteD/gz99leLuU1+VVYs
 +H6hmw8HUoOKJaeheAobVQTLPChNaTo4MDke2K/3kK6lXieUltS1sc1j11WyoY3cU+o96+zjUQT2Va
 kbanoG/IE2qcNT/fzY7tJMSgBdf64EQLr9JazZspEXMT2O22cZyWPIW9vDSnFQXbX4EexWrOQDxE+D
 mGReQwAtAt5gJjm0yCGXw7fLtY/+SpL7fza3hp8uRupH1ryf5o77W307Y+nQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_014818_456318_9D53C137 
X-CRM114-Status: UNSURE (   7.25  )
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

Along with the following:
- https://lore.kernel.org/all/20240422-t7-reset-v2-1-cb82271d3296@amlogic.com/
- https://lore.kernel.org/all/20240513224552.800153-1-jan.dakinevich@salutedevices.com/
- https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-spifc-v1-1-380f29ba4a16@linaro.org/
- https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-convert-spdif-receiver-v1-1-262465adbac2@linaro.org/
- https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-mmc-v1-1-4acbb8cc2626@linaro.org/
- https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-nvmem-v1-1-ef6f10c86a63@linaro.org/
- https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-phy-v1-1-c819b0ecd8c8@linaro.org/
- https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-rng-v1-1-0a55a7ba55e4@linaro.org/
- https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-audio-widgets-v1-1-65bd7cc2e09b@linaro.org/
- https://lore.kernel.org/all/20240605-topic-amlogic-upstream-bindings-fixes-power-domains-sardac-v1-1-40a8de6baa59@linaro.org/
- https://lore.kernel.org/all/20240606-topic-amlogic-upstream-bindings-convert-g12a-tohdmitx-v2-1-70d44fa30790@linaro.org/

this bunch of changes fixes 99% of the remaining dts check errors.

The two remaining bindings conversions for arm64/amlogic are:
- ti,tas5707
- everest,es7241

I'm too lazy to do them right now, so if someone is interested
in doing the conversion, please do it!

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (12):
      arm64: dts: amlogic: meson-g12b-bananapi: remove invalid fan on wrong pwm_cd controller
      arm64: dts: amlogic: move ao_pinctrl into aobus
      arm64: dts: amlogic: move assigned-clocks* from sound to clkc_audio node
      arm64: dts: amlogic: sm1: fix tdm audio-controller clock order
      arm64: dts: amlogic: sm1: fix tdm controllers compatible
      arm64: dts: amlogic: g12a-u200: drop invalid sound-dai-cells
      arm64: dts: amlogic: g12a-u200: add missing AVDD-supply to acodec
      arm64: dts: amlogic: axg: fix tdm audio-controller clock order
      arm64: dts: amlogic: c3: use correct compatible for gpio_intc node
      arm64: dts: amlogic: a1: use correct node name for mmc controller
      arm64: dts: amlogic: a1: drop the invalid reset-name for usb@fe004400
      arm64: dts: amlogic: gxbb-odroidc2: fix invalid reset-gpio property

 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi        |   3 +-
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   3 +-
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |  17 +-
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |  24 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 427 ++++++++++-----------
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts  |  16 +-
 .../boot/dts/amlogic/meson-g12a-radxa-zero.dts     |  16 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts  |  16 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts    |  18 +-
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts |  16 +-
 .../dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts  |  18 +-
 .../meson-g12b-bananapi-cm4-mnt-reform2.dts        |  18 +-
 .../boot/dts/amlogic/meson-g12b-bananapi.dtsi      |  30 +-
 .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  16 +-
 .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  16 +-
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  16 +-
 .../dts/amlogic/meson-g12b-odroid-go-ultra.dts     |  16 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  18 +-
 .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     |  18 +-
 .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    |  16 +-
 .../boot/dts/amlogic/meson-g12b-ugoos-am6.dts      |  16 +-
 .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |  17 +-
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  18 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts |  17 +-
 .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts      |  17 +-
 .../boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts    |  17 +-
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  19 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts    |  17 +-
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts    |  17 +-
 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      |  17 +-
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts      |  17 +-
 .../boot/dts/amlogic/meson-gxbb-wetek-play2.dts    |  17 +-
 .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |  17 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |  17 +-
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |  17 +-
 .../amlogic/meson-gxl-s905x-libretech-cc-v2.dts    |  17 +-
 .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |  17 +-
 .../boot/dts/amlogic/meson-gxl-s905x-p212.dts      |  17 +-
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |  17 +-
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |  17 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts |  17 +-
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  16 +-
 .../dts/amlogic/meson-libretech-cottonwood.dtsi    |  16 +-
 .../boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts |  16 +-
 .../boot/dts/amlogic/meson-sm1-a95xf3-air.dts      |  16 +-
 .../boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts |  16 +-
 .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |  16 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts  |  16 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi  |  16 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts   |  16 +-
 .../boot/dts/amlogic/meson-sm1-x96-air-gbit.dts    |  16 +-
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts  |  16 +-
 arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         |  36 +-
 53 files changed, 679 insertions(+), 630 deletions(-)
---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240606-topic-amlogic-upstream-bindings-fixes-dts-6a572ad54324

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
