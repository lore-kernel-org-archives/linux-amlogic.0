Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA17C3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VkE0sZXJdo1AY6uyAQ+uawvbDz+FZjsgDsRw+jhAYtc=; b=sDwHq55tXyefJp
	RWxZD/IdEsCxpdOXj/82uh2yLk71H5LKFC0s8xNsnKEDGre2wSv6yZMrgv07siwSAAWan3GUa4Q2K
	l1sebdoNXZQyKABvH040zhKQqriq22FDYAwEPBWjpYSJrO6+B4KrwxQPrRpkGfZGpN3dZuGj8Ebun
	/hMSc3EdtYhTZfPcP6mYmWgd1dY6+QQrn8Ge9AfLPiCBGCLKSfJ3L4JQzoUfZjUTRJH6L0APfM++J
	RQXmB107cckPABSmfW0+x0a31ruPC9n6aaxTKSZtvGpr/sPeCQnXqkpLkHs9EVGCLR9++acT9CGt3
	Kc9riXByiMXwRyPC6+AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6mv-00000003NEQ-1cqo;
	Mon, 16 Sep 2024 08:08:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6mq-00000003NB0-3UXW
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:46 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-374c8cef906so3251448f8f.2
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474123; x=1727078923; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPiai5M60RqcO2MrqKnmNdVu0WGeSw1DQNJICr9QeyI=;
        b=hXfjZi4ag1TgZJ6FxMUlX+zlbTiE14oC1l2nwW4KT9gsztIz8D2vf38c61NK2cHbIu
         cBLDejnvnvt7ECQgxIf0Z8D0yD7tOCnWBWshmiXNZthcUajoXXUeJ4vTlUN7YB3cwRr9
         QlkZHb1N7Fea+AgX+7K4mI2BxyG+CY0XO3DVonBrP31jeg7fEiyIi/Pbmp6qYXYuJz7R
         B9gzqOwSG9TrKGeDvmAy3R32nyiDeSMO/LIUtuwkNFjYcaDbN4bKNjmManZcEEpWpi/F
         1sa6BT6MruN6z+aC37YMODcAB3U48OlZEGgw+zRcyRelhQVyiFNBDn5kQmx8ioJpUkLH
         2PrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474123; x=1727078923;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPiai5M60RqcO2MrqKnmNdVu0WGeSw1DQNJICr9QeyI=;
        b=gHhlChSflkZ+X+LUmmnEo5pedX2liTkVQexCCYAFBDKlh3bMsiLjp/88voBzGNigcs
         l7bVmIqN6RFnpZuhrCQbLYAuV/dvoH86bMxvyK/ZUXIu79VZE/9yjbIGFSi8lMnC7v+7
         1PESjkx6aLEPX4y1secBQlZj8hpowuKszaVgu8IJgv4h9hp1q6NgEK0K1poLcFE1McsN
         TQQkLbhaRh9tvRmlWIY+KPAuxYPXU6fbu90n4iZU1dtvvloCilm6sw1PVNO4LZSHcEUX
         KAwoed3mX8o+e54g79dOuvW0TKCB4ItNR7ZTxLWKZDn9K9sVmJtlPFovNFjKq1KSKk9u
         V3pw==
X-Forwarded-Encrypted: i=1; AJvYcCXAa9Z3qD3ftKeFUMeZV79Oa6Xf90deEdaVhfvNCuwhrw8JBnCF3dtwS33XKaOQNDa1JH0PzSM2abubSYXi@lists.infradead.org
X-Gm-Message-State: AOJu0YzVt9hZHZLEJaN2Qxdc6vciZtZolRA2KNBrv/vddOGSnO/Vvwjq
	vQkUVj0qAuTdsemR1Y3YU2DcXpdepkqzTL0ePj3UrAmEVtBLBFS8pRjqWR7dCuNUmctyq+/Ey9Q
	m
X-Google-Smtp-Source: AGHT+IFcCVRFb/Urp1NX/04IsEAYLn5VJB2C5dpD/DqUxz2lYzSO6XjtM6ssTLOL1chuPn7LmmviUw==
X-Received: by 2002:a05:6000:18a9:b0:374:c6af:165f with SMTP id ffacd0b85a97d-378c2cfec9fmr10989664f8f.12.1726474122187;
        Mon, 16 Sep 2024 01:08:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 00/11] ARM: dts: amlogic: first easy dtbs fixes
