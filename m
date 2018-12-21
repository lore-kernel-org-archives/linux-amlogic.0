Return-Path: <SRS0=GwLp=O6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FABC43612
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD69A21928
	for <linux-amlogic@archiver.kernel.org>; Fri, 21 Dec 2018 16:03:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ku+IUsUC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="l6jfWtW8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD69A21928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mp+ncUXOmAF6YoSAj8dcWRNs2l+tLT48IzgH1E24wC0=; b=Ku+IUsUCadhzGp
	65JxgvOu8BTstHBT6V2lSaz/2aQd34N4wSESR9XIwrl0Xw4zOjT7z2QCgi60wxRDFP0E5ZjSnISAo
	3LqoSpQWQLmRpqPMyDYtoNj73uSo0QYMVyB0N5ZPoLp44ttVLf1K2GEOn7KqOB9hICf2TsgSJCYsB
	9I6rwXgOJ23j1vYzbpaikgcF6h25vuXBEYNt0QThkzZtgRxrEdh+6g5NB5QeKOBc8znrkhUTbMwtz
	py/lli+m6vdun48t8ABEUzo4sTF1yw/eTQFFfqiFvikEF4JbckKFKAHM1jAbh93VQjlYlY/SrvTMt
	+1LFaQjcFTFyCZVOZM3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaNGT-0000KJ-E0; Fri, 21 Dec 2018 16:03:05 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaNGO-0000G8-J7
 for linux-amlogic@lists.infradead.org; Fri, 21 Dec 2018 16:03:02 +0000
Received: by mail-wm1-x341.google.com with SMTP id a62so5766423wmh.4
 for <linux-amlogic@lists.infradead.org>; Fri, 21 Dec 2018 08:02:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q0bZMELC53/x8lmD+PNUs3INXGEckOq2dahFVEILk4Y=;
 b=l6jfWtW8zw6HpCHInoVQo9lVhkWxNtmWdR9n+MN57AY5Usq7zyqeaBLrHrmPevHmMU
 brDqtNFgqL9aTvLdwaPO1J1yoxlHJopCYi5YRiTv39em/7R2W7vNIM+jrdVZZcwgZUaO
 N/Y8i/XbgHeXCOu6NWOZIhY+twYfpYcULOR/KwKLUat7AClGrzumtB+yhYT//SmoStB3
 L9kPyY9ma/MXtOL2QwYn5TnGJtQfuw9XZejOrPltK8zzS2j9KIwMxC0bqkFmyjmILkIz
 Qbudj8a8nLkX/uOGlre/gD7V5RLmOsfLS/zVIRKzbtrfJGj2/+c2CSajKI5qun+oORVc
 Oxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q0bZMELC53/x8lmD+PNUs3INXGEckOq2dahFVEILk4Y=;
 b=n3Z3q20alAB6Gevov2O8aKVPGXgDMw5CGeVKVijGGnYfaY7OQqNNquzEp0s+qiylSj
 qxLy52Z1LarVzRidzPo6RQVh1fgB875DuP7PfLML7ItPnZiXux+lfw/HTs5x9twNsbYc
 tPpyDAfSiJYk1FURyzLSgRJI/g4tlFvP8GS8RzQ3GLIK3E5vuy9NJxJCdXYBK28Ky2e3
 T9YceWGxuKLpjXsa0Hke77WR9DBCKy6C/w3ry3HpES8fJDGvekGl//oHksjTUhxbDaTp
 iy5iSN+rfTG+weyxL0ekdUNB7tY6bSb8KtfhAP7/Dfv3PU9gC0flVEHfBKTXx1Cd1pJR
 Oe0w==
X-Gm-Message-State: AJcUukco7ecuOnQs1i23HCMj/jPXq2vxJTXN8oc7hTBfhXD+TyDXb3lS
 YUARf3lWkFez9e+BShugCkAJXmEqbvE=
X-Google-Smtp-Source: AFSGD/XcJFjdXUbsOUstk2t2ZUggTMRPjoYtpWM6g2Oicv9kaxsoqEqE4RdHniZ20c2sErVwk4FWQA==
X-Received: by 2002:a7b:c8d7:: with SMTP id f23mr3327549wml.121.1545408168817; 
 Fri, 21 Dec 2018 08:02:48 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id
 y138sm13044021wmc.16.2018.12.21.08.02.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 21 Dec 2018 08:02:48 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
Subject: [PATCH v2 1/5] dt-bindings: clk: meson: add ao slow clock path ids
Date: Fri, 21 Dec 2018 17:02:35 +0100
Message-Id: <20181221160239.26265-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181221160239.26265-1-jbrunet@baylibre.com>
References: <20181221160239.26265-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_080300_630455_E6C1F117 
X-CRM114-Status: UNSURE (   8.50  )
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

Reviewed-by: Rob Herring <robh@kernel.org>
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
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
