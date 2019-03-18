Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702C1C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:59:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4079A2063F
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 09:59:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Lrf4GRX4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="b8nluRDf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4079A2063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+IhyiZaIxPKRA3wQ6U05mrmS0jgKDuH3fAfqHzUtNI=; b=Lrf4GRX4DKkbbI
	87g3VUNlcg0QNNcXakBhNcn5leQ3tLOC6+nYu8Yuo+NyC9nzIJQzwOGo0HlHGHX6MdMg7KdZuttjn
	OiPFK+TFYiW+o8aaGheqVu/MAIl97d5JIvOf0OnugQ0n31QIHIFQ7R4q9dLc5RYiCYyJeUp+b/5TI
	PLyyI3rthDcqwAia+wK3XgtWxcw0Qcvug1YXZ3ceUHescqPGe2AttkHTVOmZ0utaLRQ1NU1tBl3Rj
	InpzTmheEjGKNtQazAe6Nj3tHw64Yilj0Tfy5jZHHOgzue2Q7MRX4Nqtb1XV8LGxPVw3SAp9hS9V9
	lYKfMrCDuWcuqQP7CaFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p3a-0004Uy-Sx; Mon, 18 Mar 2019 09:59:46 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p2p-0003X2-GM
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 09:59:04 +0000
Received: by mail-wr1-x443.google.com with SMTP id 33so16288335wrb.13
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYk3r0leNCPgpCAbWkPSi9BELgwJXXTm0j6LgXKT/hA=;
 b=b8nluRDfQBz+bboGy0UiNEqclvnEeVbVctSZaHhFe/Q9qNAXqgQ51yX30VbxSaMjon
 MfrXSY7YJdKNSNW8hOtae87IG0O4MG2e/YXh5HJGtoGzpdoDS4c5c4SabKF+YLi1MSO3
 aAFWLMmqbfhdDVepMAZTDGhsL8EM5EVH6VT47EktalHiR04epUHDdd+9wKgowVXvwU8s
 x8wOPNTKQp7jVmAwMNmPLnqWl6uugexMzxtvJxFe4jtSaGimfxLIkElUAgJvxFSqzS32
 LfTou7sgC8cd0NOYNP3snodb4Ltw0piahFiDKKyoarQuJ1Ml/phwUmbhN3thhyXVKIOY
 iIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYk3r0leNCPgpCAbWkPSi9BELgwJXXTm0j6LgXKT/hA=;
 b=HXNlJKNHF7+6kllzRq1ZIlHpIvrAteVew1AdLUjMCqvEN0qQgP5X9jKh/Gph9LJV+B
 3ZxNrzEty5XCDNf6/Gye/hWpIxVxQhKN+x0WnjWq5GibPWe2/y3b3Rnr4Idb2guPdtRW
 aM9SrbYqC9xQP+6OwviJf5KWCphA+zUGCFqtisA/JpNHWgc9FLpcNv9RSTwktCeJUhtW
 gA9xOMFjcGXfr34EAALlTRL4EKK2waHmPYWsmAUpdxek/ucjwCYLHub5WWvb316Djplj
 XNZcjEkGmRJt2IUhJp9kv4jEOuJwyZfain2N25NwHHxLLlI5mjyMvCR/azucdzVTBfQn
 cx8g==
X-Gm-Message-State: APjAAAUv5woAWuxO3AYlji4B6T2mXj1n208SV3zKr8YaK9QlqkALLiqE
 KQo+cplOPf+xb7GndxbEWlPwNQ==
X-Google-Smtp-Source: APXvYqz8zOxVQ8CAD/r0m6E/P/9f4qcx6BqOioj4ap08rp70H2iSLneMuNNn5Iw3uzoCI7+asc1KLQ==
X-Received: by 2002:adf:c002:: with SMTP id z2mr7400895wre.177.1552903137288; 
 Mon, 18 Mar 2019 02:58:57 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g8sm5459034wro.77.2019.03.18.02.58.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 02:58:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 3/8] arm64: dts: meson: g12a: add uart_ao_a pinctrl
Date: Mon, 18 Mar 2019 10:58:46 +0100
Message-Id: <20190318095851.4062-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318095851.4062-1-narmstrong@baylibre.com>
References: <20190318095851.4062-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_025859_638183_9A490868 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>

Add the always on UART pinctrl setting to the g12a soc DT.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index e050737a1b3e..7023c1c0f23c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -179,6 +179,24 @@
 						#gpio-cells = <2>;
 						gpio-ranges = <&ao_pinctrl 0 0 15>;
 					};
+
+					uart_ao_a_pins: uart-a-ao {
+						mux {
+							groups = "uart_ao_a_tx",
+								 "uart_ao_a_rx";
+							function = "uart_ao_a";
+							bias-disable;
+						};
+					};
+
+					uart_ao_a_cts_rts_pins: uart-ao-a-cts-rts {
+						mux {
+							groups = "uart_ao_a_cts",
+								 "uart_ao_a_rts";
+							function = "uart_ao_a";
+							bias-disable;
+						};
+					};
 				};
 			};
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
