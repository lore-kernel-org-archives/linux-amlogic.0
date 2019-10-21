Return-Path: <SRS0=mlCU=YO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F39CA9EB0
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:29:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33DC920882
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Oct 2019 14:29:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LdvtYTmz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DL30plNJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33DC920882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SBuGbpIwdBZSThuWEfN+U45TQRuE3Kcr9NQLiMtZ7vg=; b=LdvtYTmzImXhcP
	2QbX+N4VC5oVSBaNt9PzV3Zl4NkZ/YTPVgw9myPIqyYzpI9D3GY0C0bBV2QukVkoR0kHfXxU633jz
	29L9PKh/DlG3vaUDTTzLo7wyPl+tytg2TTLodZdOFDFxt7QWW2o6UFCdpugwmwTLw+wFDoCq8AzRy
	PYqkPcOHVg97Ky3EBRqfzYGqCqlUymqXrs7VEO6pXg/Q9dl07weNtRMndQ+wtvmMZYqOyi1eYhJUa
	G886JP3FtljiZkpAVkDUEkC0QDzgGANUGZDTTWedF1M7lz6jcgVHTNJwW5bVCt6D89WVwu8t9orWA
	xketcoCpWdQWtoMlBZoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMYgT-0007Dl-Ci; Mon, 21 Oct 2019 14:29:21 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMYgF-0006zt-Qn
 for linux-amlogic@lists.infradead.org; Mon, 21 Oct 2019 14:29:09 +0000
Received: by mail-wm1-x341.google.com with SMTP id 14so6381569wmu.0
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Oct 2019 07:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=++nYVU89w3D5DbGVf7UyY/WEEIeVtVLvhLaDHuQ9xMw=;
 b=DL30plNJoZ8YTRsPpIAOPgjMpjklyJGezkImhXfCfSZos1P4txGs18b3h6ApC7to+W
 BAgzrOE2Ip8/k1EqE1oKz1dp6dEMinAQypFmo6DKIj07DPfZMYwET/zJOQeItodlPbpC
 sRXI+omm3jVR8uL/9vC63hITA5j9cwZwfWtF81jSU1DPe4JRxa+LLquiHLNjDLotatOe
 PjnLksvMZrhcWnWtN3wnhfGRYMDiEZ1nJ7w3UA18WZhDym3PzKO4RmZIo36fy2R+YPxm
 QUjR7T6kE4vUueAXdB7E9pgpcQUf4UoqIHj78X0KZEj7M2WJFD7wyg6Ct+JDLM37Fmfn
 +n0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=++nYVU89w3D5DbGVf7UyY/WEEIeVtVLvhLaDHuQ9xMw=;
 b=BO9jX4k2Na5oHy0NtvrilKeGtnds5twsnostIUuxXxr3bBgTqWm5QcKCDaOhUSs4X+
 41ANh2+X2cBq7h8Ggj/ddzCpYJkoYxpgn5OZwxF+BCcmsA2U2ji/GbUZItF+gVun3GfM
 Jege6w42QLx+I3CosqB1Q/65hdLWIBt6i4K3VJtmJLM0Ug5AVeoewjcEi79KWd9+lPfl
 KHzM/+UOak0s6TaCWZGAUI39+vz+6c1rMxJOep+SRUkcCkZWffPVZUK8sMXR2C0AhaH+
 iL/LrVtxtoGOePe/h2Zq3rbsqmVD+ktRiuWBspizFxm8YZsUodRC5AZQ55KaWK3GmmX1
 74Jg==
X-Gm-Message-State: APjAAAWokcC0WGdyQxyK93zdiOQkPHIC9vnzkmOeTbZUmsPPIH7ykYGU
 C5am6qxxEyKp/irZe0Ckg43uNg==
X-Google-Smtp-Source: APXvYqxGkfu1beg6QQFKdXREUIGmgpSBRX5EoWUQK13HNfHKFmR5o2KsWBUYgn1oNa0KJmVl282MJg==
X-Received: by 2002:a1c:cc18:: with SMTP id h24mr20430362wmb.40.1571668145775; 
 Mon, 21 Oct 2019 07:29:05 -0700 (PDT)
Received: from localhost.localdomain
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d11sm17304463wrf.80.2019.10.21.07.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 07:29:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/5] arm64: dts: meson: new fixes following YAML bindings
 schemas conversion
Date: Mon, 21 Oct 2019 16:28:59 +0200
Message-Id: <20191021142904.12401-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_072907_865477_AAE72662 
X-CRM114-Status: UNSURE (   7.15  )
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

This is the first set of DT fixes following the first YAML bindings conversion
at [1], [2], [3] and [4] and v5.4-rc1 bindings changes.

These are only cosmetic changes, and should not break drivers implementation
following the bindings.

[1] https://patchwork.kernel.org/patch/11202077/
[2] https://patchwork.kernel.org/patch/11202183/
[3] https://patchwork.kernel.org/patch/11202207/
[4] https://patchwork.kernel.org/patch/11202265/

Neil Armstrong (5):
  arm64: dts: meson-g12a: fix gpu irq order
  arm64: dts: meson-gxm: fix gpu irq order
  arm64: dts: meson-g12b-odroid-n2: add missing amlogic,s922x compatible
  arm64: dts: meson-gx: cec node should be disabled by default
  arm64: dts: meson-gx: fix i2c compatible

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 6 +++---
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts | 2 +-
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi            | 9 +++++----
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi           | 6 +++---
 4 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
