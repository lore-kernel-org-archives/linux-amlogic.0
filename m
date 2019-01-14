Return-Path: <SRS0=InoK=PW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B31C0C43444
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 16:23:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4BB20873
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Jan 2019 16:23:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BX26+bTU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="pMzv83cL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B4BB20873
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XjWMdgkq7W5Fm3Kff/aXno16R6G94JZkirqM47xrnBI=; b=BX26+bTUcju614
	YfXHZgDX8BBAKJGMcSuohJjbWOM5Q8FdTdjVHHy0LhG4Tmu+1XXTM/SanITnegYNwWvbdiQw7VDxa
	HK8c/cpSDYgeuxQC9uAEO6dnIYzdcP4xKy22imEIjkpcIQrSZ4wpy06nVLo0W+9nLW0lRE3OujjCY
	3sdszj4zMpaZOe4J01Sfa5nqJJdrD4PB3e5SIrxmvV1FfWq5MPKAYj6TLZweBE+KlSJlRebIOZdCZ
	88j8Keg6YfyoN5wIeAsWjF+aFARK7R8EYFh708xlXk0SHreQCDHESdI2+BdTkfsaKjUhUid/3nkao
	5dMy/TT4t593iG2sHNaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gj50z-0004aT-HB; Mon, 14 Jan 2019 16:23:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gj50x-0004Zf-BX
 for linux-amlogic@lists.infradead.org; Mon, 14 Jan 2019 16:23:04 +0000
Received: by mail-wr1-x442.google.com with SMTP id v13so23584808wrw.5
 for <linux-amlogic@lists.infradead.org>; Mon, 14 Jan 2019 08:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=78t8t5aJAh2lJS/DVWCOAAUfzOZLIRzFq7ne2kpHrMs=;
 b=pMzv83cLJsDs/jPNbYToLkRh+x0/jjeyVjGHqBy16uN3IpV9nNcxWRtUt6dqFCFRuP
 ve0YGVV9lqgvurpjWxDLS27kDzjOUaJIv46OZM1PxTE+SPEG2uniYmKQJa+LA8SHIeNM
 fdU5b5twgmv96VzJp60ZDEl9/lWVXanXbJpT5MAbxFQLBO1Cnr5W+wNBlPJLhUKWwhWA
 +5U1OzCZUZsP5FZI8iIPxIXeGNKvSesmlvejSXRa9jkLIZ1VNANL4lBOU0d1Tj7s1xUD
 SxYeQaAJPWWSMzhLkCL5+sYtDcBwwLjI0Nt1uccbBWgCqw/BZRlCUs5A0hzITJcPReIV
 jqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=78t8t5aJAh2lJS/DVWCOAAUfzOZLIRzFq7ne2kpHrMs=;
 b=ozTrAiq512m8kqPRQhC9KDIjf+uO3knKgRNDr3n5FAypxU/ctDMundFWdCfQPY/+DE
 8onBkHzfG0GbJQS2E+c4OK5OgLK3FDijn+yANOFwMeE3XrTJvGv85Pa6FBp3nTVTBXAX
 9SjWW9yr+qutGfsPo0JB7msPfTSJ5AwEN/SMEUrlnBOQtbj9Be+kH7ERgCIeQRp6G2Jn
 EJ10kcQi8KP9ZesUqAl4HvPb2hMYaDaUkZ9QX83DvXccM3q3UX7lxotoX7TzTbBiDQ+j
 7NJ+VOWYGnIBhnJ+vqbew5f9aqkOfeOB0HIuJGTj41foIIAXQS8/hP6Ji/xpwyB1GOgW
 NK0g==
X-Gm-Message-State: AJcUukeQS4BVwVP/VrQdqkITC7wjRFYmgD8DxHS5sbmhBUidChnD5lnd
 R2weOtR5Np5MPaQh+66QEi2SvQ==
X-Google-Smtp-Source: ALg8bN6xPB/GWgv8moGXhtR9EB+HitQgjRHYhA2km3idSCj8U97SQrUCh+Gs3Tem1zI5Q06WOWzPwA==
X-Received: by 2002:adf:9f10:: with SMTP id l16mr25799030wrf.206.1547482981472; 
 Mon, 14 Jan 2019 08:23:01 -0800 (PST)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id v133sm25931441wmf.19.2019.01.14.08.23.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Jan 2019 08:23:00 -0800 (PST)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH] arm64: dts: meson-gx: Add canvas provider node to the vpu
Date: Mon, 14 Jan 2019 17:22:29 +0100
Message-Id: <20190114162229.5412-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190114_082303_388949_D522B3DB 
X-CRM114-Status: UNSURE (   9.15  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Allows the vpu driver to optionally use a canvas provider node.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 44c5c51ff1fa..9b0ac183ee0c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -510,6 +510,7 @@
 			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			amlogic,canvas = <&canvas>;
 
 			/* CVBS VDAC output port */
 			cvbs_vdac_port: port@0 {
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
