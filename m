Return-Path: <SRS0=zbOs=X2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4977ECE58B
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95D3221924
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Oct 2019 11:55:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FfI9mZ7Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wq/CTtai"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95D3221924
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiXx1KiBE74MQG9rv2bcP21WiWZFdGS3O8th6b0szxY=; b=FfI9mZ7Q7i9vli
	lWTYRWv6wKKzB3G0EsXbPPQNQcuzWIUyxavNurykhLhnIwhhwgx5NVlyEbFXg+TczBRl79KDwiNGb
	91q5H8sKRCsfMjlxgzzR0e1yiDIiwyaUaQY70oNMoOo6dCRG3if6Ke69BIQ7vUQa6LL0UN0GGTFj8
	te4SBv2JLnA62lmmrLFtoxqduSD78zD2hBouEKwqut2Ff8cBNPvTU+A05mVjLRWmjQco2af4r7jtO
	FHuZXylhpOAFFncJwWhDwOXIwzSkibfSc1aKupEL3CkpMfxqRDaTBxarZGStQwJn35hdQkmvowchz
	rrbBlxEbvRWw2nvliS8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iFGkR-00074l-V1; Tue, 01 Oct 2019 11:55:19 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iFGkP-00072d-Dp
 for linux-amlogic@lists.infradead.org; Tue, 01 Oct 2019 11:55:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id l3so15128513wru.7
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Oct 2019 04:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jr85PqBhcGLPuS9IfqPXvfyfH/vk/S6Kq+krrnohXK8=;
 b=wq/CTtai+tj+0EA5/5tGDINFALVYjqHd5o9YDSqfsH+rL8wN0D5iHkYAuD2Awt2m+3
 sTSuStDx+HVDFbYqUE14wm28g33855ugCeNpCVEAfkWXLuqyxADHhI3CFmH+A2tV+hPc
 1NZJBHMEqWvPEqIRP7xWiPeLv7PwO/pq/X/z2epIq+edinej+x4sAqN0LYs16EIrUaB4
 xMDjJm42h08EKg2OT4pffOhaSbLa5x2sknySblsMLPd+/6Ut1r1jglilCpjQ8BxjX/D5
 i+eAmXiRRuwdRD9S9uaesuX4ZxIBDsK05jiTMeEaf2ghAfufnTMh2+EeAZ5mhOgih+3D
 Bebw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jr85PqBhcGLPuS9IfqPXvfyfH/vk/S6Kq+krrnohXK8=;
 b=ZdCzmf+zz7qrNgWrL5++QoGbsEeqyfgbHI8qsLg3fNnV2s0l38oqEiBKSirKUpo+uD
 DfsX1I4euHDPQ4HE3e8whBh+hWZ0cHsUpjB8rdbNdkde0QBBvQQw4cmBPp9oZLetAUxy
 31Q4RAnz6ughiMamEmHOq51XiPtI84HRJNcMQjW4L9abvWDHypiA3KAhUbEm4J3PSMNl
 em1+d8DxI0b2YAzNT28zVLlV1FehtmYHhF4P0I87T30A6RNl0OSorl6/PfTHpENeGgvx
 CXCELMQYBU9ewilU84zfDn2llrz/Ylm6uWK5zjeBEpCPC5VZY9aDvGEG4Ok5eBoypB/P
 IXMA==
X-Gm-Message-State: APjAAAVbNfYWRgYGMkEx3+GKZVeJuSE8+Oho6mLaGYJAMRLcCe3ri2cG
 Y7O11MutqvB69AaJv7fi3FkEpw==
X-Google-Smtp-Source: APXvYqyBmzH9tgnVO3ZeOVIRoAdUpntLskVDsijM/gPi3reuvy7Fv3R63Frl2E3e5wblRMK2F086iQ==
X-Received: by 2002:adf:f502:: with SMTP id q2mr17229425wro.186.1569930915902; 
 Tue, 01 Oct 2019 04:55:15 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id p85sm4052171wme.23.2019.10.01.04.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 04:55:15 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 1/7] dt-bindings: clk: axg-audio: add sm1 bindings
Date: Tue,  1 Oct 2019 13:55:04 +0200
Message-Id: <20191001115511.17357-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001115511.17357-1-jbrunet@baylibre.com>
References: <20191001115511.17357-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191001_045517_467998_B2E24F17 
X-CRM114-Status: GOOD (  10.26  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the compatible and clock ids of the sm1 audio clock controller

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/clock/amlogic,axg-audio-clkc.txt          |  3 ++-
 include/dt-bindings/clock/axg-audio-clkc.h             | 10 ++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
index b3957d10d241..3a8948c04bc9 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.txt
@@ -7,7 +7,8 @@ devices.
 Required Properties:
 
 - compatible	: should be "amlogic,axg-audio-clkc" for the A113X and A113D,
-		  "amlogic,g12a-audio-clkc" for G12A.
+		  "amlogic,g12a-audio-clkc" for G12A,
+		  "amlogic,sm1-audio-clkc" for S905X3.
 - reg		: physical base address of the clock controller and length of
 		  memory mapped region.
 - clocks	: a list of phandle + clock-specifier pairs for the clocks listed
diff --git a/include/dt-bindings/clock/axg-audio-clkc.h b/include/dt-bindings/clock/axg-audio-clkc.h
index 75901c636893..f561f5c5ef8f 100644
--- a/include/dt-bindings/clock/axg-audio-clkc.h
+++ b/include/dt-bindings/clock/axg-audio-clkc.h
@@ -80,5 +80,15 @@
 #define AUD_CLKID_TDM_SCLK_PAD0		160
 #define AUD_CLKID_TDM_SCLK_PAD1		161
 #define AUD_CLKID_TDM_SCLK_PAD2		162
+#define AUD_CLKID_TOP			163
+#define AUD_CLKID_TORAM			164
+#define AUD_CLKID_EQDRC			165
+#define AUD_CLKID_RESAMPLE_B		166
+#define AUD_CLKID_TOVAD			167
+#define AUD_CLKID_LOCKER		168
+#define AUD_CLKID_SPDIFIN_LB		169
+#define AUD_CLKID_FRDDR_D		170
+#define AUD_CLKID_TODDR_D		171
+#define AUD_CLKID_LOOPBACK_B		172
 
 #endif /* __AXG_AUDIO_CLKC_BINDINGS_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
