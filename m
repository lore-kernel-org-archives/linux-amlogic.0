Return-Path: <SRS0=part=P2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38F01C5AE5E
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 23:44:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C306620896
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jan 2019 23:44:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m2sZlIJu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="R7zFH8Qm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C306620896
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kea5NjYs8rMm0/M18sP609+8Umk9KycmviDiwJlOOqc=; b=m2sZlIJumc3THC
	Mr64kHF1hO2CMxxFvxNnKQNpfDpH0T5MpEiXC3yeAbrv/cSAuHyVuZKuJ2ROlwIGq7XxjKwo2xrpr
	qPeG1QqSZq3H/Cwy34vnYX9NecAAAqtAaq1/cYS6PwuwnVWf351NX6wQusWkgJ56FxNhU6ZRERqe+
	CNzeL2BaBOcjXG4fxmr716ViLbGXd/qe7nO2GJPm47/j+ar9v6Fmub7+J2f/uKHITu8o1/OGzixgY
	Kj8i4CZSRwav0r8pNEp0euF7E62tB6uN+zIdFe9WyWFLFCWD5P1JojwHqhaAkXteciJAM3grxzA1W
	soRsqKSFzRQX/DEDLltw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkdnv-00054G-07; Fri, 18 Jan 2019 23:44:03 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkdni-0004sU-5O; Fri, 18 Jan 2019 23:43:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id v13so17068857wrw.5;
 Fri, 18 Jan 2019 15:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMi2KnKdLTkomqgDyETnU89SoNC5t5pFsNQhVgdxAsk=;
 b=R7zFH8QmzxDxUva/dxd35XSbZuKcbQwf7kO+t7wVTRNnoU88SlmsdRqgF3LnpY+83s
 cqab5l8YqCrzID/lngSv1SRpEKvGolxjzBasn9u8A4a6dEeHA6Ax+7bAgyRo49FWnNGu
 x63YoI9Jj31EWSEWdv/7v6H962jZ90AnvaI2YZwZU2EswEpeNdJKyywVEvE/M0bnhGJh
 b5yNo6/7qkX9MTVpCXdrHojVx/bnjq1bIf5hEk+D0/XtI4BCusKwtKCRWdl/KidAOaZi
 bVzJcPTdmAY0VWlTwTHhKArc07ga8AkY8dNaTGMkNLvS9DPccxfWReW4P37P9XPKQsMc
 DZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZMi2KnKdLTkomqgDyETnU89SoNC5t5pFsNQhVgdxAsk=;
 b=TTS+gOXnhqo5cO6PbzSOjOnl0/A4jj/erNbC6B4gmf8nXTu7lB6iWU0gRW7jM5j96w
 XjwT9YyHNmM7jCslP8kZFmYDwdb/3CarmrQ9Vepnj2IZgiLiIS8BsAz2zeAu8VWIBiEp
 rpdsHgSMSq8LzP7zd39nt7OxvPMV7emJxbjsqYAv/tevgZUWs11rlS41y0ib+XawxT9t
 1hkLYhE6sl9AKR0d1FKwlrWFHZNxJCl8DoYEcDl+8/RuXCfr1vZB44jXXQEoHOhuswJ/
 g6TB2ihyTnTKGH8SCRvPvaa5+jw/XLHkvv6rX4DSqWytXQsItC+HV79sVh0dtUifrsF4
 Jz6A==
X-Gm-Message-State: AJcUukcpj1SjVuT4xRv5Wqcf4T1xxNd6YsWz/PccFd2TeSABgXU7Utve
 ENeCFalu7X25AUQVszGz00G41k7q
X-Google-Smtp-Source: ALg8bN4g84Xd0gKFdHPXGt8CIQhNFPIzZ5EV5+dktJPoN1l35xvgbXIeLNawIALCArqn2BGrHMnVjA==
X-Received: by 2002:adf:e509:: with SMTP id j9mr19605782wrm.76.1547855028053; 
 Fri, 18 Jan 2019 15:43:48 -0800 (PST)
Received: from blackbox.darklights.net
 (p200300DCD73A810039E290CB771389D7.dip0.t-ipconnect.de.
 [2003:dc:d73a:8100:39e2:90cb:7713:89d7])
 by smtp.googlemail.com with ESMTPSA id j8sm108970024wmd.0.2019.01.18.15.43.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Jan 2019 15:43:47 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/3] ARM: dts: meson8b: ec100: enable the Ethernet PHY
 interrupt
Date: Sat, 19 Jan 2019 00:43:37 +0100
Message-Id: <20190118234339.16050-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190118234339.16050-1-martin.blumenstingl@googlemail.com>
References: <20190118234339.16050-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_154350_200088_0BC5D84D 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The INTR32 pin of the IP101GR Ethernet PHY is routed to the GPIOH_3 pad
on the SoC.
Enable the interrupt function of the PHY's INTR32 pin to switch it from
it's default "receive error" mode to "interrupt pin" mode.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b-ec100.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-ec100.dts b/arch/arm/boot/dts/meson8b-ec100.dts
index cba0006e2de0..1a41d89d1fa5 100644
--- a/arch/arm/boot/dts/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/meson8b-ec100.dts
@@ -169,6 +169,10 @@
 		eth_phy0: ethernet-phy@0 {
 			/* IC Plus IP101A/G (0x02430c54) */
 			reg = <0>;
+			icplus,select-interrupt;
+			interrupt-parent = <&gpio_intc>;
+			/* GPIOH_3 */
+			interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
