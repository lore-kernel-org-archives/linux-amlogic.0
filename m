Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02CBBC5CFFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 13:47:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C60592054F
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 13:47:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t+KNX16K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vr/WM++u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C60592054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ghBBihO79hOcP68CKzCUB7cI3avY68ULZ054BXpQM6Q=; b=t+KNX16K3h3LXn
	ALbyXQrO0Rj4FH4vaNoT0TGv7NP6b6w0x8oMxRnA3CAlrxQ/lK1ky+Pm7nCHJ/R3AzhPNAcvAENEG
	MVm/HoxjY4GVQ7bdblMW1VS+2ZGzPTh4XvtUtJ4k0U3iQQoOdYuaFOg4HGybEOlMIzBlnSxfcEpPQ
	4G20qLNBMh575bQ/4gX+pb6V8UntObBoSTyxJBhSqnEM4gNEql8AsFzIpYOOWJpnG72fidU8iFcXr
	AB0K7nIa3TkJuu5Udb1eB/qxLUa1WmrH107/QNufLlJy9Qj+UPEIZjFiuzJTwkdI9IO6xdc2JV8sT
	ZgTHJhO1z+7izNhpya5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWiO4-0001v2-LV; Tue, 11 Dec 2018 13:47:48 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWiNx-0001mq-Qi
 for linux-amlogic@lists.infradead.org; Tue, 11 Dec 2018 13:47:43 +0000
Received: by mail-wr1-x443.google.com with SMTP id u3so14170629wrs.3
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Dec 2018 05:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vQbV8xwctzus4GInPuwAdRPCS5e1xGTqZIxHK4PJAeQ=;
 b=vr/WM++unIByFuYmx35Ag47K8iqwRV5tz8LdpOmob6gJNiyQRJYwuWHfyhz2yOLpwB
 G4DPa6ZsIgahgFSL3q/J60JFsBcpSB6dU39G7RSLafD+hKD+rTxdaDi1R0WMNBFfMKT0
 rEVLl03ge+K1REaLJN44Ycu3nclbYwZ9alWqJTqu2JTx/z6U8wvLN4o92OxaGbxKEylt
 SCvt2GNE1MEUIzbhCYP2w/CDfEj5VvT/tl3f/J2gzt+u1IIFgjLGFyQIQDghpdYfdCdv
 cRPvl0cjB0y1bPL0+W4fXdZ9lClnijgCVwuMOCgtr0sb2KCw0UqPEEpVG8IebTqS/YvC
 HIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vQbV8xwctzus4GInPuwAdRPCS5e1xGTqZIxHK4PJAeQ=;
 b=Pz8jePKM7EuMgeYL13n4aDuqVXMyAIVGrmtm8DSrYB3nd0yJsk1E8PDTJ9urM8O6q5
 qvNvt3l3LJ8fDjp1ZOO1AdsgaxUAUR4essxyhZR7EcEMa/8+ESdlHCPBt77Zrd9i0J3V
 auEX61pSYi410Vfx/7UHHHbgFti3/BXfclMxjuQpbzedt15O4d/+JTeMQNllHizmXnV8
 uwxiZKebCs231POEp9Zz37EVAjQ+L72vgrXPHY1Q+smpmZwc4zKLvR9S+JmrwtK9m5hs
 VM0Y6Hv7OOH6o8k6bLqv75/INdlfQstz7L+hAIJflTw9gXZHhgwlNrEkfebPIOhbpsWT
 C/Pw==
X-Gm-Message-State: AA+aEWaPJgk3MCFqtHX9qZTplyeoaqd6qO9Hisik2i12SR574wrpJj62
 5pw2orvA+fS7FGsxPrdmfCRZ7g==
X-Google-Smtp-Source: AFSGD/VhoV/RAh1KqwKaFK0mf3j/2xTJk2mW0viP3fZVcECzv2HhtTNgGxIfbtfyQGKQK3+a3kI4iA==
X-Received: by 2002:adf:f401:: with SMTP id g1mr13929777wro.103.1544536051222; 
 Tue, 11 Dec 2018 05:47:31 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 126sm113768wmd.1.2018.12.11.05.47.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Dec 2018 05:47:30 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>
Subject: [PATCH 4/4] MAINTAINERS: Add Amlogic sound drivers entry
Date: Tue, 11 Dec 2018 14:47:13 +0100
Message-Id: <20181211134713.4908-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211134713.4908-1-jbrunet@baylibre.com>
References: <20181211134713.4908-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_054741_927123_988AE228 
X-CRM114-Status: UNSURE (   7.38  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add sound/soc/meson drivers entry for Amlogic audio drivers.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7fe120fc25fa..e8e79713a790 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1310,6 +1310,13 @@ F:	drivers/pinctrl/meson/
 F:	drivers/mmc/host/meson*
 N:	meson
 
+ARM/Amlogic Meson SoC Sound Drivers
+M:	Jerome Brunet <jbrunet@baylibre.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+S:	Maintained
+F:	sound/soc/meson/
+F:	Documentation/devicetree/bindings/sound/amlogic*
+
 ARM/Annapurna Labs ALPINE ARCHITECTURE
 M:	Tsahee Zidenberg <tsahee@annapurnalabs.com>
 M:	Antoine Tenart <antoine.tenart@bootlin.com>
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
