Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B22F3C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83EFF20870
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:15:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O8Gtmg5J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nfoV1sBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83EFF20870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eM1B2KaFItGK7DGkZhLmNqFnw4naN538l8vGHIsp3V4=; b=O8Gtmg5JWSPoVY
	VuPKvoV6s9edC3NuuVdvBG0uskFUSh9ZaBoW8NPYbgAPqDQzP0CSvlupTWh0VICRpvlttw8QzXxXJ
	ErZtHE6hVX2RYgw84BcXRrTYr+Q+TO6Td4rXUJRzzYf+lJjGRnk+nzXFd6NzYkDssgP/pKRVzdctV
	wkhzRd13hkGRKfcBanGndtlCBK8D1YvWanPuJgRL4rq87DgGs0d/GHaxCsO9VtHfn0BBsdbmH/sN6
	y0CU9DrSD2U+RJ45/jjRiOZqH0U77+RfL5M5pJZngYl3PaQJ1kldgti/On5uDvc1zoptXrG0RS+Y1
	d+ggnGSXZWqX/9YJ9CTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8Mdw-0002t4-3m; Mon, 25 Mar 2019 10:15:48 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MdD-0000mh-MH
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:15:11 +0000
Received: by mail-wm1-x341.google.com with SMTP id f3so8251023wmj.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qGmnnBPdv0kX3d1SiwFphEnQB3L12sT0h0laTVodru8=;
 b=nfoV1sBH0DBevTe5jXjzrSNl6evf2KHgFrcK/dqRPCJpWJeM/dPvzX/O8vM7NbAhMI
 spSQ7mS3fq19hkNYKzxb/zlStiWOBQ3c19WgO3e8Lr5VXuc/jOtrh8xhIbzIen+kzAE5
 hXJamnznpz4diFAOJ1ARhjGvC1w1kit0uu5A9AYtIasOqlD45jzMk5y99l0XNuW3at7D
 NHGBH1LTrxoiIOE4NVNyHsku4WPuFtBaLSJxaNwhuMIdFeI7/cybkIDcBA/V+fdV9hab
 M4/pVTAxhZqYME5AOKjEfpcK2zYTUdeRf3csP5zZ+5F+vZ4LMlq/KPVExp8y0HAdyn31
 nn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qGmnnBPdv0kX3d1SiwFphEnQB3L12sT0h0laTVodru8=;
 b=llunRF1HKQJb9F4lrLB+bcPTwU9vbGHTCHz/osql6YpMcQlwN2PuTLK5F3Rs5d9dAX
 s92wMDJJBFaC83MnG8KKw8A3u9Pnd4I+o0Aeo4JVb7L2vgB+Zl9TfznVR4nQVWdaX2Ss
 XJ/iFtgTVo+YOcNv1HOuKQjrVF10qVryC+RDEzLhDi5GBWVPnMl3sHY/+yWn7F5sbLZl
 kbd424RjbtgSpc2qSThYUhaJVOaMhmfaCGOKpuTV4eZVpMW51HnDlORrbHmL2Z78YQo1
 vKmNrfL5te9AaWbAiY6sId3bwIuD+tFNjs3wxTqGywxD35VDPO/8k3r1Sng9A0FLdBHF
 PZJw==
X-Gm-Message-State: APjAAAXGBMtDGrwcxEgtaY6lP3Ai5EhZxf2txwdog/WC3fJA9npbDJyt
 7lMeJBWsLEssTQs9ofYtr2um2A==
X-Google-Smtp-Source: APXvYqwKgrj6KqlCj4sDwrNiNJaZXi3Tj2kOESIcHceArA1jrd/Ab1CXqmvsUNn4sic91ardTt5YiA==
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr2473755wmj.130.1553508900223; 
 Mon, 25 Mar 2019 03:15:00 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v14sm20049484wrr.20.2019.03.25.03.14.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:14:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 4/6] arm64: dts: meson-g12a-sei510: Enable USB
Date: Mon, 25 Mar 2019 11:14:51 +0100
Message-Id: <20190325101453.3009-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325101453.3009-1-narmstrong@baylibre.com>
References: <20190325101453.3009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_031503_914364_0B53A8CF 
X-CRM114-Status: UNSURE (   9.50  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the USB2 and USB3 Host ports on the SEI520 Set-Top-Box.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index ebdad5a192f1..c350a0165d44 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -125,3 +125,8 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&usb {
+	status = "okay";
+	dr_mode = "host";
+};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
