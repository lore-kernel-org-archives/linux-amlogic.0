Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61435C433E4
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB562078E
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 10:21:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1sSuQQ0d";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjeoSavH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB562078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Vw8xW9NsgLdWdaqv8+B5pHrY2s5Diox/kbjNkD3ETn4=; b=1sSuQQ0dMIRwF7eCVbRi6HyZ4
	SFc9I0rmerDH76eyDr3ETIX+jpHsNY7FTfK/PppYwD9UPz7TkEANUZU47QbcB+jmtdDgLq4cXXzOt
	iTcFMuf71qJDnxU01efDhcR9KcbX0bPP8UgWYBJ2pTlkNbtV8NewMgFEOcYdY93dx2hEHGjpdtwq+
	7Xb2syng9Dh+1M9e0O2CgExLCH2LJnmHvaOk2fIFCnlDBMISZtjgv8+MYNAjJBix1LnbspfTB3xkV
	uj81QkzY9mffcOfpSNNMbVqFYbIuw+O8bjl0kqBt+VCSwutHFWlJZag7WiLFVJyuFsDu59wHOmjpn
	ZwhowPkGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7cGu-00043T-ND; Mon, 17 Aug 2020 10:21:44 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7cGq-00040v-4q; Mon, 17 Aug 2020 10:21:41 +0000
Received: by mail-pl1-x641.google.com with SMTP id y10so5711867plr.11;
 Mon, 17 Aug 2020 03:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PqgAiBpz0/r1imIOkYXww3zZboUZciPETdwlnAwtvjA=;
 b=WjeoSavHT6uSLWChIGkTNCoMIUs+8hkl8JHDzsIqGg+pTXusuhMy9AA/b90hal1M5F
 JUfsppg6SiOXVVWYnYbMHPbXZzCx+jCtiFzA56eG2LeQAD413L2+jL3DIunqxv+dli1D
 pD5VK+Ohqfv6jkASiLqxYjRHFvITs0i68SqDvaXD4QwOIXOjqJufuXc5ZVvy8QM5kRfA
 Fc0GkZ+Y5eHV4A/fxSyNoLGy2/NFA8uYDcXTsLEetvtFJy5D33S3VT2+m/FM21d5JdGR
 rK7Ys5p7JsC/D6OCJ5ePG7/+0kDuflPi7IXiR//w4hq7kB2gcI6xwv//R9cGe1hE0gTK
 nMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PqgAiBpz0/r1imIOkYXww3zZboUZciPETdwlnAwtvjA=;
 b=EWdCdDYABKBnXEKrbyqtSHy00FY5+KfTPv/GMVjtLFGcOnQj+X1GS5vF8wBY47qQL/
 lT6n5cbksBTnhfnRgM6/ct6hqWeNSxWZajEvsrPdKGqSbgqXRnNfRMm1MI0OK7AeWy0b
 ugZy+cosoOAbhJKBGkRhaxLZSf38sZaMuSHUBjQvPwM3W8sxf4SvQyvSNbS0W3ZzBGom
 7HoIt8sOaJqUu7WKsFq+79EYf3pHRZ1qYAC4fLM69U3hiIYuuG2W6e+tM+AN4P7WSJFs
 3dEZHqPKirH7+8lAYU1qvYCjpi54hYFs5NuxzYrc6b3ETnkhadfTxddbELK0VG7Y8Nqa
 5fmw==
X-Gm-Message-State: AOAM532XH2HF2VtEJ6O3TjKaz0F3E+UbLFgXv9RFK37mNpKxqjfPzUYM
 s15MbRaRQ6iM1q4w/O4M/Ik=
X-Google-Smtp-Source: ABdhPJyHHCKwKILAFcZptdC7vrGUvOexdN39jqq94DRbxWOmVymwbOtj57loG47MV4fNaRFz2PbNZw==
X-Received: by 2002:a17:90b:4385:: with SMTP id
 in5mr11377861pjb.16.1597659698051; 
 Mon, 17 Aug 2020 03:21:38 -0700 (PDT)
Received: from localhost.localdomain ([45.114.62.137])
 by smtp.gmail.com with ESMTPSA id l67sm16773206pga.41.2020.08.17.03.21.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 03:21:37 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/3] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
Date: Mon, 17 Aug 2020 10:21:20 +0000
Message-Id: <20200817102122.434-2-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817102122.434-1-linux.amoon@gmail.com>
References: <20200817102122.434-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_062140_199576_37624EE2 
X-CRM114-Status: GOOD (  13.20  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable RTC PCF8563 node on Odroid-N2 SBC, In order
to support the RTC wakealarm feature for suspend and resume.

Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
changes v2
--Fix the missing INT (GPIOA.BIT7) pinctrl.
--Fix the missing rtcwakeup.
--Drop the clock not required clock property by the PCF8563 driver.
---
 .../arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 34fffa6d859d..f08ae1b337ad 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -477,6 +477,19 @@ hdmi_tx_tmds_out: endpoint {
 	};
 };
 
+&i2c3 {
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-1 = <&tdm_c_din3_a_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc: rtc@51 {
+		reg = <0x51>;
+		compatible = "nxp,pcf8563";
+		wakeup-source;
+	};
+};
+
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
-- 
2.28.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
