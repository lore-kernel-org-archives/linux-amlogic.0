Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 938C4C27C77
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DlYva6sDN17em6T95qpoHguIyuGLHS1zXhbQccSj0zw=; b=cIrQ5nmkdTV+IC
	J7t4/88Qf5+MIg/DhTBgmAVs8t/7D9Ai47yWX/MJ4SxMwEAk28dVh9nIGM5GpdPQxJ7YHCEtLZKCw
	MOsyoM65yJLRNzHfeX7h1WtLfbozCBlV2WcPmDbCfIolihM/59bB/Wnn9Kus7R91V1yyvwkX1FGg0
	7gLQ3wlpbmsBILELJ335sbP+AC5XP0HZJ/787Z2NC2xgvHIHN0wIHwBcqg0N3hX3nJe0VpED3YzEk
	CAVVtDvOi1KYE6iSyplMXe/Tys/bUbTBV/zSajb4rTcgVe3ejsgrJV9WKviU6gBTwM2xDjoz5aDwR
	hNabBbpED8Nb6FxSatKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI9in-00000003On6-1Qk8;
	Fri, 14 Jun 2024 16:24:13 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI9ik-00000003Ojj-0zzt
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 16:24:12 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-35f090093d8so1908741f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 09:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718382248; x=1718987048; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=put13URUC593SztdFC6LSEgjQ2u1ih6bSw5FHdIqhSg=;
        b=O4G0XCz7yojetIAaFFMm/m9JAAQT5Lm+FwQ1nLc94X1CldQXLSBSl5isYdClsGO8kK
         TNRwN+bUwpBFZSIDZ75ZUnghVqKzFM4LBs0p/Rf3zSipFXkqtaN83yvu8QGKbkbIxjXT
         YItrVAXAP+GEIXUkYH2E2OfrbJILWT7VcEGrYFGuMt+SMk36hS7MYWGPpHpU8hWHdo7b
         1Sbx0STAMiAkhL+rh7Wy0qriPT3JqQc1fZ4Maxk9vDrTl4YaZkmQ9zsG3GxHLUdMyKXg
         xTe9kbMAr/lNbiHM0FSGkQfJt37nC+PUejQBrD19Fp2aVNLrSKcog/4ZtZdxoCxU24mJ
         tN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382248; x=1718987048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=put13URUC593SztdFC6LSEgjQ2u1ih6bSw5FHdIqhSg=;
        b=Aq0svubjBAj3Wb35CKXAs9c3eYC8PzY4KyEdFzYIYDvNurlvEDNVG9voXw7HzFNqni
         pCX85s+wm+W83lhPoRi9geUJOAm9ugaNmK1mjIj0vobgfSHgWpONWebRksDD+gLehfbX
         Ya+mq+XNJ8lFWRVG2XAy9OMtFFXXrg17tyzoIb77RoN82XOzCbTooVyLXyz4X8WZ9iHn
         oO9nuXKvG7wYYCGtA03vcYQxJ5OajuTfWU1oTsrrNZBbELQbbCp1nRcFYS1C7Su8HCXh
         39No+godTljRVaNuxAgicMR7li2NoJcSrj27qWEyZ+GxP9P3aPC73gxnMchmudaw/r8E
         32TA==
X-Forwarded-Encrypted: i=1; AJvYcCXTe6AQ4vqUbQG8WTNsWJKcfFYbbwR04M606lHZC1h8WmGyYOhvc6RRa8NZG99BTtpWk+/GO8+MEcbxMCgvkAteOBbC5YSK5HJKyegazXQtotQ=
X-Gm-Message-State: AOJu0YxLLxmNyfBTp1yupQN1NR9L/gsXXGZ4xSC+T9fB6Sp72jwqID2R
	hWw2hEpigBTe7gQInnqa0cRKeB8Nqt6ut46AZMtLyGUzu2zK/08Hci6qDFyBSIo=
X-Google-Smtp-Source: AGHT+IGMFRVbIiEZo+RBebjVEl7ueTmXDg735LDtznnpXDovGqgeT6L/jaYzgZuAW+s/dO7labznUg==
X-Received: by 2002:a5d:5187:0:b0:35f:1f23:691d with SMTP id ffacd0b85a97d-3607a780dfcmr2520291f8f.61.1718382247778;
        Fri, 14 Jun 2024 09:24:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36074e0e5adsm4931165f8f.0.2024.06.14.09.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:24:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 0/3] ASoC: dt-bindings: amlogic-sound-cards: document
 clocks and clock-names
