Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D46FAC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 16:07:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D06218AE
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 16:07:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jg6OMGIP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="s4CKHm0Q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D06218AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lEvuW7/Lv8WNaLvbx61EgODwB2IYs/nS0llfBHq8AtA=; b=Jg6OMGIPUMCOo/
	llKu8SaavkZ3kqlU/rdHezY7pZSCRuApX13vey/UBNDQ7R+y1ztISIjpMPxiTebs5MSuhtHBOSp/O
	cYnoMqtX4SG1ZiB69Av5gHC1PWd3Keg0i1JAxqpoWiGH9kTPSYtuAoUMtCAFPl1UhAGrQz3ph+B4K
	n7EwFpB3y5yfpexgh7qExtn4xgXkgBRiV+mlcga1yPJQsrYxojByaxlN2pDfefHD855JyBTkIE+bz
	usClxw5i1X12RbY42OpJqVShCZNO/2AzwCPLBwv9VS78D8OluQS1bSDan/h9/YfT6xpgRBgiG8GRd
	TtuG94QRVsJEOE/8knFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9u2A-0004tN-K4; Fri, 29 Mar 2019 16:07:10 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9u27-0004sR-Vy
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 16:07:09 +0000
Received: by mail-wr1-x443.google.com with SMTP id g3so3227302wrx.9
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ffLBMmlN/R91KDE3bFeIaFV85gfF8NMBVLWE87EFlsw=;
 b=s4CKHm0QAPPaPdPapbBThGbHXPQD1osO6knnosaihjd3z+4NXUBjS56VJoka7LLNgd
 mZK4GFZlC3i6M2WfMBfCFuEXrjm8HkNVw0z/V6ZzYDK0cqzcT5i88AAZwSKo0eqeIXur
 qsh7mBNoH0jE8kilTGvPV8rCeN5iyi95mDRbczoUEUgLoJT2DFHfxd9X1ANasZhJk6yj
 Mvb868PuAxvjgvrgWoatvlkhwIaW690hjkgmiTI9ZHtpv5GTvBUsNl5bDSjyGDfsr/eN
 jyCnxKkU34KTjqOWZYbVt6rtU7clJGb1pMuFlPOVrOSzv/yTIge3FZesJdGUwmGa8/hV
 REFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ffLBMmlN/R91KDE3bFeIaFV85gfF8NMBVLWE87EFlsw=;
 b=Jxqqf/FG1RBCvbYDiNN6MK90Ed4pFRJsWRaxkYU/pjhKN1p/5JmttX4MhKOFw5LMru
 wm/Z4sDrr8nNQWS/OeFzyoV4Sz5J+N17iT6yx7Aksp/4hkTUn4C4ohfTFppKi76j4sva
 HHd1GUqq0FpycZnfmmPgs2ws6zdNvlobFzHsRgU51Pp+jp8U4R8lkl4GgdiFnJeOxEF6
 4zhicm9wi97+RR951zUcMyhFLt77wg46teFksBtVe+quriRyhJssv2HDteq9mrwFQbkv
 +LCoZqL9I8onBhcdZbdre46n+iJvAmeQTBezGqS6/OMsp2J/4g27ySMVOmGgRFYjNegL
 H/tQ==
X-Gm-Message-State: APjAAAXpgfLxc3ivVe1tIeLG3gK8oac7QlTc31rm/9MPLci0vpz98kkW
 hGH3JjrVsQAOEBLasM3V7lvpgw==
X-Google-Smtp-Source: APXvYqwdgF9JFhBs8GvLw0C3GPwnW0HYgtmJ09Q8WyUILKmpEKm5w2fxTYBiXTjKvREb/kVRHNXVTQ==
X-Received: by 2002:adf:fd41:: with SMTP id h1mr14733625wrs.155.1553875626386; 
 Fri, 29 Mar 2019 09:07:06 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id c10sm3329527wrt.65.2019.03.29.09.06.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 09:06:59 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Jourdan <mjourdan@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/4] dt-bindings: clk: axg-audio: add g12a support
Date: Fri, 29 Mar 2019 17:06:46 +0100
Message-Id: <20190329160649.31603-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190329160649.31603-1-jbrunet@baylibre.com>
References: <20190329160649.31603-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_090708_031564_1E8701A2 
X-CRM114-Status: GOOD (  10.40  )
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

Add a new compatible string and additional clock ids for audio clock
controller of the g12a SoC family.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.txt          |  3 ++-
 include/dt-bindings/clock/axg-audio-clkc.h             | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
index 61777ad24f61..0f777749f4f1 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
@@ -6,7 +6,8 @@ devices.
 
 Required Properties:
 
-- compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D
+- compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
+		  "amlogic,g12a-audio-clkc" for G12A.
 - reg		: physical base address of the clock controller and length of
 		  memory mapped region.
 - clocks	: a list of phandle + clock-specifier pairs for the clocks listed
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index eafb0de8466b..75901c636893 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -70,5 +70,15 @@
 #define AUD_CLKID_TDMOUT_A_LRCLK	134
 #define AUD_CLKID_TDMOUT_B_LRCLK	135
 #define AUD_CLKID_TDMOUT_C_LRCLK	136
+#define AUD_CLKID_SPDIFOUT_B		151
+#define AUD_CLKID_SPDIFOUT_B_CLK	152
+#define AUD_CLKID_TDM_MCLK_PAD0		155
+#define AUD_CLKID_TDM_MCLK_PAD1		156
+#define AUD_CLKID_TDM_LRCLK_PAD0	157
+#define AUD_CLKID_TDM_LRCLK_PAD1	158
+#define AUD_CLKID_TDM_LRCLK_PAD2	159
+#define AUD_CLKID_TDM_SCLK_PAD0		160
+#define AUD_CLKID_TDM_SCLK_PAD1		161
+#define AUD_CLKID_TDM_SCLK_PAD2		162
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
