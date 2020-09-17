Return-Path: <SRS0=nwdc=C2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 451BFC433E2
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E732065C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2020 07:00:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N2Vdm0F7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zAxziCPI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E732065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tNEFHVp/MOfuBDB6dynAhESK1UerlEHej7fIyEVN+Yk=; b=N2Vdm0F7Gv+ACEW2irbcMwqVp
	32v0IWHDpZ7bOQndp5iU1g3/wk3DICODJXl+kogaAF/XdITZEfu/7ypL+Nhlxq2hYDEwupgM3gA+P
	gHjkd7qpTWOmv/NotbL0DkYKOdmyuvfSISy5puvbJkdYDIsZwUI2pZqmpOlg3HAxw8yhI6u/lz6Z5
	3NmSQEAo+DHiJWBb+VtS0L7AQ6XRN+CibNEkseQydvi/rn/O6shfkHrYSaLLJ5YKqIJ3uIEKlvgC/
	7bFobkie5D3pTREDvxB5AzBvhbqYDs5b1abR438C97EBeUFEN/w2vr+EAZ3hoiJaUJGf7cTJB3H4V
	R7D8GiMow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kInu4-0000SM-JJ; Thu, 17 Sep 2020 07:00:24 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIntj-0000JY-7M
 for linux-amlogic@lists.infradead.org; Thu, 17 Sep 2020 07:00:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id a17so784921wrn.6
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2020 00:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Sr8oVzKvyD/zquOuBfsibXPcOOdCUHxve0EXAZkgxo=;
 b=zAxziCPISkzSXUnEHDjswb1aWbCu/F/BgQ37nODlVtfT7XQxc3p+BB7uTBkX6ifJzF
 y9u7LKoOphxoUm60u1XcFt1Gj8Ck+ohOzAU86JxyEPPurTfDqxhGtDl4ZF2G3pruZvWQ
 gDqeZa6RlXly7ApknGR4IA26N9gUADNnyDgxf6wiYzts2Ef4WKHPU9v/RQLJrMA0YwHS
 RlKwbBuy193Irpy25bB++7/APngy9hCbRTEkl2Y7uryqPB9MDloSuc/m/3iNTRNkNNF3
 tmyF3fpRfqXLWUFpb2SOVIVV2OmqNEyehJg6BOgIGHrabOk4PhfDTt9qakpbly9ayxeM
 jHNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Sr8oVzKvyD/zquOuBfsibXPcOOdCUHxve0EXAZkgxo=;
 b=dXaoFaMnFTxQz+XPJV6BQfeVDQGWGD9mHWGuk5FBrXnSgJmVdb5mW33r4S5qrZFCXt
 SIaCZbraSuXvRV4PTqktJjQd65v7eDQbZahUXOd5Gu3cwfnJSKtzvU0wvpb5rNscGnil
 j9I+e5rpTLxQ50VCQHkA/RkgzXPEwyEG/4FzuDIMYWWYrTyYS/VDT5vsYJ2qOOXdqG7+
 W8t0VKzO0ej1Pjf2qk92pfU07ww7eKlE22s534a7X1XK0gC49WgaEqX1WeJgJIwcHPuG
 zlookpAGxaIhDwruexYQsCYCOJdH2FYIJv6Ydp/FLREKuThL4DA13uSEU8JvR8EL/xe8
 lWMw==
X-Gm-Message-State: AOAM531ZlGYeGD3AYx2Fz3kOTN3Gdz5dMq7j3F8wAWG6WPZMlK6jV1qE
 fXxtiFz+awl6H+ashLv6NEwcb5sokv0XLAWb
X-Google-Smtp-Source: ABdhPJxZcc1dB/8PenT4vG8pyjqgyZKjF4FfZZo+k5kkR1VqWS7d/qJLCfVQ1jjZVVPcRSk9o9jyiA==
X-Received: by 2002:adf:9c93:: with SMTP id d19mr31158974wre.275.1600326001840; 
 Thu, 17 Sep 2020 00:00:01 -0700 (PDT)
Received: from bender.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z14sm35709055wrh.14.2020.09.16.23.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 00:00:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org
Subject: [PATCH v2 2/5] dt-bindings: usb: amlogic,
 meson-g12a-usb-ctrl: add the Amlogic AXG Families USB Glue Bindings
Date: Thu, 17 Sep 2020 08:59:46 +0200
Message-Id: <20200917065949.3476-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200917065949.3476-1-narmstrong@baylibre.com>
References: <20200917065949.3476-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_030003_600412_0D169F6E 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic AXG is close to the GXL Glue but with a single OTG PHY.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../usb/amlogic,meson-g12a-usb-ctrl.yaml      | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index 5b04a7dfa018..c0058332b967 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -25,13 +25,14 @@ description: |
   The Amlogic A1 embeds a DWC3 USB IP Core configured for USB2 in
   host-only mode.
 
-  The Amlogic GXL & GXM SoCs doesn't embed an USB3 PHY.
+  The Amlogic GXL, GXM & AXG SoCs doesn't embed an USB3 PHY.
 
 properties:
   compatible:
     enum:
       - amlogic,meson-gxl-usb-ctrl
       - amlogic,meson-gxm-usb-ctrl
+      - amlogic,meson-axg-usb-ctrl
       - amlogic,meson-g12a-usb-ctrl
       - amlogic,meson-a1-usb-ctrl
 
@@ -151,6 +152,25 @@ allOf:
 
       required:
         - clock-names
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-axg-usb-ctrl
+
+    then:
+      properties:
+        phy-names:
+          items:
+            - const: usb2-phy1 # USB2 PHY1 if USBOTG_B port is used
+        clocks:
+          minItems: 2
+        clock-names:
+          items:
+            - const: usb_ctrl
+            - const: ddr
+      required:
+        - clock-names
   - if:
       properties:
         compatible:
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
