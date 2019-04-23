Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE82FC282DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:15:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BDD9206A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:15:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KzEtpUwu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="c0hsP+yI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BDD9206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RM01ANVCjCj3xWcMDbleHp2Dq833nz6JKiH4hdIBN0=; b=KzEtpUwuOSqdhk
	e7H+GsNj6sbXX42BorleSpA4rgaOS+P/5236CyxHU1c6dWLOAXs8DPKIrN0XPdaNPG3OwVPmAlfAA
	TQi+lBS7X27oEoitxUQD1jrHdlfNbszHI3d+t84GeyU7klyKKq0OSIdulCkbYcnr/rJtg1i/Ttw5l
	dt/ZAYSJLv8fud6dhgDgYDqaf8QB1OqPjfrfrhLKUoAJVTMiiQZMvOIgf9/fLZpmS8mJ4pJCO/fec
	KsycxSSlVZD31chZ8A3KPwRalUlFeuVzrvqGKcNThgkj1mqhtw5zZkFLRzrrPiw0k9YcjDYa1LhhR
	FNOMNKLfG/fvBA1TM0VA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrWO-00030c-JO; Tue, 23 Apr 2019 09:15:24 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrWA-0002jo-T5
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:15:12 +0000
Received: by mail-wm1-x342.google.com with SMTP id y197so17850521wmd.0
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bInNvpdWwB8SzqqGmXY3uxa+isS0spqIYrGtdkeVxUk=;
 b=c0hsP+yIZF19h+AXx0mT2d4eJ0IH1y85CxXD65JPhpKFXgcv3Wd0iRQGjENk5eURYC
 qHX80QIlnFt2Guh/QQ5OvVATzOHhyzVlnBjlhdFnRj5Pi3uPhnIk0z3rm1+SEFLlaQvf
 7dbKeJC/GTcVs/DV6w0bePrR1nIxItr/BJKT9UZlP/i20vQz6TzUSwn2bd6ANhsRwRM9
 RaFHlh8zPuq/fMMCrU3TnItYiJcvrfe8xcw63X//qr6q21QvSj0ObbiBsfmSvUgGSTq4
 2D/FMUJKqOz7bclq7VOqjGw7LZtRSnh8NjU7xbcsRjoCtCYWEImkUxCRYbs6mPDuCOaJ
 LqBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bInNvpdWwB8SzqqGmXY3uxa+isS0spqIYrGtdkeVxUk=;
 b=YsxLJPbn+S5mCcsP7Au7NlyqN5Dwjc9WJi+/NonaA7ooGv7CYIKCaU5cRud+Q7mS1Z
 PPych1RIf8TRA09LKmOuVwD4rqU9a8iWADJ9zlvrk9u+Ce0ftNK+Enr5lqtlaGsSMG0G
 9G8VjxuTZTCnyJE9cB0DYEWr9iGhAIe4IVC5r4MuFFWT6AARNuhebxK04z6z4dGB75W6
 ZQReLE9hdOChXvlVcvy8gfS1ibwByrkPQIU2CZp7WAAXmkFe/iSBEJ40RIsBKFMA+cN1
 0UoTBWLRoNV8S62sU4WSOzcaffZJmxF7BWhB3nDHKVyjEH+N2nv2ICMeyhVl3asf6QnL
 45jw==
X-Gm-Message-State: APjAAAUU9v0CeU+d6YmS946NhdndQVQxtp78r3Yp+DacwWpVcBWC5AOz
 y12zw4io9TsUEsQNwPY4QD1/4g==
X-Google-Smtp-Source: APXvYqytnShlWc7jx99S4PTztqmWXYznar8H0bgJqj5IMVe4/uzyShja8Eh3SDIedamYeQh+k6yQlQ==
X-Received: by 2002:a1c:1b16:: with SMTP id b22mr1549969wmb.101.1556010909322; 
 Tue, 23 Apr 2019 02:15:09 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t17sm12241272wrr.26.2019.04.23.02.15.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 02:15:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH v2 1/6] dt-bindings: clk: meson: add g12b periph clock
 controller bindings
Date: Tue, 23 Apr 2019 11:14:58 +0200
Message-Id: <20190423091503.10847-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423091503.10847-1-narmstrong@baylibre.com>
References: <20190423091503.10847-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_021510_940692_34D32717 
X-CRM114-Status: GOOD (  10.28  )
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
Cc: Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the specific Amlogic G12B clock driver compatible.

G12B clock driver is very close, the main differences are :
- the clock tree is duplicated for the both clusters, and the
  SYS_PLL are swapped between the clusters
- G12A has additional clocks like for CSI an other components

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index 5c8b105be4d6..6eaa52092313 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -10,6 +10,7 @@ Required Properties:
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
 		"amlogic,g12a-clkc" for G12A SoC.
+		"amlogic,g12b-clkc" for G12B SoC.
 - clocks : list of clock phandle, one for each entry clock-names.
 - clock-names : should contain the following:
   * "xtal": the platform xtal
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
