Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82737C05027
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Jan 2023 19:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x+YPSf4eOqyUDMjxgwnGMoHhS/JFFDeZSo/F8PxgLIo=; b=zg3lduJ1kQmxSY
	xBdUVmYBIR+IDwkFs/vnIsMtZ9YRut4kChf3vE8r1vdq0gnmVo6yIN6B1cT8OdEpp4OXue5M7yAy/
	4+xEVvjJspdoNL49F+IdqZgsisELPs/xjIk3WD3fXbG5P1YiYGn7GxIlwydVtbqgYY8q8/QeIjP5W
	9TXR/CKT2N90AQf8KypnuAyqltDQP5GfQibsCtTm2Eyv5o7G6UMpD5/a2by1AERV0BN3k6xfBFQ2K
	KvFX4HHXmIFloOAE9YEOHVJ/WYB8yTv7uzwjW6soJvir5ZQst51+gQni42moIL3ei07/daq2RNd+I
	LQDeknw2auzte8oW3rdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL89P-00CLiu-VO; Thu, 26 Jan 2023 19:43:12 +0000
Received: from ip-89-177-23-149.bb.vodafone.cz ([89.177.23.149] helo=ixit.cz)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL89L-00CLgX-SX; Thu, 26 Jan 2023 19:43:09 +0000
Received: from newone.lan (unknown [10.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ixit.cz (Postfix) with ESMTPSA id 905EC161F6C;
	Thu, 26 Jan 2023 20:37:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
	t=1674761858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ccBGHlkR7MMpjrKhllmWGIlkOOuku6DhNh/iMepjLE=;
	b=cJPGgG++Ab2U/1JZqYXw0bmHl52qFK0eApA8lh9ZUgKgdZhGn6mFZRgIBnulZ3GwtNEtbf
	9FbHkNoaahgsURd6bHAM3pVFjm8h6k1A77c6iahJAjI9UA+WOSGKBWCALO4lJ5Blnddxbj
	S4KNuFYRjrGtFQ5msk1sOjb0oaeVjPQ=
From: David Heidelberg <david@ixit.cz>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: ~okias/devicetree@lists.sr.ht,
	David Heidelberg <david@ixit.cz>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: meson-gxm-khadas-vim2: use gpio-fan matrix instead of an array
Date: Thu, 26 Jan 2023 20:37:32 +0100
Message-Id: <20230126193732.69699-1-david@ixit.cz>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Spam: Yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_114308_098688_B71A63A0 
X-CRM114-Status: UNSURE (   9.03  )
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

No functional changes.

Adjust to comply with dt-schema requirements
and make it possible to validate values.

Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
v2: added Acked-by, and stripped from other DTS changes as requested.
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index b21172ece1fa..74897a154891 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -52,10 +52,11 @@ gpio_fan: gpio-fan {
 		gpios = <&gpio GPIODV_14 GPIO_ACTIVE_HIGH
 			 &gpio GPIODV_15 GPIO_ACTIVE_HIGH>;
 		/* Dummy RPM values since fan is optional */
-		gpio-fan,speed-map = <0 0
-				      1 1
-				      2 2
-				      3 3>;
+		gpio-fan,speed-map =
+				<0 0>,
+				<1 1>,
+				<2 2>,
+				<3 3>;
 		#cooling-cells = <2>;
 	};
 
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