Date: Fri, 14 Jun 2024 18:24:00 +0200
Message-Id: <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKBubGYC/x2MQQrCQAwAv1JyNtAuSw9eBR/gVTysSVwDdrds2
 iKU/t3gaRgYZgeTpmJw7nZosqlpLS7DqQN6p5IFld0h9CH24xBxqbMSpulTs3OdbWmSJnxqYS3
 Z8KVfMUwra0UrjJQaY6AxBiJ2Cvh6bvLv/HyH2/UCj+P4AfjpwlOLAAAA
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5357;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sS9FsJVE243d0WeteqT/1ZGnFSB10RXVtcZOuky7qhI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmbG6lSLFDzo9pAh0PJ4DgWo/c5jJ2/VmjIS/DLHYZ
 5xoXzd+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmxupQAKCRB33NvayMhJ0XUiD/
 sFiFA1YgFp0/JZkEYOqbL3rvO5Ws8p5jo26BTDPI3abVKhJ8E2pvYLkHQ7pEsDdSqIZsbRkxYVODd8
 j1k/Nllu1Nil/h53HBA5l7BIAr0GOOy6huIrFZrIFCUI5YMBupf7eenYc1swD1F9ljt/aixxyFFZo+
 iU5iaG6wcY9PEUMC/RATkdnue29TYMTkOwiSAYOOQHhE1wZm2zfGUTlO+MIgXPxsiRbbVIE3M/mF0v
 hcziJDFbG18tEUFoSFbsjY5VUu1pXNp6HwZabdqohCjagdm3jZrRyJX0r2rpeMXhLvGhEIeqliNa/l
 6L9Sn+pRXJ2qONmsd6eo1L//s1F3CC72bpG82oWIpDa1CKYOoQp1nfaAvGesI7czBcTrY2rVxe9tNB
 fLNEhLsbochDN3GrJ5JEBaw8h22vvDzpBp37nXxSD6EMSBh6zQwdFwfmFpvbpxQN9l1z/M8LV3eumf
 kEW99rNM0vUFhVMkeM78RRYjU3xxu5f2nYpBi4paPihxzGxQ2jHqq9f65MyXvJtIf6UClcilYVNXFZ
 5tSP/QSpE9b0syvfZSvfbxS3l2BinUfU0Hq4Dv0IVRoj0O/AJwoimDg45qIIDlnhmR8/Ky9Buyi4Zm
 8JjtT+8HFX0VpoHmIoFx5H0v+UMi7MZxNRY/WCaMfsiojsmLWD5jcWLR5pLg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_092410_334238_806D606A 
X-CRM114-Status: UNSURE (   7.93  )
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

Following an off-list discution with Jerome about fixing the following
DTBs check errors:
    sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
    sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
        from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
    sound: 'anyOf' conditional failed, one must be fixed:
        'clocks' is a required property
        '#clock-cells' is a required property
        from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

It has been agreed documenting the clock and clock-names in the sound card
is a better solution than moveing them to a random clock controller
or consumer node which is not related to the actual meaning of those
root frequencies.

The patchset adds the clocks and clocks-names to the bindings and
finally adds the properties to the DT files.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      ASoC: dt-bindings: amlogic,axg-sound-card: document clocks and clock-names
      ASoC: dt-bindings: amlogic,gx-sound-card: document clocks and clock-names
      arm64: dts: amlogic: add clock and clock-names to sound cards

 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml    | 12 ++++++++++++
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml     | 12 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts               |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts              |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts           |  4 ++++
 .../arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts |  4 ++++
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts          |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts   |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi          |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts           |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts          |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts              |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts              |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts   |  4 ++++
 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts     |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts          |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts           |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi           |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi  |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts    |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts    |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts             |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts            |  4 ++++
 50 files changed, 216 insertions(+)
---
base-commit: 2ceb903a0c515872bb0ca0156bc4e568651f1eb4
change-id: 20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-2c642ccd2c6e

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
