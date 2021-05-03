Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D32C433ED
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:02:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8BD0610A0
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 15:02:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8BD0610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6V6Z4ixRgiDiPJxtmDvDnL2DCsJGPq25DW0CXsOBdiE=; b=P/MxHEblzpMxCFcm5Jveq0MKH
	XnQ6rl1VMk1Ty6gsfgcjXjySemkkuwnBWt4z/TervLoOlCYZMHSELW0gILe2+JkE5q07UXgh687Vz
	2BLqLrubagg7dF42yPw4qo/s5F7lNZwhaNMGibkw7HCG8BIZra63tAGMS6bxKumBIPK30d9Kr8hne
	DuDqEluszOPUeKMzszwXv5hpzKX3REAOhnnVesh5AC0C70OpxEgasuQ8oMwyNycOyFE2IJev7ewqF
	dUOzDy72iDyg8QmubDxiQsOOPf2owqqY9xx5NXob7VmQjUM4HJKa1zJ1jiql5B6aC3WmMo8mSDpC4
	M3TDRY//w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lda60-00EA66-Mc; Mon, 03 May 2021 15:02:52 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda3a-00E9OY-3g; Mon, 03 May 2021 15:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Y8Jx10fBRRAyAXqe89r614y4Nn3d7ekioAosLYfsorI=; b=ideYrJ4L9eaN5/Z9A1FaipH1iv
 SxtyKi1PL60KSc147YE/rzbrL7WouMyqEf8Z6SBRi4mBy4Ws1NGb6CRneWZFQEW/MC2pD0tVMq67G
 rezFW3WSz7v2AxzMdohN1zDHPQ/9iSW5fHOmKSF7s2a2FECFlj4cpchrhanuwkcDOdjNnWC0qCKKW
 NpSrO8SkwCCLeaX3l4qnEYJmNUFmjszmDJHs8fspL2IeO5/HTVfwlR/HPq13OYgmBdDtxtzOi5PS1
 VC+tjw2pXHCdb1ubmW9OHt7jdlbAkuVJuGToDn6UpQQZfGGdlmckV//ALKzZeptQpHVCuwsHYwuNm
 huIGQQdg==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lda3X-0039Oj-KP; Mon, 03 May 2021 15:00:20 +0000
Received: by mail-pf1-x435.google.com with SMTP id p4so4376773pfo.3;
 Mon, 03 May 2021 08:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y8Jx10fBRRAyAXqe89r614y4Nn3d7ekioAosLYfsorI=;
 b=b7hYVY9EtToaTOGKclQPTp+d9zBrF4cdxYNSxyO1kcgFjclhVrmEwUwSmOS3Zx8Bia
 UdA1pqZRGbBoz3v6Lp7KHnK0a9+SCEj/LujSJ2A7p6Y3Rkc4PQqkz8GbMupYTw+z0/Ks
 tu1u5Y24juPE3o8wc/7FAvTqTPKj2VwFO2AGM36lw3en7rwtZKymjZa7APjjwyqtHVYH
 oaD12RLad2AbRYXjU7Dn4fSYDa1oVHTcVwd8IQV9rjquP+Nm/FATub4HqT17YzUz/1Er
 pSIG94uPM5avTvBq/0N/hAUX/WWiH/GZIunka2RP8A3TgkfaWwMYIMEemDesWBfBF1Vx
 9V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y8Jx10fBRRAyAXqe89r614y4Nn3d7ekioAosLYfsorI=;
 b=k9IZHFjkiV0lEGft2SNEy4h8/zLjvXu4RO3pWYJ3/b6kQnje/JTnIODJPXGOqilHMX
 0LM7jgFjpyiW3bkl3Kgq7YdotRtiHKZTTKlB3H7I2mIdYT1zBjA2yAbrJ4DW/sO++xy1
 h/zrNHWDN0DWPeQqTt0Dq3eaRsaVYslsU31bKmsO0zGPzYA5DN2GNFGZd9J2OyrFShZD
 BljqLSH5gqzle3/pcQLjg3BXNKx/RWFcokcSBa1neeOBGMQq7fZiapzJyeBdqy6AT4oB
 IVt+G3+CNwd/28zG3EPqBhRMD4RTh9HX6u5lg+QPMK4I9D8X9wMKy7KxKTH7eBD9JTCr
 T6LA==
X-Gm-Message-State: AOAM532ljlNUHWAuS6S5o1sdaqv730LKBoyfw2Ds7bjvZe7vyLnNpcoU
 VTkPYgjC+GH2+W8OX8P4NIM=
X-Google-Smtp-Source: ABdhPJx3q9BKW8sqHNuANBAOlnyBhQXNL8PyteBe5Hx29D5qoeiRpfob5mXAYIDoxwcbOFXEx0/Zcg==
X-Received: by 2002:a65:52c3:: with SMTP id z3mr18671591pgp.338.1620054018554; 
 Mon, 03 May 2021 08:00:18 -0700 (PDT)
Received: from archl-on2.. ([103.51.75.154])
 by smtp.gmail.com with ESMTPSA id k38sm3593983pgi.73.2021.05.03.08.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 08:00:17 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCHv1 7/9] arm64: dts: amlogic: Add hdmi power domain for sm1 sbc
Date: Mon,  3 May 2021 14:54:40 +0000
Message-Id: <20210503145503.1477-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210503145503.1477-1-linux.amoon@gmail.com>
References: <20210503145503.1477-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_080019_690331_7E5E341F 
X-CRM114-Status: GOOD (  10.86  )
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

Add hdmi power domain id for hdmi on sm1 sbc
to enable hdmi power domain via "pwrc" controller.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi | 1 +
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
index b16a9a2b6cc4..fd8544d0150f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi
@@ -347,6 +347,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_SM1_HDMI_ID>;
 	hdmi-supply = <&vcc_5v>;
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 0ca72b000105..c9fc51d81fca 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -413,6 +413,7 @@ &hdmi_tx {
 	status = "okay";
 	pinctrl-0 = <&hdmitx_hpd_pins>, <&hdmitx_ddc_pins>;
 	pinctrl-names = "default";
+	power-domains = <&pwrc PWRC_SM1_HDMI_ID>;
 };
 
 &hdmi_tx_tmds_port {
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
