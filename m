Return-Path: <SRS0=hCbX=HE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED271C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 17:09:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EDF264E3F
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Feb 2021 17:09:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EDF264E3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9m0lH7D4HvCDEeuAIxLBQE1bF2WNWprl+AFqLnWZTM=; b=3RKzX4feZj+FEnGfHXYeN12pH7
	uk0GTV/7xH9xjZAfAR7UahAINfQW3+ybbFqTJbFJEkaJZN9Hmx9efrkLvTrCVTumIoKaHxTZp8LZq
	nE6eKPm1jQrEQr/x09FynRShJgWEI/izK5RTH8wqk9/tOoeamHOR1bqpf5elLf6NfqeYcUO1LBQMn
	6RSG8inNvLAVYzfBruwP9rWEa4tohtFwqDVQPuQ+rln3y5NVbcTESMvbf/TSlTmvQS+XnIw9GUl8Q
	hw6RDPZ4cVYFBsEEOS/kuH91QQW6K5/4ZM6FfI8BCTDrlUF9Yj0xSEQEDpC3B49LiG/scZxVALX7a
	InDIuhRw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zAv-0002sW-PW; Tue, 02 Feb 2021 17:09:13 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050::465:202])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zAs-0002rg-OV; Tue, 02 Feb 2021 17:09:12 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [80.241.60.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4DVWW861WczQjyS;
 Tue,  2 Feb 2021 18:09:08 +0100 (CET)
Authentication-Results: spamfilter05.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1612285746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=rKefVOHIgH3RRUJVkiub1hkbfVxHTICw9ywDriRKYC4=;
 b=m4TgnXqEhVKkxYVCnKJiQbeHyHxbC7TKoIR7NikZ2heyjnbgJXhfV8HXypN3tY85klZA9m
 bZ2L62mYmV4781k33uVWELdPfYKNbucnvX6enDLDVoQjMHTrrh45d6wC/KGkqJ3Pc7Z2K/
 cPIUL9Ynk1kGmkHt+JAaqUDIXpQL+w2RZbb43Fv+mAKORI4TSugE1tQoRhHIzBas9Tf9Vn
 m5bBJLpCay+suHdsWhHxb31r4VJdouJzdUmr32d13mbCnHkLRfWzpQLKcpgCjAI3DOJ/MW
 tCkqQKCqj76uxBXAofglj9G5m0Q5gv0bE7Ir8t5Qd75AMc1IgceiYYowVHiAgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received; s=mail20150812; t=
 1612285745; bh=aTQLSZ7C/O5xdekCHLTA25N5p4fllJpG7xKztu/Tv9E=; b=W
 yorkOIri6NhxHckdqVr613MUcQ+XlWHNKGR+bfkHkj74uEhzfWdugtM3O1WBws1+
 qk5sA9tQbWrRIKra4+xKbHrEKCWHnWFduZyI9Yb+ijuo7JnFYQc0tz7+wmqgUP2d
 GpKyMAfMdJx4gkHt17Q/inFYhhOyW1qCd7QDabZnOKzlU/XPSx+cFwleZjYwp+l1
 oFAw4mJWM94ZreSit/gW/3TowZg+duOlPfAF7Bn/Joo/3067yGnLvG7a80UmsHvB
 +C8eELHm5pyI6SIRGoA6gdhqxV0ob7WgON5flzWRS4qM06tUZc10Atr7AnYdNp6Y
 bxbwTFOwLl87iIffVbfrw==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp2.mailbox.org ([80.241.60.241])
 by spamfilter05.heinlein-hosting.de (spamfilter05.heinlein-hosting.de
 [80.241.56.123]) (amavisd-new, port 10030)
 with ESMTP id sAlSN3_dNllc; Tue,  2 Feb 2021 18:09:05 +0100 (CET)
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH 1/1] arm64: dts: meson: g12b: odroid-n2: Add I2C RTC device
 node
Date: Tue,  2 Feb 2021 18:08:46 +0100
Message-Id: <20210202170846.81685-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-MBO-SPAM-Probability: ***
X-Rspamd-Score: 3.19 / 15.00 / 15.00
X-Rspamd-Queue-Id: 9C9CF17DE
X-Rspamd-UID: d27b0d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_120910_916340_EC733AB7 
X-CRM114-Status: UNSURE (   9.46  )
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
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This is taken from the downstream kernel and works out of the box.
Similar to other boards, this RTC should be the primary one, rather than
the internal one.

A wakeup alarm by writing to /sys/class/rtc/rtc0/wakealarm works as well.

Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
index 050862cd0996..10edc7ce5e84 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
@@ -13,6 +13,8 @@ / {
 	aliases {
 		serial0 = &uart_AO;
 		ethernet0 = &ethmac;
+		rtc0 = &rtc;
+		rtc1 = &vrtc;
 	};
 
 	dioo2133: audio-amplifier-0 {
@@ -471,6 +473,18 @@ hdmi_tx_tmds_out: endpoint {
 	};
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
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_input_ao_pins>;
-- 
2.30.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
