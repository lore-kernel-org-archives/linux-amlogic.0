Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E8B9CD98E2
	for <linux-amlogic@archiver.kernel.org>; Wed, 17 Jun 2026 07:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQLzHVpcoL7V9HFT42kY8a3tB3fhJdYoiLJvnxfGqM4=; b=KIzkyWYbAo011B
	oICEmqJx6RzhbhL95lgfQoZJZau/FLt1x1KPLj3uMaZbds3GAXV6IpGbIB5yH2SNdt+qdl5FvWps6
	Poee2drMBZUzAx9N9/shQ951mJ3oXBUXf94HkRQ5zOXOsXdtXmnFtFefPAB5ID/GbyEgED3ax6qyQ
	z41uahG/FN0o5Ac1MlyJKLeOfCEV6LkMjAbxw+5TYho5eHivqbmkf1avOQGUS+hHdq2uks1aOl9lS
	qhCRb1mBsIRwr7wBpd8OFC8w2RB2xC2WiEItaNeo9KYDKjnMGm9azR+ZubYL17k7uad0FkJZfCfmG
	lTS7EnC0l6HBAyTfysAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVx-0000000Gnuj-3B4w;
	Wed, 17 Jun 2026 07:16:45 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZkVv-0000000Gnrp-1022
	for linux-amlogic@lists.infradead.org;
	Wed, 17 Jun 2026 07:16:44 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c85b73ffb52so2417458a12.3
        for <linux-amlogic@lists.infradead.org>; Wed, 17 Jun 2026 00:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781680602; x=1782285402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=lLSaOkbHm82LxDiGSRii2nOprQHwhtd0lhSkGH78ZiQJ+ATy++ehqGKIkgcyKn0Yye
         jcvQ/0EYpi6sOvPaLUK/DUTZh3TSldUejCcPdz/mi1lMzpW0xJeHJ0DmyQJV7tkxgmF9
         wXkKjZsYUaj/aG/Yt6GxnA5+9LTigp8um8Fx+GVKKQ6GkqEd+tbTYa8DBNRFaiCVjw6B
         LRCIbluXz2/auxJfd1oXfkGnmYxxhi+5fb1Ft3jFJihuiWiS8+ulEG+kBCi/En8KMjkH
         hWgyUF1Ga/ZTebCDEPqSJfQAF4XP/ULKD2D4HXhsMX5n+urEUSKpx3SuHH2s+q3BMsjL
         Nn3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781680602; x=1782285402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kGqxYO2Oa1YzQdRB279ndYOf99EMUYTgi9douNfsaII=;
        b=PkObv+4z1pohzgXOjSID49A5r/HpbtqCApndJ56Y4xcuD8I3CdjyTa7K1keRZWKKwu
         unp/evSWsQQ3i9Dw6+owJBIJ9mf2YiElJ/wwqQY5g1WnpnU3go1ZzFBbxWFR8CyKCKUM
         67VB/KucedoIsYx0L4KinpDtAEwnnk67g7mqWmmzTtsisdwelqK9YvQloMmnd3DTpWMo
         NKOFVW7YLiQRlZdCv6iQpfcZaPPHCK90KADvkQuo563mBlYehWJz5IRPA8Eku2XzQAXY
         mPg5OZ0OzYgas2wwywLBaxrQNSCEEaktLwLEABWZ/nb1DmzYdC3JnE//k0QvRQlUs+w1
         FoCQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TXFshvPDaFzzkZtAWntfFI+yHr2Gkwyb6ZCdaU7OQPO47cXv/nx/v471TsOVMEz6TLf1KpQ0O4h3lYqiN@lists.infradead.org
X-Gm-Message-State: AOJu0YwvO2zB7ABBocOJsp0pbfcQ/mtjLwsrmiE+HZ+0Cj/zN7zt1o7q
	fpq1Jbu65GgcH2FrzlVq3sq4TFmNpQDRtimJDEfr7E6lhcY0iM7SXzC4TlcTrdXS
X-Gm-Gg: Acq92OG7LD8UvjBgrUnJcalf6tnUBcRweQiQnx3gL2kKH+oHbB74MV8+ZsK9o2ZPEdR
	19zKjlmP9C7nlICaHVydqj37wMank1ABLfU1eT2jWvvDY4E1YDUZGCI+VSarRPSKxAT1Z7CQEIq
	GiEy4DDcEBTXvFWliNZ905knLaG7BqR2Ga2txMrsIbSynnNG3afoZ+g+DillRUKOHeoNpouhOhG
	cA+k76E2xvCy+cpisHtBJEz9Lljq/vxPnyWt+T3ftUO/M7HCvMb4EuxrXl3gu8gN5S6wiVq7eiZ
	dCicKKMmjX+mX8b94uwepEhPbXXMWzmHEYtOuTFAThEc3wuqy7mhVCipzavoU6y9R24MVEr95GR
	oJNl7e16/zVvcOnVGOaV9+TTjtft0H8sWZxeRS+4XnVo1pW1kmyv5wKCmd2RL4JSzVu9Zfykd71
	8xuGBDv797iA==
X-Received: by 2002:a05:6a20:6a09:b0:39b:d937:8020 with SMTP id adf61e73a8af0-3b8b80f27d5mr2810990637.42.1781680602489;
        Wed, 17 Jun 2026 00:16:42 -0700 (PDT)
Received: from arch.localdomain ([2409:8a28:a52:c491::1002])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866519faabsm13653439a12.24.2026.06.17.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 00:16:42 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: amlogic: meson-axg-s400: Enable pcie_phy
Date: Wed, 17 Jun 2026 15:15:59 +0800
Message-ID: <20260617071604.635627-5-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260617071604.635627-1-jerrysteve1101@gmail.com>
References: <20260617071604.635627-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_001643_276809_ADE92180 
X-CRM114-Status: UNSURE (   8.42  )
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

The meson-axg dtsi now disables pcie_phy by default, so enable it
for the s400 board to support PCIe functionality.

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 285c6ac1dd61..7ba249cc3d56 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -448,6 +448,10 @@ &pcieB {
 	status = "okay";
 };
 
+&pcie_phy {
+	status = "okay";
+};
+
 &pwm_ab {
 	status = "okay";
 	pinctrl-0 = <&pwm_a_x20_pins>;
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
