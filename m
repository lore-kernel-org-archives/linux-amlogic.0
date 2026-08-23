Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24910C5DF98
	for <linux-amlogic@archiver.kernel.org>; Sun, 23 Aug 2026 11:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLAxzIT6OvK4T0vr7xgCG8USnKC+cucpPp+riuux3s4=; b=lCGSeMZXhBtZwn
	4+LkYnH0Xbhcwo/uNEz+dAWxlCgoc9J98aGw0BDr5vkOMCINKNNJZHXPA2oPeidH3joCeF5RT51fG
	3Nrhp4kMj7gfRcFQ6dvb5BsBR5USWCzGOIn/rJJB0InT/BAUiUpT4r7DEqA1C+rR9pW/2rINHVvCC
	aZBRSCeiySuDfgvE1Kvel9OynfOafYeHiVRKhllR5V1N1h9NVL9pGXT6uJ0TURtQfJmATnG2kLYvQ
	yJDvHyYh04Z8KtAkXq/dxcTUY5bozCyykzQ0bm4GDmItAjMpR0lJBiETA7WGIpjWGggB9LwGuQKQG
	8V4Ehsx+MYAfZWs+lwhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6lv-0000000FJSR-1XpW;
	Sun, 23 Aug 2026 11:53:55 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wy6ls-0000000FJPs-3ZHM
	for linux-amlogic@lists.infradead.org;
	Sun, 23 Aug 2026 11:53:54 +0000
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so20963005e9.0
        for <linux-amlogic@lists.infradead.org>; Sun, 23 Aug 2026 04:53:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787486031; x=1788090831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71w4/rq4K9yb8GmFJtMWkONctoSy21P/XVfk3Fhsusk=;
        b=PR5J93y4oiDGP4CTPX9K4QsBlzIWs6tMViYyhDqsDNaexWZP7rjK+otMgMLbaKy5EF
         IQpo02UtZa1OLUGIjVknF8gU0FQQV141zVr1KKLGRpyALqzYJmQCNIKc/eRzFmvwUiUV
         DMSz2DGWYktlo4Ygx1lEXUtBdw0hLpiUhtI7fTvpYBefV9JvMvvWDKXQZYlxLx1HMT/M
         QjdsNFgGfmP5leO43c3itBZU/5QCIHWtFFan7FtQwCnMD3I/PTEtAs0yujhwSW+gdwUT
         lqS2iSte2BaRwDecYUpTUsBM3/9Z84xV4x2HWZd8QJuEW+PIQyJ1YC4joCawih1ckBpV
         nR4A==
X-Forwarded-Encrypted: i=1; AHgh+RpxNkZdoyek+6N+E9bODcVVVw7mpTacNu1ZuFYxWoBT1ZEcIWCeLxZkjdJFa/aGAhGTtafpKHoX7M8UKDg7@lists.infradead.org
X-Gm-Message-State: AFuF++nk7c9oczMJnnNq0J7DiVkTAs2yJiqrjBSjVEZgawNE47mp6qCb
	HmJxgZxXeUEOWJf99YKydKfpBcwWSsya2fwwnP4PvLz55uVfcb+CGdbUa+LR2g==
X-Gm-Gg: AR+sD10ooMzn1tVKsa8B0Me43uJmb6pWb5PwPnZws3X3lSaL8DYbEb3yYwn7Yc9l7sX
	PjIvYtQHH/NhrU0A0M1K83ZgM7YpProkpTU8JSy9ME01i6DU/EeIHb1hUFtHB1aXaS3dEcjlz9A
	jOv6/ihkhMlqSMCeXVaVSzNDJtF2R3Y0+nIlKZj7PKq+FGv+8ULwlqUpMuAqR3xwqtFhdTudVEC
	zt+H0STcUlsUTFJzKj8BU0NX28ZVWtJKYUj68Bj+ZWdNXBKVmjOCx8BXv0crBUiGy/+wWBt+Oc1
	ew4Gon/Q2KzF59JgEiTUS0X7SORFFWfvQBV1ev3MvtcNgfMIWOBSHc3iOcTG8qYCTPVqgbhaFLB
	JX0YTnz+pKwSrFNb29b/zpRJu3a7KU0oJQA+xoB0RPurY+ZYUpC9ixkh16SlDmATTrJRCNZKJ1Z
	9hptT9uMmXVJ/GOc8GPlXALAO/vxWuwemOwARwecMcvgdd2IAMFJqMi5Uei+Fvf9cz90o0ylofp
	o1Vc9f4ZrUoNBUfggKM++Tmkke9h7FmKVdWaQ==
X-Received: by 2002:a05:600c:1548:b0:499:841c:2016 with SMTP id 5b1f17b1804b1-499b8273456mr224164355e9.0.1787486030800;
        Sun, 23 Aug 2026 04:53:50 -0700 (PDT)
Received: from threads.localdomain ([83.106.158.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499c355e1ddsm48680935e9.5.2026.08.23.04.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 04:53:50 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: amlogic: t7: use the real UART pclk
Date: Sun, 23 Aug 2026 12:53:34 +0100
Message-ID: <20260823115335.102219-2-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260823115335.102219-1-tanure@linux.com>
References: <20260823115335.102219-1-tanure@linux.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_045352_896066_8BB1D81E 
X-CRM114-Status: GOOD (  12.28  )
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

uart_a listed the 24MHz crystal for all three of its clocks because the
T7 clock controller driver did not exist when these boards were added.

That leaves the real UART bus clock without a user, so the kernel
turns it off when it disables unused clocks at the end of boot, and
the board hangs.

Update the board DTS files to point uart_a's pclk to CLKID_SYS_UART_A
instead of the dummy crystal clock.

Fixes: 4fef056588f5 ("arm64: dts: amlogic-t7-a311d2-khadas-vim4: add initial device-tree")
Fixes: 6f048cc7a635 ("arm64: dts: add board AN400")
Signed-off-by: Lucas Tanure <tanure@linux.com>
Assisted-by: Claude:claude-fable-5
---
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts       | 2 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
index cab2ee9ea0d3..ca7536f772ff 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts
@@ -33,7 +33,7 @@ xtal: xtal-clk {
 };
 
 &uart_a {
-	clocks = <&xtal>, <&xtal>, <&xtal>;
+	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index c41525a34b72..75d81ad6830d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -266,6 +266,6 @@ &sd_emmc_c {
 
 &uart_a {
 	status = "okay";
-	clocks = <&xtal>, <&xtal>, <&xtal>;
+	clocks = <&xtal>, <&clkc_periphs CLKID_SYS_UART_A>, <&xtal>;
 	clock-names = "xtal", "pclk", "baud";
 };
-- 
2.55.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
