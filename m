Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B38E6C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 861002082F
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sMHRqrxa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PojLIeY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 861002082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myvzyk5rmPZmOD9pg2Lvtiq1lTLuoKmDacGpxIML3Zo=; b=sMHRqrxawVc3h3
	ttOCUsKxgW91Uct7x13gIpyYNEqHL8aylmvku1QJR+4huK0xT0bImipvy/2sUWnQh1t7lRISx35iB
	BmdX1gm880XmxVvGUIq/6YnpyRCr8bSfLEEzg/CWPwbPnjShz47FODlA5J0nsWIXnuUyz4RzFvGUC
	POt6hrgrf0aWt6JVPPZs4QrkAnLefHpONe61dFo++phqM2ykdoqbwWYV//q1YmZX4/aPAiOUYNXHZ
	s3+AybBRWqvGyMao2CIfioEKS4gR08QDI5xqCCGaSUd5WyNf+SeAe+Ri8MG7pE0ZbvoHnQIPUFMhi
	VD8epnE+vR7qNcFKBPDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTo88-0007Mg-TF; Mon, 03 Dec 2018 13:19:20 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTo80-0007Gj-6M
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 13:19:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id v13so12132704wrw.5
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 05:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kB5h7/Rv1D1xOyHHlP5vWdrL7/AqkFtz/4BXIM0rK9U=;
 b=PojLIeY3MW0adsgpleN5wGL91ePZiK4bHuEPzWbp8iRQf9aOBjXrjkuJjgj0XlEg/b
 KWVx/quw7zUfLbHi8w53zvLr8asluoOFM38tJU6sE/YojRqOVV3SFa5QDrNR5OaIOjtg
 +g2ADTdPlkRBmbpCCqwdFhgdPtdXwejPIMXYWFsfUqiqX2wWGVFfMqT7SdsBblRGJXYo
 sQOkIq6lo6eg+GZ5T0OOMTZG5BcNIgFbo0/KVp49qmlZxEC+wxLwzFZb/bS4QTT+S/6G
 FAA9c7h5lqqG2znsuCzgCHC+3Ij/Ou9YxjiNh8745npYVHKJf9gBUaDI4lMmWzHuNyZw
 /lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kB5h7/Rv1D1xOyHHlP5vWdrL7/AqkFtz/4BXIM0rK9U=;
 b=LrDg11uhMtdW+BjSb//gQcD4Os+GG+rSwMnAmHfR9uGyBTERrq9G71QhFyFgNgvJZu
 BcLI2OySwDgQqNS4/ARaz40MjGvnszcWIi8MfjkPOa2RRPSmqQiOky+lFBI/AL3cHGsl
 FVjf92tzs/C92pfp3KtMc/eq2ysZMp7SfxGlID0AstuY35N7QbUsAz+McAK/iyDYb7IL
 g5ah9ej1Cw10yY1mtV6m5z9Fj6QcPG0wSqPfEWqE2ZgiF7ufFQKs3162GXG/gZd2g3eF
 SQ3fw6UQvDa2PNH26xKSGWSrtiNwUZ1Ei/8XB4Cksy/bv+Nnw3aDDAcKGDgK1ZpxM2A5
 ARcg==
X-Gm-Message-State: AA+aEWbGaNMxNug4V/rOY2WBJKQkJJarj8eC8bdvVPrUWWxbC/cYGcLH
 6zcuQ2asVwNAUWIaS/DINjaBOQ==
X-Google-Smtp-Source: AFSGD/UZF9UuEkYeIdajIAI7B7XhcajFUllHFzFJcGmdcIDTGR5C8gZ9gaClJ87PzrGgYeZqqPdjrw==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr13759344wrr.155.1543843143160; 
 Mon, 03 Dec 2018 05:19:03 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id n19sm6371063wmh.26.2018.12.03.05.19.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Dec 2018 05:19:02 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Carlo Caione <carlo@caione.org>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH v2 2/3] dt-bindings: clk: meson: add main controller clock
 input
Date: Mon,  3 Dec 2018 14:18:49 +0100
Message-Id: <20181203131850.31388-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181203131850.31388-1-jbrunet@baylibre.com>
References: <20181203131850.31388-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_051912_234279_3DDCD120 
X-CRM114-Status: UNSURE (   9.69  )
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

Add the clock input of the main clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index e950599566a9..a6871953bf04 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -9,6 +9,9 @@ Required Properties:
 		"amlogic,gxbb-clkc" for GXBB SoC,
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
+- clocks : list of clock phandle, one for each entry clock-names.
+- clock-names : should contain the following:
+  * "xtal": the platform xtal
 
 - #clock-cells: should be 1.
 
@@ -31,6 +34,8 @@ sysctrl: system-controller@0 {
 	clkc: clock-controller {
 		#clock-cells = <1>;
 		compatible = "amlogic,gxbb-clkc";
+		clocks = <&xtal>;
+		clock-names = "xtal";
 	};
 };
 
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
