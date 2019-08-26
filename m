Return-Path: <SRS0=Ixac=WW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC62BC3A59E
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 07:26:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A5A8206BA
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Aug 2019 07:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DohNqMk9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qT5sO3/V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A5A8206BA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AIyLwBO+YcnQchnn0lsWbTWfP0+/UbhZ7KrDaVoQXuw=; b=DohNqMk9JC863O
	UCMsfbUZW4B0qXbyZbITAKTqAdBohRDCOAt4b1RB8xvScVeRcjlU3WHhnyJqsJ1bMGJA/LUZRCqjy
	6zxCky1UHqANvql894a6wWyoGJdgHwbTGZRFt2PuonfeIstkIy/OPAlYKixtJb7gsHN5U/uI3cPgO
	GtixGXbllWmYl/3qPbNrRySIrxcz/3Se8E7Sjra02WsE0a55u/RpdkVKxLgfBWNT6Ef8GiZY9/2qd
	iKQCyRvjnDZlyLYD1TQpL8f4x8okdi2DDFY9oRxZcJrgQJ5HkAD70UphVmi0cLiaw676C0M/s07Ja
	ANQ5h4+UJ/7tPIRHiS0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i29Ok-0001Wy-Rm; Mon, 26 Aug 2019 07:26:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i29Nq-0000yN-7e
 for linux-amlogic@lists.infradead.org; Mon, 26 Aug 2019 07:25:48 +0000
Received: by mail-wr1-x443.google.com with SMTP id j16so14224798wrr.8
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Aug 2019 00:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CGSQN1D6LMdbmgRSGuE1QGkShUk3nt2JdTILP9Ti30I=;
 b=qT5sO3/VwNLT9TYqFJpq3GUIhwypqUCsOJYUBM/JGzJ/gCpXWQiNF1AM6Gi6hIqIsH
 W+DNZxpwQSlQ/bWfL5331VrESChFxdIa8OBRlfuGlHAfYIZThkf6SUCakQ499aGtoD8A
 xlRZGuz8leZeFBkz6lF+U7393CssphmGpF7rznn47Pg8bxx+9aMs1ws/oeRbl7qKpigs
 SARsEA2jq6l7cLv0phk2SQ+9ynqJUrdGdcl795ULoIayT2/b2cjA3BCNFkdbAzZgcpfh
 wyQ52xxVMQIlDFGRwLQaTMEjziHECD024y92rUV/T4MldmvJisruNiWMlWqgXxlMuIw5
 5CSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CGSQN1D6LMdbmgRSGuE1QGkShUk3nt2JdTILP9Ti30I=;
 b=Cb6F9ZpmApWVNEvrXTwGyyH7wj/mhlectx8g60/AG96TjvL4bJZD4KH9cG/6mK8huv
 7QEGFSmSXLKt7Wshkv44AjKnVkjktaNA3kOdStXzocLqEGqANN/49cfmRK2eA1Nz055h
 FHhOUekB7cWYcRtcIfK3WKaCbUqiAdc6biVMQMloHdRXAQvzRNCn/gF/RP5VRO3Tpjql
 lt1l+R08S/s/ZPnjCSsI3jMu2w7HAJjeA6xldwKcPXURxcl3ZNnhYh0WgEJjun44Lina
 jvi+tLf4WtelILaczpfu97kp+Lk93W5NrZS/kwzqHk7bzMwUxBrGqUZ8tHW8VJUcn+3m
 ZilQ==
X-Gm-Message-State: APjAAAXy3hDc/DR0utV2eL6A2SdXQDwwfuWdExp+gfijyJakq8LU/fDl
 HLDDZbZ3CMRKqWeRQ8mDc7F6Fg==
X-Google-Smtp-Source: APXvYqwlbtNtWnQBNuZa6LXcquUhpElWikUs08sQ+LU2PHstPRCWiPiyF+S0J+d1FpO1H6bp1Vu7DA==
X-Received: by 2002:adf:e4c6:: with SMTP id v6mr19549498wrm.315.1566804344540; 
 Mon, 26 Aug 2019 00:25:44 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm10821324wmg.45.2019.08.26.00.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 00:25:43 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	jbrunet@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: clk: meson: add sm1 periph clock
 controller bindings
Date: Mon, 26 Aug 2019 09:25:35 +0200
Message-Id: <20190826072539.27725-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190826072539.27725-1-narmstrong@baylibre.com>
References: <20190826072539.27725-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190826_002546_365441_D59C3252 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the documentation to support clock driver for the Amlogic SM1 SoC
and expose the GP1, DSU and the CPU 1, 2 & 3 clocks.

SM1 clock tree is very close, the main differences are :
- each CPU core can achieve a different frequency, albeit a common PLL
- a similar tree as the clock tree has been added for the DynamIQ Shared Unit
- has a new GP1 PLL used for the DynamIQ Shared Unit
- SM1 has additional clocks like for CSI, NanoQ an other components

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Kevin Hilman <khilman@baylibre.com>
---
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt          | 1 +
 include/dt-bindings/clock/g12a-clkc.h                        | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 6eaa52092313..7ccecd5c02c1 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -11,6 +11,7 @@ Required Properties:
 		"amlogic,axg-clkc" for AXG SoC.
 		"amlogic,g12a-clkc" for G12A SoC.
 		"amlogic,g12b-clkc" for G12B SoC.
+		"amlogic,sm1-clkc" for SM1 SoC.
 - clocks : list of clock phandle, one for each entry clock-names.
 - clock-names : should contain the following:
   * "xtal": the platform xtal
diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 8ccc29ac7a72..0837c1a7ae49 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -138,5 +138,10 @@
 #define CLKID_VDEC_HEVCF			210
 #define CLKID_TS				212
 #define CLKID_CPUB_CLK				224
+#define CLKID_GP1_PLL				243
+#define CLKID_DSU_CLK				252
+#define CLKID_CPU1_CLK				253
+#define CLKID_CPU2_CLK				254
+#define CLKID_CPU3_CLK				255
 
 #endif /* __G12A_CLKC_H */
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
