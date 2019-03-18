Return-Path: <SRS0=lgrq=RV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A595AC43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:07:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6647F20693
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2019 10:07:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rDC3WYoC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="J77rpt5L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6647F20693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPK/hSxwu3dDnb1hWjSTytSaUegYVWrhLDlKo3ll4Ao=; b=rDC3WYoCudf8CO
	Wi5+MSPNyI+PFKj85RIM2vgBoP6/1yNiuY1AWpv95HRy5LtduX8cAYs9igoaL96vabyWT9nFY4+9o
	SFYX7vEqlMrE8UWthMINL3w5RtMl2VQrxgk1k0ynBSSukqYC4YxhOPZHKXhvnx+ra5JVAtTg5gY81
	LiJC1AMpsBCWX/+C/SZlaYdXQ6pLWl8+joQH7RmuGDD2HFy32ygr2AQJqjBDCR+aM3aJQLgYuOqVU
	bgSQYta5djzkVSEkfOztW4Agz+CdvVllxh3sJA5g78lwACEzslV5kYxaQwjR3EYb4rjPYvHIQa1FF
	gCxJHNiSoKgh99lsDjog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h5pBF-0003rN-3Y; Mon, 18 Mar 2019 10:07:41 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h5p8p-0000cj-G7
 for linux-amlogic@lists.infradead.org; Mon, 18 Mar 2019 10:05:20 +0000
Received: by mail-wm1-x342.google.com with SMTP id f65so12315023wma.2
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Mar 2019 03:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ifq+TfMjiWMh1JgJ9FAR08E6K1K0cnIdwZQaSTVzWwQ=;
 b=J77rpt5Lv0AXfOES62Ho3p209TyyRxV+gkafmU1NGW/UnQQqqeVB4z+rNhV6k3lMgW
 2WZnc3SRo3lg0CZJasdnGUYtK1xSMRZ92P0fhrCkmOJYKoJtkEPjwa+9Yq9fuVe22bkA
 nvkXKuPu9P/D5NQk23+9JdTp5ZjDg3ah3DLAwzd9kBX/Hp1kQdUaTAJqsCUoSE/KOwx5
 224ULKAZLZzJDxQPy/u6eSsvpikBma143Uo7wXrfhVQetZrA4m/4NkGK5hiEdQcgBmtA
 mjlXUiKfj9zz2Wm7rnRMPs/4uP7y1GhGBxemQ/bjD8ivlD0IwEValIucAVuAGfmGYI9S
 1Jug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ifq+TfMjiWMh1JgJ9FAR08E6K1K0cnIdwZQaSTVzWwQ=;
 b=BvKQvqbyTa3ZC/DkcWS680klbat5L3kVAGo0N1hTDR+ojWoOF7x6MtL2I2FXVO0Ik3
 DPRgGyWUhxC7a/NPiPdt5+QPKk2EtbYzTkURrp1Wpy3T5LSiZZM70nTaliR5Co8mTlTX
 9GjoUrIGauOeeef68aA+Cb6BgIj+zED78a13+Y32gnC12p6UKWA0+whY1c6XrrMHcjlp
 tovnut8Z4ICqpjsvd+hDFLzyPre+eXmFG02kduWyKWyJmc6gfFRAe2qUl7FdY8VtWel0
 m41BZa3aEd2aveips16W/yp4MGXvrgjoVxh+TkFjXXe+/PAt3Fs2RDeKxfdI2VXEZOBE
 Qgjg==
X-Gm-Message-State: APjAAAVk0fBZhv5Lj8l2amyIejpTssaGWnW64Qhh+3nGcR6Gww8pPIWA
 gwdNFci43xdZPQXZCM2NGR6lSA==
X-Google-Smtp-Source: APXvYqwHI9b9sBqu1dHQaoafeF4RhB2DGqUaITfFZJxgctzs3P+R5vzssllsQ4aVSZLCwtOoy5V7Rw==
X-Received: by 2002:a1c:5f06:: with SMTP id t6mr6724566wmb.7.1552903510009;
 Mon, 18 Mar 2019 03:05:10 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id i11sm5216800wrp.40.2019.03.18.03.05.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 18 Mar 2019 03:05:09 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v2 10/11] arm64: dts: meson-g12a-u200: Enable USB
Date: Mon, 18 Mar 2019 11:04:57 +0100
Message-Id: <20190318100458.5619-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190318100458.5619-1-narmstrong@baylibre.com>
References: <20190318100458.5619-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190318_030512_182291_E8F00EBE 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the USB2 OTG and USB3 Host ports on the S905D2 Reference Design.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index c69328d16333..2240e365af27 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -108,3 +108,15 @@
 	pinctrl-names = "default";
 };
 
+&usb {
+	status = "okay";
+	vbus-supply = <&usb_pwr_en>;
+};
+
+&usb2_phy0 {
+	phy-supply = <&vcc_5v>;
+};
+
+&usb2_phy1 {
+	phy-supply = <&vcc_5v>;
+};
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
