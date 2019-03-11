Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0981C10F0C
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:56:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 989492084F
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 09:56:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cdku/ak5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e8fUERxa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 989492084F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1A4NF9w4HJu2mZgbLKjJSwOjPlrzH8OEhXSqUW7hu2I=; b=cdku/ak5UquTze
	PiOgyypYyJTG+jGjPBqveuL2KJ8Jl0M+hE6X9DqME5SsWgwiC04TGfavu/imfiXbiphhAOwvCw5ho
	1pMIUMz5WU9xyfAIfotIj15JvUp67s+VVilS4VPSoh2cacR1RzWxAzkT5SewQHyfd9ydOuImWb0GP
	QtbN+xvYGTfcBqchTO7x9dZYDT82GJh2fPfWcdFOrL4d1gWFf65h44zZaET9agMuB0b2eTQHp0Xvu
	/hgeoPyMx4S45MW18LyrchlcJYOB7FEjD4dnf+DNcq/FvVZ/+phcFF6vRhAnr5KQUYqRNmpipw6PN
	kk3HvfsD/PZllZW/yBCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3Hfn-0000k8-84; Mon, 11 Mar 2019 09:56:43 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3HfP-0000DH-Br
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 09:56:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id g12so4316698wrm.5
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tgjmXU98UgpESiVAhCUJ94ToSTR4AXwNyUDy2FHUfUY=;
 b=e8fUERxaJOijPz7SdXnJ76K82ahZ10WDqueGGh9r6fekVphkvE1OCzvO2zEMSzZYP1
 yEOVYC6SPOS7WHl1quAeXtHBi0bmf0a1YroxTPlZSLmwczj1xMm37qMDWkkCeZwwzebW
 mm4TsZarlvTHsSFUKCnN+BdbzRqR5+tVlMJOMNk+5rkAqOzGdu9m0VToleZVrML9jFT9
 XuwfLx7oDc/pJZkGVGQI6JPX/lvqbSzVbd5rWgC7fWMq5sch44eWGVmQXl129+mRBYUX
 iIal0a/+CqOTZM1U1MqxyfMWiefm4yotykAbIe+r3aQVzQeezRjn9PKNahgh38O7ZDt1
 e0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tgjmXU98UgpESiVAhCUJ94ToSTR4AXwNyUDy2FHUfUY=;
 b=RW8Oj5zRS9d6VFFybz+1uPG+LJubxeFFnXSYDNRn+IpE0o9IBB/20asLdOUOmQhzuy
 JSrnG/mzfZ7uG09VQPwdA5f2+k+JgCqLealKVA8ozhnyHIEVoPp4DQvO2mD8IVeTBrO7
 CmeT+M1zXFw7E0nu4kcmxKIlHFCIhOaT2lVNfcuJ85k4I7UwVRrbKn5EGhcmjIGXGnIi
 M4QHdS052MfOTDime9uS9J3zdL0YzhbKVDnFjIpAknm8X3iE5HyjuLqQ/sWsKXbZiseW
 DzQ4dCIyfzVGMlvtgX317UIAt1bExKtAJf0nS5CjvytvBE9YC6zOmW0mTMFMLNjpVez4
 hCcg==
X-Gm-Message-State: APjAAAXSCAKtAz7StTcl5WOQYWMkfkOHd0BnzV4WkM70WKQrGV1FYvdK
 1PAVPyApQ9n8fNo9GsVnLWzbgA==
X-Google-Smtp-Source: APXvYqzbhyk+A9wTozxQspxlP7cmicAHAc4YM05jwZvwHHrygXlTwvZlna1hJxG0GZHovF8WvlF13Q==
X-Received: by 2002:a5d:4302:: with SMTP id h2mr19966564wrq.273.1552298177670; 
 Mon, 11 Mar 2019 02:56:17 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id e12sm4764737wrs.91.2019.03.11.02.56.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 11 Mar 2019 02:56:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 01/11] arm64: dts: meson-g12a-u200: add uart_AO pinctrl
Date: Mon, 11 Mar 2019 10:56:03 +0100
Message-Id: <20190311095613.11371-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190311095613.11371-1-narmstrong@baylibre.com>
References: <20190311095613.11371-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_025619_421206_B8E1A5A6 
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
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index c44dbdddf2cf..f2afd0bf3e28 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -25,5 +25,7 @@
 
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
