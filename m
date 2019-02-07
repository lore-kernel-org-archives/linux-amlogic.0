Return-Path: <SRS0=fppM=QO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2597EC282C2
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 13:27:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E78D22175B
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Feb 2019 13:27:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZuWh/Bck";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kMRtPItA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E78D22175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D6xNi/K57QgjvtVj/3+Q7qwd1cCMI+HgMoX2Mo9zhY0=; b=ZuWh/BckxU0ZWb
	V6wa55MF35+UzxeaPGDHmETnz1/gULqbf3O9w9ZG/Bs5dK8xHENCdIoqm6n+WHPohgmDCp6dBYAAF
	R2cNO5kuzSyAAZemWQ7rvc9407ORD00LTe4aHoA4En2+2p2UZ5Q460QkI2Xrk222lGdCV/vnrQIUG
	gstMhEJ9w7BIhkKXI6ogvIZJAoluFc34sKIkQETX8oRmHl3azFDyCRBJRuaRzIRDU5ge1U1GInWaj
	MjEhLXZ8POEfVOO3fpDgeIPYKERrA0cnVeeLgQL9X0vBCUpeLdn8bzRqMynxFxLETJWagU006JsbL
	zg9t8YHBp8MY4QUNgexQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grjhg-0000N8-76; Thu, 07 Feb 2019 13:26:56 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grjhC-0008Jz-GI
 for linux-amlogic@lists.infradead.org; Thu, 07 Feb 2019 13:26:27 +0000
Received: by mail-wm1-x344.google.com with SMTP id h22so4379652wmb.0
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Feb 2019 05:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8XylRKB64rC0etlFc8MGnuHKrAg5r8/oAGOA99T2tC4=;
 b=kMRtPItAaBPkNvo3gAV2Y9er+9FSAnNPV+ICuvBPuMmMMV4POhRy7nveOWRwQZz5uM
 MnU4x1Q5o/XVzzv9OjHiEzS2NLR4bBrtEdEviWTkA8ubXKlzPsfj3HBT93Z3/ubzfybC
 sdm6rQJg5wUu1HnKVARHuXEy3WYZ9Ncd8L3GKADrpqD7GdzU8PUnStc4tywrEp0JKLRy
 oJD4Z2HWu4QaGCIBHKExQ9KlZXDt+Q6clRkZnv+3L++E1UR9kWxyijizFarutBgPvC6b
 fppEfZUsTXguscPeBeTo5U3Np5ME0zfJ0mFcP+xFYXY7DSc9W8v6UWSRSz+IVwDMGK1k
 FJpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8XylRKB64rC0etlFc8MGnuHKrAg5r8/oAGOA99T2tC4=;
 b=sOEtCo7iDfBjHZKnv9Ch9HJ9wuB1HMNEHOwUtd7I212EkniOkToXjra5nvmMMUrD/9
 svXIIFa3WUxt8cikkBQ0nHZi+YaAHnaa8RYXtOlmDdMre0tw8d+ACGL26nrB1BW5lumq
 h8u2UY+JABcW/Bz69g21Pc213zrWb9kQSX/6sTQCa85FZBrYN86wOcKoMmp39rA+1nVS
 xt4usu6Vg/UC6ZkMtcvfuP9LgroTbgRBtQjKSpp2RJGbUwsY9lXBdGm38SRueTRADJJW
 9bfx3vZzUFeF3xTPrVNE9b+6FOV50boZjGwHs9+PBk5vUvuDxki02viWGdVr2r7hVcpW
 X9cQ==
X-Gm-Message-State: AHQUAuaMQaXKSHiPOgI/bZRQznS4MUTF/FXVQfhQu44voqhz4rYdkkoB
 TRBDcYHZ+I7iEcBuWnADbQtu7Q==
X-Google-Smtp-Source: AHgI3IazHRtY/RT/wDeZ+hWjsf9AxYG8eJn5ILrK1Gs0DTZgAxISkZ90bOPieDKYv5UpyabnUNn8Og==
X-Received: by 2002:a7b:c8d7:: with SMTP id f23mr7266686wml.121.1549545984743; 
 Thu, 07 Feb 2019 05:26:24 -0800 (PST)
Received: from boomer.lan (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.googlemail.com with ESMTPSA id v22sm11061612wml.37.2019.02.07.05.26.23
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Feb 2019 05:26:23 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: g12a: fix clk_msr node
Date: Thu,  7 Feb 2019 14:26:02 +0100
Message-Id: <20190207132603.694-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207132603.694-1-jbrunet@baylibre.com>
References: <20190207132603.694-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_052626_555417_9112C394 
X-CRM114-Status: UNSURE (   9.90  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The clk-msr node should be in cbus.

Fixes: eeca2cf15e05 ("arm64: dts: meson: g12a: add clk measure support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index c9d53103a58b..05ea750b8c16 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -217,11 +217,11 @@
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xffd00000 0x0 0x100000>;
-		};
 
-		clk_msr: clock-measure@ffd18000 {
-			compatible = "amlogic,meson-g12a-clk-measure";
-			reg = <0x0 0xffd18000 0x0 0x10>;
+			clk_msr: clock-measure@18000 {
+				compatible = "amlogic,meson-g12a-clk-measure";
+				reg = <0x0 0x18000 0x0 0x10>;
+			};
 		};
 	};
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
