Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D35A4C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:03:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CFE220693
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:03:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RBweyMbp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eICupXCS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CFE220693
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CXtqmwfWvJH5gHDa7dAe4kdxHXMUomgCq+mb6NEf0dc=; b=RBweyMbpIXeAH1
	rLWi0+v5cCrbbrnfYcH+djbfqUToiIWY9ijJZIx0jmiY0Nan1l7reSp+dGY37x+CgOsKbypKlrWFN
	amUAJHzFhfrZITFmHmllcSEOIzpd1RY44DE42JbPvZykv1+8GjCECURoRCACPTDUnGFpFO8sV4k7j
	hls8PBsKgbxxcad38jULrr/j9dXurHPqB/tckxeFyiVR3C8Ba4FrOnvPARLD010A7LnudXb/Q4lP3
	EOrYxk9p6Co2n8zvxm+0pgJN5XyfiKbh0Xk7Su1hsmB67HTcZTTdPDOHDLx1RbSY1QEE6kK2vYQHQ
	pIG2hj+Xk+lQ26dLonog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MSP-0000KZ-EC; Mon, 25 Mar 2019 10:03:53 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MSG-0000AL-1f
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:03:45 +0000
Received: by mail-wr1-x443.google.com with SMTP id o1so9308905wrs.13
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BEySt4vCv34IdyGWOMiVdKBVLMjCgxH48wqT3pqewH4=;
 b=eICupXCSEYozREncd20DXAs/NYwW6m9XSCcupAu446YgCAMIltU37EdmAKBlILklyk
 Zm0vv8c+dLvy+89g1hS1DXCjwRfrLTXsdDtWVZ7pqvzAfu9tYcN6jqbq6ckww7JWEcGT
 oDK0ONzwa3pvFWJjT2l7eIc4buYnWWqk63aCp8qh3IBhzmMKM2kOyZ0IAJfZUlWgSyu0
 FfLeAMEKILTKi4b8gSqCloyyFMw31yZV5G4uIkcz7UwsQl9OBgw7xbP+MQg0oFOFN9ky
 BmrdRjAaLUCJM5ijRV5sA3gKNZe+EDW2hD03kcMsKTWg4G+mXIDmjxouLKrdPC4t5Xp0
 nuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BEySt4vCv34IdyGWOMiVdKBVLMjCgxH48wqT3pqewH4=;
 b=NVHr8KjjDLGrte7pmxqqwKA874BmZm3EKDTOQfATlpfw0SsL+LSj+tOEpPaV7qegPK
 HiB0SCqOJH2QSgfF9wR3ve9jtOx2oPszHlVi37SlPM9tPVU7nHFWC1TFe4GbyszY89Fq
 WLnYATv/lsDQluoQDaXsDSn/N73ALFrW80I5yeUYVdnCv+hPpMMKAX5RM5cTK6t6xMl3
 XyBh2jr0qLpU9UAtjlhQeJB1ieDgNU+c4nrDzhZLpxbBxoqn1d4bYKhajn2YMYvTb6Yf
 P4cX/ZUSm8dY8uvz3yyiGl2VFeZnovqzRIqqGoUj14XhLaQRpUByNfGLxaRTrwBta+I1
 6oCg==
X-Gm-Message-State: APjAAAX/WduVo2jEuuvidYTGQZbTJcuBYMMQVIWtcrbSbfF0qDI8CNI3
 TAqUgqcCVCsoKTZ2Qi4q/KbfFQ==
X-Google-Smtp-Source: APXvYqxEwjlaBKKaKcRUvQR9inpAKfsnGGUQe+AippB05cgJ7HhVWMNcaAqvgT2N42V9PI+5r6/i0w==
X-Received: by 2002:adf:b68d:: with SMTP id j13mr10633095wre.50.1553508222174; 
 Mon, 25 Mar 2019 03:03:42 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g12sm11581215wrw.40.2019.03.25.03.03.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:03:41 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 0/3] arm64: dts: g12a: Add peripherals
Date: Mon, 25 Mar 2019 11:03:36 +0100
Message-Id: <20190325100339.749-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_030344_119488_EB92EEAA 
X-CRM114-Status: UNSURE (   7.75  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add following peripherals :
- SAR-ADC
- USB
- Mali GPU

Dependencies :
- ADC

Depends on CLKID_AO_SAR_ADC_SEL, stable clk headers tags will be
available after v5.1-rc4

Bindings has been merged for 5.2-rc1

- USB

USB depends on the CLKID_PCIE_PLL, stable clk headers tags will be
available after v5.1-rc4

USB2 PHY depends on missing Reset bindings, have been applied to
reset/fixes, waiting to be merge into master or immutable branch/tag

Bindings has been Reviewed, waiting to be applied

- Mali

No Clk or Reset dependencies

Mali GPU bindings are still in review.

Changes since v2 :
- dropped applied patches
- collected review tags

Changes since v1 :
- dropped already applied "Add AO Secure node"
- dropped meson-g12a-u200.dts uart_AO change
- fixed includes overall to fix build for each patches
- removed disabled status in dwc2 node
- removed uart_ao_a_c pinctrl
- fixed uart pinctrl node name

Neil Armstrong (3):
  arm64: dts: meson: g12a: Add SAR ADC node
  arm64: dts: meson: g12a: Add G12A USB nodes
  arm64: dts: meson: g12a: Add mali-g31 gpu node

 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 117 ++++++++++++++++++++
 1 file changed, 117 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
