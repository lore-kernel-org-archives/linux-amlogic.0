Return-Path: <SRS0=xxsk=K7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45FD3C4743C
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:43:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11CF8613EA
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Jun 2021 02:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11CF8613EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VXTkRZecAzm8PpD4yzTuxcYiSTBlizjFgBY31Tn1pA8=; b=geO0KgDICRUNw7
	Zu8X/fkUsNs6+HZTgYJUggiCsz0CnWJJ9IhDRSRVLAz9t9+4Yg53458MtwpviEgsYtCbdQpOaqhpB
	WMf8pWBs2hA3bBxxakxYyMiNpLKD0pXQp0haglExCSlB5l03Y9E7E7egedxPZK8smV5whZUz2pmPM
	xfoEg/WH0WyaW4fDMk06nMQYC2cdjqtbMNmYjMkQWySvYvyjarkkQBp9mw/GmC3aDB6/26ZA/hccx
	eLKXUdWtPr5C74Ei6Gyr57K58XOd3vRz2S0v3+xY3hqH2YdroyiDEMGBoWJkMguelO0+9/LC/63v9
	zZT4jmR8orb7UReJWX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpMHi-00Fqmo-5S; Sat, 05 Jun 2021 02:43:38 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpMHS-00FqiX-P6; Sat, 05 Jun 2021 02:43:23 +0000
Received: by mail-pf1-x42c.google.com with SMTP id x73so8770062pfc.8;
 Fri, 04 Jun 2021 19:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1f90Mva9ReuDNqMb7g12jTb4T/8wcPfWg+nhhZqJDgk=;
 b=vSsAWF5hV9+LTYoXLppeFHkLYY54a7Xif/wejfFmgwu7T/qo+zZhiDMo2gTJ8MfBoR
 G4I3lwJjR1u+ytugt4arnDtN4KOSQM375WXjln2saJaTRvafWao5bsy29LD8iZHBzOdI
 PTmwaTJp8iql14rQx0nM7A4nWIXokc0HwyPwQR4WuxrKK7MiRqz+Sic+9VicMgEyQUo8
 +QKc8PQch359XGWE6G8d1VxlA5gX8CZZi7QXsFYORjE95X9eO6QuMCQSWFGrklWmfrE4
 eZFKFS5r/XUAm5JxSFtNJG1CgtFtkSj7EssecZT8V2vkDhalPzvqSHbFwirTf/n2h1kZ
 Hj8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1f90Mva9ReuDNqMb7g12jTb4T/8wcPfWg+nhhZqJDgk=;
 b=RmVHDSoENYZtNjXS5YVg3lr+k1jikaTFYeMZ0GZbniQvGc30IsGSSS+Enw9PLiWDoO
 cql2AhvzMSWwc1IpG8UYI26+BxxC3YgOQJO3LTUeB4cvqSoRqIIFOcamTYZJxSegMp5+
 oQe7HHf+6hfPmclBI9a/CTA1e0kPONOax78Xd+2QSStT87BCsumCsdL/zbOcHDiJbtPk
 lHu/eSOmjO9lmq3cW/9tHQrX0oh8Y3Fvfg17ieVDSvI1awpfIMaqpns8tPZoTciUCXIq
 Azly9I++VeFwpZ/d6J0L58pwGTqnD92nDyLnAbXe04IJJ4Qez1nrY3HDddi1YUB5CJog
 1B+w==
X-Gm-Message-State: AOAM533SNx23Xgch7DdwCNCbmhHbMglMicczzij/bCfJpxljBUIsMIUm
 Xd28NE3nQMcdp/3ajLTEtBw=
X-Google-Smtp-Source: ABdhPJwn/bLLG2jxKA4T1rQqSmDsCCLYkuynNVLOZlLJBHj+tiZdjh4ntiqoEmhsvdmOWYp8t6zoIQ==
X-Received: by 2002:a63:b40d:: with SMTP id s13mr7786242pgf.271.1622861002037; 
 Fri, 04 Jun 2021 19:43:22 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id c20sm5511540pjr.35.2021.06.04.19.43.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 19:43:21 -0700 (PDT)
From: xieqinick@gmail.com
To: robh+dt@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com,
	artem@khadas.com
Subject: [PATCH] arm64: dts: meson: vim3: add serial aliases
Date: Sat,  5 Jun 2021 10:43:10 +0800
Message-Id: <20210605024310.409430-1-xieqinick@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_194322_852164_F6CCBD29 
X-CRM114-Status: UNSURE (   8.14  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Nick Xie <nick@khadas.com>

Add serial aliases for Khadas VIM3/3L.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
index 66d67524b031..4686ea7abe0b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
@@ -13,6 +13,10 @@
 / {
 	aliases {
 		serial0 = &uart_AO;
+		serial1 = &uart_A;
+		serial2 = &uart_B;
+		serial3 = &uart_C;
+		serial4 = &uart_AO_B;
 		ethernet0 = &ethmac;
 		rtc0 = &rtc;
 		rtc1 = &vrtc;
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
