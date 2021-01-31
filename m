Return-Path: <SRS0=NBQ5=HC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63E96C433E0
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C0464E24
	for <linux-amlogic@archiver.kernel.org>; Sun, 31 Jan 2021 05:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C0464E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c044tbNyUqopH7ciAsIYOLbfKoXY78VNfoeppe872Hc=; b=hmIz8OhTvPvmg/I1YyaWRubbx0
	cLi76FpnjxKEabCXtA5YoSWnxQwnXo2H/0vBubrHh6w2GKBCf/bj8WyeU5VhhelHG0pMevObgPcOV
	KfCNIJZK01/GTztUzFrj6MsrAGD76W62kT4TX8eF2/yxJGpioQ2HsDHif1QHLtfJJDeGxDCPmq9Tr
	Km2+Do+TvqGb2DZCTrO/YXY4bbmhUQxwcWh/xU/8ZoobbtUbzwslHlNyTnbMKf9ykRqxy9jMvNB9t
	v15zlLG18iykGI1cSPWV8EIFZFHBuS3Bre69CF8G+hy3oaq3w/tAn/bLKh0Qbl41IZXZ1xCdz5VIt
	eCNq045g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l65gl-0006Cn-OC; Sun, 31 Jan 2021 05:54:23 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l65gX-00069q-Cb; Sun, 31 Jan 2021 05:54:10 +0000
Received: by mail-wr1-x435.google.com with SMTP id 6so13009723wri.3;
 Sat, 30 Jan 2021 21:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=HtKg2mQ7AbqX2dbubhJvxGnJfUMSZejUtnrYl0NAkaM=;
 b=tI/DBXXeMpplc+r+lIwAGvfziF/KRBMKJRcJhIebQPezC5U0odeFCCQPSonEHfl7rd
 5Z9iisXH4OxACjDcQRPdaA8Iwd5QoWR6A3Im33OFHnUgdxZnhTCRq8/zI7+UCI21UReP
 3Cp+qSe0QGoHt+1UAKOnax/XVBDMtQNvuyxCJ9HxXxqxjt/IxADnHHkcurI7efLVe8x9
 nFpOPTvtXTOToKGE8utwhAmOi1yL34+DFzUmInGqNvM5NdK0XmpbRG7oQvBqhMws1eHe
 Vl26CldotsI9OsWe1cdHyQBWJH+ejrkh4WB4g5d0PDVFW3bTbz3fd2AFgaL3YGdP9jzo
 x3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=HtKg2mQ7AbqX2dbubhJvxGnJfUMSZejUtnrYl0NAkaM=;
 b=fFlD2D4cxm5GOv66XEYKC6hOj9+4yXbbBuj6MqQslXrLpKaA7PQw/BdstpKywAy8ZD
 tAY3e/RZ/RRs6CxyTGUrthEGvNdy7paf8ZI8pPifZmoP6UnRptwnWNIYIcBXJtAJdDV/
 aslfDftTsw3GmuUOWHDuPnA+5Rnw8mUIk/GOI6SCufP3Js45vg45Gm8RvqyK1eoDiA4G
 skRzJv1EoJJaZ7VOrqpeLH256sA7itw/Xr28NAaDNGb96D3jxV8a2vZFWS4AeKMxC04j
 qgfNu8/EmInnrRhLBiDBimfKMEqInI+7QKQUkLJuJcD8UmU2rIzLOcy4n6YskLB5GnmF
 VWEA==
X-Gm-Message-State: AOAM5326HHnQ1HiM4TgJfhJ5qEHmp683hVbtEbk2h55Wum6n05ttGz8f
 1+uABtrsOwj3wmdbN30SAq4=
X-Google-Smtp-Source: ABdhPJyM0cZqa11Erzs/jcJO7XNCRwpDu8Dn/ScfhBbUjrlcVOrzdf7tI7SaescIXmBF3ZxM7Yn6Eg==
X-Received: by 2002:adf:e384:: with SMTP id e4mr12197899wrm.13.1612072448132; 
 Sat, 30 Jan 2021 21:54:08 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id c9sm20056589wrw.76.2021.01.30.21.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 21:54:07 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: meson: sort Amlogic dtb Makefile
Date: Sun, 31 Jan 2021 05:53:55 +0000
Message-Id: <20210131055358.21293-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210131055358.21293-1-christianshewitt@gmail.com>
References: <20210131055358.21293-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210131_005409_446937_C8AA396D 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: Dongjin Kim <tobetter@gmail.com>,
 Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Sort the Makefile before adding new SM1 devices.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index dce41cd3f347..f3c8a85fe987 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -45,7 +45,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-rbox-pro.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-s912-libretech-pc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
-dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-khadas-vim3l.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-odroid-c4.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-sm1-sei610.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-a1-ad401.dtb
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
