Return-Path: <SRS0=mB3M=XC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D00EC43331
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Sep 2019 16:52:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40DF421835
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Sep 2019 16:52:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C2NQjiy5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dip9+kTS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40DF421835
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0IJoZyuJa6eKHz5Vsm44paJcXVZbyNFAMmXWi2HsEQ=; b=C2NQjiy5eZjvc6
	gCPTB5QvUosTbs41iqiLQfsJ2PuBnk7JK5oQcf5DUUjbjTrIcb3iPuO/lEkJESUgEDm2GX6daYEjq
	TTVzrYyZf1bi01tgOK4emF5x7zcyuGGUlLbTj+RNHMxpzLR84x9hpHOp4xogh44Mi8pBE7Pd3dUIs
	jmuTqJLtZ6R7E6D89XS9d0N7LJ0Mc3bhta4VHlcON4HaesY5dtnLQX2KoMd7tfxDTFhWRjRTvKCfi
	M1FcIca09Hn8pfzcuzBkwGl4yzXNNKGkL+/p/SAp6+/3cslpqr7eq7MyJYIwZsuEQ/aa8d9399cwl
	m5V8BqpTWbkxq1HdG5LQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6dwk-0004dd-Fb; Sat, 07 Sep 2019 16:52:22 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6dwJ-0004H2-E5; Sat, 07 Sep 2019 16:51:56 +0000
Received: by mail-pf1-x443.google.com with SMTP id r12so6581340pfh.1;
 Sat, 07 Sep 2019 09:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NOgs26FQJd+mh+eb+SMpRPr0VcbXm8Xot4tqXkHbFIk=;
 b=Dip9+kTSWTbr6gn3P0yZFOqPtta+hwDN47LPrzX6MDjKBMFBWO9JJdcUbs5Ik9ajZa
 +ixWcapDeBlq+Yr27K6BOXXhfBAxN6Pj6Tt0MwEp//aBhpkVLyssNUhQnMxZlYSAjndW
 ptQMF5lmIUBGklV9ugMRx4tshjIRsOvEHRUv2L1CnJlMDgYemrYgHyizUpEDlwZwD7pl
 quf1Mnb8UwNTmJDOd+ahyX3tHh1y6yeqrhNg2pKkMuzIL5fUmkB3IupGf6yfM4oRNqKZ
 pTsolZ6boiDZCRwvKl5aBdw1M7p707I/QDheZ7VPwKrFLhLrTNjnFmurV8hQAd+rrgE3
 5LtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NOgs26FQJd+mh+eb+SMpRPr0VcbXm8Xot4tqXkHbFIk=;
 b=haPzwEzQF6A047HvyXtikioexzZJpLVB6/l6VmNKkZgk0XxcdiTmn90WDS+gqxyfoU
 N8F6Wy9ZXWEYZS9gBGpv6p8OvHPqJMDPg3LXJLZD+FZvhejoRZLqEu2+aJZ5VHQZQJQW
 yuTrMXNyp8YlYom/dtnLhuxIwBuFkcgk5GYvIzdrdW4X6FtMLtFwz6D1sBdMLWsSkiyL
 X4EVDhNDAGF3dVYf3IDyVxu4sIy0u9Rjq0/lz2sT7cG5QM4uX6ZIQqsWhiGuA8QVaO92
 KKJNT6gkMbMvGQwA9FTbsDnofr9ZIbia2rsdd80Ga7sHuwhDGEhESxXqIwX9rcd5uxfH
 7j9Q==
X-Gm-Message-State: APjAAAWsFY2ZPdhB3zJ/CFsJ24Mri9qx8HkAPwsZxJSFGYBdvStkOUbl
 e/0EK6exz3jFa9VB7Nf3O80=
X-Google-Smtp-Source: APXvYqyXYjonK2Ofr7tH7Sz+4FfHQ0WLG28bw9csjkdeoulwVX7aAU5EopaZVWxckKScZWJ+UM4Skw==
X-Received: by 2002:a63:7e41:: with SMTP id o1mr13657678pgn.212.1567875114780; 
 Sat, 07 Sep 2019 09:51:54 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.203])
 by smtp.gmail.com with ESMTPSA id v27sm20028215pgn.76.2019.09.07.09.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Sep 2019 09:51:54 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [RFCv1 1/1] arm64: dts: meson: odroid-c2: Enable SCPI DVFS for cpu
Date: Sat,  7 Sep 2019 16:51:32 +0000
Message-Id: <20190907165132.464-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190907165132.464-1-linux.amoon@gmail.com>
References: <20190907165132.464-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190907_095155_524350_1FFF2F94 
X-CRM114-Status: GOOD (  12.01  )
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
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable System Control and Power Interface, DVFS for cpu
with setting 1.54 GHz as max freq in the initial SCPI tables
loaded by the BL2, i.e. packed with U-Boot.

Fixes: f7bcd4b6f698 (ARM64: dts: meson-gxbb-odroidc2: Disable SCPI DVFS)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Suggested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
In discuss on other mailing list thread below.
[0] https://lkml.org/lkml/2019/8/30/186

Tested on mainline U-Boot 2019.07-1 (Aug 01 2019 - 23:58:01 +0000) Arch Linux ARM
on archlinux distro.
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 6ae9fafe4244..7e822408ba26 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -307,7 +307,7 @@
 };
 
 &scpi_clocks {
-	status = "disabled";
+	status = "okay";
 };
 
 /* SD */
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
