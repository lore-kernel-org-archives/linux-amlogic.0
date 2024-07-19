Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A274EC3DA59
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jul 2024 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLPESRr1i/N2UK9LlPcRIrz972IND79k8XaNNQ98t7o=; b=G/N5alRXY4oaSp
	D2kQ8vceALMMqIXYZgkEEIhg/hii0bEBEO5XOS/DwCUq/N/sJN0S+Ocow9kYKtE2kAFuFSjtSTk/u
	muC/uQRSipnYd51fADDttShuAkAU2/YeSUD5ZMC6sDtbRBQHXOu+uWc2eGkJCXs47Z1yhDUjLiH7B
	7HcSL3m9MiZaHrXRtJ21aShv0Dy+LTnpggn+QmpEDuvXz122fmunToKGP0Tqq31lyWzba1nFY3bkm
	U9Goak+FfI/p8dyMyhv5xnCItGhGf2lTBaTWXwLjxLfj8cDdnduTh8AtQ97TwcyYFtCpAZ6w9b36C
	9Fyn9IhPZkFNYKRGqpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk5g-00000002Gex-3F9l;
	Fri, 19 Jul 2024 09:39:52 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUk5c-00000002Gbl-0ref
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jul 2024 09:39:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so7454455e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jul 2024 02:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721381986; x=1721986786; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ok8qT5sg/ukyA77onQiJddqngdYN/iGCzJwgTQrvtPQ=;
        b=yfh3lTQLAfIf457+linquTsO7UI6GpSYC/Cs8Dc8oF4ABw7ejYZIHx9WowsTb9N1C4
         EVge9oiTb118AIvTEpE8jcH0Ik6BinKeb/t5cHo05sY0BMWitVkEExRYXf2tqfGn31WF
         1m8tXVxOBpeAcJfg+J77TS9KjPeiWLELk+Oz0Uxb1MBaoA2xD4Ddx9eTyXSRwW1lESU2
         rYkbCdX6QI4qAmGLYBIU2pJqeDomkF49fe/XhzlJFnzvcJyZmGweIss1ItDN3QWk6SbC
         NqGSqpY7q5Ny9I1l1Eh/XOJ256rrXftk0DAFUcZt6+jiVasnVlK3R77Irkmnet16E6IW
         lC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381986; x=1721986786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ok8qT5sg/ukyA77onQiJddqngdYN/iGCzJwgTQrvtPQ=;
        b=WIPVxu3RZK3oBFbbv1gw1MifCSyRtIs2OQO4yKxR2QFNf3W+McviGz8HcXyvj0mORc
         mJE4FucXEefy4JiTSZFjwfxQTM2O2Rfyh5+Vv1U8lAIFwWU+x3adhR8/xQ9pXOXZNvpV
         iHkRAR1qvR53z2j0auqyB1/IYwEMUMHI2B/FSGoN2yeLZqgt1Vt5fm9x89ZbZBsmYOc8
         cEoUTV9kRxJQe5YVVdZ+cfQ7/DdAa014pcV0mXjQkDEYjSqhq2K3K6QuP144wAVrV4X/
         1j3JhJc2BDUVUr9JPBL7cVSjVn4+B4Z0DGIHZVeVEnDG40e+f4q2//CYmMfEhNJueTfb
         cYxA==
X-Forwarded-Encrypted: i=1; AJvYcCWRCQJUbUYA7ZpRL2oNnrvVQtorLpNUYmmZPkUBgHweghxhroh0LOI/EudUbPNVUkME6bLN/xH5yRqZbAMD2v93aq5oHYlcGRLbnEnTxQT0hMc=
X-Gm-Message-State: AOJu0YxssZNRWqV4ZVboOssLOb55LBTPQ/2mrovefgwKRJkE8LvSlCje
	XZSjpxJ8xt39myCDsXca3eCUdERTDbz54VpXzjAA1XzrqADMxxorC2hzljgSpYI=
X-Google-Smtp-Source: AGHT+IFRBg62WuWS0T4N15ozxDHT5px+Wx0AGbkCxcIEYMBTBgmOQqIY2DCIWNCIKkRjdhVXnuc1yg==
X-Received: by 2002:a05:600c:3110:b0:424:71f7:77f2 with SMTP id 5b1f17b1804b1-427d2ad9f96mr23848925e9.16.1721381986549;
        Fri, 19 Jul 2024 02:39:46 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5ac4:5655:4dfe:ce97])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3687868bc91sm1100956f8f.45.2024.07.19.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:39:46 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/3] dt-bindings: clock: axg-audio: add earcrx clock ids
Date: Fri, 19 Jul 2024 11:39:30 +0200
Message-ID: <20240719093934.3985139-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240719093934.3985139-1-jbrunet@baylibre.com>
References: <20240719093934.3985139-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_023948_261540_9AA98BD8 
X-CRM114-Status: UNSURE (   8.19  )
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

Add clock IDs for the eARC Rx device found on sm1 SoCs

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/dt-bindings/clock/axg-audio-clkc.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index 08c82c22fa5f..607f23b83fa7 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -155,5 +155,12 @@
 #define AUD_CLKID_SYSCLK_B_DIV		175
 #define AUD_CLKID_SYSCLK_A_EN		176
 #define AUD_CLKID_SYSCLK_B_EN		177
+#define AUD_CLKID_EARCRX		178
+#define AUD_CLKID_EARCRX_CMDC_SEL	179
+#define AUD_CLKID_EARCRX_CMDC_DIV	180
+#define AUD_CLKID_EARCRX_CMDC		181
+#define AUD_CLKID_EARCRX_DMAC_SEL	182
+#define AUD_CLKID_EARCRX_DMAC_DIV	183
+#define AUD_CLKID_EARCRX_DMAC		184
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
