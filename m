Return-Path: <SRS0=1Qmn=2P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD65C2D0C3
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 00:58:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB5062063A
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Dec 2019 00:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ihIJTHOS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="GlptQvw+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB5062063A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WALSsN7kz/9dFLOuYT1XYhejw7auRnMGD4nuI2Blxq0=; b=ihIJTHOS2JTMcD
	cK1v1Lopalq914WfPrqmDBM+/Mb/kCdjUnN0knfpz8QJS7pXzJ0YeJhJtEcBVXjckGbg2jDNdL/WZ
	eonqapwIOVvIgIhnivvWUnqzWindbgbNGinsfKsiB97tIVqDtuyGrVXObDsxRCq4mxi6XUophy9FF
	SHQVuFxMJChS8N6DnkebelX30tnqqqt0Kjz2jpKhx3uLurVkcPLUi4N7jCCoIZzP340Tdbf3nel5k
	3Fmu8UzthQYJV5Kc0hrsBUsIYxtx8VOivrHkQ3MLOHDdAgEcyTuDqlfO5HVjTfC7hJObUEds2vPqD
	vcZPb6XETf3G7PEACpIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ijv0o-0005qX-45; Wed, 25 Dec 2019 00:58:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ijuzt-0004wR-UN; Wed, 25 Dec 2019 00:57:59 +0000
Received: by mail-wr1-x442.google.com with SMTP id c14so20894015wrn.7;
 Tue, 24 Dec 2019 16:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PFmQ90ZYw4YHFMWAxeUA4KZ+OR6FSTaAbjo/3KRmum4=;
 b=GlptQvw+dENRbqNV/ZmYyeMc5Iulp2sTSNKMBKg5vCMLRijEI9Hx3VEPXiFos2QoaM
 qGGlUu6cka/RPmy43aWC/KO2BUyr6IVmb71uP+FS/BlJENgpEVw2bRW8ERlUHsPOhPq6
 1FL/jRTLeIDjfgkSdwv+b3IwbhE7XNOo7ENrwB+ytOP8t2aByTrcLeDhjS61iXJoPo/2
 ltA1Pfr8zQsYRObjB5Gq2glDrrGmaJNg4dHHyJtZ/dG7wDQVsCgcja2RlaCwN+9UNEER
 pUpOoSHw3xsn8oebebqtZljVxeKLTlHXZ7dyOa6ixLsSuoBrq3aajnuQR1iHKWAAqRJ6
 6BdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PFmQ90ZYw4YHFMWAxeUA4KZ+OR6FSTaAbjo/3KRmum4=;
 b=PwDI6lNpyv7gl0qEGYpxM+XY1HXODz9JP+VX3E/nX0xUO46eRnbvZprICilDhRhL//
 qdLQrpPtwznklTAN5I2RQSYdCA09uobq5QVaiZ59YRd/yy9See0EHeaoh6UHpmWf0rgm
 U46LbCx3URkD5HoKnx+r/ySYs0UC/i/h0uJVhFN3/icTI0VilVj6BV8wgLNNAuYf3meM
 47mLz1NfrG0WS0T8UMF71g+eyVtpDvPMyrF/3FZRe/TQAUFyvw6l00BcdPMcDubsPOXk
 wEBEQZiVwmoFbNsCKuqe3JV2OGbRbkTZPkG36Cfzw0YwctY/xxTi52QDAw10xz8yI40t
 +Q9w==
X-Gm-Message-State: APjAAAV+yhK7xTL0WGbc0mOvYMFOrebYzo/1CRnHBG5B8AdwXrXjOleZ
 sOQURinQDI/2OnHdkMr/DSuyDGfN
X-Google-Smtp-Source: APXvYqzMRfyD3lyEw+Zb4gNepoyAdwAUCWFEyKKCzMwOT61ncy02kog+p+b5jrt9BJEzS0NQro+IIQ==
X-Received: by 2002:a5d:6390:: with SMTP id p16mr38153955wru.170.1577235476171; 
 Tue, 24 Dec 2019 16:57:56 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1373A1900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:373a:1900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id e18sm26034448wrw.70.2019.12.24.16.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Dec 2019 16:57:55 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, netdev@vger.kernel.org,
 davem@davemloft.net, khilman@baylibre.com
Subject: [PATCH 3/3] ARM: dts: meson8m2: mxiii-plus: use the same RGMII TX
 delay as u-boot
Date: Wed, 25 Dec 2019 01:56:55 +0100
Message-Id: <20191225005655.1502037-4-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
References: <20191225005655.1502037-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191224_165757_976817_C5423421 
X-CRM114-Status: GOOD (  14.21  )
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
Cc: linus.luessing@c0d3.blue, balbes-150@yandex.ru,
 linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org, ingrassia@epigenesys.com,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Due to a bug in the MPLL2 clock setup (which is used as input for the
RGMII TX clock) a TX delay of 2ns did not work previously. With a TX
delay of 4ns Ethernet worked enough to get an IP via DHCP but there was
still high packet loss when transmitting data.

Update the TX delay to 2ns - which is the same value that u-boot and the
vendor kernel use - to fix the packet loss when transmitting data.

Fixes: 35ee52bea66c74 ("ARM: dts: meson8m2: add support for the Tronsmart MXIII Plus")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8m2-mxiii-plus.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
index d54477b1001c..fd94b5cbd845 100644
--- a/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/meson8m2-mxiii-plus.dts
@@ -71,7 +71,7 @@ &ethmac {
 	phy-handle = <&eth_phy0>;
 	phy-mode = "rgmii";
 
-	amlogic,tx-delay-ns = <4>;
+	amlogic,tx-delay-ns = <2>;
 
 	mdio {
 		compatible = "snps,dwmac-mdio";
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
