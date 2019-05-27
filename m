Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DD69C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:24:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 54E8A2075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:24:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EocPis10";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="U3aDFZjk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 54E8A2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9i9wBaxBcd2ARv8SKEDRnIRFC/lfYrGJH1HXqOrkUo=; b=EocPis10Z5ANWk
	sy5vFxDnAX0iByFAtTLWg0kh6wN7hGyrIb05V0Lpq68J+1QklboSgj7poCFqcjB26Sg9LxnFRkeHD
	JfWx08vPESBFiNgaOyRFYVEoJdlwWE4Vco1iorPvsQngU7xit9lkKfXoHH6wQDSqkWzdSSFDA7fFn
	4wCnMcCcNFntNJ6FWvgPIT0ZxGn1SDk+hFVJ3ZBw4SmKDexM/m7eVv4eiTonGqi2TIqz8uhZvDbtj
	v1YePLkqww5CeHWr04SFbJPwl9t6olNtvqNPHdOtmL6Vvlt90LjUatT315rk2tsFoAHxtMiCA2Pav
	8wsLTRKUPmiHPmM4m3fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFbW-0004EI-Ev; Mon, 27 May 2019 13:23:54 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFZq-0002EE-Vy
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:22:21 +0000
Received: by mail-wr1-x442.google.com with SMTP id f8so16950621wrt.1
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4VtDGZ3OVSVw6HZggJOqUTRYqY5ZUaLIQ9cwARYH99A=;
 b=U3aDFZjkZXFYe7wNf6AFeyb2CzT8QJzBjLaQiB1ybT58exOolffDkQZVEQs9IwqDlR
 QupHWofac4pMpepiaHEoTBoAoDbCYUXpGZXPIAHJVsg6zrVjb/cSCHRMpR6uLZMrAIWk
 6rBE8L+83X9MjSsf0nrI/eChI1+CYF18c7AFPIb/WYqBGhWRRW4wCj9IwngIHnLdodiD
 vJcNQV1d2auvf/HD178QOgLZxp/OqkiTLwo7k2i+po9wNsk1Vih74NuIrIR3bKMaDjOQ
 clJSY0WBe8PP72dtaaKri3ykd9nxXqPJnaz84BsPl6+rXtGdeqp0Pso3z9BhRNexq2PC
 Yjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4VtDGZ3OVSVw6HZggJOqUTRYqY5ZUaLIQ9cwARYH99A=;
 b=umKOW31BCAsIkdxVlYSgZSukAjEmuDCsbjybzgJekMzsky2X8ET3aVW9CHa3rs0CbB
 tmXqwacypVj6ox0vhWmVqvGWtZvstT4jZxbPrKYWsdFWsjJglM4oZvchj0LD7vYjQog0
 x5fGXavGcehta87pTX2qAojdQK0/cYMG/ODM98kcC3mrV1eTW2j1qPq7YdLLky56H9Ln
 KZ7qQPawSJ+ncHMePSakFvVqKTK32gHjLqLaylnRY2DuOw0LfjUMuHITI5+rFpmg8Ubz
 Oio5KFcWv6il7Dk1YCkSoiX0zczP9BeNEBQAfHw/UKwA7T1wHXS15rIkeRPgjyFj34R3
 cSrQ==
X-Gm-Message-State: APjAAAXZ0qXVHerjGopl4XFdddS/nfOXgACUgozYX3PCj0HYkWqEJ75a
 j6N7XsKC5zMLkUxgNsqmlSmAng==
X-Google-Smtp-Source: APXvYqxf3k/7Wb+ZKnTinne4Kei3iMcPjtfcFlS1vpIpQ2xmpLUmTWkDcbZC/+3pmja1wPjdeR5u2w==
X-Received: by 2002:adf:ec8e:: with SMTP id z14mr45794613wrn.198.1558963329516; 
 Mon, 27 May 2019 06:22:09 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l12sm7019836wmj.22.2019.05.27.06.22.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:22:08 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 08/10] arm64: dts: meson-gxbb-vega-s95: enable SARADC
Date: Mon, 27 May 2019 15:21:58 +0200
Message-Id: <20190527132200.17377-9-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527132200.17377-1-narmstrong@baylibre.com>
References: <20190527132200.17377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_062211_488061_5CFF656E 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add SARARC node and associated regulator to support reading the
ADC inputs on the Vega S95

Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index be8799653ad7..4d2aa4dc59e7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -54,6 +54,13 @@
 		regulator-max-microvolt = <3300000>;
 	};
 
+	vddio_ao18: regulator-vddio_ao18 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
 	vcc_3v3: regulator-vcc_3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC_3V3";
@@ -152,6 +159,11 @@
 	clock-names = "clkin0";
 };
 
+&saradc {
+	status = "okay";
+	vref-supply = <&vddio_ao18>;
+};
+
 /* Wireless SDIO Module */
 &sd_emmc_a {
 	status = "okay";
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
