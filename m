Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5EA5C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9642C20693
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FT2FhPZh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="byqOkFPI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9642C20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gCHy6u5hA1cN5/wSCQp29nrEm/kFOG10+DHMuYk5+D0=; b=FT2FhPZhtGVmNl
	unhF9YByKB8MhhJLHGRPPsvVtp54SjiA6wuBRNPKuHRq5v6+YINaShG8qk+6Vn6BoJDFym/CW5A+a
	avJnltWvKmduRSaempUFJPH67nXWo+ftWzpXC7PeliSFsL0cMmErHfzqExH/7Vi+VPU/hAV3S/jJR
	CdsyOPcxLYonFwIu+SI4ePKqf47Vr2YFn+j5kUfo6VZBvBDppotWQAa+iAEoJhVcHbcT0OAsH3nZk
	sfETzwhDnw9GdILc/Bk/03faXKAyWpNB5rYmVdusYJGlrm4aTBxZevwmYr+rxi5eiDJX/xBz4yyH6
	qhKT1LcRUzUu4lzuT8qQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5p9R-0001aw-HC; Mon, 18 Mar 2019 10:05:49 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8i-00089i-My
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:06 +0000
Received: by mail-wm1-x344.google.com with SMTP id e74so12283655wmg.3
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l4lB+A4NpMmoBfDCc0H8yeSl4aEUFbhEf+MpsV/sM+E=;
 b=byqOkFPIOilU2z0se+NOCtFSnZjUM8EL67m8TACubdxgrGRXTSIpYz/9Yh2GMzicNK
 Fdg1XPXfbAD2h6eb4mBaCbIJv9C/rBEg9Qxu8bXROvWuFedcgKHgpVw0jquyKrE7UrRI
 EtwKBMJqD4+yBWEixq+Lu2fQ9IGWJTt8Jf/PQ2RW7Sv8oz9PrOLpNkg9zVcISIPqjLAQ
 Zl1TWCxtVM22LrKbBT4UN1hbh7WkPFTaX4ShpcPBewfYasvBwDfzJZ3j0dY+yzImxCNE
 ZaB+22JrrDht/R0cGUp86DtOpwaPJbOu3NUOJX/JcIAlmNvEVA7sDvAobdSV5V3nXfyO
 mS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l4lB+A4NpMmoBfDCc0H8yeSl4aEUFbhEf+MpsV/sM+E=;
 b=m7wi787f+mqkC1wczZv+pDcnFs9p4DjdvcWxNZg5fxiRPi+Oez6nh+caCm6BW3mj2J
 7mDXaH6SYu+0WBvFM1+BtsGtbZfmxocT7wAnHSd/qXRordNLFxoUXdRjhHWFGOAoG2ZH
 7t8Hxw6Dg5zJ9w/4YewUsWQdYULJZMPBklv00pT7iFdBasgGrg86VCwcIrTkorq0+zzZ
 NrpJZrLARjdg0/5L5VmiWz6aTfHpXDN7o9b/PFy/fUq3qV/XaY5s/fXPV8sF2zStmBNI
 a6lnzppOsHFW1PhTpcPMd0DYXIV9E6CTM3uQX9P3mzFXsWvwnxe6ynvl9hIxEfgpzkKr
 VP0g==
X-Gm-Message-State: APjAAAWFdohtMLuBFDaNDzpxpQIa2nuLjGQzSAPVZ2U0sqw303ozZgQw
 hgb21u+WXfYGdL31zmTfJXzLfQ==
X-Google-Smtp-Source: APXvYqyot5ZvVxet/erVaABn/qqOji/jAmi82itVHtOpYI0u2yg3sNOlkhFoZw/AtCIwhjWSOdqRgw==
X-Received: by 2002:a1c:1a46:: with SMTP id a67mr3702308wma.21.1552903503069; 
 Mon, 18 Mar 2019 03:05:03 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:02 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 03/11] arm64: dts: meson-g12a-x96-max: add uart_AO pinctrl
Date: Mon, 18 Mar 2019 11:04:50 +0100
Message-Id: <20190318100458.5619-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030504_880617_2F07D628 
X-CRM114-Status: UNSURE (   9.76  )
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

Add pinctrl on the always-enabled debug UART AO.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
index c62d3d5706ff..0edbd00b358f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts
@@ -25,4 +25,6 @@
 
 &uart_AO {
 	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
 };
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
