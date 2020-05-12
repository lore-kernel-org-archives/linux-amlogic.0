Return-Path: <SRS0=k9nf=62=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7F1C2D0FB
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:52:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C267420731
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 May 2020 21:52:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qgmyZPyg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bwgSPVs5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C267420731
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZLGeByjfkZDHC27+bAULyJoOjTmbxImatkzY8F3423o=; b=qgmyZPygrvCb0P
	C2TfLT1lE1F3VVlNvW76YYzGmaRziIlNJyKoVvrEKifz0QlhQP54jlW9/Zbg20BJPOqnWZmvJZHzm
	aK8+iNqu9DuI+Yapw9vsNZzwWiZqNqS/NmAYNBrLxxJATF9l/XcgU5FlwZeJhGcTWJl8CMbZt+4jT
	MJX97T795cDC3cf/gJktdk3TaFKTypbAecMUvZUuWRe1CA2PhOkKs9wJyLNXf5AU6MG9vBXA01wgW
	VCTac7ETbVw9udv7vxoQsh33N63a/IuAg/6bIcPpYmZdDgXAy7XbYdCPT2lhd4y5dMFeP4vjL12i6
	0mrxdPVTpxf/dRs/iuDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYcot-0007ZI-As; Tue, 12 May 2020 21:52:11 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYcoh-0007Nt-Ke; Tue, 12 May 2020 21:52:01 +0000
Received: by mail-wm1-x341.google.com with SMTP id g12so25714278wmh.3;
 Tue, 12 May 2020 14:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0knvu8zyqVx4y2NkIr8lOmrEgshGQH0lpKJi3cjk2SI=;
 b=bwgSPVs5laGpM0d83i3csmznJ1/yWKtFq1xT96YbPjSKVZY3DA/KjehTuB5plFcy6z
 EY3hNdTNGMRO+CSZGMVlJ5g4ACqDMocZYlhOnzK3a5BPn61uwB0dn0LYty6Bxov73Vlw
 1R/Z8XAkTT7HEiHdHVbawuL4MFXn4A6zZa7dk6icq3xN/ilfVGa0UFWWOYODfL+OjLvB
 Zf6N/dMiWhEvQnvKJW/nkzO1/nhdFy4KygJVbKSZpLK/We8me5P197koIyOBNKSVvcgB
 gnrQc1RKBtfdHlw+bmGtYur+Kgv1E0KbZxcW1d49ddhOy1nmAA+YoslbKMUEhIWyYt9a
 +meQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0knvu8zyqVx4y2NkIr8lOmrEgshGQH0lpKJi3cjk2SI=;
 b=JMJAusfd+PPHRELOm/XCrU4k6vnrl8tMEjEKYX8iPYBon0CmpDNeMf61XybYEixA+P
 LX2EN2pQtZ8H8QnJPCPrkZeU2rc7UtHYlr6juuPXYtx950glzvU2RQ9Hy1wN8xvzYKmQ
 LW2wwUgIFiGW15w8LLBsQIKKk8Wt0DEwKJo0dyY7vQDYKcpqEG358ZHMLsT5mqje5zfh
 KTM9IcoAQwaePHdPbJFcdwRMLXmWiWjOOc1UTUvjqTXjbJZZjQ6ZMLTmftkBWhv4T2oV
 tdlJEQ8UIXLRU7gzgeY7fZ1V1pppY3SpAZ75qNCTniYp0fHbgOw2sY4h8yJ04BD2QPa6
 MOzw==
X-Gm-Message-State: AGi0PubRX0En/N/AjyXYMTdmM10E9r1PptIfyvDf4gGrvBGfMrwItMxU
 z1emulYsqPKZcmg6yv3QmMy/P6LQ
X-Google-Smtp-Source: APiQypJ8uUi4vGNBLtT0TFTdWAmJqfDA59+C/Ue8RoCtXdE4ee4Rp809GhvNT7tn2LEUhTnMGBwK+A==
X-Received: by 2002:a1c:4d17:: with SMTP id o23mr7874381wmh.87.1589320318046; 
 Tue, 12 May 2020 14:51:58 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137132E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3713:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id d9sm9154234wmd.10.2020.05.12.14.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 14:51:57 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/2] ARM: dts: meson: Switch existing boards with RGMII PHY to
 "rgmii-id"
Date: Tue, 12 May 2020 23:51:48 +0200
Message-Id: <20200512215148.540322-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200512215148.540322-1-martin.blumenstingl@googlemail.com>
References: <20200512215148.540322-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_145159_676959_E144367A 
X-CRM114-Status: GOOD (  14.64  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, andrew@lunn.ch,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Let the PHY generate the RX and TX delay on the Odroid-C1 and MXIII
Plus.

Previously we did not know that these boards used an RX delay. We
assumed that setting the TX delay on the MAC side It turns out that
these boards also require an RX delay of 2ns (verified on Odroid-C1,
but the u-boot code uses the same setup on both boards). Ethernet only
worked because u-boot added this RX delay on the MAC side.

The 4ns TX delay was also wrong and the result of using an unsupported
RGMII TX clock divider setting. This has been fixed in the driver with
commit bd6f48546b9cb7 ("net: stmmac: dwmac-meson8b: Fix the RGMII TX
delay on Meson8b/8m2 SoCs").

Switch to phy-mode "rgmii-id" to let the PHY side handle all the delays,
(as recommended by the Ethernet maintainers anyways) to correctly
describe the need for a 2ns RX as well as 2ns TX delay on these boards.
This fixes the Ethernet performance on Odroid-C1 where there was a huge
amount of packet loss when transmitting data due to the incorrect TX
delay.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts    | 3 +--
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index a2a47804fc4a..cb21ac9f517c 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -202,9 +202,8 @@ &ethmac {
 	pinctrl-0 = <&eth_rgmii_pins>;
 	pinctrl-names = "default";
 
-	phy-mode = "rgmii";
 	phy-handle = <&eth_phy>;
-	amlogic,tx-delay-ns = <4>;
+	phy-mode = "rgmii-id";
 
 	nvmem-cells = <&ethernet_mac_address>;
 	nvmem-cell-names = "mac-address";
diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index d54477b1001c..cc498191ddd1 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -69,9 +69,7 @@ &ethmac {
 	pinctrl-names = "default";
 
 	phy-handle = <&eth_phy0>;
-	phy-mode = "rgmii";
-
-	amlogic,tx-delay-ns = <4>;
+	phy-mode = "rgmii-id";
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
