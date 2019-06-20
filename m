Return-Path: <SRS0=0I7C=UT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C81C43613
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:04:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9934B20673
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jun 2019 15:04:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HegsD2IE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZkNBuemC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9934B20673
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DA2oyoFthscE1fBV3TiRY0HofNMTqEHYptBTmy+KpNI=; b=HegsD2IEAnqet8
	+1EhsECvzMLDVEqBwyIKvIbT7CUBLhjicIr+FjKwaXm8E8P5fjm9cCfX+qab20cyhwdDANHBiiLO2
	PhSBTtf8duyHW49qxufFEUU5GrBgQHxME6/2LCL3qWpizA4DFDjocnt5bN6VbMog1DnpO+2UlfiQd
	nwtBVx0d3jJnGtmOIpoQO5l0I/IiLOG+OHdtukdZs3kJPx1gxnDnU/dhy5FnoEhK8OfqEKdKeq3/v
	nEhSCIp0Z9j5+ujhOWV9lmAANOBGktrNuOdk+XMXySalevA0/ztVelVkceYfR/OJQM14yWMZKn+QF
	nfykS6thkh4kHKwdtSpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdycA-0006OT-Fr; Thu, 20 Jun 2019 15:04:38 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdyYA-0003Fo-Pu
 for linux-amlogic@lists.infradead.org; Thu, 20 Jun 2019 15:00:35 +0000
Received: by mail-wr1-x441.google.com with SMTP id k11so3410338wrl.1
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jun 2019 08:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lvCQg8fkf4AhMPMA11E/TDsr9RLDhACmfamGvoLo6Us=;
 b=ZkNBuemC27/s9vbgndDsGwjRRSiLq96YdfPINqqKzDjQn90Qcm8t0Lj58ZfQBZYKGg
 8bcR/XvPsILe892VTo0OmoSCiekCJCX3TlbRmHEHJ3vzE9+sGXw+vnKAhBs45P2SI07v
 e3Oxz+tucuq69krMLV2LUbPRErpWXYbw1Js/nnOYU/94RZS05BAgy3h/bPO6/zfrOwZ4
 F7pNiAUgM8QtuJCVp8ilAjUhGe61FLORLA8seVVdFd2cslK6440TD2MBCqoSVTL6xu0X
 wVzWvyWRK4E0sVAODLvJRbX8E+NbHm9dcASo78JP08wjbXVEPa1TxBSF3Hg3xqEq4xUN
 RHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lvCQg8fkf4AhMPMA11E/TDsr9RLDhACmfamGvoLo6Us=;
 b=AbNrh59W8pwGgrh8c3a1bBJQQ6dDWiUcV6kDjhWy7RVihXuAK574R0qyJV0N1TWbUw
 /qhlWugJ6YRFJY/+55JSLusBANrQ1BOYilIhwwXdKxVQkp3LocAsferhFHrLwpNMVJWj
 u8VLVf7SxGXQ+kJY3K2d4fQVBfSNZuOVE9VgGLE297Bzc2LrARoIaZlifdqkIdf2/Pdh
 09//pbe5UM+YnNODXdHiDhhEouV9uBjSK3OQVZ7b3GcrIQ+Nwh8j0sh1M7qICgdpn+6N
 rIo9vm2K6sCg6Vmo07S+WAySqDbEqnsaDH3hbtoKen+fxuMfs980r7JxsPUEDmmXxaL/
 bq+g==
X-Gm-Message-State: APjAAAWZ/FRsTJUAY/5fH2evHHdmYnmOB/oqqL4qbX4BH8//5DlZCqrL
 Fr9PqiE0qTAtm2zQ3qqW44Kicg==
X-Google-Smtp-Source: APXvYqzLYovsxFjf46DbcbhAjqfq5ncPgOBrMCKwL4HgOuGrU6Zszy7/dmR3PIOLGHWu/FGiIBljIQ==
X-Received: by 2002:adf:df10:: with SMTP id y16mr4435320wrl.302.1561042829338; 
 Thu, 20 Jun 2019 08:00:29 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o126sm6802520wmo.1.2019.06.20.08.00.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Thu, 20 Jun 2019 08:00:28 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com,
	khilman@baylibre.com
Subject: [RFC/RFT 08/14] clk: meson: g12a: expose CPUB clock ID for G12B
Date: Thu, 20 Jun 2019 17:00:07 +0200
Message-Id: <20190620150013.13462-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620150013.13462-1-narmstrong@baylibre.com>
References: <20190620150013.13462-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190620_080030_891945_24C39E89 
X-CRM114-Status: UNSURE (   9.39  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Expose the CPUB clock id to add DVFS to the second CPU cluster of
the Amlogic G12B SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index b6b127e45634..8ccc29ac7a72 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -137,5 +137,6 @@
 #define CLKID_VDEC_HEVC				207
 #define CLKID_VDEC_HEVCF			210
 #define CLKID_TS				212
+#define CLKID_CPUB_CLK				224
 
 #endif /* __G12A_CLKC_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
