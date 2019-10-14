Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4146CECE587
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 14:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1391A2067B
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 14:18:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XUOn5FZb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="qw+2kp/+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1391A2067B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8GNzLAfhwcD6E3pw0vyQG2ykZJK2IoJykZqJf05WzHw=; b=XUOn5FZbgxm3OM
	fRRZT7OEdlpquFaP1uZ7aR7nexJEW1ZcBlO0Yixtmi6wdMlF+V9dAYeHFarettse+dVv6/+6u/DS9
	ECmFSULXwUKNvSpOMnIazv3sUyi5hPHbMOBVXSfMeBetTlFLZRlGY/ABxXS2XGTaxrC+4ymX/r/Wn
	1kZQNhlTdyj8A86d8OTGPVeMyYEODNScRC5ndCK2F04D+WEPGgGMXj+L05gaqfZXnIZRq6lMk+pmI
	5clC68oK+XcNN9X62UE/L5LFIvER6kRKram8FAsU490EpABgtSnKwD7rBWceE5ovwVEuyad0w0lQh
	jHcYHL2QJTFSSr0JfXCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iK1B0-0003bl-0r; Mon, 14 Oct 2019 14:18:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iK1A6-0002cE-PT
 for linux-amlogic@lists.infradead.org; Mon, 14 Oct 2019 14:17:29 +0000
Received: by mail-wm1-x342.google.com with SMTP id p7so17479983wmp.4
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Oct 2019 07:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WhPSwUwjAsJRbhdmE0cVGRUouZ5x8oaruQHda5jd55I=;
 b=qw+2kp/+fl6kXsLl22YjrO0TyQy+b2qOG96cAr18nh3mIUcQO2wxOniKBJRga3bv6p
 9gVO175nSljYfUAcAjw9jxTI1QDAAsmlRxihaiHD0ltMTQcWkjfZASaKg7Zrg0rKzyc5
 kFWR35CpMP10S6rBiE0sZlidqw2c81x70/pVS9YXFWxXbQfXDv3Z/TWitlohxBSSLH0I
 P34TlcmfOwb0nOjj/iyY8JJLUbbJhcr7bPt+yGE4VFH0VxHjbSW13cTO9VLCyNOU4x1F
 GyW1IX/y5/Gt5n10NogGoISQkc3ykn+ouY3KCXlxf+UvVSWFnjKjQKKwexoQVmbk7g8u
 mwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WhPSwUwjAsJRbhdmE0cVGRUouZ5x8oaruQHda5jd55I=;
 b=UlelApqzwNwT2WgnQL3ZtdDbv2tmwwqnxox0RrjF5I9LS13jmBXDqojwiOKaIVcnEF
 7kuRh49fOaqcXSCdxwOOnzNAbdfFvxVW9L1Bi5tD7aylXkm40qXdpLXaq2d8IcePiuiw
 JgKod2PGOZtbMXbv2FhDVaMxIvPTJv2/ED/KAQVrLhA85tgKnpzDZsG5apIonXP/01gI
 2crLJZoYjxWeEwYahY4KBBpu+BYYQro9JHJP0RTIPcdjCbjdGKb3Dzv2z5mheB95phYj
 CyHH21tNASy5OeQjlyneH2dZYNU6esMYw4sfbrNmHw2sRfD4VyT5iT83f1aNHi+4O92k
 a2GQ==
X-Gm-Message-State: APjAAAXslY+7RB7J3FktBOt8HcBLy7aIvFEFRpmCPAeNFsIubmbQRO18
 XXvnFwyM3/6F2O75hij0I+Y06A==
X-Google-Smtp-Source: APXvYqwyLKkJs7kEVRKHW2iMVF8t8Y3SI49VubmuzAmVzLaKXolT83XHyMDU/m35t26Bb9WZbO3Sjg==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr15817487wmb.125.1571062643202; 
 Mon, 14 Oct 2019 07:17:23 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t83sm42708624wmt.18.2019.10.14.07.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 07:17:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org,
	khilman@baylibre.com
Subject: [PATCH 3/3] arm64: dts: g12-common: add parkmode_disable_ss_quirk on
 DWC3 controller
Date: Mon, 14 Oct 2019 16:17:18 +0200
Message-Id: <20191014141718.22603-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191014141718.22603-1-narmstrong@baylibre.com>
References: <20191014141718.22603-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191014_071726_823751_391DAF67 
X-CRM114-Status: UNSURE (   8.92  )
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

When high load on the DWC3 SuperSpee port, the controller crashed as:
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
index 3f39e020f74e..4b002e799e5c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2381,6 +2381,7 @@
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