Date: Mon, 16 Sep 2024 10:08:29 +0200
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH3n52YC/52NTQqDMBCFryJZd4pJrdSuvEdxkZ8xDmgiEyst4
 t0bPUJXj+89+N4mEjJhEs9iE4wrJYohg7oUwg46eARymYUqVVU2UsISZ7KgpzH6I3m6KXjPaWH
 UExgKjoJP0NMHE9SNq1VlHsZaJ7JxZjyHLHx1mQdKS+Tveb7Ko/3vZ5VQQo9aG1PdG1mbdqSgO
 V4je9Ht+/4Dqu9BTecAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3355;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=rqP4urlgJvBv8itNHMQIBpXX+FWTUpB3KudvZnSF/Mk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eEFBDCJRr0IWadjwoOIQnZHKQ3vEeTTdIDJHbR
 1OQqcQmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufnhAAKCRB33NvayMhJ0QMhD/
 sGdTuYNtS+aFKuEGfoJB3/m6Vo8xC1/ugz/vjZyUnV8Y9sx6acLuzmGhn8c2SBMCPDDMTefMBHUmEe
 zULOke8PCKwsD0IKuYd8IqH/+/mYJlHOxtyulaqs17xDxQBZtLGIbDHdXhRTjkS858GPtSYtTNwgWk
 nwT5BKsJ2FoLl5tTmpHaHteFIFd9Irynu0YCpZIb/34GHLZwuC6VOG0aoFyloc/+H+OVTa1DFbvpuE
 65p+yvd8edpPazb4OyJkVKRMFr0KLGBXlK0nQVoR/Ko84UkfhycCiaorhqkUYt95fNVvt855SEKBYe
 A20cOc4SuJgMfmg7sX1bvRRH9MYgGUMyS+R5q6/3moyclXT+z+aB/lDFTv8Re31/Zd4bHa5IlG4r71
 p8DmNep9WTq/8WQnoE+lfpZ38g2QYCMzJgy4R6HTJ2uXcgwtsGgxwbyLncIlw4PYM3ic/ZLneLXQLQ
 M+P6SHlhKlgVx3ukgs+nQ26gFryhGbau+lwwov3PwtkgZ4g0b2IdRmYRZxTQIB0EU2vLWPObvDBw94
 y5mEKKe3tqwPoYOVf0CJR69p6jss1ZkGSyBEOIKHFDczHWHLIogbyidpWHvxJaeyAnWM2WxCcdtw5t
 VL3VbZ2HveqzV4E4JPI28oL/vXoWHINsxZyGzq/G74+ZLRdYkct4yIimfhNw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010844_927647_DBE5B8F5 
X-CRM114-Status: GOOD (  10.61  )
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

This is the easy fixes to start and fully document the ARM Amlogic
Device Trees, remaining work includes:
- amlogic,meson-hhi-sysctrl:
https://git.codelinaro.org/neil.armstrong/linux/-/commit/1be8f8c67e5b83fa4069ccbcfa80d0614f668a65
- pinctrl: Unevaluated properties are not allowed ('reg', 'reg' were unexpected)
https://git.codelinaro.org/neil.armstrong/linux/-/commit/8b408ad0781b4eb28a86aa04be136bc04ef73f0c
https://git.codelinaro.org/neil.armstrong/linux/-/commit/b6e9df5a7a642ee757e3aa0c84236338151d9f6d

This depends on the submitted bindings patch to fix more checks:
- https://lore.kernel.org/all/20240911-topic-amlogic-arm32-upstream-bindings-fixes-covert-realtek-rt5640-v1-1-6b3745e34540@linaro.org/
- https://lore.kernel.org/all/20240911-topic-amlogic-arm32-upstream-bindings-fixes-meson-pinctrl-gpio-line-names-v1-1-4345ba336ea4@linaro.org/
- https://lore.kernel.org/all/20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson-mx-sdio-v1-1-b7bfae886211@linaro.org/
- https://lore.kernel.org/all/20240911-topic-amlogic-arm32-upstream-bindings-fixes-amlogic-hhi-sysctrl-v1-1-b8c3180b2fba@linaro.org/
- https://lore.kernel.org/all/20240911-topic-amlogic-arm32-upstream-bindings-fixes-convert-meson8-clkc-v1-1-e0b8623c090d@linaro.org/

With all those changes, we finally get fully documented ARM32 Amlogic DT !

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Collected reviews from Martin
- Fixed /memory node name fix
- Removed meson6 DT instead of fixing
- Added a few more patches to fix all DT checks errors
- Link to v1: https://lore.kernel.org/r/20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org

---
Neil Armstrong (11):
      ARM: dts: amlogic: meson6: fix clk81 node name
      ARM: dts: amlogic: meson8: fix soc thermal-zone node name
      ARM: dts: amlogic: meson8: fix ao_arc_sram node name
      ARM: dts: amlogic: meson6: remove support for ATV1200 board
      ARM: dts: amlogic: meson8b-odroidc1: fix invalid reset-gpio
      ARM: dts: amlogic: fix /memory node name
      ARM: dts: amlogic: meson8: use correct pinctrl bank node name
      ARM: dts: amlogic: add missing phy-mode in ethmac node
      ARM: dts: amlogic: meson8-minix-neo-x8: fix invalid pnictrl-names
      ARM: dts: amlogic: meson8b-ec100: add missing clocks property in sound card
      ARM: dts: amlogic: meson8b-ec100: add missing gpio-line-names entry

 arch/arm/boot/dts/amlogic/Makefile                |  2 -
 arch/arm/boot/dts/amlogic/meson6-atv1200.dts      | 33 ----------
 arch/arm/boot/dts/amlogic/meson6.dtsi             | 73 -----------------------
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts |  5 +-
 arch/arm/boot/dts/amlogic/meson8.dtsi             |  8 +--
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts       |  8 ++-
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts         |  2 +-
 arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts    |  4 +-
 arch/arm/boot/dts/amlogic/meson8b.dtsi            |  8 +--
 arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts |  2 +-
 10 files changed, 21 insertions(+), 124 deletions(-)
---
base-commit: 292f97a2f8ac6b645ccd7766a06310351b9d9fdc
change-id: 20240911-topic-amlogic-arm32-upstream-bindings-fixes-69d624b8bccd

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
