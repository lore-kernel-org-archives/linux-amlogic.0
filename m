Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E8B2C34047
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:19:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 174B4206ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:19:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IwuLbEIp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rGhtHgzF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 174B4206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SfqnDiJCFdU7jqZbYN5HFten4ExRM+SKvNfi7Oofvlw=; b=IwuLbEIpMDO4Zm
	3vw/IMaR6Qf7rw9/ugFJE0C/48d0mI7S68cNOCjW5z4UeXpvnSUxDaL42MLISM2Sm6DGfK4RvMk+t
	2342Y/vTsHqQGyOsszBa5KAyFqeilqA3u+e8eckW1B2mcC/xaGwZ/pgr979t+LqTgs53JLHTFVGWL
	n0YZllPKcYpk+0nuGFwnht4V/GoE7DeQP6o0W2AROuk1LGXR8Kz2xABg64i7K9hmte42J8+qMKBp7
	3Vdu+4zDqdwUxIbKzJT2ZaiuisV8TyPZwhtpSYQjkVfz/iAM53qY1cSjhWCeFjgrcMpAkxF4upTBp
	pNKK5fW8YAhGkkVaOXvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4QCB-0002tE-JP; Wed, 19 Feb 2020 14:19:23 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4QBF-0001q9-U2
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 14:18:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id z7so683875wrl.13
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 06:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m6wyWMfpOh6h06xGncQF4ABfwmrzTVZCtOS7mfMUTXc=;
 b=rGhtHgzFPVIvyePVL2F0QQtaCcH4EzshdF9w0AcP3bP+qg/nXW7c5fAKfs2P25yueG
 4bb6aNJhWh1zKuAPO102lIhF21/Lk9yOH3MX0kFyPZ2ReASa6Gs/10VKmhL/tG0KbYEh
 V4tOeMBent5Wu+nTrWZnOdVbFCTOxyq6LUCKI4o6dd/3hK++uzi0Fz6LFdDxifACcNfz
 W3N1tAbaKECcJn2uP1zKP2rDFnKHqfNJiSXUbiYwU2wa5N1YgTK4+qqYwES9U4cY/8N5
 Bexd5TZ/Wl5Q+y2ALcLJ7B7rqTyJ6pDoXlq72g/HgWCnZ7oO0rP9QTxGCTkkLpFT+9mf
 a/fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m6wyWMfpOh6h06xGncQF4ABfwmrzTVZCtOS7mfMUTXc=;
 b=HrN0oyVHYjTgPMBYCLuvYq9Ncq6ZyYaNdi85P9gEDZYf8dXlW8VBznJrhq6tzxsvcC
 wEwMpcsZUJaZX67L6iP3cWSB+Euu5JwJ9tOIVGULN7oQ1f1dGxbsQyE1K2muwhCTs6/P
 mgRfAn9SpJTyrZFJZq1c5pXBE5VnmcULTqIwaoScLBOJmhVmFUJUk/as1W+X7a/ldMhb
 B3SUbuORLZl2GpNLtKfr0usIxiY0m7EK8th6O+xP0NHU0VTppxwDAX2gKXy+dPJ2FQCi
 etFrSBVmQd6mCXso5KdwiO6PoySkUJZZ4PRE8HIkGM9pToD1JQ1pT2rOARdJ9PfY1Oym
 Nx8g==
X-Gm-Message-State: APjAAAW08RFUNAsZFj0G2HKUWgKqDJVjxIUEfkPB5EDM/CbypSwDLQ6/
 PhdFkcpoOxLhnEcgrZs0QwWK0w==
X-Google-Smtp-Source: APXvYqxeF5cOXe12PQNqxlBBpiCnT3qQh/DDAtJr/M+esSQV0pKaEEHHxg3jUK5q+JMyj65o7WMEsA==
X-Received: by 2002:adf:db84:: with SMTP id u4mr36849595wri.317.1582121904379; 
 Wed, 19 Feb 2020 06:18:24 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:510e:e29a:93ab:74c3])
 by smtp.gmail.com with ESMTPSA id b11sm3337772wrx.89.2020.02.19.06.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 06:18:23 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org,
	khilman@baylibre.com
Subject: [PATCH v3 3/3] arm64: dts: g12-common: add parkmode_disable_ss_quirk
 on DWC3 controller
Date: Wed, 19 Feb 2020 15:18:17 +0100
Message-Id: <20200219141817.24521-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200219141817.24521-1-narmstrong@baylibre.com>
References: <20200219141817.24521-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_061825_999309_01290334 
X-CRM114-Status: UNSURE (   9.50  )
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
Cc: Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tim <elatllat@gmail.com>,
 Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When high load on the DWC3 SuperSpeed port, the controller crashes with:
[  221.141621] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.157631] xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
[  221.157635] xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
[  221.159901] xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
[  221.159961] hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
[  221.160076] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
[  221.165946] usb 2-1.1-port1: cannot reset (err = -22)

Setting the parkmode_disable_ss_quirk quirk fixes the issue.

CC: Dongjin Kim <tobetter@gmail.com>
Cc: Jianxin Pan <jianxin.pan@amlogic.com>
Reported-by: Tim <elatllat@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index abe04f4ad7d8..87b9a47a51b9 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2220,6 +2220,7 @@
 				dr_mode = "host";
 				snps,dis_u2_susphy_quirk;
 				snps,quirk-frame-length-adjustment;
+				snps,parkmode-disable-ss-quirk;
 			};
 		};
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
