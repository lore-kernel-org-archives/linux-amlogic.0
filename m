Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B7AC433FF
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:33:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5947D2133F
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:33:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cozs+KtD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m9BQRXok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5947D2133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5/7cbPzHeoM6BWgHKdmuAuCnXTFAxKo6UNPhOda5y4=; b=cozs+KtDgUhib+
	OGbQ0mmlh0W01eA508sIw4Mjbnx0+kXoaMITCzJc2GOsqk0dGihI7VpAMlfCkPlgUMqF7ayc5b7CV
	TnAlD+Xm6uI4N11gtaVjZIxCggOsSJhsiJb0ICx4Onb9v5WWUR1m99fJavX+pDXfJfjE1ZRGtVtKZ
	FZJTwzvE/8YzY4onLmRV9Ep2y6S8Yu3+Hj6BltKbwNquKMsooruLOo2lMqjIZiZ/O1Vm2v6qzsuJw
	cf0nHTvIEaT8AgjxOf9Z/GAzc/jc1E/pAJFcJ2UYM6XqLbEWuKpUgw9sNhmpRUGXL4xMo2yillss+
	F4qiQbEi+kFgVwoTXd9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuKi-0007Ob-Hv; Wed, 14 Aug 2019 14:33:00 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHQ-0002ji-2T
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:38 +0000
Received: by mail-wm1-x342.google.com with SMTP id v19so4658597wmj.5
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zee9ZRDcb5inoC93RJS0uCkZrQQq9+sqXLbyGEkf3es=;
 b=m9BQRXokoK3oSLoUUWSs2P/Defc/M0t9ePLgdmYqsJtzJ0HI3LnXX5AHvsqPrmMUsU
 iUI3sllxVhZnHVaLcTFiqiSPDYCnotEhoZIj6UAhJ5GZNeyK8CfZbltY0t5zysRiVJJG
 IE2X30uYI3ir2Ab2j/XPggNbgLrxPzAa/QIgoIuPnWrpxfow4T2kSU2vV+1Ks5xczDJy
 nknhfRbZ2oz8bmTU1UwHiE8mZaMjczktURT+D8oqWgcHgUTWq9d6JsXqfkz1yM7ytxCL
 roF2OK8GdvWpWHwbpOGdkGIGmlWwEMvM3aYtyARyEil6Dnd9MvCi4R0a5LrAgLqMgVzg
 Q91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zee9ZRDcb5inoC93RJS0uCkZrQQq9+sqXLbyGEkf3es=;
 b=R+Gat+hlS51VEQh6D3KutF1OcwyHOfTgEuDEiEdIneLEkG38nnAPLW7jMzHp7E1AB1
 tt3uMEHMPf+9+4//ufc4sw07AYm6anA6qPqi8z00C0Ze+jIIfXA8aJ0ElbH8saFaPWl6
 iQ0XVCZyX2Fm2nPXxpfEXmY0gltutoTGpS+OKckJ06QF3PE9Vl0KrdPIvq8AmaF2uPlO
 HglYyNRMLMGqngQXBCACWmbkK/xJJza24zd9YGKhS6uj0NiDbqpFnLsnKbzRg01ARleD
 S7iWJ5tkqAcc0pkeDTv/PSdQgbhdcSAmUvlsbCNWJVXZB4rfYf6NU7vjMyTYJq64qbIp
 zEvA==
X-Gm-Message-State: APjAAAUlOFv1UumwzmteXcPmDfq0YRUItOvnbF0HzujCykdsuNFel1n7
 MScABYVGD+gi4TQX3+E9Eklr1w==
X-Google-Smtp-Source: APXvYqyObvPZ5EwHEMDDw6HePxLmKaHa/IrznJlLwb7R76uBXAsL0zEnQqlQ0zVdkK3gER53KlcZjg==
X-Received: by 2002:a1c:a481:: with SMTP id n123mr8225671wme.123.1565792974524; 
 Wed, 14 Aug 2019 07:29:34 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 11/14] arm64: dts: meson-g12a-x96-max: fix compatible
Date: Wed, 14 Aug 2019 16:29:15 +0200
Message-Id: <20190814142918.11636-12-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072936_228718_72C78A04 
X-CRM114-Status: UNSURE (   9.84  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-g12a-x96-max.dt.yaml: /: compatible: ['amediatech,x96-max', 'amlogic,u200', 'amlogic,g12a'] is not valid under any of the given schemas

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index fe4013cca876..acb931cf3e7c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -11,7 +11,7 @@
 #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
 
 / {
-	compatible = "amediatech,x96-max", "amlogic,u200", "amlogic,g12a";
+	compatible = "amediatech,x96-max", "amlogic,g12a";
 	model = "Shenzhen Amediatech Technology Co., Ltd X96 Max";
 
 	aliases {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
