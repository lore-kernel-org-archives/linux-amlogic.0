Return-Path: <SRS0=czMH=V4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D89C32751
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:25:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85BCE2067D
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 Jul 2019 08:25:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CTIS1/Ov";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KfFL/BC5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85BCE2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rG2ZBwrXkkVIxoOfEiFEf6oKpmj/Objgd3ZEXQIA4fY=; b=CTIS1/Ov6ohBIr
	45rxYruwM5bFXwx2yXDjFuuIL4P7GqnhmmadAzRkVvfZmdGi3RpakF1iTKR8vZru60GN8lRwbyfdp
	vUzz16A1KYLEL6KpKDfZ5qvvCdknVahB7s4AticJZmcIiTVRKFmsR17/+qqewDznb+ZNeAq1ZXo3U
	x0iIUg3aMcvbADy3MT5szKWv8A5I860FaIJ4Su5N+neKLOhANMMZbMaCg1KuNI5XNc7pcFIO7GGnY
	VpHm61U0y/xOW+umVYhmWlwgojn58QKBItUy2Sbpf4QpQKYcD0x9VvHSMoOyOmMVCLU4a/XEgqiRC
	QibuKHfs1rqtAaV1B9gg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsjv6-0006VL-Kd; Wed, 31 Jul 2019 08:25:12 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsjuF-0004lj-Cy
 for linux-amlogic@lists.infradead.org; Wed, 31 Jul 2019 08:24:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id n9so43558730wrr.4
 for <linux-amlogic@lists.infradead.org>; Wed, 31 Jul 2019 01:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FvbjEUb/Th+01Zl6XcdJ8odyub7JsODLUUEoKLKzNZs=;
 b=KfFL/BC5xXufP3lnLyJas5UbmqihmA7JUqE/ABeqHp+2fHzgoTfjS9RR52KjZgfybD
 OWqofiqs+lXpz8e0FIe9QWueOTgbduVw5Tu7tP8cuMt7q1VkNTncx+hrHp0bk3rLNevY
 bdMNp54T7/xGH6YVjA9tk69Nak4tnRzf5LN3TZWpM+rQ+ggpa2/uhsg5ZiXOS8voq1am
 YRaf94BMdbjKllwNF37cCZCid8eMt8jn7R/szwHsN6HzXtGZj4raMFsnW8K2fMyfKg9l
 1gdwmtDgDU6DaWK7EH3XLMPjP3X/ORYHNdbq0XnyeTsQkRB6EbRn6NRBUYcB929zc6XB
 N2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FvbjEUb/Th+01Zl6XcdJ8odyub7JsODLUUEoKLKzNZs=;
 b=a3jAjiBaz6DEcIb9RvwL0tk1MCwxmh9Idd6T0gmYd8D++JIZviAm2GooO3BtvaA7XD
 bVpTPj66Bt36nPTpgY5/vCwz7vVfAMN62umiDtu8C2z9hatLdBhoBcThIyW/Ty1ZcYtq
 t1E9gSCq3DT0+j5POyo9YvL4H/ddqmudoF8KhwaDt4u/uoqQO0s9GZPA4Cdeit/Q7Eae
 hVb6Ked/XnexCuyuZs0vHv0jvm/DpW01kYfBXk4NL4R58Pn5dWxbBXPqp2X9oLTXMSbL
 V+pLF/XtR47YBzMUAOTYp4J9SePQQAjthsz9DsC93GizySC1TzLiweJHASTn+BrnThIW
 /ARA==
X-Gm-Message-State: APjAAAVkmORm43F48OfGdSBxxqI3P0TDJI7TlbHJPIVWxj8QSvgSLpKx
 fnBOcRqnzd3S1D+SXjbnduf/mw==
X-Google-Smtp-Source: APXvYqx8lMDuI8fETzlBpD+Nb0OwlBL7r+bY0XigWErXCCrG7/5RRdFHxOGqoR3XxYQElGTaiYN9dA==
X-Received: by 2002:adf:f646:: with SMTP id x6mr140810646wrp.18.1564561457832; 
 Wed, 31 Jul 2019 01:24:17 -0700 (PDT)
Received: from localhost.localdomain ([185.49.42.196])
 by smtp.gmail.com with ESMTPSA id o3sm54597664wrs.59.2019.07.31.01.24.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 01:24:17 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
To: srinivas.kandagatla@linaro.org, khilman@baylibre.com,
 narmstrong@baylibre.com, robh+dt@kernel.org, tglx@linutronix.de,
 jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/4] arm64: dts: meson: Link nvmem and secure-monitor nodes
Date: Wed, 31 Jul 2019 09:23:38 +0100
Message-Id: <20190731082339.20163-4-ccaione@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190731082339.20163-1-ccaione@baylibre.com>
References: <20190731082339.20163-1-ccaione@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190731_012420_659946_DB9EAFF0 
X-CRM114-Status: UNSURE (   9.36  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The former is going to use the latter to retrieve the efuses data.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi  | 1 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6219337033a0..b8244efb85fa 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -117,6 +117,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		read-only;
+		secure-monitor = <&sm>;
 	};
 
 	psci {
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index f8d43e3dcf20..2b07752e034f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -100,6 +100,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		read-only;
+		secure-monitor = <&sm>;
 	};
 
 	psci {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 74d03fc706be..d244d9783718 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -161,6 +161,7 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 		read-only;
+		secure-monitor = <&sm>;
 
 		sn: sn@14 {
 			reg = <0x14 0x10>;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
