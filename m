Return-Path: <SRS0=5e44=GO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3861C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 13:58:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B39122472
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Jan 2021 13:58:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B39122472
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fvfd/Ez190YuIjuokD+silowvgeaKLUjis48UHDcWbc=; b=AjmaRTcYMe3nucTU8JGZakh+V/
	gjJ0Idsu5NzUDhS1aqNH+SkkJiasZK/kANR6GL1NPS76CF/CL+2ArIMQ3ZRYvSYmujYtTWhrmWtLT
	BMlh2t0f3Ba3j3/ObsRFvdvjFuHO2qtdXwhwDHQbiSUsuu4zYburcfwNJSQtH+Wuxb55C7IE97CQj
	mVAcoMX3pztm2Fk8UYxyfg8EPk032L/HTNQgC4+QLD7KqTvkTygiiGkjDiCTVfXYgLuNTbFa8KXl/
	dRIbHEwPNcqO5H8yPN01Rugp8iB6LMywIC4sWKY5bAPNsfEq9a0GJxWJXPXcVJs6xumhjkJsIX6eq
	S6V2cb+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyxiW-0005Nz-9U; Mon, 11 Jan 2021 13:58:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyxiR-0005MJ-K0; Mon, 11 Jan 2021 13:58:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id t30so16556417wrb.0;
 Mon, 11 Jan 2021 05:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Y+oG+xNm9xP+x0Bd2rZ9vn+P0+PwuwT6nvWBSD6Nz98=;
 b=ej1ljIbtahWMaGXTQNV9pI+UlDz+JM+ZZrdSUlnKqTdv7A15XmfHu75mqT/bnbCBxm
 mv3MSo78U0qjwGkbEqyVzv11PXj+p5h4fN6MCY0649LWbj8b0rjKf4lM+uWj5gJQPJPr
 6UsaWjAUNa5iz+yByAoCG3T8JKVu+C78QnGrjV2y/cjFx1AomkF9b/+P2g1DWbwlSbvR
 LgLl7EuO5nXnhzL+bO/CAvFEUBz4yJ8ucl3q7r6+NrHiHsGfJxlXKhuVryc71Z1qY9Oh
 9tftHFp4sgdIzf3ePzxShqkcoJsQgautCst1j1EZaidgxOWhQNUhye9y4uhFVewf97dQ
 dckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Y+oG+xNm9xP+x0Bd2rZ9vn+P0+PwuwT6nvWBSD6Nz98=;
 b=JWxthJro8MNJBmIdyG7d4XtgFmh+nahoM/lxqOATAAMKIEhGNYuE8edQ34+QSoKocd
 c3mkh+GFFkQUunlLd7nPCNgolstZGwwqx3Jyg+cG1pmia+4QLgc16dHTR3rxHLJg0j/j
 OU5EY/sMNSLSy0lI9olqt1gVVDw3OAqOBjE+opWB5cQcoh8bt0oMrsAXtNTkW+IIgJY1
 SOpiegMfynSvxVzdowHQ+ewKrkyRnX4p3ASJ3Y91IiBiRU03XR8JlRDij9RvGcPW6osK
 LnbHat6xwPVWVutWVPNKxntCNj2hqO5LxjCDRQ6cp+U37ZHGgVmbBa2ovmrLo+ioM03a
 orhQ==
X-Gm-Message-State: AOAM532Ix/RZnhRkSfxh/+kJwvOOLJXwYR2Aa0Cd8ypGgUKCClY9os+V
 fGOfR4gnEGE2UGCMHn6Kw9mOZfebCQaixA==
X-Google-Smtp-Source: ABdhPJw4USDQqdK6oVUdyEsVMIb9mDKFEOAu1DET+S/0kX+94PlJZ/YAMZjwVEuDbBRCLbuiUUZR3A==
X-Received: by 2002:a5d:43ce:: with SMTP id v14mr16366742wrr.342.1610373516733; 
 Mon, 11 Jan 2021 05:58:36 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id u66sm22543950wmg.30.2021.01.11.05.58.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 05:58:36 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add i2c3/rtc nodes and rtc aliases to
 ODROID-N2 dtsi
Date: Mon, 11 Jan 2021 13:58:31 +0000
Message-Id: <20210111135831.2218-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_085839_738264_9F02B087 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the onboard pcf8563 rtc hardware on ODROID N2/N2+ boards via the
common dtsi. Also add aliases to ensure vrtc does not claim /dev/rtc0.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 39a09661c5f6..b78be3e6974d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -13,6 +13,8 @@
 	aliases {
 		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		rtc0 = &rtc;
+		rtc1 = &vrtc;
 	};
 
 	dioo2133: audio-amplifier-0 {
@@ -478,6 +480,18 @@
 	linux,rc-map-name = "rc-odroid";
 };
 
+&i2c3 {
+	status = "okay";
+	pinctrl-0 = <&i2c3_sda_a_pins>, <&i2c3_sck_a_pins>;
+	pinctrl-names = "default";
+
+	rtc: rtc@51 {
+		compatible = "nxp,pcf8563";
+		reg = <0x51>;
+		wakeup-source;
+	};
+};
+
 &pwm_ab {
 	pinctrl-0 = <&pwm_a_e_pins>;
 	pinctrl-names = "default";
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
