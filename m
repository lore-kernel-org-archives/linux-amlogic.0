Return-Path: <SRS0=BDF+=SK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4D79C10F13
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 12:18:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB0B72087F
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Apr 2019 12:18:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aiyCh1X0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GsOUHEkg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB0B72087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AA4mm9m4uSJEQMF+5I+UsICZiirPZrxUWV8EKFqFak=; b=aiyCh1X0SyXoAu
	na2LnqlL/bMKwcOHuS4XfGP19OnuNtEPxy4htkK9XyPwcme7hwRYlsTJ8FHLg2rzJ+2Tv9BFsjKgF
	e1lKTINxmtMqW19Vt9Yi5au9sDbPRhmQ0TxmQ2iRIaSB+qFH9STvPlogXM3wJjbi1K6m9OeaZR6NR
	GEPNpigSRuLhfDpuIosuBUe1zFzXmtdq+3HZPVTopvjGzBua6Owknnt+gMDtTYIS3a6CEPdvy9CLR
	SzOwMY92+mIN58ysT8WwS3eqQ2O2/2EHvKYD5USMpqCISfrAzzvpdwXfsclG2LhpNjBkhPYxX739w
	oHe9TijoE6VPpYU2sA9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDTEH-00006J-Ay; Mon, 08 Apr 2019 12:18:25 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDTE2-0008Hk-73
 for linux-amlogic@lists.infradead.org; Mon, 08 Apr 2019 12:18:11 +0000
Received: by mail-wm1-x341.google.com with SMTP id q16so14103508wmj.3
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Apr 2019 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPCsPseQBMIVb8GXk16egJLLB0THHe+Jag2FwI16saY=;
 b=GsOUHEkgKUmpMV0FVrA2lW8sTwQgov5Qlw2IShucdpSrVtORe+Tdp0qCY8kNMrXiqM
 UcxRR4+ljsvh7ubYmA9yTpm3oC7+Et9xO/Bd3kJV9VvbwiMsb1/DCerUbV0BAkAFLxHk
 QTCzgv4vD4249gqUeadn4jCsWT+iA4fb3qiKAboSKqvseCSBHXpKsWwxHfmf2QF9eOOq
 yaD94ct997yZpqHhsfG0enQuiY+i8cesScDZyYhDFlLlk3ZgRouRp7i8t44H14l5nEWv
 NJPYsHeEexnOz4TrfnHVsvjxfWGuYqLDV9x9x0nyWrjADrgFqMCPh3+Yb+OqeSM8xcNQ
 D2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPCsPseQBMIVb8GXk16egJLLB0THHe+Jag2FwI16saY=;
 b=aSk0FF7e5bDlwgcpUUQNcM26Q+3Ufeen195RPmp+z9vvpx+qi5q8nU386eWiKW+gbk
 Vhd6EhL44yH1lxMjY0RzD3EpJR6lQT9I8Akw5xxiFymWPgF5/I8GAT8BiKPXdhQbFgHl
 p2JEIkX25X4T1e4iy6Z6zYYc4WQJol37iIl60PezLK3sK5RH0OfRfO1s50Bjuq7fOrv9
 lf3u1XAfVGRawkwbpddcYmfvQEsB9w4/WbkZ2dsp1B/ThmHiMv23fYWfQHlmaKTqBEDZ
 miTVY5JSzwoxuP2D2ZLDz1wm81wXhdXt1OtOKduhQsUCK8vOieTMp/MY9iPNqWpoCZ8v
 6SXQ==
X-Gm-Message-State: APjAAAWhZxLawKaemzGx+PJ8RTk96Wq3DbnEDF6XH70HFOMZLycILcnx
 sIR5q1DeGgtjMMnwOHrcp8KV5Q==
X-Google-Smtp-Source: APXvYqzlps4FBMCEKeNxdqwjhf8OR5kgIWSeFcLdE5eWPVGGik79f/RubJkbQKGxK2pm7A3cSfw01w==
X-Received: by 2002:a1c:a711:: with SMTP id q17mr17951855wme.111.1554725888769; 
 Mon, 08 Apr 2019 05:18:08 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e1sm52865103wrw.66.2019.04.08.05.18.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 08 Apr 2019 05:18:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] media: dt-bindings: media: meson-ao-cec: Add G12A
 AO-CEC-B Compatible
Date: Mon,  8 Apr 2019 14:18:03 +0200
Message-Id: <20190408121805.2870-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190408121805.2870-1-narmstrong@baylibre.com>
References: <20190408121805.2870-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190408_051810_259268_FADF9738 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Amlogic G12A embeds a second CEC controller named AO-CEC-B, and
the other one is AO-CEC-A described by the current bindings.

The register interface is very close but the internal architecture
is totally different.

The other difference is the clock source, the AO-CEC-B takes the
"oscin", the Always-On Oscillator clock, as input and embeds a
dual-divider clock divider to provide the precise 32768Hz base
clock for CEC communication.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/media/meson-ao-cec.txt      | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/meson-ao-cec.txt b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
index 8671bdb08080..c67fc41d4aa2 100644
--- a/Documentation/devicetree/bindings/media/meson-ao-cec.txt
+++ b/Documentation/devicetree/bindings/media/meson-ao-cec.txt
@@ -4,16 +4,23 @@ The Amlogic Meson AO-CEC module is present is Amlogic SoCs and its purpose is
 to handle communication between HDMI connected devices over the CEC bus.
 
 Required properties:
-  - compatible : value should be following
+  - compatible : value should be following depending on the SoC :
+	For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
 	"amlogic,meson-gx-ao-cec"
+	For G12A (AO_CEC_B module) :
+	"amlogic,meson-g12a-ao-cec"
 
   - reg : Physical base address of the IP registers and length of memory
 	  mapped region.
 
   - interrupts : AO-CEC interrupt number to the CPU.
   - clocks : from common clock binding: handle to AO-CEC clock.
-  - clock-names : from common clock binding: must contain "core",
-		  corresponding to entry in the clocks property.
+  - clock-names : from common clock binding, must contain :
+		For GXBB, GXL, GXM and G12A (AO_CEC_A module) :
+		- "core"
+		For G12A (AO_CEC_B module) :
+		- "oscin"
+		corresponding to entry in the clocks property.
   - hdmi-phandle: phandle to the HDMI controller
 
 Example:
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
