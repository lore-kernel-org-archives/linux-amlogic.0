Return-Path: <SRS0=+F2p=SW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79222C282DD
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2019 09:33:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 486C321855
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Apr 2019 09:33:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tViXucHS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="D+98tgcf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 486C321855
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V3Lz9G4D4fGM1zxFM1+MH3b5+jqILHPhbRbTy57ojx4=; b=tViXucHSkc5pPv
	S9WJ9SLBJqxJmzVu75/9TQ9kP0OjxTXWeyiSg83SLPr9HuJqBNmtBidlCaxC+FHbWr0KuSTGqYuL2
	7iL9yS3SS4/+Qt4WXxbKZxYRQqZazvhi2aBsLSlASkk3ZvVzGuFC6dVYOX2zmP5U1Orc4WmnEqJ29
	7dVzvFk6tlrtLqGnKnb8dTJnc8BJFYPcUZC4dIUUAiIevmkjM6JxiKcDx29IwlkC0qgY07mW4zghT
	Mqc3WUowbKnBHKfXTmgCQmQKhfWWLrAmJbxxa47HyUWl8hjKLkrd24FF7WZcWQVzGIc7F/ags3wLM
	msjEYT/Uk+Te1G3/2AOA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHmNQ-0007El-MD; Sat, 20 Apr 2019 09:33:40 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHmN3-0006mZ-5x; Sat, 20 Apr 2019 09:33:18 +0000
Received: by mail-wr1-x442.google.com with SMTP id h4so9612281wre.7;
 Sat, 20 Apr 2019 02:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idwqWI24RRMujosXdp72Gc2bSSwiwXLwDzY0CFc9vDM=;
 b=D+98tgcfLHHn/09OlcyMyPqRyvAkI0RjyRjnng55f1q0Ha+YD2lTxHIZuhaGvY2gdP
 m2Q1y+7ZkoNNtON3+XSNpkIxTDysbaAgvfWGt3SiYjaJw6rlRmCIr3OyB/c9fr5H/lqz
 eSEJi2lqkIeVZvz0bFtF5EwMM9srM+UdbIrAiDrbfHMzK0JIUF9pcvC6xnkttRNnjZX1
 BuqwVdmXfNxJooIAxgaZjcnUqZ1WLhGFWfOEJbeOEpKTzCgH3ZydkaSx9Bxwnj6Kh9P7
 Irt5ZGLFgHPxmdDXtNyhHu/LM5rn2zfQ/NA5NREcp06Vde31PcdjIcwND1tZf6700CSk
 kgJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idwqWI24RRMujosXdp72Gc2bSSwiwXLwDzY0CFc9vDM=;
 b=pjCS0Gj/c6AHS84AsgViFMWlHWzjyl6++vMmxs6jKg+hGs/sfrOKN6BLRHqorR0DGT
 b+wGMjIOZr/XWb4TWm469D7nXC1rAj7jgalPFm23Yl85ODqPbrttmcDB7GDkD7SszKet
 UTe8DY7uKzwcfpoUM2O1TAE8HClYY47Od+2kLj2nwkzPeeGKT2VYWvMVTAC9tepwlifA
 q4WNI+/fMvlzWIuckoeYJGVuamaaEhB4vuRGGOh30AktdyHw3NY3XhmzGZW6qXI17Qff
 ocd5elnVkE4yJs/cZFO7pnc947uY/jI3MCDw0RCsGYb2YOYM3+cDet/onbS2Rx5axtbn
 aZLQ==
X-Gm-Message-State: APjAAAV3HUafSeW0FOhLvnhCeIGndU2vOnVxEtsbdq+oZQfQcIzEJAH8
 asmnWRnPnuCLiL00vGft6T7V1w9C
X-Google-Smtp-Source: APXvYqyYB2zv3rPKR/iSExi8uLlrZXfzKr72r31aYA603zBukH4UFcppZL9Jev1aaIKTeUmJm0E6gw==
X-Received: by 2002:adf:ee82:: with SMTP id b2mr1592773wro.233.1555752795276; 
 Sat, 20 Apr 2019 02:33:15 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C8AD0028C4739A57449001.dip0.t-ipconnect.de.
 [2003:f1:33c8:ad00:28c4:739a:5744:9001])
 by smtp.googlemail.com with ESMTPSA id w11sm12858244wre.15.2019.04.20.02.33.14
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Apr 2019 02:33:14 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/2] ARM: dts: meson8b: drop undocumented property from the
 Mali GPU node
Date: Sat, 20 Apr 2019 11:32:58 +0200
Message-Id: <20190420093258.2012-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190420093258.2012-1-martin.blumenstingl@googlemail.com>
References: <20190420093258.2012-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190420_023317_218260_A4255D7E 
X-CRM114-Status: GOOD (  10.38  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Drop the undocumented "switch-delay" which is a left-over from my
experiments with an early lima kernel driver when it was still
out-of-tree and required this property on Amlogic SoCs.

Fixes: c3ea80b6138cae ("ARM: dts: meson8b: add the Mali-450 MP2 GPU")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 800cd65fc50a..4b919590dae5 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -229,7 +229,6 @@
 			clocks = <&clkc CLKID_CLK81>, <&clkc CLKID_MALI>;
 			clock-names = "bus", "core";
 			operating-points-v2 = <&gpu_opp_table>;
-			switch-delay = <0xffff>;
 		};
 	};
 }; /* end of / */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
