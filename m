Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124FAC54FB3
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Aug 2024 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vlTeIfdTkKW7HXedFM5QSV9KIIbFllS0tsfyU8v0Zb4=; b=ukkMl6m36DHdAL
	7qBB4lcGK7V2t7bnc7cHsb+wi42ebVrqbabo6lBwbO/7BO43K/wTtlrk8mhmI2CwUCnnTC45aMRpn
	OaGfHrbTgxr9zmQlD74zR0dIZrINEWn8bQMX9m4pRFWfMUcg4j/Zd1QpSBtRh/RzMBQo49NNIQx6q
	2gfDYyRtXXXp0TzTb/wm+T/P39Vn9rPyGeMNbvtVZ8jajrnaD9j3TlDhg5OmPMB2+VFiAEIsL7Hqn
	U3mRQsHSIclWjzIDGLQt6AbKobwbpfXuYx/7EmCowbDwvmrrvCASD2DFDiHVKf0dSHath3cCd9f8/
	uuvRoKeDpA38TUlLTqyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJ98-0000000FcEv-0mZE;
	Wed, 28 Aug 2024 13:55:38 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjJ7b-0000000FbbW-1rsp
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Aug 2024 13:54:05 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-37196786139so4189270f8f.2
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Aug 2024 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724853241; x=1725458041; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PsWzKaC8r3z3iwI7ze5w6BhtUaD0ABZEzQQaTYtnZn4=;
        b=Zpg0NtRw9xMzXxhKecnkyxjV8bzKnIJCgNAuynfTmDI3V8MxNCtAV4bZ/DLgF9qJiN
         tCipYqKUkhJCZoMJ7RxEXeUprAYCMYTQBP7+EKM9fYrMY3BcCqxBtqEisY4W6Vmmsjv6
         RgD+ukfbL4SXKlb5rr/Q/87TNWLTxYIUmZNGpPM3Ak+2415VCuSjdICZvmYSPfdJkCNL
         AtpVDZ//oEiIZLE345BX5jNeTFH+z0lW7qf5dHG9Pi+nbhvCoQoJZ9djmKnOEQr68Xcf
         raJT82XvclvZgxlZkRTyl+qjNiwsGswizA616yBZPPILfbwyd9lnhdKXdgZeJbXwm+3T
         bbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853241; x=1725458041;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsWzKaC8r3z3iwI7ze5w6BhtUaD0ABZEzQQaTYtnZn4=;
        b=A5GF8qP4iACYKMZY6G/RkzGmQ9QHPchz1ad5Zuej/i64uShUXCx/wSQNJ3tTWGmXyZ
         h6sR9bOUn7kH2uT1JYYq5GA+Wdv07SH+XL6xFYtxm4CQVyPDpBlMC6Y07qhJruUPQ4oV
         3GgiVZn1thjLSZONx433Ju7JhdfYSpyhrHVOdT4y3i3niPBFSOT2Zy7BVhsoL4V+pnlm
         pIq55qv8DHxo8JBQkOupaLiyspVaoOgmgMHBcaDUxsQridVivqod46NjhHKxZCD1cZzO
         oIssKN+p+YqxcmgkWZdmikNiaw0nwId/w52zn+RqrgHQMgFI7S6O1WR+VSKm0i8wZZRg
         0wFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmEA7Q+j3WwF0GEqjB4oCOyxsPh5Ine28qLK4zovjBK8FsbzHJh/4uxL6n7/mGMQx+D/6BJXS/r2btCOTU@lists.infradead.org
X-Gm-Message-State: AOJu0YweW+1ph87YzMCXTzcMm0dA0TKE4fj5sB+i1Wx3uK+yUCoCghsA
	lxjeE0XYEjQH0pXSVaBkotq/DpX+dCtQ1cA7jeTzmtgcD+3SM+FI7+IRpSDFdIg=
X-Google-Smtp-Source: AGHT+IGYNhcSsHhA50Pc1ZE3GvXf2OgkY55sS2VidB4C2ZkfpkxCDxWyLcO8SIagveLtAqlTErYVvQ==
X-Received: by 2002:a5d:6111:0:b0:371:a844:d331 with SMTP id ffacd0b85a97d-373118fc172mr10240865f8f.62.1724853240598;
        Wed, 28 Aug 2024 06:54:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730813c44asm15613395f8f.34.2024.08.28.06.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:54:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] ASoC: dt-bindings: amlogic-sound-cards: document
 clocks property
