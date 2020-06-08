Return-Path: <SRS0=J82+=7V=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86FB0C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 09:19:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59808206C3
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Jun 2020 09:19:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z5hwNqQ2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VKp1v8Jk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59808206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0McuD47vj86H5B/fjE3K6t770ive/+5DYxiQAeF05pM=; b=Z5hwNqQ2fdzPQF
	T2U2dndKxBFLSkN3g4X0zRoDGJwkn+WNpQ63hu1crJvufitdgyuyvzqRLj69o79hOjEWPHyDN8hkQ
	nufSw5djkPzx8AxTbniC6lcvqQHblxQd4FsUohGckcZvtvh4CGFtTarILfwr+VGjw0txIKoxpJEQZ
	Ntendj5lo/LnGlSbnOlvokDynNRnWNPLjvysUNj62kWq7HZ7B0pf0l74xwuFM7tmW5u9g6xu5ZeO+
	7izgAMOuqrah67BuIPCzo+YV18LPxoP4wtrFuq8J02Dfb62ZekgHiYXZF65JqHuSnn/V+PivvPc5j
	p/S55hhjd5plh/d8FHUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiDwW-0004F0-LH; Mon, 08 Jun 2020 09:19:44 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiDuh-0002Lc-Or
 for linux-amlogic@lists.infradead.org; Mon, 08 Jun 2020 09:17:56 +0000
Received: by mail-wm1-x344.google.com with SMTP id u26so13812987wmn.1
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Jun 2020 02:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=80rN4Yy/llOMe52Inz2Rf3Vg/VV/GbMwITSO8biBc4M=;
 b=VKp1v8JkbAxrUOZSvdERfeYsryZbG4ZALZU7H3E+o+6qhK0KqmrwmQfvLQLKo1lxT9
 geGP1GMMeDqB7Di3ltJnV1K7KMH2gzn2kIpY+gx+PlSRNsgyXsFHllVad/i+cGbo4CsS
 27YFviT9Pmq465c4nDOupAAw+2KBKbTKPxWxipemlZfAEqrpsEAwTZbxJ+3bO/tzk72B
 5AmZlWcI/UfSCYy3xhoexs9q34DQdcb0JO7LwJT8qSKtHMDjH9D2KqJ20XT74/wpZrlN
 W2ofL5I7munj2PmfKNFVxEmI+WqmdvjHx4gsUc+FQtiawDrWNi90aEXAnvwKn5M+H1KB
 AWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=80rN4Yy/llOMe52Inz2Rf3Vg/VV/GbMwITSO8biBc4M=;
 b=B1b8nH2LVv2Qczopp682IxsVh/EC9x3ggmpxkg79kusafQX11kxU0iCLu+bNrTJKv5
 kOeTgB1HQX+CAaABq0sa4XeI1FWoZ4HgDzBMRLwOpBERM8REcTKjBGedddVyY7Lp7QkM
 eklAxkWqWsPcpg7aj2+ZrW/V8+1tYN8MWX7qZKXT3h46W+c1G06FtdSA3AFYKhiFiclH
 2v8xnyMvk1VziX1WPe/dgzQLB0LF5LmIunG7LJYjRZbbbItWcymA9MI/xFkxhw8KS0DC
 R5qW41e54en5heanqGyWn+2XIlNatsxdJqec3LNBzqvc/NizhpXL0m+DAmsdn1EK2iBQ
 N9lg==
X-Gm-Message-State: AOAM532rGqs9ONEmhEk4gT9PDHuG98Jc/7aABxe92hmc7+JbjgvnjX/q
 DjuOmYYItpCAp5Zl6wgTiwuh3g==
X-Google-Smtp-Source: ABdhPJwJa9Vo9lkGfwDogiFZQ0nVGFlp0w7rxsYeJta8zYKqW8uewQsscYdWko6YwfV9ExZreI/2qg==
X-Received: by 2002:a1c:5411:: with SMTP id i17mr16162838wmb.137.1591607868962; 
 Mon, 08 Jun 2020 02:17:48 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:22:5867:d2c6:75f4])
 by smtp.gmail.com with ESMTPSA id
 t7sm22732326wrq.41.2020.06.08.02.17.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:17:48 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: lee.jones@linaro.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amit.kucheria@verdurent.com
Subject: [PATCH v3 4/5] MAINTAINERS: add myself as maintainer for Khadas MCU
 drivers
Date: Mon,  8 Jun 2020 11:17:38 +0200
Message-Id: <20200608091739.2368-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200608091739.2368-1-narmstrong@baylibre.com>
References: <20200608091739.2368-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_021752_542290_BC05B988 
X-CRM114-Status: UNSURE (   8.01  )
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
Cc: linux-amlogic@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the Thermal driver along the MFD drivers and header as Maintained
by myself.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 50659d76976b..29d35fe0f886 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9436,6 +9436,15 @@ F:	include/linux/kdb.h
 F:	include/linux/kgdb.h
 F:	kernel/debug/
 
+KHADAS MCU MFD DRIVER
+M:	Neil Armstrong <narmstrong@baylibre.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/khadas,mcu.yaml
+F:	drivers/mfd/khadas-mcu.c
+F:	include/linux/mfd/khadas-mcu.h
+F:	drivers/thermal/khadas_mcu_fan.c
+
 KMEMLEAK
 M:	Catalin Marinas <catalin.marinas@arm.com>
 S:	Maintained
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
