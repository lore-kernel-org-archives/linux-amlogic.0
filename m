Return-Path: <SRS0=pKyR=WT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796AEC3A5A2
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B68C22CEC
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2019 07:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qI5lQ+D8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qxwEOLfb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RcHgUPSe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B68C22CEC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tCkGEMuLJerLXQBBDhJ3bqyRexQJhDT3Ex2kaGPaqx4=; b=qI5lQ+D8xWc7dq
	gTGfthTDpxJGLxI52w07+H8pl4Pio9lrk5XU0wBL1XTGPJY3CI5m9aPM2ikMCqai8g58TdfZKktHL
	wKs3ZBT63Jr5I8TESVeY/zG8hcnU/I9X227BG0WIIdYzyoT9DECL5XxhNK0Q5EMNO/XtKXmQNTYe1
	+5tRnYYVG9dAOkC6hLwn7kXm14O756pechb1V4XAc9pG808IRndzEIJgwiKxHUDamuFEl6nogUocV
	p8MHcK+4EqhBSRWPkUQVMbRSIxhWbjQ/zkhLa9+jwITEk1IaWaXBpTxQgW6xva1DDZxUHPDenfl3C
	NGQErsbA6sBO7ya+Lbwg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i13tp-0005pa-C7; Fri, 23 Aug 2019 07:22:17 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bO-0001Eu-Fx
 for linux-amlogic@bombadil.infradead.org; Fri, 23 Aug 2019 07:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zZM+2enzuUNFCA37SD/7zYxLMBFSG+C8Aa4ksqqieas=; b=qxwEOLfbBc1TXxhgk+T3iMeJO1
 XF+6UTd9rUUToYWUJWrevIOEzamdzz94hrDBDZUeAQTBw07zM9QgYchmXPX2Ww+arKXMnwacP/8vT
 eFfzH/czF7uR38geQACM0Ph1T409/GEi55gaP0sUXssyuvICulm2cGSECfZ3zieTp22BJjKQ/rV1L
 yESVtiDTU1Tjnmh5m0vIWvgB83HbLao7zv4yoI5SCDm90TnlG4wZ5+dxJtAktlSmA3coWTu/HUm+v
 eWfrrWHsWT7d6pScxMVS9FnzR4JIa0blGAItWYFFLbHXJZjb2kSqUu6DjO/YhVhn9+n7jFbzkNONx
 njdTFAbQ==;
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by casper.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i13bY-0001fL-3C
 for linux-amlogic@lists.infradead.org; Fri, 23 Aug 2019 07:03:26 +0000
Received: by mail-wm1-x344.google.com with SMTP id 10so7863122wmp.3
 for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2019 00:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zZM+2enzuUNFCA37SD/7zYxLMBFSG+C8Aa4ksqqieas=;
 b=RcHgUPSetZMb6XVkRBcbgGh3voKANG45YMVzzKFcBxplKZXPJ6qQ79gYxNulJpGOeI
 BpeCqli79E2juPK5/L3Oo09h3P+RbZKuC86ktySK7JHgQhx2cyDTYKiHBr58swEdihU4
 wIIPqLQXAHv5XiPJlJ1rdUXO/cESPQ3k5rg7NMeWBFFOYfwzy3HVS5RdopLunT/guGbA
 33wnYMm0Lg7o7sq2ToCZ7BymmWmuLbcbUAH/roNTnFvHR7OFtunORr5PVt4e+qyB/Z05
 MFFvG6SkRWCPKzHuZzUSdeSWgFEKv2fjE+0PyWUzi9buLFxuU06W9Q6rw+pLi+4916x0
 v8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zZM+2enzuUNFCA37SD/7zYxLMBFSG+C8Aa4ksqqieas=;
 b=n6dWZF/UFSeAvzSA+iZFJfABT0ps/61PP3YCTK2lv9TNNH+ZIERP3xe2ohUwt8cd0j
 PhijWLvtGXq/DMpnbv8T7X19m0OVCYg5usPScjwyUlq2rfjTvbY/XkYuIDQGRVupiBec
 6EVUfRvwoyasDgzjOKrDSLKKTxjd7FqeKshoMhhjzlkKtSx9EMOFJIoWJepLXP55P8E+
 YBpU+JFa7iq5VWpD5JMt1s6baUCkPJPTQ5IbtnE3i+Z5Pf3Y+27uvAtSD6qdECpsHWKk
 jHAKbxJyd8i7Z0UulzrMc+4ANsxUHfZe8EITvOc8XQTw8XNM1SxZ6dR6aMqLYaFsAgSF
 tFaw==
X-Gm-Message-State: APjAAAWcmsG4D2P6W1h9rDRHxLtqPBth2Xn63+n4eRI7r4fZGbAaWht7
 GAKxPlzALacfyxCMxu4afaMNxA==
X-Google-Smtp-Source: APXvYqyk17sTfM7f3T7mT0ImLFGi8x3Ic4MHhGFXmX6vZ1hYbXK3bzb6MkvBUg/eQKrGDTAjN2YO8g==
X-Received: by 2002:a1c:5453:: with SMTP id p19mr3357995wmi.120.1566543780920; 
 Fri, 23 Aug 2019 00:03:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id a26sm1741833wmg.45.2019.08.23.00.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Aug 2019 00:03:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [RESEND PATCH v2 07/14] arm64: dts: meson-gx: fix periphs bus node
 name
Date: Fri, 23 Aug 2019 09:02:41 +0200
Message-Id: <20190823070248.25832-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823070248.25832-1-narmstrong@baylibre.com>
References: <20190823070248.25832-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190823_080324_173103_A8D6C154 
X-CRM114-Status: GOOD (  10.30  )
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
meson-gxbb-nanopi-k2.dt.yaml: periphs@c8834000: $nodename:0: 'periphs@c8834000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
meson-gxl-s805x-libretech-ac.dt.yaml: periphs@c8834000: $nodename:0: 'periphs@c8834000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 74a2cdff0563..6733050d735f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -451,7 +451,7 @@
 			amlogic,canvas = <&canvas>;
 		};
 
-		periphs: periphs@c8834000 {
+		periphs: bus@c8834000 {
 			compatible = "simple-bus";
 			reg = <0x0 0xc8834000 0x0 0x2000>;
 			#address-cells = <2>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