Date: Wed, 28 Aug 2024 15:53:53 +0200
Message-Id: <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPErz2YC/6WOQQ6CMBREr2K69pu2VhRX3sOwqO2n/ARa0g9EQ
 7i7lSu4mrzJZGZWwZgJWdwPq8i4EFOKBfTxIFxnY0AgX1hoqY2slIEpjeTADn0KReeRp4x2gBd
 FTzEwtPRGBjt7SsDRg7PZg3aV0c75oihK9Zhxz5XmZ1O4I55S/uwvFvVz/xxcFEio28vV1yjV7
 WwePUWb0ynlIJpt275XTao2+QAAAA==
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5950;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=W2qT+nbE+KGIf64JgDj7bPJT7KbQfb1ZNolRePACrmA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzyv1/ZMuhoHR5pewIyF5Gq+f8UGw7T/m3E0Pig6d
 v47cuCGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs8r9QAKCRB33NvayMhJ0fnGD/
 wLvs8Egp00XPNWKHBIC7q7bcXodhwunPgAOFqpH1cksGb0adPigFWPnTjhBvqwGGGhOJgriDhoRAGb
 1woPAgTxo96yPq4y/rOUeYrDphxqx1JrATxTausbPL90AyGRCD0kUMfk/RrnLy69k5xWohubgGA7fD
 nT+qmhS1Krsub6kIvmu6KMX6AJctbDhBXDxCBY/hEIkmVWSoTlA9uBYBYQw0PVSP5+QuaIwEGAlA3+
 ka0JH8r1kSa4pLYwgrulUHpSS4xtUX49o+krg25UcEbWwr4fVcebHkCILobKPdcs1W1zbK7Okl0c4u
 XrJzhrUcnK6wWuPaLy/NGi1l9+eFP4wSYm+v2t32Q2OzTZruBpI90pTUCpmoAd9RU/zAKctieznRQg
 U8Ss+nck4wPHvbUN84+uY+6mny4pnIfE30uezrObARDrMwHc9Hdl9XDX+kPXGK9zyOXNSAkgpXQmws
 TL4VoO5Hnr7I7SzygZhESUanUjzbwAAVFu3ujUkgUfUworJRpTejrKHjip2S3BUjE1TWq7kkGflz4F
 gMCH9XdPE/ix4Osjkw1SIs/vONUpn5MsV83r5SoaeYX5SFz71RtFuk+RmhioViGTCg66piwhgE1J7H
 AuQTT9amtEy4KQ4/kHU5kwamsatOXJulV86VZ9vNbOpLdsv63fmrqMCDvzVA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_065403_565421_F85BCEE8 
X-CRM114-Status: UNSURE (   9.01  )
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

It has been agreed documenting the clock in the sound card is a better solution
than moving them to a random clock controller or consumer node which is not
related to the actual meaning of those root frequencies.

The patchset adds the clocks proprty to the bindings and finally adds the
properties to the DT files.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- drop clock-names in bindings & commit messages
- fix new boards
- drop RFS
- Link to v1: https://lore.kernel.org/r/20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org

---
Neil Armstrong (3):
      ASoC: dt-bindings: amlogic,axg-sound-card: document clocks property
      ASoC: dt-bindings: amlogic,gx-sound-card: document clocks property
      arm64: dts: amlogic: add clock and clock-names to sound cards

 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml          | 7 +++++++
 Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                     | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts                    | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                 | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts      | 4 ++++
 .../arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi               | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts                | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts         | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi                | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts                 | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts                | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts                    | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts                    | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts         | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts    | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts             | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts                | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts                 | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi                 | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi        | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts          | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts          | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                   | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts                  | 4 ++++
 52 files changed, 217 insertions(+)
---
base-commit: cb2361c78068ec47c3a6222d71f664b67665550e
change-id: 20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-2c642ccd2c6e

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
