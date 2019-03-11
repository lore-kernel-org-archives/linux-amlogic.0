Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37FC5C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 019452084F
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NM5qbiOo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="AMPtmvi5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 019452084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbORxLP3cJmIEDbOdRCFky5xsG41afrAzxO6ePcv5hs=; b=NM5qbiOoxDgkJM
	D3X3G293vKDSTlnQFPJQmkhjLQLD8eJlrH5eBnlGYSNk8mpqIcbAMkPTAQE1k/24j305VQCvX3J2t
	EZuUJqJGImKFECtq7hKN6RHVFtIwMMlOVOM2Euwghc1L+ODWasVkTImR6HJ34YIMPWum1vYu2ajdH
	AJKcNG0BU4w2lg15uzuvzNl6IrfzyqThuQx9Zn4LmRzIlk9cGvW9H8BNL/62am4a3qA2ZRtI3Pgbe
	psPlOTK8CifgUJw0GR3jkWfiopPZ5eIYxXW/P5eBTKc7GMeBq3/83so2mWopMzz6aKgj51fmVqOrt
	ahuKEmciW/DTQqnY6kVA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Hfp-0000n8-At; Mon, 11 Mar 2019 09:56:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfQ-0000DM-Em
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:22 +0000
Received: by mail-wm1-x341.google.com with SMTP id q187so3720453wme.5
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ml6CvXuME0Z+K5TCp7FSk/CVb63UuP6ge6cT6uImDU8=;
 b=AMPtmvi5NAGFDML5TgMFV7WG36BWxCIx4m3lQQGavm7KeyQKpRo62YqVhzKrsLgnLX
 mkx/WyT/WNCiqlI1XCF1y4DNSfUOWdc1HGIzhjI1057rWLHxmNhPztMRuc60T8NHtzOF
 WBn+3ASO3kg7vVOzOe6qNdELim+5seUNOQshDL5P+YzAFGZMweRZbmNC35Y9NaqBcaBF
 gTv2W2+IdFa2jHPj+V9xlYXYt+PTu02vG8sKSpjk1NnwIzpCNsGjjGJC9EbAWdtfPEEi
 3oWgLQ4yiHwLLUbhayElbU5pAFDwOqz8NuzrKv9ng5LTVshWo53HmDQzj+y+T5xp1McM
 MAUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ml6CvXuME0Z+K5TCp7FSk/CVb63UuP6ge6cT6uImDU8=;
 b=aVnMrFfvqSSSZQJ2VTa6So428uHzygTWIhN2GWHW1QvwB+VxXzml3+2QCej1X8Rlam
 WL30ejJVZQ0Mz9gybgaE/EUBYjO6lA0cp2sdKbgYo++lXSqWHPaXxrkTzUKCRchg0qGh
 novStFQkNI13IZ1h0qsI2n8ZJEsSHa5IwNrZJ940O4mocpxgJ58RVklgwiT9jNf0E5Z+
 vzuOlXiukWk9FGiB2cBa2ScJbRp1ZAWrJwPIRZ73kI2bER8doB7iglxNeOOyaNXvtl/A
 AxGHdo2vCdDebbqm+sw4RrxAeM/7anuZBkgAu+apAtgAXV0n+hJVwrf+ATiYed9imTau
 UVqw==
X-Gm-Message-State: APjAAAVaR2e+sv0I/6Sb1iSc2RK1xS1uJSCiV+Sec8xQFZTkZPv+pmzA
 CzdJyjiSJYhbQYEjAl/mhgp3BQ==
X-Google-Smtp-Source: APXvYqwvl+lCRstMEevCscukF7R3/hPAwQBtGqgvjwzVd8d9iutAtbpToeqeZa64LkCF9H2Uv+DC5w==
X-Received: by 2002:a1c:4c1a:: with SMTP id z26mr17081379wmf.139.1552298178656; 
 Mon, 11 Mar 2019 02:56:18 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 02/11] arm64: dts: meson-g12a-sei510: add uart_AO pinctrl
Date: Mon, 11 Mar 2019 10:56:04 +0100
Message-Id: <20190311095613.11371-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025620_495321_8F9205EE 
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add pinctrl on the always-enabled debug UART AO.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index 6a7c3241862a..63c515fe4996 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -35,4 +35,6 @@
 
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
