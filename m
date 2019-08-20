Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF73AC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 09:46:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0FCD22CF7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 09:46:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qU8b0TqR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="skd+6wLZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0FCD22CF7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxkT1rqvAa+2/LBY5hqyiijtHDyoOvCyEqZ+bXZU4vs=; b=qU8b0TqR7wMC89
	I4FwwLYi6lJ676+ZdOoI9m3hSOmryii/xTC5SVPbZWfK4QKq6NhSPYCytrR+PvjkAJnk1FQV2MTit
	T1QZ5zlqWPgAGlqgRaSegS19/wZC4XQUWXNtF67xdOg7qAgu0RjWEobfT2105rIZK0xa8KjJlioFa
	S5l/WdJvqdsY+tu423othIkuo5YLDUOHGJSYvAlCN5XVlLlrfnCzajketaKXPIhtTXQ/HOUg7tIms
	gAMNgpdHJfOSa3GReC2GaVigUzGdUcMpz2ZFcQ8zH/0dvBnT4siRVLVLybW9Ql2+C62ufYFNXiAva
	z5EdwhSYdNmMUAxnmIZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i00ir-0002qE-UK; Tue, 20 Aug 2019 09:46:37 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i00im-0002nw-85
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 09:46:33 +0000
Received: by mail-wr1-x444.google.com with SMTP id p17so11662701wrf.11
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 02:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wu+Hc1WycBhYeKR1pHbRQ6nVmuPzQ42/00GPF9ACS0U=;
 b=skd+6wLZFaGGAnwwAVlawhB0YB3fgyzkrfNxyIbQmuSYzcxK1m5LRcV3YMhTHl6xnT
 WQqyOczqznGQEwtngKkgVihlcWs6C+BPd2XjqYCCBde1YcFH7Ju+HioxY4GbB/T3TldC
 4/mI7j1o3rv8VLZFhgDYPIHlj5zH/Wt0FcRcXvzoMYw0br9N/d/GrnjfUsUgFsJHpw4s
 1zOFffK4RCWzi2hPVSHMbacYWjw2IHnt56AP0qZnWpzopOBzLMlna1tkorQWvv817zOw
 g+PzR3AE/PwtO4klH7y1MkabhZFOhE5XHJsk02tpaym8JiNbkZx8t6dZxllpdtgfTp2/
 wI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wu+Hc1WycBhYeKR1pHbRQ6nVmuPzQ42/00GPF9ACS0U=;
 b=Z5du2yY0CI7tTT+fvwuLarBArxJed1NfErj2kmSYvpcCC/hl3nJC7oZjJ5UQmy7Zcp
 Gfbw5gv0esT7wSLoMUfzd8IZ74JY9yGJolg5yQqiB+QV8xB8lCrOIaWriLGfLCpV9LPQ
 sRwt4z64mAtfcaGb4Bb4ubwSsDdo5XXXzPCzCu1paj2egPGWnBVWbnt63xsQ0ZjqSjbW
 eAke9gDNRu2khT9akcvcfcdPnLTT8mPcJNB3kX5yrXWyRNRlERtdLya3PKkDq1rnEIAG
 cZwkKEGWXfndmVXnbPfluLaDlVDj5N0N0IDH3xPasKRhhibo1OzJe+T007wpCLgRkGgH
 YrVQ==
X-Gm-Message-State: APjAAAWd494awPQwUWNJJI6eW3018H6t525apEf/p/xzUp16M/2Rdnu6
 Nl/9gnhb6jx5eCYYBKpTy3i5EA==
X-Google-Smtp-Source: APXvYqys9kYkJyg6KnuwR/NfvkRSehLjMhdFPI1tUm2CTUkxzTfLEICnt5NyKEOMcUoSGn2YjsoEjw==
X-Received: by 2002:adf:f386:: with SMTP id m6mr32999738wro.313.1566294390507; 
 Tue, 20 Aug 2019 02:46:30 -0700 (PDT)
Received: from starbuck.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id o17sm15958305wrx.60.2019.08.20.02.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 02:46:30 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 1/2] reset: dt-bindings: meson: update arb bindings for sm1
Date: Tue, 20 Aug 2019 11:46:24 +0200
Message-Id: <20190820094625.13455-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190820094625.13455-1-jbrunet@baylibre.com>
References: <20190820094625.13455-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_024632_286174_FE5716CE 
X-CRM114-Status: UNSURE (   9.74  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SM1 SoC family adds two new audio FIFOs with the related arb reset lines

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt  | 3 ++-
 include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h        | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
index 26e542eb96df..43e580ef64ba 100644
--- a/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
+++ b/Documentation/devicetree/bindings/reset/amlogic,meson-axg-audio-arb.txt
@@ -4,7 +4,8 @@ The Amlogic Audio ARB is a simple device which enables or
 disables the access of Audio FIFOs to DDR on AXG based SoC.
 
 Required properties:
-- compatible: 'amlogic,meson-axg-audio-arb'
+- compatible: 'amlogic,meson-axg-audio-arb' or
+	      'amlogic,meson-sm1-audio-arb'
 - reg: physical base address of the controller and length of memory
        mapped region.
 - clocks: phandle to the fifo peripheral clock provided by the audio
diff --git a/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h b/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
index 05c36367875c..1ef807856cb8 100644
--- a/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
+++ b/include/dt-bindings/reset/amlogic,meson-axg-audio-arb.h
@@ -13,5 +13,7 @@
 #define AXG_ARB_FRDDR_A	3
 #define AXG_ARB_FRDDR_B	4
 #define AXG_ARB_FRDDR_C	5
+#define AXG_ARB_TODDR_D	6
+#define AXG_ARB_FRDDR_D	7
 
 #endif /* _DT_BINDINGS_AMLOGIC_MESON_AXG_AUDIO_ARB_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
