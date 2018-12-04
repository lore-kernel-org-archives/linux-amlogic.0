Return-Path: <SRS0=ycqe=ON=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166BBC04EBF
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB7E20659
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Dec 2018 16:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G1N94Gec";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Ndm7bn0j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB7E20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y3Qvl3CP8AFlVJmi7bhWbEEZuUlVjoHuByF7QgCJgS4=; b=G1N94Gec8RdYDS
	x/itnNE1Gukxry3fMhaMnDoSng32PWPQxmNwR5DCYav9aQyabSXrijx4iOBmi9jzjpkta/dhX8Ks2
	pnatlMaXjj8gDUo3Dzw9gBKyalXtdLuhTtFU7CZd2wi52J0vVOFKZBkTQSNvsm2TaVl9fvPryC52a
	jxQXasCqDeFqN8ESQr4LYq8Hhwtca0kh8xJDLa/r/sV1OOtGHMZWtflypBlPg1rZn86iw6zyereTq
	/zrSOlC+UtNnPa8brl3lecdCwln1MXl0lRl4DJtLyuEI/rUKA9lM5t2ps1ftBYTg2kb2Txt3mGklP
	Pr7f74626+UNzsbsZtKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUDx2-00023V-LE; Tue, 04 Dec 2018 16:53:36 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUDwv-0001jO-BL
 for linux-amlogic@lists.infradead.org; Tue, 04 Dec 2018 16:53:31 +0000
Received: by mail-wr1-x444.google.com with SMTP id j2so16734160wrw.1
 for <linux-amlogic@lists.infradead.org>; Tue, 04 Dec 2018 08:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uovFhiZzGyaBQW3XHTv2xNNKBWvDbg0VR5INejAlggg=;
 b=Ndm7bn0jZb94xI58zz+oX0/gfaHf3niAB40+7cua4CjbFYIZxjCQZNEI5svNuA4n7E
 EnYSOXOXGvHCCMM0ptOoZfUn7+fWYdL1xn/1fytJXrcaBA/vn8M4sdTYZLfm9ww3Mww+
 j2JAnHJPEX1TzMwceR+QCW4QRiHMoG/UgRaJ3nNGN+tgXu66PFhoCLetTSUjsEYNpxaX
 m2Pvmz0su43yt7h+YPk0ImrMtauSDXw8X7WEpXEc0sfUFA+oA/9U9VLI03Yab7CKnQMv
 xzu+UmvdeK4uME9LoHz14ctE843hLf4poLi1Tke4S2GV6P+I8BUcEnVy1K37ZsOkAoX+
 TGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uovFhiZzGyaBQW3XHTv2xNNKBWvDbg0VR5INejAlggg=;
 b=VWs3yHZ88ap46FL/z8UBVQADOb9/lw7fc7cT3FyMUP1k7WzMSxzmyesD2fOIxi2K96
 KBdKidHZ2sqfaX8L4TF2OO51PXYLNjGQE4mfiJZ03HFnLogJSoDWZsXGCC13trkNFp+t
 hU2kW9etHVsaxKg+XcOVD2xn2vp3soSzJ5EV/TvoRFRnxehWXiJA4JlkOAHGbmSuJGgj
 38el0LoMy7nRa8hn6CQHkDqAzEq/zwi0qUPKehKb5sJWQT+oDb5x+m0IeZUDp3pjRZBy
 IBs9tJ5Hh5pxLXxqTrUC8KfKONUSiMwvRNhbBnQo5UNB41VZXP78cOB6ahc963AfvIFg
 A/PA==
X-Gm-Message-State: AA+aEWaPwnppZK3ncJss6WNhEwhN6R8SasF8+Z6ubVj2bFzTnoYBuFVk
 jaMRW3XqmTFCFVY7UPySbbn5cw==
X-Google-Smtp-Source: AFSGD/XDdbF2gsvv4ETlkHHO+i8RPcr3Pz6l/cELoKLZ7YPov+Rz1qjN1aKrFHTPfGX1n8/T3KlUag==
X-Received: by 2002:adf:d0c9:: with SMTP id z9mr18031940wrh.317.1543942397582; 
 Tue, 04 Dec 2018 08:53:17 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id s66sm11581633wmf.34.2018.12.04.08.53.16
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 04 Dec 2018 08:53:16 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH 1/5] dt-bindings: clk: meson: add ao slow clock path ids
Date: Tue,  4 Dec 2018 17:53:06 +0100
Message-Id: <20181204165310.20806-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181204165310.20806-1-jbrunet@baylibre.com>
References: <20181204165310.20806-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181204_085329_560741_94A1B554 
X-CRM114-Status: UNSURE (   8.82  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the CLKIDs for the slow clock generation path

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/dt-bindings/clock/axg-aoclkc.h  | 7 ++++++-
 include/dt-bindings/clock/gxbb-aoclkc.h | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/clock/axg-aoclkc.h b/include/dt-bindings/clock/axg-aoclkc.h
index 61955016a55b..8ec4a269c7a6 100644
--- a/include/dt-bindings/clock/axg-aoclkc.h
+++ b/include/dt-bindings/clock/axg-aoclkc.h
@@ -21,6 +21,11 @@
 #define CLKID_AO_SAR_ADC_SEL	8
 #define CLKID_AO_SAR_ADC_DIV	9
 #define CLKID_AO_SAR_ADC_CLK	10
-#define CLKID_AO_ALT_XTAL	11
+#define CLKID_AO_CTS_OSCIN	11
+#define CLKID_AO_32K_PRE	12
+#define CLKID_AO_32K_DIV	13
+#define CLKID_AO_32K_SEL	14
+#define CLKID_AO_32K		15
+#define CLKID_AO_CTS_RTC_OSCIN	16
 
 #endif
diff --git a/include/dt-bindings/clock/gxbb-aoclkc.h b/include/dt-bindings/clock/gxbb-aoclkc.h
index 9d15e2221fdb..ec3b26319fc4 100644
--- a/include/dt-bindings/clock/gxbb-aoclkc.h
+++ b/include/dt-bindings/clock/gxbb-aoclkc.h
@@ -63,5 +63,12 @@
 #define CLKID_AO_UART2		4
 #define CLKID_AO_IR_BLASTER	5
 #define CLKID_AO_CEC_32K	6
+#define CLKID_AO_CTS_OSCIN	7
+#define CLKID_AO_32K_PRE	8
+#define CLKID_AO_32K_DIV	9
+#define CLKID_AO_32K_SEL	10
+#define CLKID_AO_32K		11
+#define CLKID_AO_CTS_RTC_OSCIN	12
+#define CLKID_AO_CLK81		13
 
 #endif
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
