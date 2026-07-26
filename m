Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1708C531F9
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jul 2026 18:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2MYiltuPuWvI2HoPY/E07aVSFU+VXieuO9/I9HH4mRI=; b=3dgAmbCHclEJDD
	90x1P+x7zxp+Wg5yqNJt5y75w68FqIPN6aIUIDeygaCyk9FbUnWsHdBgaApoMXQBdU8nfl6rR8AST
	H6Lo6AsYUKoMs1lmK6tQtNLMuf397WUf3iqyWuAzdrXXKs1VCeYzpkUnBCC+W/r+OQ3G25zF1jlry
	9p2hcYUfGDVJySZiuoFofaDP3zmvMunhIEt6cjs3I8BSTcQP1wUuVDnWpgApqPf5koNknaVghfUxk
	n4f+7uq0PURzfySdICZbBno8Xbdvb9W/L8Stl4jcn3qN+zJsOiy36mDlWnr30WmAzo3B8JJLWzXLh
	hUgscfsHoRNkBm11PV+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UF-00000001Tll-0jmT;
	Sun, 26 Jul 2026 18:22:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wo3UC-00000001Tl4-1rzz
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Jul 2026 18:22:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-495590dde14so21401595e9.0
        for <linux-amlogic@lists.infradead.org>; Sun, 26 Jul 2026 11:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785090122; x=1785694922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wRAQur8L/fejABMUOGfnExKTMwqijNNgWK29zDYECjE=;
        b=arPOcQeJvIZr8N52LXknlNNMHbbvuBMOZCL7dR9OZl9PEN2+Jc2voynaProwKNTadW
         tbbTkyhIL3OwAwYL+W+5mmbWaZ3G1hYhe0X5zeSOCCYdbSHG8t3vOAadkqXCYy/t8DPW
         tH7k4MC6oPJqGgYSAXV5huzK8swUQ8juLv+FDHYx6d/YWnSjazODQLKopoRNAMVfQT5m
         WhbIXAbNm+ykWaRAPPSeo/zZnsP0cELgVzVrQBME42fbCE/EVKZmY4+AY33xYCHPd+GX
         qQlJVLmBDir44a5UUpDL645SDEScgWHr6YBA6nYnHs03xkkoqLewnSHV+SvGb6vi0KPm
         FtQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785090122; x=1785694922;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wRAQur8L/fejABMUOGfnExKTMwqijNNgWK29zDYECjE=;
        b=LGj12zrDyxGbD4IBqhG3n/tCtUYwahOegIW39VsxJimuEbCzb85cQJk6z4VDGr2Q/9
         0yTgUPytWmsH0/msVx0N0OjABt7mu/j5kl/h0JhRpDZdG9CsWQOT5K3aT05V9PRf0fPj
         JnFNE6m4NPIR3Rifzb49XP/WlmUore1TCed/ML9OaptfWbIa2fH1JdZ/+UwS/8hHHhrp
         TOT+4aEQ7W3MHNtHa6YhmxADSKvw72SKFCvG8aidPbF8VOkipdV6NcpMzbiyIHxOkxZX
         39i9w36Dl3Doh6tRBZVe4IlQ4IKxczFf8djeL22/eP0gyzXsin1WHWgTmD9OkGmKObG9
         +ofA==
X-Forwarded-Encrypted: i=1; AHgh+RqlCp+viyC+xkGdpfrp/tTIWe1oRp8inOTgeijqynwSvCdlPZT5FaZCj5iNtmBHINQdK/1U+FvtESECtQhQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yxt7XiNNDJkeiGXh/qVd+9FHgv1dlLGNmVgAgQ323q3O3+h+rUJ
	92SuIbOHPbmSyGxvu+XRU7ajuGjRPGB7f0Y2kiV8kVIeFDTJiXJTWBmJ
X-Gm-Gg: AR+sD10rlnD0lRX4bZ6T2RNqMu1MNnhrMX9n7o9ViImYvI9yDnRs45B/qC5U3pQla60
	vMV2D2AeHPh+IxGw0ZXcRN7ja+CEHmPwAV+1aO7VQEGaA+B3tdvqhgK3wU7vLuZWE7YWl+wD44y
	JIrO1GRJh4/FGgOCz8piH891XuMGMjabjKF8I6psMT+jSCeRt2bSB3eQ8cg/M3LDo0K91epy1w7
	KbeHh8rOEMEbtfE9c+BXTywM3wvMP1MXVSPWBQaMISrBXG4Q7Hm3qtxc5IAiZJ0pUo2yjxElzIC
	UoEZV2qbzDZQkz7fHSXvyXSKFIntoQgWDsfNzYNcAM++5e+ldDGUoiOdn+hMx2zuX/+k+2Q0/WV
	XxJisqvGRRIQb6v/dxdkOQMoPqPtTtRlGCYeCYHWjfTq+8S/bdI8Xn/iSwjJR22Ai6912QUC6LH
	8COL29ZXjpbGoHs1B49seQ0uv6lZZcC3iYVsQHkw==
X-Received: by 2002:a05:600c:8b75:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-496b56e6efemr88359835e9.2.1785090121922;
        Sun, 26 Jul 2026 11:22:01 -0700 (PDT)
Received: from slackboot (93-34-145-231.ip50.fastwebnet.it. [93.34.145.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b52eec24sm150748045e9.3.2026.07.26.11.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 11:22:01 -0700 (PDT)
From: Alberto Robazza <robazzalberto@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com
Cc: robazza.alberto@proton.me,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 0/3] arm64: dts: amlogic: add support for Orbbec Zora P1
Date: Sun, 26 Jul 2026 20:21:55 +0200
Message-ID: <20260726182158.249449-1-robazzalberto@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_112204_500998_3F895FA2 
X-CRM114-Status: GOOD (  10.64  )
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
Reply-To: robazza.alberto@proton.me
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Alberto Robazza <robazza.alberto@proton.me>

The Orbbec Zora P1 is a vision development board based on the Amlogic
A311D (Meson G12B) SoC, with 2/4 GiB LPDDR4, an Ampak AP6256 combo
module (Broadcom BCM43456 Wi-Fi over SDIO and BCM4345C5 Bluetooth over
UART_A), HDMI output and Gigabit Ethernet.

According to specifications and how it advertise itself in the original
dts configuration, the board is a revised version of the ODROID-N2 with
WiFi/BT and Amlogic A311D instead of the original S922X, so the device
tree builds on meson-g12b-a311d.dtsi and meson-g12b-odroid-n2.dtsi
(mirroring meson-g12b-odroid-n2-plus.dts), extended with the
board-specific GPIO wiring for the AP6256 managing, the status led is
green instead of the original blue of the N2 and polarity is inverted.

This series consists of:
  Patch 1: add the "orbbec" vendor prefix.
  Patch 2: document the "orbbec,zora-p1" board compatible.
  Patch 3: add the meson-g12b-zora-p1.dts board file and Makefile entry.

The DTW was built, validated against the amlogic.yaml binding
(DT_SCHEMA_FILES), and the resulting DTB was boot-tested on the board.

Alberto Robazza (3):
  dt-bindings: vendor-prefixes: add Orbbec
  dt-bindings: arm: amlogic: document Orbbec Zora P1 board compatible
  arm64: dts: amlogic: add support for Orbbec Zora P1

 .../devicetree/bindings/arm/amlogic.yaml      |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 103 ++++++++++++++++++
 4 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
