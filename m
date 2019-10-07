Return-Path: <SRS0=9NnP=YA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC079ECE58C
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 13:17:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F332084D
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2019 13:17:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WRdClG79";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBinECWV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9F332084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GtdLDuMJyTfK32aa1+VW1l5OAbjRC/Jv4237HJF0wLs=; b=WRdClG791NOEPC
	zSC02cTOP3fm/uJw+7JQIm9ZBxL9Mjole42XYadwf0RR4C4BDG3C+ScRUsbBWc31z5+iRVDRJ7pMk
	7J2U9RgrsY5DXo9XT/6fJ91BXdc4YT258mE/YVlrzZnyxwjmuxzVEotFd8cdhVbXgOrJQCkt6C2Qd
	eWF3zl+VbW9J0aRyh71cU3h9rSxoGJLz8+KBMUT2MWr12AuXqZb6I2BpBf4fZMWpoor0n13HVK3Zj
	YOsBeR8iPP9vvuHXrYopUN+kq9GubnSUDSvsNHw4MDVGqV++d2i37JiSk+LD8RtPPUDSzaCtT3oQQ
	ZB+ygDSh6qK13lv/D63w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHStZ-00025N-Rm; Mon, 07 Oct 2019 13:17:49 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHSt1-0001PK-Tk; Mon, 07 Oct 2019 13:17:19 +0000
Received: by mail-pg1-x544.google.com with SMTP id 23so8218274pgk.3;
 Mon, 07 Oct 2019 06:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQptgICcCtWSSBgk772ZatoxsYgICaTNG3vZM+tN2JI=;
 b=fBinECWVUCIqe34f6Zm6eVHxOd/IF8rHVCJXk63l1nCydtUcpyb2geWtuN+s+Ay4gU
 IYQjoki5Gx0y7dqhznL3n+0H0tkinm2T/CN9NHGCk9vudJJxYJdUrpB0OwWS/qXUivMC
 xB0CuWqI5T8ka+YYVaSXrrfA/WjJHKvkNImhg79hHxu6RaHhy0FIW0y6uYG1MoVnIbkP
 1b2C0xnlTfa8ddknz2jCcTmGEUPTAeITZ6YjXFfbjR/Emrtso122HF7IOeC6DiU9zUFv
 q30VrZtsw3M1yntt8ev2mhejPd5LRVFYqomJYMnX0ryYMAV8zu2Po9vZJOdttW1LnNHL
 Mxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQptgICcCtWSSBgk772ZatoxsYgICaTNG3vZM+tN2JI=;
 b=VPzOhySXC27zf4yLcw/qHcjp94ZFcC+ZCR/4jH1iHCDw8xt8LZ51B2rJSiZWmnXWD7
 SW0+0l+KNSP1pPDRUe66U6qoev2qF5FQV6tHJ6gUj8TpdoV/vF7M2vTsrYiodPohlZAv
 P06/YG7L/zkr1Xv42AQF8nTHr98GQXNn4kw3sPPXCF+JBlkGA5cOtNxEQ7VEkVKfDUEu
 AX8SAYuypkrVEfZXmzXXo3jqv5XXchC6WaUte3j+5VRL+9MNIFDYbsG2JoGKk9C4NlCX
 URoGQfUFlykWeCToc7dYOW06JJVzIQiwsaqdHa5cokqV/7ftONRdhK4llP3+zfPEI7Vx
 9rdQ==
X-Gm-Message-State: APjAAAVW/rh/R06B3rk59oWVe/oj0XkzJbae7nRkKFQEpHN3iRoybqh4
 5BsD185cwCKBVDnAHIcJbgzpwCUU
X-Google-Smtp-Source: APXvYqzfY9skP87J/Jepml3CjVgEOVUZCdNt5zbuEYhEafhjGqPWB7v6/VCcFrt0DeUtkWOl/eN25Q==
X-Received: by 2002:a17:90a:380a:: with SMTP id
 w10mr33937550pjb.104.1570454232768; 
 Mon, 07 Oct 2019 06:17:12 -0700 (PDT)
Received: from localhost.localdomain ([103.51.74.138])
 by smtp.gmail.com with ESMTPSA id r186sm16938650pfr.40.2019.10.07.06.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 06:17:12 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [RFCv1 1/5] arm64: dts: meson: Add missing 5V_EN gpio signal for
 VCC5V regulator
Date: Mon,  7 Oct 2019 13:16:45 +0000
Message-Id: <20191007131649.1768-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191007131649.1768-1-linux.amoon@gmail.com>
References: <20191007131649.1768-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191007_061716_390047_3A20BFF4 
X-CRM114-Status: GOOD (  11.58  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

As per schematics add missing 5V_EN gpio signal to enable
VCC5V regulator node.

Fixes: c35f6dc5c377 (arm64: dts: meson: Add minimal support for Odroid-N2)
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 42f15405750c..a9a661258886 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -94,6 +94,9 @@
 		regulator-max-microvolt = <5000000>;
 		regulator-always-on;
 		vin-supply = <&main_12v>;
+		/* U12 NB679GD 5V_EN */
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
 	};
 
 	vcc_1v8: regulator-vcc_1v8 {
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
