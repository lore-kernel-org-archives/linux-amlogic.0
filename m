Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A32CC32757
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B5D2083B
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:32:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IqzE7ejq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GNzT3FnI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B5D2083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RJzU8op1ycpe9pqT2TulSMDchYO6hQyUu12QgzlBTIE=; b=IqzE7ejqMFv1uR
	4TZHwrvQVBSpTSzSU+wyJJXt6fxCuHVFwQ9XA9V76bcYfKmTCRLOuAJZzz6Nr9y1Nrqrk3D4q/1hJ
	/P9xrnjbwNLYeiG0//Ib23xoYwr26qXhqE++Vwi1P/MuGf0mMWPcfPkvQ1C/LXmmZ5uWFI4XFFL68
	dYGTFFZmF90Mn1CPw2xNaUI1RRGPinWJ/SBRYAbgKpcuGb5EWBLzJmXhL/anD7cuVmNJCZ+KSXgWu
	Kv/IRQyJGS9vA9z2ep7/dlPieV4vtYYWURgu9jbRV6yMtaa8MNDQOh23Wb7vwVdFwPVWd2gAza8fF
	f5B4MQ5Na8vchynLYxqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxuK7-0006dM-Ub; Wed, 14 Aug 2019 14:32:24 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxuHN-0002dq-Ty
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:29:35 +0000
Received: by mail-wm1-x343.google.com with SMTP id m125so4655278wmm.3
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d9R5lD+eyPtty/EDRB0dxvoT1lDKjG0Cf5Gg/5QaCyE=;
 b=GNzT3FnIRl2b3ybIdQLPxMtE9bcdJkCqUB/3O8hct7afWdURosTJPbMY96tVMfIvjk
 CvSVfwooKZNsxNPcBIFpagBc7IfYBvJbbOm9x39Q21Edp8unNSxuRrFEj/wi8Csdg947
 sTs2lsUyNp+YcFPbIPC4T870vz13/0JgLc5vL2d+x/lvaNrPSrQ3BqJO+++YihV+v0+/
 E6zpiWoSI7G2EHzpnYIo8UjuCCXin2rui80fisFkDcYBofOR9AFj9Qicfqfery2wgEvJ
 Dfcjd2GvMzLSUSpu3skeR3k4ucBm17R9M21hyFtnKt5Tr+qWa30wSPfVSvOqaKC2JGVA
 XSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d9R5lD+eyPtty/EDRB0dxvoT1lDKjG0Cf5Gg/5QaCyE=;
 b=RF03owaWP88omC94MSWyXwJE3kvShyn1oSxeGfA3sxkTkrFeMSlngqUW4Xo3z+d9qP
 N3DzXDC2So5Wb9pmbYqwc/M6rmneIQ18dsQSudIs0gUIp9GpMKIhhnrbacSL17CeCmGL
 QnonRa4fSOyy9k0ePWLYlsujiuxAZpb6x0qbethLaBIMjeFB91O2WqkMu5EBSqI0Oq6E
 qnsIG1NwmlWzPvViq/Os6XJyFhyhtS/4QFszrsyYcGiwguIEH9nwEZHbTfYrEXoH+Ncb
 QU8uY1XolonOeRugSlqhr3iZy/OwVWtp6zPKggPvzQcj5IT33pDGSc4948pQ+vQMJO3Y
 EUhg==
X-Gm-Message-State: APjAAAWZWaebmpUyEEbQcV9vDi9CdtTyO7DxY8LnOjgQ0lLk/UA08I2C
 HdWiCSHo+RGAGY7unCOPFZnVKQ==
X-Google-Smtp-Source: APXvYqw9hNnn1+mAsquSAj/R9n5028pqU8HwYAJy2MdmuUrEF/+GoIdhBFhAN4poaGz3c4MgOPxF/g==
X-Received: by 2002:a1c:9696:: with SMTP id y144mr8796545wmd.73.1565792969990; 
 Wed, 14 Aug 2019 07:29:29 -0700 (PDT)
Received: from bender.baylibre.local
 (wal59-h01-176-150-251-154.dsl.sta.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id o7sm4202908wmc.36.2019.08.14.07.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2019 07:29:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 07/14] arm64: dts: meson-gx: fix periphs bus node name
Date: Wed, 14 Aug 2019 16:29:11 +0200
Message-Id: <20190814142918.11636-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190814142918.11636-1-narmstrong@baylibre.com>
References: <20190814142918.11636-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_072934_035816_76E590D9 
X-CRM114-Status: UNSURE (   9.63  )
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
meson-gxbb-nanopi-k2.dt.yaml: periphs@c8834000: $nodename:0: 'periphs@c8834000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'
meson-gxl-s805x-libretech-ac.dt.yaml: periphs@c8834000: $nodename:0: 'periphs@c8834000' does not match '^(bus|soc|axi|ahb|apb)(@[0-9a-f]+)?$'

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index d8127f863b55..a7735d2f0037 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -437,7 +437,7 @@
 			};
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
