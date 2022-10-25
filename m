Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EE3C38A2D
	for <linux-amlogic@archiver.kernel.org>; Tue, 25 Oct 2022 14:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UsaryFMJn5QhCNWirHNqvuxovRepfOtMSkNFQDg09Kk=; b=rZwY8xKfi2UmdA
	6f7rpFBzftJG9ccEaCAsF7fG5Iru+9Oj86arvYNG849RjGRJVCG1M4mHpPvJyfKQohRS9LPULeByQ
	2/qzIw7BhUEpiWEhqFtpZwqsvunKF0mVrb7Al0FvBp8XHksVxzkdxVXWlTZLfgLNjWSmlxNow5fUs
	piThe7G0GB5R4CIeusTfnP22vs6u1/6gq3D/z3JtTb+MvNEOcFDifDn7+5h1TFLlfDDhwRkehTsLh
	QBaZox2Oi3Q9ooeZbfm65NX0EPJDoOgyuYFCp7xtWg58f8eUXKtiey6SXh3GgQKgEM9a2CP0ZsN5q
	sXvJczjtry+ky9gCxVpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onKyX-005nv2-MA; Tue, 25 Oct 2022 14:32:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onKyU-005nsm-1H
	for linux-amlogic@lists.infradead.org; Tue, 25 Oct 2022 14:32:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id bh7-20020a05600c3d0700b003c6fb3b2052so8400731wmb.2
        for <linux-amlogic@lists.infradead.org>; Tue, 25 Oct 2022 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dKeRAu9PVCRn7Z56jquOlHNx6/8ZFDbg2F0PmmYkZNw=;
        b=A+Jkt2V/uk7vkgVpg3BpM63ON58pdpOZq5N8JtTjgjQ6hMGHg/jHaZN5Y6ZQc85YFn
         lU8tED23NbHSVlewvOMEYxr3fpEBiNHoO9pUOP8Ekx69dMwtTm/kSYT+WRg5+i7yKGPq
         hp1gv/Gv1GyawHd9ecRNH27NQ3I7N0FG/FqO9RlkpKKJdcZAoAaoE6iAvXs3gtgPQOX7
         EGVqgzzFR47KIWkpz4KR/HWUuuL5lw1Z7L1uxZk3c0mKdIuuBk2+bEv/ogkXp8zZGsjg
         uL4L/VNxu4VNL//4D1U61s6cxGwdBLrtRzdsVeL7RPqwxo4eZ8Lu8jdTGqLglmv0x/v8
         lcYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dKeRAu9PVCRn7Z56jquOlHNx6/8ZFDbg2F0PmmYkZNw=;
        b=N2VlaxJ3X8C55PW+5TVgdSLjHnYSdaMFjJlFu4mkmYIM4w17vuUn2n1T738Hfp74C+
         w96pIYO9eNpkejFKQ3oCQpCchb9LN2dZx5SafPue9/+nkrY49+mKYLAMerjkI39tct35
         601euz9Qs2aZbeuB/PA8Yck9xyGlrU5Kz+tZLANR3ItIYlgf2R5zWR66OJXrKpTjxMAD
         mWWvIDTJviYtqlbEGOu+sgLdJrn87Y38dQhUsz4QeYe/O2NV7jQr9lM65xS1bLUDFvD1
         xL4OK8x2++hqh7PryUuE4XcII2ooJhmHfBquVvafCVNUbW0LvPdsypcerT6QEbDVt+pv
         IcgQ==
X-Gm-Message-State: ACrzQf1xGXIM3VrRZv5xSYOMe+v8t/S3IGbVF2DEYdhvc27LvI+6JOKD
	//WlakedTqh8FuHtfkXiPsXKhP0807Dv0w==
X-Google-Smtp-Source: AMsMyM5k0w84DIGcajG8YKFlmKGIVq9Lr+tl6RjcZ1GE/aYQVGAc3DHeoySTkxGghogP3pEMq8oH7w==
X-Received: by 2002:a05:600c:214d:b0:3c7:1182:4874 with SMTP id v13-20020a05600c214d00b003c711824874mr18654269wml.4.1666708329438;
        Tue, 25 Oct 2022 07:32:09 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id y9-20020a5d4709000000b0022ac1be009esm2779648wrq.16.2022.10.25.07.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 07:32:08 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: u-boot@lists.denx.de,
	u-boot-amlogic@groups.io,
	linux-amlogic@lists.infradead.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH] arm64: dts: meson: nanopi-k2: readd PHY reset properties
Date: Tue, 25 Oct 2022 14:32:05 +0000
Message-Id: <20221025143205.14470-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_073214_131328_8644C00F 
X-CRM114-Status: UNSURE (   8.32  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The sync of device-tree/bindings in 11a48a5a18c6 ("Linux 5.6-rc2") causes
Ethernet to break on some GXBB boards; the PHY seems to need proper reset
timing to function in u-boot and Linux. Re-add the old PHY reset binding
for dwmac until we support new bindings in the PHY node. This borrows the
same fix applied to the Odroid C2 board [0].

[0] https://lists.denx.de/pipermail/u-boot/2021-April/446658.html

Fixes: dd5f2351e99a ("arm64: dts: meson: sync dt and bindings from v5.6-rc2")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi b/arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi
index c35158d7e9..2a245bbe7f 100644
--- a/arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi
+++ b/arch/arm/dts/meson-gxbb-nanopi-k2-u-boot.dtsi
@@ -5,3 +5,10 @@
  */
 
 #include "meson-gx-u-boot.dtsi"
+
+&ethmac {
+	snps,reset-gpio = <&gpio GPIOZ_14 0>;
+	snps,reset-delays-us = <0 10000 1000000>;
+	snps,reset-active-low;
+};
+
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
