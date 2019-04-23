Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27FE3C282DD
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 13:37:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8929214AE
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 13:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tDpJBVV/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="bRcvWgBp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8929214AE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uNkskdqZ+4M0QId8Z89zymglnJr3AP3RQSqGt3XBQmo=; b=tDpJBVV/dGeJPc
	sScG9c21l8s4Q++Zg+yrywhcAPlWbe4YcZsIbCXaJbzUBRS992p+HkM0kgr2tY5/pMtvOMBMLiMWG
	NmH93GeMjsKbX2B2X8dEey5cDX3pVNrMozJpSxAVQcmBzBjALJ0tEez0jWQttqSOmIZ73m47R//pQ
	8ZqhHeIfk8XH/JmQFXhpN+FpIhpV1pSdQESVQQaqGJjXGzG7mbjvwQlMM2OeMduGfjzir6fs6ghYm
	uQLIN0miC1dXzMbxOsPBKl7R4l3q0at+/6lDG6WPRMS9D5Iv9nGXpUA2SvghOYoOCdaaO89QctL+5
	gcBdk6XSk8DNdjsGU9nQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIvbb-0004gW-KI; Tue, 23 Apr 2019 13:37:03 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIvbR-0004Um-5X
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 13:36:54 +0000
Received: by mail-wm1-x344.google.com with SMTP id y197so121736wmd.0
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 06:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4u08udtdpGGPguEldhC30tabgRiyMWYpo/ojtODeRdg=;
 b=bRcvWgBpOj0RWdeX94IxO4UTI/+Ra3Sb+cXVTRx41P16iSB/IMw+b7XDIE07xPSF/w
 VWR9bFOxCLJ9yGYSOw4hqx5sRto7ofp+7SJWjKBOwykGq8Kjnym5cItMIvRZb6UHXBhe
 Wq6kUfi2a4RQBNP8Q7LgBDM/bnUn7TZhXdEE/YzjQpRkMjEGwLKuhzm9O9pT5pc5wrBf
 p2oWvc9WwVaVEbvE/2QlR9vqRBwi5m2wjBPEBW9pcSmakfSnrLT5b9y0VYJBzupu4Mhu
 pLZTaxWmfa7/jHPhs19z1KFmK1DO0TrwUEulKvAoPAx1P4nEwMzwcu4F1oNLvf7FcJrC
 5gLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4u08udtdpGGPguEldhC30tabgRiyMWYpo/ojtODeRdg=;
 b=jYn9Wfs1h7wHttuuRi6id4wMfQEnnd8wR5SkCGe/Ew2tVjKTovYOXK9cU8SQ8sxPpH
 T98kkgS0sHy24JcUpYG7otXB9tT+4jsFH+TONsAWewok3217A2edzeCrj37TnHA4tMPQ
 FEjzhJdysJYmJZyZl6i6D1QQtP6erJk/iC2AN9ua4kAmDY9Ju+YZsB/A+bm+FY0gtgbU
 oBxogClPYYD1QkWoX7fzMoeg8FlJyT6W1E1xq8rdqOz85GkR9qOQUe/TZ2PUIMKFfVb5
 CUfaAMtlsk4DOewy2Fvc9Bw4yLucsFIPmHIwIYnx4R+O473XHrOx5u6yAiq8alH38wpW
 odgA==
X-Gm-Message-State: APjAAAWM0B3OABNYglII5LCqqP9W66+k2A0is1A7oBK2rVCrMlE/34gk
 Esm3GzWDdgtz82AlpkeixsyvUg==
X-Google-Smtp-Source: APXvYqy5PogfeuOQbSn5JeMGn87hNjbwlkH3Q+iOPgz4uXZIcpAZNYHJngaceD0LBFkTCeHS84kFtw==
X-Received: by 2002:a1c:4d02:: with SMTP id o2mr2407969wmh.134.1556026611281; 
 Tue, 23 Apr 2019 06:36:51 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z20sm13509543wmf.34.2019.04.23.06.36.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 06:36:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com
Subject: [PATCH v2 0/3] pwm: Add support for Amlogic Meson G12A
Date: Tue, 23 Apr 2019 15:36:43 +0200
Message-Id: <20190423133646.5705-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_063653_203182_41113D28 
X-CRM114-Status: UNSURE (   7.55  )
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
Cc: linux-pwm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 baylibre-upstreaming@groups.io, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds support for the PWM modules on the Amlogic Meson G12A SoC
family, including bindings changes and DT nodes.

Changes since v1:
- Add two different AO compatible to distinguish the different clock sources

Neil Armstrong (3):
  dt-bindings: pwm: Update bindings for the Meson G12A Family
  pwm: meson: Add clock source configuration for Meson G12A
  arm64: dts: meson-g12a: Add PWM nodes

 .../devicetree/bindings/pwm/pwm-meson.txt     |   3 +
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi   | 179 ++++++++++++++++++
 drivers/pwm/pwm-meson.c                       |  30 +++
 3 files changed, 212 insertions(+)

-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
