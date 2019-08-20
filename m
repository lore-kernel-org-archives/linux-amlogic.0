Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A10DCC3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 14:41:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72DD922DCC
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 14:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PUeJtUKm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Y/hLIPMr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72DD922DCC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9hUaY7dLyQO+dROwuYeFFNqSrtlv49KaTPhA8vp9Z+k=; b=PUeJtUKmiYuvoX
	H/LXdDSauZG1NMgKxU0ypQG4q4Q+qiOBLHdXjhFxuHIMCWSAWh1xIsFIm7wqiJV7rhtjutV+dohel
	BOg0Mpf6UTynQDZIuvq5X64/lKssRz+Qug6tia+goTWlHZgmuJpji+55zTWLENOU6b8Na0hq2q6V+
	uZdkVfvyjxk7YjgvHjVbAIbwhcee/9vBTDnsRYnrlP4nVXSnzYQqS/UyQ40pHmt33j+7lcnmNN+GI
	BykYzs6XFaJtU8zy9/W+AXq/RjnsuwYvTe05oRLG2JdvQPUSTzl7UcePp9TwUvZZPFlbjtRKuKf3N
	EEzXaO49WXF75bz8Hd7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i05K2-0003jy-53; Tue, 20 Aug 2019 14:41:18 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i05Jj-0003T9-B7
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 14:41:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id g67so2896413wme.1
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 07:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FtjbfzxxRQVlXomA51tccWbA15Rb8KwyrlxD2ZA+wlQ=;
 b=Y/hLIPMrAuVaUxTSVXjbJHQmQQ8JLEBe1TvDbYh0gvKcX2L/Q/YU6tCzL+yKFrGpZ5
 ++ri4z7NgbbXSYnpAP9cfnIKYfRqe6h736YsHvXgGFZfhrlp8i6rE9I0FqQeijg5Ywkd
 dSxEds04VSwwrRZjM0p1JUPOWxO0Drr+rqefb6Znck07/Vgb482CYubnYJfz1jZUuzGz
 ljFEX685mjvDyQG923roLxR5fBE0IEULiyQxg0QqAmYuxMTXDJH8LVbQYWH0KvnhG7OW
 D8IE/GWDFqaEzeeSTlYlvnjYGETQC7pdoEmQkBd1sT3eay60Q5JzCHIqi/MjXCwfRPFF
 Cz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FtjbfzxxRQVlXomA51tccWbA15Rb8KwyrlxD2ZA+wlQ=;
 b=Q4sg3Kdnc6Lpw3U03htiNgunbeTf/KikwsN0gId3NNhKTFXlpfTqlJBKMuBfdq8Xt0
 XynBYO+rM3vOrTDD/vyDy8b9X1cTnjwl5yn0JMVXqZ/he6tAN8uG+1W4tQUltqRiXze6
 Sllv9/1El+bjxBeCXU6+VQnAm9QsP1Ga8lRecKGZSUSAWJ//EscviXfrYLE+0DYB+Vuq
 e3c9+Pun+BBcLzldUUzO/FNGeqyYXCmdnt6k0+H24ugiul+06wR4jYPZxulHy1Qqrzrn
 mmtUj1Pc9EBOYJn6PgGBh/YNKS/xwh9tqpPCfOVlSANXOYnfPXcu4W5EOWfvEJ8rkkwN
 NGXw==
X-Gm-Message-State: APjAAAXlX6fcFY0wVAv/JDaeCtLg5so5XCSWBL1l1TNZizrFvPkbEBQk
 14ZSqNRWeOHqMNebT9RdX5ImZw==
X-Google-Smtp-Source: APXvYqwBS4oD1m88wTCd7yYz/NuvNsTh8uemnpLC23aAqfqzhSziSlAqHUgACd7BA6CGz5CxGnWs0g==
X-Received: by 2002:a1c:740b:: with SMTP id p11mr400414wmc.6.1566312057392;
 Tue, 20 Aug 2019 07:40:57 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a18sm21826750wrt.18.2019.08.20.07.40.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 07:40:56 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/6] dt-bindings: soc: amlogic: clk-measure: Add SM1 compatible
Date: Tue, 20 Aug 2019 16:40:48 +0200
Message-Id: <20190820144052.18269-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190820144052.18269-1-narmstrong@baylibre.com>
References: <20190820144052.18269-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_074101_616325_EC874739 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Amlogic SM1 Compatible for the clk-measurer IP.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
index 6bf6b43f8dd8..3dd563cec794 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
+++ b/Documentation/devicetree/bindings/soc/amlogic/clk-measure.txt
@@ -11,6 +11,7 @@ Required properties:
 			"amlogic,meson8b-clk-measure" for Meson8b SoCs
 			"amlogic,meson-axg-clk-measure" for AXG SoCs
 			"amlogic,meson-g12a-clk-measure" for G12a SoCs
+			"amlogic,meson-sm1-clk-measure" for SM1 SoCs
 - reg: base address and size of the Clock Measurer register space.
 
 Example:
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
