Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8297C4360F
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:54:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A24720823
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:54:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0I+rRxk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BRmVM0pg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A24720823
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u0OcML9wMXuO5iI8+ueZrtNq+qDIb4b569MwuAANVF8=; b=b0I+rRxkrKY09F
	ls2pjmIYFCaejdC7d/7OCgdJVohUpw4at4XrpKtOZHaUcDYHy5xfXMTyUfmjw/awWM0IvyErKbWIS
	FKn282zGLOLUEhQawTK7LaDEkLGmz67H2o5ygTm9RBm9imwnNj0UKwaqoBauYLOvsxBHmKjQlc6Sb
	ngjKKWRHrLmoU2qfvvHmndX9InHj6jPZPuqY7UIIXKkfIwveDBbgv4A9BRFN9n+8qq6JjYdTRTq6A
	WKiiVM75RdO8lCt7dgZuFef8w+h3Jneb+6KOqSPtb0/5bUpCjkbLNL/fZue79zrrXzljP96T/c5BW
	iXm+1dJct+vLoSaI/QfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0lES-0003ce-Kp; Mon, 04 Mar 2019 10:54:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0lEP-0003bq-Vt
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 10:54:03 +0000
Received: by mail-wr1-x441.google.com with SMTP id i16so4982897wrs.13
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 02:54:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBMGzFIEHIQ7zv+jwc9v87XTUsS+NaVoQ1+r7qeHMU0=;
 b=BRmVM0pgR+XnUsEccy9kGG+98Q+d2CQSVst+lIhoYlMhfD3GzbvaoNWx+iMbKhSf2K
 hid5q9nAyKvYGfgkoWwke8UXwXwwbBWGh9JW/bWtMXpng+GEIQRMjDlEIaBgT8hl+26/
 rJpU46HGsfcpqg7ltr23k7L3DW5AQNkOSISM7xzids0CM2Ts89YHMUisRAKsrByCkzH5
 xQYTf55l+ltnxizDZONfLT370yQF2CH/HUFt15LVqISjT+MFcOBAuxSPBom9ulK6QT2Q
 nY8ScJEpT4T+OyfmD0bJUBShNKMvmsG/bDJL2on75EXeknLzXqcHdMTsnyObh8zSPjt2
 eI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YBMGzFIEHIQ7zv+jwc9v87XTUsS+NaVoQ1+r7qeHMU0=;
 b=qHApDfkNW+ByVvsxCN+vbCf8MNhhTAYhR6f4zJX6B7uzV/26msZrrIRuXaSWFOl5Og
 ulb/dpf3o9tQ3fiTGF6HYIzMbOetK7i3eGa6MBqXNFGBKelzpme0kI5L8vOSGCE7hLmv
 UIiwnMBVelUdz3ATnVCQGXmeTj0Rkgl+WiO7+tl7L20VFSSovq6DhcNUzEfOjcVfgF8L
 aKWsLDqwVabhym7BbTeS3iMsMCEuvM7tsyLKuFgbAwNrG6wNvlHTanaDGNab2MFky/4i
 KDAafz4CLtnzhJbLf2dzD1OEOQX0KuB1RNzeuOaudtWAkF5MT4AyzFaNHi/expidflXb
 nLDg==
X-Gm-Message-State: APjAAAVdoTx8t+NSKx4SJou9tLtsJK9MU5T58yqLddtLh7qajFcl3s2Y
 A2PjTetpYCKOYPeHSoz/FXTXJg==
X-Google-Smtp-Source: APXvYqwzyvJ/CENiAa1enYYEUkpI981sn+aj1XtJn7/p5P9NvQVymeZQ1Mv9eb4/SSoNO84bqu4fwA==
X-Received: by 2002:adf:d4c6:: with SMTP id w6mr12033156wrk.65.1551696840245; 
 Mon, 04 Mar 2019 02:54:00 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n2sm5915996wrq.58.2019.03.04.02.53.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 02:53:59 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: jbrunet@baylibre.com
Subject: [PATCH] clk: g12a-aoclk: re-export CLKID_AO_SAR_ADC_SEL clock id
Date: Mon,  4 Mar 2019 11:53:58 +0100
Message-Id: <20190304105358.4987-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_025402_023826_5ED290B2 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When submitted v2 of the G12A AO-CLK IDs, the SAR_ADC_SEL ID was moved
to the internal non-exported bindings, but this clock is necessary and
mandatory for the SAR ADC bindings.

Export it back to the public bindings.

Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/meson/g12a-aoclk.h          | 1 -
 include/dt-bindings/clock/g12a-aoclkc.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a-aoclk.h b/drivers/clk/meson/g12a-aoclk.h
index 04b0d5506641..666b4493822c 100644
--- a/drivers/clk/meson/g12a-aoclk.h
+++ b/drivers/clk/meson/g12a-aoclk.h
@@ -16,7 +16,6 @@
  * to expose, such as the internal muxes and dividers of composite clocks,
  * will remain defined here.
  */
-#define CLKID_AO_SAR_ADC_SEL	16
 #define CLKID_AO_SAR_ADC_DIV	17
 #define CLKID_AO_CTS_OSCIN	19
 #define CLKID_AO_32K_PRE	20
diff --git a/include/dt-bindings/clock/g12a-aoclkc.h b/include/dt-bindings/clock/g12a-aoclkc.h
index 8db01ffbeb06..5ac66a2eee0f 100644
--- a/include/dt-bindings/clock/g12a-aoclkc.h
+++ b/include/dt-bindings/clock/g12a-aoclkc.h
@@ -26,6 +26,7 @@
 #define CLKID_AO_M4_FCLK	13
 #define CLKID_AO_M4_HCLK	14
 #define CLKID_AO_CLK81		15
+#define CLKID_AO_SAR_ADC_SEL	16
 #define CLKID_AO_SAR_ADC_CLK	18
 #define CLKID_AO_32K		23
 #define CLKID_AO_CEC		27
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
