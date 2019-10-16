Return-Path: <SRS0=vLcw=YJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB9FFA3728
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 17:09:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 445F22067D
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Oct 2019 17:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WhuV9Me7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p2tUHLOC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 445F22067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YZuW040JD3DtjZkJDPKLgABjPIzpz+9953rCR35zHhc=; b=WhuV9Me74bRj4SqS301oaZKe6F
	QCKhS8aWENaMChceScIo/kwrxPyOurFhtSZpmNlCUEiPpX9bJMfTVFGw5vi01vQOVM6dagz5IrTwK
	zjRpGqRFELrbaaXJKyxN7bQc9BEmAeRWnZRtK6u+PlQYqfMdwx6h4t5zKTWaFHvL6Dt6D1CHGR1Nj
	IxTHd8xp4nCQNKtSqQ5Kp8mttIxO/SYJehE994kSJSzDTEItqrvZ6aboZd/7q6JNLrILZQlxT/gv8
	VnXIZojo87zR08mUTH8B/rqjASHRSTQzU+ZkZGkq3Xsc8khf+RdaivRzWo2UNYjhQGttoWqCTl0J8
	sXQFH7gA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKmnc-0004ee-Dw; Wed, 16 Oct 2019 17:09:24 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKmmo-0003oL-1P; Wed, 16 Oct 2019 17:08:35 +0000
Received: by mail-lf1-x142.google.com with SMTP id 195so5157134lfj.6;
 Wed, 16 Oct 2019 10:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tPzq/4pAdFPsSANJ/9NHJEoF3soP3uhPziVivyFbVzY=;
 b=p2tUHLOCFaKYtSzu+8kqWT2Dzna3tCZCKO0yQhQ0QcSNFhesJBaDW4i8xBo9fc8T3f
 g4eJS93zAfvcr0wQv321p5gCDYU8yH11j7caUaImTHabE7jMqFUhfsMfEfncCCqpvda1
 JxleoaFtrXcAMuQ0kM0H7K6Uh6gAE7Iqnx3mwfp69rfGBM6pO7eiVCa7GjaVPh5JmNON
 cnFSELeJrbWBRGjeHBuHMwLciJgxseg5AG5TFGnCrsxzIDYHgYDX4RSIahqW49/yQDuo
 gmMmpIVwBMdBUFEMHczk+8drg+XldueaYcTmFPEZ85TA3lhIOO/rfDiJle9687mWEZOV
 IMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tPzq/4pAdFPsSANJ/9NHJEoF3soP3uhPziVivyFbVzY=;
 b=KVbIhXLcTDRwvfXKKvQPrHEl1agbNgwoYtiY1YJL9pbeUJuN2BFxv6hh0MD0MimIT8
 UMTbhNG+RfywT9FV1ELv4yGsE4pU8HFvbrRF0zm2mRpmtYcF2HXyyjma6XwH59e6HcV3
 6nlmAbXfZHxIYfSIexRTRKjb05UBrbxVY1PV9j8B00En0p04kqQQqCLCMmj52fxP/e0X
 ucws9F7Qsox35mi12zzVLeNDKkKuNHxwx1rZ0L3KBcugPRMo6J9DY9vvvfUUgNJjtW2N
 AAzQo+CtLusz7kplngOTn3HYoiY/ZEZv3/CsPbHw6c97dk8gsNC8V+HPAM8U8zzOpCoW
 JaNQ==
X-Gm-Message-State: APjAAAX2f5BVbvghU3ex50rleHDte3Eag87y6OkxEjzpj5VF6FlktWUy
 EO6ZI0sd4MRxui7oGuynmVg=
X-Google-Smtp-Source: APXvYqztlIKXFcwsX9T4q5xwz9eoGg3GnsOg0q124ETsT305HLl5q3GH2LzOddyA4J/Q6XbgkwM9Cw==
X-Received: by 2002:ac2:4830:: with SMTP id 16mr521889lft.35.1571245712219;
 Wed, 16 Oct 2019 10:08:32 -0700 (PDT)
Received: from localhost.localdomain ([87.101.228.250])
 by smtp.gmail.com with ESMTPSA id q24sm6299182ljj.6.2019.10.16.10.08.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 16 Oct 2019 10:08:31 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: meson-gxbb-vega-s95: set rc-vega-s9x ir keymap
Date: Wed, 16 Oct 2019 21:07:37 +0400
Message-Id: <1571245657-4471-3-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571245657-4471-1-git-send-email-christianshewitt@gmail.com>
References: <1571245657-4471-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_100834_142133_FF4943BA 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the rc-vega-s9x keymap to the existing IR node in the device tree.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 43b11e3..0cc6d18 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -152,6 +152,7 @@
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
 	pinctrl-names = "default";
+	linux,rc-map-name = "rc-vega-s9x";
 };
 
 &pwm_ef {
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
