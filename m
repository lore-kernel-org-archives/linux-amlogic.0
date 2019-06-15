Return-Path: <SRS0=3Avb=UO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19187C31E47
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:44:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF49520861
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jun 2019 10:44:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IntSaPvF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="R0yBQos5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF49520861
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06FuSpVe7ANP8gD4dMBGUtPkfCB1dSpeMnJlcetUU8g=; b=IntSaPvFKTbPaN
	jRl9UQKfgXAaXKB74g2VSaWlG13WfFzGdmEmAYsQ8GNdsTbM0tXFsq2e8QHToEKraK4REccsPOg1P
	3cKjX9vuNdcZ0/scuWBkBPI4hPtMk91QgkRfLPkvSA7PFSG461AVjSpRfwBm95mTfUKkk0qkvcEbp
	FawV7MT0RJ+F+vmtJZxn9ser8eKdh+zFZCsbZC6A5+BGL8IXSw0L1n/nmUPQQbHue5gj/gp1BD4h2
	kOMfxalxWpBEEHGh67BqyQ2oTgisabNdO1DzGKyYxuP15b9lQHvjaByIDgn53kRug4YX1sL8OkDOU
	3r1RCzAVD6P40oIxhDJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hc6AV-00036H-30; Sat, 15 Jun 2019 10:44:19 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hc6AH-0002rl-Dp; Sat, 15 Jun 2019 10:44:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id x17so5007128wrl.9;
 Sat, 15 Jun 2019 03:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6zdNw3j26hIKq9Pkw7umZ9fm4rrocSNYRpSOLSmy3DE=;
 b=R0yBQos50xrtqq39b46j5ApodBRZ1gOp0Na7tJgbgmkwJUPpA/J2uXAOXt0TRyVxPd
 Xa9ZjBRz5vYE5JbPzrAY4P+zr1US9qbBCKPsC+8hWiHsTz+RIKKhW8JsI22KF8Lgm1xK
 A+Z8fcPsVWRq9/rp6nh64m+N9KmAWLVDLrSfTh84k2MqAe1vllIKrQMVF9cXaYsxDEXc
 jtd//zYqRKREXCa3jzGFK2LZzufmOE9xq8NSU9SXiBO8fpEkjMbtTfw9l4GwHQKdsq0t
 q8D4WZNMtc/kgZmcXMBkWCLcfv4cngx7UVh8MoNsh2uqNBH8QTsejWy2qeT+K1D+yP+v
 P0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6zdNw3j26hIKq9Pkw7umZ9fm4rrocSNYRpSOLSmy3DE=;
 b=lxAGC15qHYjJrakwjftXzWpf1n0xaqA2RxRCVzIDLYpQ2kEueoGLvxGEFnMCumh3MN
 3WKd/o0O1dt4MbBi2UWq/gk01W18c5cIen1NPbXOwwzt9Fc29F5MhOtiMlcNp7KDeYqc
 eV1z2i/C0m26+HdP+VS7Wm/6GNEMXEY1PWUtCX2bUkdd9p8+Kq71e3tnT9bbYwYNrjwf
 0sciHBeWhLanGmRqzLyaLf+YfEIBJpSe7NxJn59GwoGY8+SpEki/lJUQ+KTuwYJuOmi9
 fz3HRETSp9R5eP8fO+y1iJhdEt6RoHmBV8E/0tCX+pjuCUrgn+1PecwxGQrM+hJVSAr7
 ztuQ==
X-Gm-Message-State: APjAAAVZG/8fR8sOaT0miWjtG+zX1IHDOlx4UcNDnqTieNA6zQydnmMj
 PrTqQFcZCM/BsrjjLcMVdio7XvaapC4=
X-Google-Smtp-Source: APXvYqx5Cjb4em34zJEgLyQgg3ezxWmywZodf6qeyk0GQ79btKvMPPOP3Lybn8sH7D3sDJWK2rdbfQ==
X-Received: by 2002:adf:e2cb:: with SMTP id d11mr59054829wrj.66.1560595443825; 
 Sat, 15 Jun 2019 03:44:03 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C20E00A9A405DFDBBC0790.dip0.t-ipconnect.de.
 [2003:f1:33c2:e00:a9a4:5df:dbbc:790])
 by smtp.googlemail.com with ESMTPSA id l12sm16761120wrb.81.2019.06.15.03.44.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 15 Jun 2019 03:44:03 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH v2 1/2] arm64: dts: meson: g12b: odroid-n2: add the Ethernet
 PHY interrupt line
Date: Sat, 15 Jun 2019 12:43:50 +0200
Message-Id: <20190615104351.6844-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190615104351.6844-1-martin.blumenstingl@googlemail.com>
References: <20190615104351.6844-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190615_034405_459186_85C9E9CD 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The interrupt line of the RTL8211F PHY is routed to the GPIOZ_14 pad.
Describe this in the device tree so the PHY framework doesn't have to
poll the PHY status.

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index 82b42c073c5e..81780ffcc7f0 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -254,6 +254,10 @@
 		reset-assert-us = <10000>;
 		reset-deassert-us = <30000>;
 		reset-gpios = <&gpio GPIOZ_15 (GPIO_ACTIVE_LOW | GPIO_OPEN_DRAIN)>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* MAC_INTR on GPIOZ_14 */
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 	};
 };
 
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
