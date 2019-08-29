Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7062AC3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:27:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F31022CED
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 15:27:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MOY7akTo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="S/3okXCK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F31022CED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxN4mJh8zaelL1PKCQOpi8x14KVxrLlrQ+jbdUH/pp4=; b=MOY7akToJ9Eq2K
	RjwvKzLOYFliHGuQi9CldCRQUTUJ6MaPTaLDqJUBYD0ZVYnlg6dAo1o49u52wrULqPW9A+48nink8
	49RUnXq7lMpsu0sQyVx7QkwsBo/jHS2FsCE/wuqH1PjiTvvG9Qt8eQe9FXS4IPoUIAV1hzJhjjoHZ
	0lH1jyq1aM9CEyd3g0ge5yNftLS4cxCBRqzjINdywpvkWLrGzosOoq8/QLvAB/ZbdII4hOkohc6F7
	F5DXa9EIh7tZNU5InSx0hlIh4dVAfmcHKe3FOMJyMRtBSpdoRt6557Uw9wxtcjim4GAlRvF/O93si
	trYcvzIlTd23NphsqJdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3MKo-000198-9D; Thu, 29 Aug 2019 15:27:39 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3MH7-0007Qx-9m
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 15:23:53 +0000
Received: by mail-wr1-x443.google.com with SMTP id g7so3890349wrx.2
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 08:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BV274s7zt3wwvGwt3NgSkJi54bLOGbQjevUMF5GAsdI=;
 b=S/3okXCKjNTOL8vkN0yxlvYrGXaYiBD9C8IO+pFcUgOVRGOs1ELkYjmVFFgrLcQH6C
 8wdPNFLBqkpjKEWiA0t85ERq3bsV/eCcM2Be3aFFG8gmMFcBtCQL4DdFlQR5FoIfElEu
 0JQPFWrgNm/mYo/oReoHFqvoApe5aUgUDO6wmfGBtjn899XOxD6MmNTKby0KkTXm/IbC
 gTn6bLXwnGor/R5dHIfafVm941o3Wt3bYvjrK4GtOC1t2hMn4mnBwR9Urm72w3OuOJ9t
 XDs5wzOpGLn+QxmS00VnDLGKNFdOjBixrZaSJpITNNTaXAn/283ToOPyImavpgwV4BQ2
 rjZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BV274s7zt3wwvGwt3NgSkJi54bLOGbQjevUMF5GAsdI=;
 b=taKah+YGku0CPoO7zDffiUvRH5UsldfonHVBHI3Wr1UxsCSaZW2htlgK4s/4ljh5cT
 3MuYovoyjyZSFo5y24Vg3bsbd/jynOmzevVgQcMj7I7Tf7bNaXVnOzPgAEQYtjemOnt6
 QcqWG5qMhkRZZBGwe0rDnNkvcN9xtG7ZiKdMfJqzTopogMqf7o2DsJQ+dlv51U9HWBe8
 izT8yRHqjqqCbeDizjvGuaFCjt1bEy0QYpUfPN9Iidh6InW6C9/9frv8md4OQXtduajV
 ZAF6dhqk/pEna5znVq0w4ryvtOag7MZKtPcH+UThQbe3ReD6Bu71WU50NahjhCxhuArd
 qqZQ==
X-Gm-Message-State: APjAAAV+hve3Wny9bWzSnxJZoHpr8LtVEr/kRx+SHBs6p/LpWa1jkTmu
 sByvsSGnJKBHsOt7dcw2UsqxhA==
X-Google-Smtp-Source: APXvYqydgX/gtdvTwrPnfTWn9Om1yJ56I2EGB7GGkB7eYu7itvRAS9hY7BegpIShnflsBTBc75fqvg==
X-Received: by 2002:a5d:434f:: with SMTP id u15mr7173257wrr.16.1567092227993; 
 Thu, 29 Aug 2019 08:23:47 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d17sm4866871wre.27.2019.08.29.08.23.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 08:23:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 04/15] arm64: dts: meson-gx-p23x-q20x: add
 keep-power-in-suspend property in SDIO node
Date: Thu, 29 Aug 2019 17:23:31 +0200
Message-Id: <20190829152342.27794-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829152342.27794-1-narmstrong@baylibre.com>
References: <20190829152342.27794-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_082349_945966_0411841D 
X-CRM114-Status: UNSURE (   8.47  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The WiFi firmware requires that the power is kept enabled while in
suspend mode. Add the keep-power-in-suspend property in the SDIO node
to specify that the power must be kept when entering in a system wide
suspend state.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
index a9b778571cf5..12d5e333e5f2 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi
@@ -169,6 +169,9 @@
 	non-removable;
 	disable-wp;
 
+	/* WiFi firmware requires power to be kept while in suspend */
+	keep-power-in-suspend;
+
 	mmc-pwrseq = <&sdio_pwrseq>;
 
 	vmmc-supply = <&vddao_3v3>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
