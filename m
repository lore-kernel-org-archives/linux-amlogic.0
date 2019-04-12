Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EA0C10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:05:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 095BE2084D
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 10:05:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MQsoIRa6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IbNveT6P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 095BE2084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wj3enqsySLZWs1wEFpHeYQMm1isWVcB/7/qQ1/xmBvQ=; b=MQsoIRa6RvnS21
	oI3biit7hpOfVd3uEGGHa0b38c8pL1VNieZTQb5RkdMAgL63ZRoOPfB3WaOvWvDNFxLZawagIhkmt
	qMWf8MFBfx4Bu1O+ZGuWJ+2vpbDRGS8a2So1z3RIahMoGrCbq1ZlXeHt3qlSjETp+RdNKmc9p1TAI
	eaEIuxtfhvXAO8MB015+RtHwMF/Ne5AjRBQDDVJ4HtY5b4UnMNN3JpdbWBb/JBumOC1/yAE9thiwg
	wQHvlbUOCQtNES2Djizp9A8LsaAnxJmyoP4RjT1jw0Kgut+dmB8ZS+i2g8Nox/k7cayuhfnJAsExe
	MBbQTPMnQvaWA7pKdSwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEt46-0002Gz-8d; Fri, 12 Apr 2019 10:05:46 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEt3k-0001nK-9p
 for linux-amlogic@lists.infradead.org; Fri, 12 Apr 2019 10:05:25 +0000
Received: by mail-wm1-x342.google.com with SMTP id w15so10267420wmc.3
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Apr 2019 03:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xkjuJ+A3CtbzpoH7Dj7v7XkShfP9AdFWRwTBjrR2ReU=;
 b=IbNveT6PuucTpm2oqxnyW64wMNqqNlJtc1DqH43P9FZnvru5wQfosjLm4YSMK4xiIG
 3IRGR1VmFf6BV2Aahic1B2JmezknK36y5KRaDuqxbTQsTLiKeTClvimVSKcRXW2pPb00
 xG4tZKAmpKEdKzhch0SO6B878bWvJS/nmAIfq/ycepdr1iNLASYrEBCc8ItLYX9pn4te
 6UND8+fyVTwRIwifI9++gD++fPjDITBXRIM+tt6JLI/Upd6L9ox5On1RBxwuh3PAMB9s
 qpxmW909QwSHUKn03zS0B0faaTXCE0YtIZki78D43sDaFvBgSjoSBG+7h9ERUQosz7gq
 xIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xkjuJ+A3CtbzpoH7Dj7v7XkShfP9AdFWRwTBjrR2ReU=;
 b=Hn2k2ehJj0tsi+r2wnNdFLdSmSITDEG2xurGLeCIoNCN1I8MZHggKxf9Rx6QJodwiA
 fF102pBAsHNfIAmLLOheMOvhoX7IE3ZwKY/aNfThi2NdZiQ7dWPA1Kb3Q6Ri92oE7K4O
 h6P88KDsRXE+g4Mqgx1UX6toeT70AOrimPPLNNXKlVY1i4FG66P1ZrO0pwP3kx41f/6j
 QGLhjheQRl0dUXGQKcesWIf3VwG7UYsl6x5XD0qo7GIKI46rzMlEg+bHD7hJN1wz8lJC
 TKadZ1sOdRPGj47GAiR5YQakAh2Kb+MHzc9DgYpcY6L3cm9goSYOj/ny/J3/QF6Th53h
 /qaQ==
X-Gm-Message-State: APjAAAVZUl+UxZUvYW/UAM3RA00fmgnL3CCfzJnoDoyquoKEHLTXqbcN
 VURJWq+FW0Qi1NWImjCkEZaaiw==
X-Google-Smtp-Source: APXvYqxD0gka6EJ/WBVfVnuT3SeNRS7g0otlV4QuwZkGtqXe3xO0BTHvcELrCks6+9dMmOUDU13zHw==
X-Received: by 2002:a1c:2b41:: with SMTP id r62mr10842720wmr.94.1555063522721; 
 Fri, 12 Apr 2019 03:05:22 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s10sm10545602wmh.0.2019.04.12.03.05.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 12 Apr 2019 03:05:22 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 2/3] arm64: dts: meson-g12a-x96-max: enable IR decoder
Date: Fri, 12 Apr 2019 12:05:17 +0200
Message-Id: <20190412100518.24470-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190412100518.24470-1-narmstrong@baylibre.com>
References: <20190412100518.24470-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_030524_359568_50F5F74C 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the IR decoder input on the X96 Max board.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index b3d913f28f12..5cdc263b03e6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -144,6 +144,12 @@
 	};
 };
 
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_input_ao_pins>;
+	pinctrl-names = "default";
+};
+
 &uart_A {
 	status = "okay";
 	pinctrl-0 = <&uart_a_pins>, <&uart_a_cts_rts_pins>;
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
