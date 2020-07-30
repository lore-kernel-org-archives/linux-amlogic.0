Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64B73C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C8E20838
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 10:02:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B+RqWxfH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbUnbw1m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33C8E20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hYYC4Msn3fwacRjcRlODVlPcghOU5+YuXJRNYKC/dUA=; b=B+RqWxfHf0J7FSUd+nmJYQkVA
	+C+ZNccPrVXEmofBlVvORH74PAE54HY6utG7MSU9kD2O5RnPI1cDpoLPY75zSkkcu5EhbxG0SO/TX
	VpOqRbpBV32uQCOJb5BdP9Z3vyaxJ1I+MS8btLBY6QObPUA94cyRji9aWVdyVsxY+VkbjPi+sTQYx
	48tNZoeOWcjrlLKy0VF4RzFEwEwSQ7jgp3A73dI1vNqk6Xud6BcKBoBBQeJLTWkxevhqdDt87JRfD
	PYEAHYhFzw/Az/eHiSQFh8ZvvLe9aBiBMt7lEGplNaz6xkRhaF/QQ/23mvKjKNW4VW5htgKAhoiv8
	lpXp2dvvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k15OV-0002gf-AC; Thu, 30 Jul 2020 10:02:35 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k15OI-0002dH-UX; Thu, 30 Jul 2020 10:02:23 +0000
Received: by mail-pl1-x641.google.com with SMTP id o1so13626118plk.1;
 Thu, 30 Jul 2020 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZ7SWSzvwwbS3EpvgZK6SEDfeD6G2eNEW69i7sZy4RQ=;
 b=XbUnbw1mhtlAOwfYAqrTCCYYOeGp72p+gE8bjIvWCW4s3d7UFHXkbdC6SzFtmWWIP2
 hIEOiSyvg0SlqOGG68fGQprSd73JM9IS+hXuKUP55g+JT+xdz5FA/fTy3bh5a95Us88m
 Qi+Q3Fx23lSFT0N4SiEpnaJpIozSuGq6odQ1GHhzvSMT0HA2EOriSW2sA+QEN76iuW8w
 LQcjaD0UX1kUe/QJvYiVvC5csMMalMYAS7L7Xmo0QDNcVc1YC82RmQZXQNWrax5dxtN0
 1WAi7XbFXh6QTvKMS/cgG6HOWKvubNaBzfjb+Zs+VepLud3kx3HhFAg2sgMp7m7PT6qF
 le4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZ7SWSzvwwbS3EpvgZK6SEDfeD6G2eNEW69i7sZy4RQ=;
 b=iAn3S/4CxT/4Ci7+pzYiHW9ix0avpgx3VIAXtrevNE9+eGYAN7yHTpI3iq9LOEIgD9
 8e/LVlA4Ez/OgjQFJvNtJTCd3K7aM8D+v77JlkidCgzuPUAbaUj67wnRkPq5pFW/OcI/
 hehVlSuGuyKamAVrWwHMSlyY2ulonzboRSRuBwPq6/FpxbzuCv0PSKmTNs2J57c9q3/O
 vtN98gMQ4BTsskjTuqQB48vcx8RJ3uzwjngAhqyWYQkp6MebbA3CYfRp+xDB2Oz9gETc
 GNEH50IUXKsU03HJ3457yTrC6JNY+wtyUySJUrGccCxlTeBcHWirCfwYQbtiys0L8Fj+
 cF4Q==
X-Gm-Message-State: AOAM533DJPmSfqgTuCTag0Ut9FHCWp7Rf7C/MH0zXqpClusJ/XCN45iE
 e/t6DLgriPkDE09/wy3Tdjk=
X-Google-Smtp-Source: ABdhPJwZbh5+9WfKlj1CCG0taNSZwWVmTcOxeGhhTboKzyiNHu/2x7rUEv9et/7G59VkaCSYgQA1og==
X-Received: by 2002:a17:902:9042:: with SMTP id w2mr2345751plz.8.1596103340192; 
 Thu, 30 Jul 2020 03:02:20 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.37])
 by smtp.gmail.com with ESMTPSA id d12sm5476640pfh.196.2020.07.30.03.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jul 2020 03:02:19 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v1 1/3] arm64: dts: amlogic: meson-gx: add missing ethernet
 reset ID
Date: Thu, 30 Jul 2020 10:02:07 +0000
Message-Id: <20200730100209.793-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200730100209.793-1-linux.amoon@gmail.com>
References: <20200730100209.793-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_060223_009310_724665F2 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add missing etherent reset ID for reset controller to reset
ethernet mac controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index ba63c36b22e0..8720c83990ce 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/amlogic,meson-gxbb-reset.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -574,6 +575,8 @@ ethmac: ethernet@c9410000 {
 			interrupt-names = "macirq";
 			rx-fifo-depth = <4096>;
 			tx-fifo-depth = <2048>;
+			resets = <&reset RESET_ETHERNET>;
+			reset-names = "stmmaceth";
 			status = "disabled";
 		};
 
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
