Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B275C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:24:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BFD122D6D
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 14:24:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mPeHqpiT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OSGfdrzj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BFD122D6D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rv4tNin7fZzQtBQln9QYVpUTorrI0bmHokPV6zAR0NM=; b=mPeHqpiT425yB2
	kaed324PGhDmOblt0MT4RsbNHDQPeYuBLai1OHrvqcwIzxizsQwT/PkKzGAZhftkywdynYacQu1Tf
	m2YyyI8rLw2/jzR3KjosdnHoFKZTiBTmeb8St+b1SEX7NeXFVRw7Onvf0fv6Gcbys+BP5Ug1fJ60V
	MDRKfYHTFAj43hW99ufJdSpOBmY+vvjicE+b88yhVWnKGLuPjHXtWsmrHCa7kYIXX1usKdRsYCSRO
	nmp5vSWvY7L7dDUplZwpeovmK7A4umGE8B9CVDzS7ORA5814dpnhBEiP/H+r9dztamA8TdnKyh6oc
	2gIKpbf6n5wynxI3PwpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0RXa-0002JH-Vq; Wed, 21 Aug 2019 14:24:47 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0RU5-0006ui-Fh
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 14:21:12 +0000
Received: by mail-wr1-x442.google.com with SMTP id c3so2216468wrd.7
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 07:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DKp/3tQaH/+CAXC5vPIgbu9pLlo8VAlZxJspdFK2/l0=;
 b=OSGfdrzjIJjZpcOjACbI3Seid/ot5zvi51TgigW1XB3XjpmPJB2WNeCwQiLv+BbDaW
 a8/WMma+VwIEpMV7r4nAGjqYIxKA4rjtgJLqjR11N24KUExmK/naz1ns2YEoQ2xjk3+3
 O9pT3UGN428hlyFLjTzVUS7CIOmFQjVi2fAxfDhaFmFmA6wR9Z59OAOoDtt4CnxOCmNS
 ScbnBdTkBV0+n0D7/8IYWicO+1mv9pD3zSwS2KGee0/Pp4Gv6wwtgcHdTytxPhapKOGk
 UOE1rAHKQxTgX3rJcnDuQDcD/CMtFjC/nFzysoRDYU4nxo09WJtxWxvxhCtXSEBE9J81
 3mag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DKp/3tQaH/+CAXC5vPIgbu9pLlo8VAlZxJspdFK2/l0=;
 b=CgVDDjsLnAoKK2Q53uMnbatvcSKwSwYzJdU9npOyVrIN0cj8Uz/zep8yUA4zNarxYO
 0opZGUVQm7jQeJDx1dxfuCudpF7W1bzABx1zWlkwN5PECN2EpmiqsF8kbBrH7chzLM0M
 zJfd9iBgvjTFr5Jwu7B0+YZn37/kXjVRkFai5NZ+ZK2KZBa1Ya6QKk0nH37+ts42nVJ6
 jHNEnw6VEj6f+Q4OiGG7WfxJxAIlvnDe3WyudQgPIrksW0zd1dTe1hIi612abtKzPlGS
 gYw1kYFlJ+8Ou/l1HEocJ5pQXNi35WypLC90dx0wlYPgfdicRIQ0nr/6joTlvQcXaoOj
 54cA==
X-Gm-Message-State: APjAAAVOkrb3xF9DK+NQ7R5kgjbd9EJ7LdOr7jglh/PmiIxAGlSjHuO7
 0uxAz6nma+HI2Ib5CzQhJXC4YA==
X-Google-Smtp-Source: APXvYqzzO0DZqhYIzGAFRa6C0TlMr+71d5c5kM8OtSvLjlSjGtrSDPVnGu4LF7KrckfiDIVXcPZQag==
X-Received: by 2002:a5d:5408:: with SMTP id g8mr34532487wrv.201.1566397267868; 
 Wed, 21 Aug 2019 07:21:07 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o9sm33418939wrm.88.2019.08.21.07.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 07:21:07 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 13/14] arm64: dts: meson-gxbb-p201: fix snps,
 reset-delays-us format
Date: Wed, 21 Aug 2019 16:20:42 +0200
Message-Id: <20190821142043.14649-14-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190821142043.14649-1-narmstrong@baylibre.com>
References: <20190821142043.14649-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_072109_606530_E0AE4468 
X-CRM114-Status: GOOD (  10.12  )
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
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxbb-p201.dt.yaml: ethernet@c9410000: snps,reset-delays-us: [[0, 10000, 1000000]] is too short

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
index 56e0dd1ff55c..150a82f3b2d7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts
@@ -21,6 +21,6 @@
 	phy-mode = "rmii";
 
 	snps,reset-gpio = <&gpio GPIOZ_14 0>;
-	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-delays-us = <0>, <10000>, <1000000>;
 	snps,reset-active-low;
 };
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
