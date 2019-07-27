Return-Path: <SRS0=e4TN=VY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26036C76186
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:47:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD3112064A
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:47:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q7/Lpjpt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VLfAIH5S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD3112064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UlviAQCJKL76tZNHkH0uiu58G+H229poMhtW6hHCjoc=; b=Q7/LpjptPo5RGr
	90DAPtgFXtAsPruxEclyoNcGrZZWr+rozk0yoBhFZpV1VxgcRmIVDc+sflcRPDcwg5baeeNLaeNLo
	L9D4x7S5CnrgJrYbywXPcAGrwS9WbckamcCnrjnKZvWLsccRpVg4F+yXvKWe9Dnve4qWKuUUvOJy9
	Xkp1laVfdyJ9/tK7Vvw51qi+C1zrGnrvtEwD3hCyEstRleF0Bq0UwdrDY0qgl2jiSTIwRMZoYZmRT
	rU6LO6V/Rq4y2tZurFa6CV5B5iziOpyeXWrU+DA7U6CEgdjBtxtw4iFVM663636grVgyeCeNa2m/O
	3gELzDcYP2SPBKoznM4Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrSf9-0000TQ-Vp; Sat, 27 Jul 2019 19:47:27 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrSes-0000Dp-Kc; Sat, 27 Jul 2019 19:47:11 +0000
Received: by mail-wm1-x341.google.com with SMTP id v19so50267622wmj.5;
 Sat, 27 Jul 2019 12:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u4zxzrsUGYajoD9B2Tdkb88ZiEEyjMTr1V8RPdE+1UY=;
 b=VLfAIH5SbHDQJcWnj5H522i2JcJ07BE+Zogzg/hd67JVrtQ/SMrYJZcfbNkZ2UQn11
 990VWKwTTuOrjBF318IiUVbLdDT5wu/CkI5NegXtPCqDvW7C5ZZPwIZp3QI7b0cixVNL
 1DJOL0s3HhdLycXuchIAIxwKy9Izek+IjPMrTFqle86YmZuBFaj8QkzS5hMjnUeZRX4x
 Wzupss3SpHykXFCouwWrO6cOydH6MlRZ6HfnuB+FI8xYP/q0yoNexz5Iny0FwGoNXvs9
 JLq5FFJHF0wXXz+QrWFGPfQltGm0HB6Ch7+5CvNbG7OXR+TrctVdnqJuzi226oAfXu/g
 8JDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u4zxzrsUGYajoD9B2Tdkb88ZiEEyjMTr1V8RPdE+1UY=;
 b=OCt72lZ+p8CGQDJ2TQdul1jo5r0s6lNBGZny5pCcCMTu6w0nhuua/LvwUbZWawso1v
 g/bU2IaVj3u9yHqb7c/cPq/kNK+8aoIy8AVpzme+v5uuRQae2XKpdV3OUMRuskBrLuak
 vvrp7qNkpWAlhzEwvfsr7zHE8BE7OAbdI3c443Dby8ztsbCNprI8+JOfTpvYIPOHrhLq
 rLNU349tNpH9mezNlQKVF/bOJH5zb7PfWA078u2aaR+HYZvvqvU1n3m22fkiY4aQmE2X
 e3rsjwIxEm4vOdIJLx9t8LpLIBpJ23G9xqxwW3v/1xMnSw34XwgBIK1syfV0BepO7C7v
 qBjA==
X-Gm-Message-State: APjAAAXTv2mLdbN7EI4hDjyk1kSphwU4vr/JBsLxiv0Mj/xOU/qW4MLw
 Dr7a0rM5da/XfCblGg625ZsOCDBH
X-Google-Smtp-Source: APXvYqykfdQYXHJvMHLdBsllsqHbIXy+FoSsDdN0ix235Vwv3c8pZV4WMrJhL5yfUaEeSHpjmVRfvQ==
X-Received: by 2002:a1c:b706:: with SMTP id h6mr88410051wmf.119.1564256828803; 
 Sat, 27 Jul 2019 12:47:08 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de.
 [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
 by smtp.googlemail.com with ESMTPSA id c4sm44651726wrt.86.2019.07.27.12.47.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 12:47:08 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 1/2] ARM: dts: meson8b: add the nvmem cell with the board's
 MAC address
Date: Sat, 27 Jul 2019 21:46:46 +0200
Message-Id: <20190727194647.15355-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190727194647.15355-1-martin.blumenstingl@googlemail.com>
References: <20190727194647.15355-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_124710_671916_6D951046 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: linux.amoon@gmail.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ottuzzi@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic's BSP kernel defines that all boards with a MAC address stored
in the eFuse have it at offset 0x1b4. It is up to the board to
decide whether to use this MAC address or not:
- Odroid-C1 uses the MAC address from the eFuse
- EC-100 seems to read the MAC address from eMMC

Add the nvmem cell which describes the Ethernet MAC address. Don't
assign it to the Ethernet controller, because depending on the board the
actual MAC address may be read from somewhere else.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8b.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b.dtsi b/arch/arm/boot/dts/meson8b.dtsi
index 30fca9bb4bbe..c7de58b71d08 100644
--- a/arch/arm/boot/dts/meson8b.dtsi
+++ b/arch/arm/boot/dts/meson8b.dtsi
@@ -402,6 +402,10 @@
 	clocks = <&clkc CLKID_EFUSE>;
 	clock-names = "core";
 
+	ethernet_mac_address: mac@1b4 {
+		reg = <0x1b4 0x6>;
+	};
+
 	temperature_calib: calib@1f4 {
 		/* only the upper two bytes are relevant */
 		reg = <0x1f4 0x4>;
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
