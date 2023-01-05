Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99095C4708E
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Jan 2023 22:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDf5aQvKvc9GsimbOUTJJXHKl4OC0WBzLN84KsW46Qk=; b=mVwWz6Sk99ELLw
	jdnV7B4NGk+DotdUNB/jFdZIWq4tl/kiBNNUYGfL7+pdvr5vgC5kxUCyuWn8rDvppkTz7AtDBGQ/V
	MVORI034mhbPFkbN2PuQKUQnbAW+yYGvI3YrC8Qlbtf0CoTeX1zpKjDOJtztFWdysifIQBUWf1M3U
	VR3hUqabX/wLI79fFWtfxgV6PgomvIhS3IDfAsvLN+SL0UcR+mUDbcE4vu5EPJ0BBXxPKgVpPtxXd
	CDSHd2q4eKpdUTPTmm4ZjVJ2cqXbf2pzWF7z5SQwYIFOsmc/LibTrYHw4/6soFzswSS1fDTSTi8Lr
	MF5uhBrkXN2WqvZOnIUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYwk-00FipK-Qk; Thu, 05 Jan 2023 22:42:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVLN-00Dqi9-24; Thu, 05 Jan 2023 18:52:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=r5bHjQn0y/uV05AqhRvRvF0f0Uwh0AHPN8n40wIUTmk=; b=Tvt5AczRL5yvBupRJoD/RZIBwr
	5AXHoT+RWAXlb9WhbT6IqJgC8lUuMF9oMu0DlCwA2eL6wmXlK64syZLZ1FFHThD8YTCvuUlfZY1M7
	IHoKKbo+krV50Li4+vCsZbh2dA371oBSTHkk7J3UqgSI+4jYrd66MdKX5CWiPs5sK2UYqxgtIA15m
	VPpFjV4EkKctaIHA+qG6N0BaiXcYfWiFdJmguc6GZkZ2zwfGuoGkyguJ/5ZnKYlHeK0yzwFeUzu4k
	nyvnxdqZk3akfikeM8VSpU2+G4So27M+xeVF0qKuDNwVw9eCIie0mP9bUcyBOiyYwC3JCfzcDLyrL
	+a2A202g==;
Received: from djehouty.pomail.fr ([80.67.179.207])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDP0m-001Inf-2d;
	Thu, 05 Jan 2023 12:06:23 +0000
Received: from nout.ra.nemunai.re (82-64-151-41.subs.proxad.net [82.64.151.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by djehouty.pomail.fr (Postfix) with ESMTPS id 787FB3FE51;
	Thu,  5 Jan 2023 13:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nemunai.re; s=thot;
	t=1672920375; bh=xMc2q7h7Gua0SVdV8D7xgEcfHISSaa/b06krzVch9d0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ELxo5ErcxNVkClGKAnyZzj8xRh4SNCRybCZDw9FcsYWbRC94XY6EUr7sA+GnW1zEB
	 44wnZgNlt8qM1zlPS1PqAPdjoOLVEoLit/aZDnGOzaujDY8NBGJGT4OcDgG+gwK0V/
	 JqzthPbi9E8t9wLHhbFiYj2kVktPzt6s26qbxICHOuskdF7YTI076siGtOL1CzjRRi
	 d0nVGOPIbkxXa1aqaCjsU9P2GkFeZbtE3uDngqazY2xv/pFS7p5JNeHKl4CTxqY5KU
	 /IY9cHJW3fsJELJZpWnRRIeYEo4t+0f1rAx289CvNGdO0ytVwf8j6PycUqNGMQjINT
	 tg2IYqzQeyqb6HIpy3Dy7FPU2zKVWf0gvoLzaNFvFQp/I3UKV6bsbiAF4VQGf54k2k
	 XqR1g0UskzT7UcNvrTUPTXKyompNIrbzG030l6y6t52G7d6kDMY+hiV821YjlVnXtY
	 O/sH56sQsb07ozOG3LbRvV6E8e9CcCoo1c9XeNx/q9NZQaD/FjAAU/eGPexLAa75zt
	 tnOj+gA+JIzsNkoqb5KuCyP0saDRwMNPhCrFfQRwol2LfpzAP4AGFDnwXZw26JxAde
	 oZzFIUNSlHcdkOF+UBrqwt2zvq9dk1pLak4xSdToiEkMhHHPsc0XborWip+ThFIB5Z
	 q5laEOX5P0vJylR5dDFLoPPk=
Received: from khonsou.ra.nemunai.re (unknown [IPv6:2a01:e0a:518:830:24ba:f302:d390:49c2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nemunaire)
	by nout.ra.nemunai.re (Postfix) with ESMTPSA id 9B33121DC7;
	Thu,  5 Jan 2023 12:06:14 +0000 (-00)
From: Pierre-Olivier Mercier <nemunaire@nemunai.re>
To: neil.armstrong@linaro.org,
	martin.blumenstingl@googlemail.com
Cc: khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Pierre-Olivier Mercier <nemunaire@nemunai.re>
Subject: [PATCH v2] Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0"
Date: Thu,  5 Jan 2023 13:02:08 +0100
Message-Id: <20230105120206.28964-1-nemunaire@nemunai.re>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230104140608.28432-1-nemunaire@nemunai.re>
References: <20230104140608.28432-1-nemunaire@nemunai.re>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_120621_636841_8D9C4563 
X-CRM114-Status: UNSURE (   9.63  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This reverts commit 703e84d6615a4a95fb504c8f2e4c9426b86f3930.

USB device enumeration was not working on Odroid HC4 as both USB2 PHYs
need to be enabled. This is inherited from the GLX USB design [1].

[1]: https://lore.kernel.org/all/20170814224542.18257-1-martin.blumenstingl@googlemail.com/T/

Signed-off-by: Pierre-Olivier Mercier <nemunaire@nemunai.re>
---
v2:
 - Fix commit log
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index e3486f60645a..a1f0c38ccadd 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -131,10 +131,6 @@ flash@0 {
 };
 
 &usb {
-	phys = <&usb2_phy1>;
-	phy-names = "usb2-phy1";
-};
-
-&usb2_phy0 {
-	status = "disabled";
+	phys = <&usb2_phy0>, <&usb2_phy1>;
+	phy-names = "usb2-phy0", "usb2-phy1";
 };
-- 
2.38.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
