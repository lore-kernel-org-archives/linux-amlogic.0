Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08813C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:43:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C92BF218AC
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 13:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WV3Fw+Pa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="taURnEyh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C92BF218AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dhMYIiWAcYiBpGumtpZA4+F34zGwKxnzZkgVGvkBhGM=; b=WV3Fw+PaeCLXSZ
	mpv705RjY7FfEHXLhQHh9KeivqR7M7RJNejFved83Lhk3oGznOp6BJWsyypfvOlVcymHr5/yXb/XE
	zO9Y/rsevTGHDpCeMOePfh5eSYxhjNqlT3qv1TBPSHckYVneCfWSDJzvrRqwDSiwXNSgp0J3VnA29
	9d7UhIE/m/+C6y/JRbVx5m+yrEHqmtgDUn3ADWpTOAYiGHqHnl/UvJJaLHEbjmfGaCWjPkfXzJSbv
	dk3/rAAey6gSoJJDirKai2FWXhlPmh47b2QUG/JmfWtMvC8LFpJYMs29dGgNsWP47FqUSTyyaqmYn
	cteCFp6GHV2UUjkj4Ibw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4n7D-0007FW-Oe; Fri, 15 Mar 2019 13:43:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4n6s-0006cM-4k
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 13:42:56 +0000
Received: by mail-wr1-x443.google.com with SMTP id p1so9625493wrs.8
 for <linux-amlogic@lists.infradead.org>; Fri, 15 Mar 2019 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gz+IYaan7/2Eh+eJMLV0munYzmfacWjDFUXL21TiogA=;
 b=taURnEyhPquRk5Ay2RyfFOVZyjGDdGdYHAcKPleHcNp1Qgrkxts5McL4Mr6j/kVBHs
 y0wZl3OKieUbp8QMVYG5bPSQskd4Q1goOR1UjXsGcs43M83sCVRVeHGkHhjfoXU/qeC6
 nr6ZUHKbC8KWN98WzYppLz6y2hF+rnFLQ5NiufjeWwyOcbjDrleRfwplI/pcRphUnAet
 UgHs772kF5XQ/Xd/xAejCidgOuIjMQWTjZBr9zHerRXsJgHH3ZkslRd7qiPPJcmZ9DJd
 zQRUZkQI7qFuPy/LDBDKcZLxXOrd+l2vV1ixZxH/1vIJ9i1abVLukp74XkfAWunVB1ib
 cqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gz+IYaan7/2Eh+eJMLV0munYzmfacWjDFUXL21TiogA=;
 b=t5UMMholIvgnSGnW1TCni7oc4UZ6xvBUbVH+bvjhnbKZ5e9vEK3H5rgIIK4huAAvD8
 J/WKlxnmWidZtxWa99fb3OOR6tvzLbMRYDLOrHtIQBkPTFcULogK7+7fU2kvPiiL0L+a
 yTD9mz3Qrk4vNuGGmbdFx6Sar33XDhg3WNVuNIymjavorcNUdc+uU4cgIk8SWn604ilC
 1zQ8XIhcoROcSTAHSQsb5yydwhjhbrK8VltlZRtAUiIIii6myz3iBAMmXzrmsKt8FI9y
 i0LrAm5EhgSCSKEvqe5Sk42Jeq97t34dfwlvbAh7t38lxsV9X+xSXIf6RNCkr/fXwO1+
 0q9Q==
X-Gm-Message-State: APjAAAWbWiP9PAJt95kF0187LMEsI22Vg7Qf73NK3/2uwmtBLO6TfgFH
 BNM2Icm9HfW7/GkNVFa2MKGgpQ==
X-Google-Smtp-Source: APXvYqwq/ds+ohvPOdLU9ghTLwQJIFCSqgfQH0nYW6PffVPKKQKhj3Ora16ZfySP/rcuSQTvDIWoGQ==
X-Received: by 2002:adf:81a1:: with SMTP id 30mr2708660wra.285.1552657372397; 
 Fri, 15 Mar 2019 06:42:52 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id x17sm4616143wrd.95.2019.03.15.06.42.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 15 Mar 2019 06:42:51 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: g12a: add secure monitor
Date: Fri, 15 Mar 2019 14:42:43 +0100
Message-Id: <20190315134244.14141-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190315134244.14141-1-jbrunet@baylibre.com>
References: <20190315134244.14141-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_064254_179514_A24250EE 
X-CRM114-Status: UNSURE (   8.07  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the interface to the secure monitor on g12a

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 31ddf9444b3e..92ee8c895ba6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -72,6 +72,10 @@
 		};
 	};
 
+	sm: secure-monitor {
+		compatible = "amlogic,meson-gxbb-sm";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
