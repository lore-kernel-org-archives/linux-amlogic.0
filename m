Return-Path: <SRS0=UZyj=2C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66249C2D0C9
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC892054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Dec 2019 14:59:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="flzT4SBa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="BAjhFYlB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC892054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xbp0OWzgK/nTEjGrTht96r8sumwNTKS9lkpG7XoKshY=; b=flzT4SBa+bGjG84CWENBDcPHoY
	JrScU/NvGQIEY8l09A8xdcWF8Rm0aH/ZSY/Ueai2GCCjMpPJprsH+pJiEnKEq93nz54oFFg+egnkq
	zE3jpC04r99mdZrmMUxKfdvoZJr8zxeru/m4FrhQ61Y4bZ1E0T1vUCeZCbob2eCE7Nvhx7gfGBlw1
	U3XIqtlhexz/qeUB2WmgwodYmMlTdD36FvYrecXHvtvRA2h5dqRCDpGpdL/PI0jCqiOWo3IWXPpgb
	+YAGT/kTMbmoAFcwH4E18a+SCR93Y2Fr1scHKllynkkZW+wmdoah0AZ2/rqoELO54JO3OivTHWbG9
	iKj4YDDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifPwL-0006Gb-8M; Thu, 12 Dec 2019 14:59:41 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifPwA-00065I-8v
 for linux-amlogic@lists.infradead.org; Thu, 12 Dec 2019 14:59:31 +0000
Received: by mail-wm1-x341.google.com with SMTP id d139so3815808wmd.0
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Dec 2019 06:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=38rJqXHZjcXBB4mvoplhT0cjvb8m/n1ml03uGyFv6p8=;
 b=BAjhFYlBWOTrrPM/C9ckV2izA+EnfWmSdK6mkCEW2UgO0HYqc9UsNUNvlR9dMjSz3d
 JN/hsxtteUqQnVmCQTq47mq1PGsivh5lrl/L9IxXalWCBN+PXyN1IRn2UAAiLCZy38Ib
 QM7JI6e1KmIZiTlPr1iQ9AwNLxdAhXvlMLoh0s918vX8BQa4T0PQZ5BvkTtSn9nkH7KZ
 Gb1uPRkKtyaYYHcrghm7sgUeBUkwrVRz4szHrNowHW4erZxBSSKN3cj3CG2BHxAXBYBG
 FDEIJd0nCGmfF1olDD6WX+uLg16Yr9YeUh7CT1T7ghUV/2KZC9h1gZ+lgpux9niZU7zw
 /+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=38rJqXHZjcXBB4mvoplhT0cjvb8m/n1ml03uGyFv6p8=;
 b=msEJ7IWJqLNq1kieBFWTY14qvXCfvTCDJ8DYB6nE1jyRXKFaRZawW4EexbMQnm+nML
 oVEv2ryZi8Lr2psEV7C8ABeIsB/Axq4UF49c2x7dX33C4oS6iYkn+Tb2Ehbsht31p74x
 YKXx+XFT7wXsJqG/8Ou+vXNAtSxgwEyX9nv+/d5OcDdMiGGnkaIWl9HQfqavBmKs4444
 eIy3gIEeu2IIEEuAP2xKh8ggZuF2l40CTGpSYx0iQ46Io2n0e/WVNs1ckVwiL+ru+251
 iSi2PMRQRaM1+v8bTW8btnB0imRSqCxycda4ERpAWbYBruvpZXNL/F1D7keN6p3Ojiol
 8AnQ==
X-Gm-Message-State: APjAAAW+QQBxMQKjxSwy030tHRJXK7pJVPKcmJgs9QBOE95VkI9f2Q0C
 8RCo1BN1Rp9MhIQLNS2ClUGncw==
X-Google-Smtp-Source: APXvYqwKa3+rSD2mxWWJuNz1Hup01RbVsGslqsIbH/oJIm8YXhIy9SEHl7lcDD/GNrjJTphnr+Qgdw==
X-Received: by 2002:a7b:c416:: with SMTP id k22mr6750643wmi.10.1576162769121; 
 Thu, 12 Dec 2019 06:59:29 -0800 (PST)
Received: from glaroque-ThinkPad-T480.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h8sm6670292wrx.63.2019.12.12.06.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Dec 2019 06:59:28 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
To: narmstrong@baylibre.com, mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
 khilman@baylibre.com, devicetree@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: meson-g12g12: add syscon phandle in cec node
Date: Thu, 12 Dec 2019 15:59:24 +0100
Message-Id: <20191212145925.32123-3-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191212145925.32123-1-glaroque@baylibre.com>
References: <20191212145925.32123-1-glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_065930_308890_CE31F8A4 
X-CRM114-Status: UNSURE (   8.98  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

add syscon phandle in cec node to activate wakeup support

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 7fabc8d9654a..98c6a1d1d035 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -1899,6 +1899,7 @@
 				interrupts = <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&clkc_AO CLKID_AO_CTS_OSCIN>;
 				clock-names = "oscin";
+				amlogic,ao-sysctrl = <&rti>;
 				status = "disabled";
 			};
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
