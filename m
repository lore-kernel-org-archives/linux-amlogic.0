Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3515BC04EB9
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 15:52:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FC1920850
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 15:52:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nz8yXhzx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="d9o4snlR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YPwqQwie1GZweC8Oj5qQIV+NNOj2qqiBPWllzi/ha7k=; b=Nz8yXhzxKXwWnG
	+xwX+fFQWcsSpC9ozlAqk+yW5kkJlF9I0nErVY/aARTQaJkLciAqcGl5kml5VKTW5FJIEuVfwK9j1
	Q0rMQSInNhsPQCVpqH3cYdASoCoZ2snCM+Jeeusq/56uF/MWFfVl/6c5gKVfToaNtwmILQEj8xdHF
	MMuDYM8xPumP88Tw9/MYbEiQSW2lPJMGKCKpfr4cC/DDbnNXDYKbYCJ9d1LCYz90p5IiCS+bkhHf3
	Wo/W0+ZS0O9Yp44ilKxypLLfP9SV7k8LCsSRix1GmfeB9IcmKX/7vw3cJ4aqMq9ZFlIkfByhkRp9n
	aceZcrH0FViWesl5iOHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUZTW-0007i7-80; Wed, 05 Dec 2018 15:52:34 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUZTK-0007Xq-Ju
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 15:52:24 +0000
Received: by mail-wr1-x444.google.com with SMTP id u3so20192393wrs.3
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Dec 2018 07:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NPPfILoIFLKE7CBqXxkvn0Ogwxu3zT6g0QVqfWBCWbg=;
 b=d9o4snlRCVdxGIqNZrjHZnYmS8JjPoF5c9BE3fu402CAq/zoGotTblGUI3shHkALRL
 R/WqK+kzy6InmCSCTttJOT44hDbTJqlO9tNXcbmsriWx60ru0SeL0w0np47vZWZIuJmY
 clWpPB0c3N88fWm7sPb5sSkJt24oj4OF6R4gCM795x4C41i2mK38jYCmcK4TlYpA/Bmy
 Z2Dh6R2ykWMqWq10RupaujH8FBeiHwYO2YgTm2k8R8QWfYrUeN3980h0MQlhjudSBUPk
 q5cBz0efDjLJHVHX+2F4hGBWY111XMLqiUN8dCRslsR+4ufx8gzFOBuSxnnG6OBuo7Vq
 Ipww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NPPfILoIFLKE7CBqXxkvn0Ogwxu3zT6g0QVqfWBCWbg=;
 b=deh0e/ZtgyTsuXdzTg8oxUbXEYNiSwXRfv28p6yzqV2h7mVK0dFyV8toPdjr6mLOf9
 I1smlZhmB3sL3lvDxAMMEVDsxg7Y9cif5Bfw1Y8uJPjPP3+i9OqV7uunwrNYREtlmFTc
 FuhsqzJMO20gkJ+TGy8zQi83pkH/A/VUUihTxYGbKQct31unpdPhqgSp+xky4dMsRsoQ
 7xDnxrnV95wIAoVv5asWCkisBq0UYF8RptsVyP0ya4K1T01/3wszbl+uauiBxi3JzpU0
 JIDONOvmY8B1K3nDGn+TL94FwlyfQ3dstW/YKYXkvfyPVmN5rO+bkzVHkWWeuuflqr8z
 WNXg==
X-Gm-Message-State: AA+aEWaeudLAgex5qpMmUK3xL5Uij0x8pjlrFlyyT7GfVDyiic4AKnME
 cVDaMFibXT5AzV9I93Qs++MpAw==
X-Google-Smtp-Source: AFSGD/UH1O9NI33z49IodR57efpZAwkDq+v7iIVwMBLxOmOeZvjL04cyVcqbtUrWA9jheqPZdTUZjg==
X-Received: by 2002:a5d:61c4:: with SMTP id q4mr21248739wrv.308.1544025130359; 
 Wed, 05 Dec 2018 07:52:10 -0800 (PST)
Received: from xps.expressvpn ([2a00:23c4:f7a1:ce00:88c3:9e55:d084:7f7c])
 by smtp.gmail.com with ESMTPSA id l197sm12587759wma.44.2018.12.05.07.52.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Dec 2018 07:52:09 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
To: robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Subject: [PATCH] arm64: dts: meson-axg: s400: Enable PHY interrupt
Date: Wed,  5 Dec 2018 15:52:07 +0000
Message-Id: <20181205155207.25568-1-ccaione@baylibre.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_075222_798808_835AD57F 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: Carlo Caione <ccaione@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Now that the GPIO controller has been enabled also on AXG we can hook up
the GPIO interrupt for the PHY.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---

This depends on https://patchwork.kernel.org/patch/10707741/

---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index 18778ada7bd3..e7efb5a76f04 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -357,6 +357,8 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
+			interrupt-parent = <&gpio_intc>;
+			interrupts = <98 IRQ_TYPE_LEVEL_LOW>;
 			eee-broken-1000t;
 		};
 	};
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
