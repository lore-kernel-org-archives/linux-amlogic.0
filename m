Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44063CA9EAF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:30:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A7172084B
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:30:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZlCpvnc3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1ZyCG1ok"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A7172084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pty8h442rAW7ciHIGItBDaC9sFOxAWscqa4plmp/A4Y=; b=ZlCpvnc3myzLkW
	TJAjv9hVqi9AP0TCnNWbOHhh5Qj52Gi4C/Jm5kfl7l4eWscewMaMX1rikw6nI216Pe6jAGGL9/9L5
	vu4KAtRcPvM6hw66hqmK2FQUP4RFTdZ00bAbaIam9fzaJr6jOgE9KM76XapiN/qY8IuAdBdj8fz5k
	MB80AA29bxwHpJ6JDu2xDZgEWEsdvV9RvhUHy8PxpmOFikho0MmIE6u1NK4fS5j8BjWjMWKFGOYNA
	CLTOfLPXJYyH63eS4LZkNtCN+S2sNRklurw/eQujOalbKvi9kLmMSlPcGYvtKxMwXgFIatPXKDfFs
	m8lIGzbEkjWWv0PbIu3A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMYhn-0001Ci-Dv; Mon, 21 Oct 2019 14:30:43 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYgK-00072b-42
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 14:29:13 +0000
Received: by mail-wm1-x342.google.com with SMTP id q70so6406027wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 07:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o2g5MppcRcxrnsPQBvomKNHr4TeFrtJvAa8pk/mHOiE=;
 b=1ZyCG1okRY4dyPz4T0huoXg+PIbmxW0rg+faaMGWsRd0sSzZKzDh58t2YXt4bPk73g
 JKqfpSJmBJosg7OF3PcUW1Z1Jkqrm2hZvqWkGnQSKUD0Kk05iO/vVLluPyEOsAOF0HYv
 CBoFTTtqRB7ZjeWQ2mxxgUwEEIPICBAJrJHsU8DGtS3ghQnRsiYLmCuQeINF8iP+6J2x
 6vmvv7bmVVvDeJ0Cu167jEcFsha2vBAa2bE5sor+h25iEReQoD/AjkjOzvocnvUVmCiW
 qxT7w9wvcy9RKErNZIP8c8ZibvN5cBbPYTC1gMTApcJrlNlcIX6No/ekpIgxNH7Yxxt/
 tqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o2g5MppcRcxrnsPQBvomKNHr4TeFrtJvAa8pk/mHOiE=;
 b=MLU/VmEVJPDtBYDR3S3zAowQga8qpAg63gEgS6Ubr0Drj6BNSfHqgfR25SVL4l7AQT
 BoOqgRC/hXGfYhjYPTnqSmmAy7ERMUybod1QpXdYkKq++QPnvzUs6edkB2j1smia6gYj
 EjZkgQmvhonuXQSxHVqI3p1YHkq9Yvgi2/5pTBW8HxjWn5lTl5Gl2+1IING4ZCDQ+zbe
 70DRDdZhUpAx4CxAcUko6ePkw2R1fv9Clm77I4cB/COJ2gvU3v1xsCtHsJVgR/c6mcEj
 6glO0W3v7txvgP9TVDtrlxa77L3GTVKoXuUOV57vc3IFP4W+LiZucrLv9IftGQcOPmDq
 pmFA==
X-Gm-Message-State: APjAAAUiVQA1px9zQyxl4iC/ZMoa6GH/ZpAqDRPl9sUnRd0LJ3gb6F3t
 +UDRRxUwnzCwIpQpw0N/pNY5MQ==
X-Google-Smtp-Source: APXvYqxeUGEAtkX1OR8rn7MFQuU+/p8DKQ2ipjOJurJYS3W7VQjwRXnYOLNiAr44/VtEEL+1x+f5rg==
X-Received: by 2002:a7b:ce88:: with SMTP id q8mr18314690wmj.160.1571668150520; 
 Mon, 21 Oct 2019 07:29:10 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d11sm17304463wrf.80.2019.10.21.07.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:29:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 4/5] arm64: dts: meson-gx: cec node should be disabled by
 default
Date: Mon, 21 Oct 2019 16:29:03 +0200
Message-Id: <20191021142904.12401-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191021142904.12401-1-narmstrong@baylibre.com>
References: <20191021142904.12401-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_072912_203921_FCA590C9 
X-CRM114-Status: UNSURE (   9.74  )
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
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This fixes the following DT schemas check errors:
meson-gxl-s905x-hwacom-amazetv.dt.yaml: cec@100: 'hdmi-phandle' is a required property
meson-gxm-rbox-pro.dt.yaml: cec@100: 'hdmi-phandle' is a required property

because CEC is not enabled on these boards.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index 6733050d735f..042132bf5b76 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -391,6 +391,7 @@
 				compatible = "amlogic,meson-gx-ao-cec";
 				reg = <0x0 0x00100 0x0 0x14>;
 				interrupts = <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
 			};
 
 			sec_AO: ao-secure@140 {
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
