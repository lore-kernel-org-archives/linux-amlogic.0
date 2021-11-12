Return-Path: <SRS0=kAbd=P7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047D5C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 16:33:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C86F060524
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Nov 2021 16:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C86F060524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hC2g6BNR0GGSntxsy6qU2PrXzy/5dO8PW+lg2pgGPV4=; b=PpvFQKKgJgAv/K
	zAGPbdJ1SBfpKZnNvKv8X0LUR4mBTEtFeRUNTfPWcPLKwVL1u/ljZnX9GfaRBoljJlWjfTvjtrMl9
	ljeYj2HLE9wVSsZSBEv6HZpgA3Z6xrb18wMdqiF3nSOSWhsih792d0VEiNrRNtaY8ZsxcYIUWCs+z
	LEV/YBNSFzxW3OPFJF9vJBmCBbyY8Kh7ZfnkU+7UXhX+IgbhXY7I3g+t1ZhfoDDRH4/KKyvGJeutC
	wRDCh/XJ1gLYrWDDZUAN2OxZbMf8GSn0S6nZWQ03VGVNHI15G+Pvb1omCqrIhkbJDY2DPUUdSS0jw
	jvHwqmAK4+/JskaR5hYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlZU2-00BEjB-Dq; Fri, 12 Nov 2021 16:32:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlZTx-00BEgi-MJ
 for linux-amlogic@lists.infradead.org; Fri, 12 Nov 2021 16:32:56 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 p3-20020a05600c1d8300b003334fab53afso7418266wms.3
 for <linux-amlogic@lists.infradead.org>; Fri, 12 Nov 2021 08:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DGBR4yhVEVUiH/mTvdt3pOymiiSiQAdDtYWSc9ZGrG0=;
 b=0DcN2fMUFea29aTX3A0c1UOJ28rJ35uyYIEZcr6SwdfWp6ieSpdvTH5CqkprU3lZrY
 eYvdpUrqGzBoBpfEdU/A1ubOApjD/5JKrmkCDcnJwgbwyyb7sy1t16vpec/eFbGSeGir
 jisBenr9phF219QXnHpY0pajSCIs/qmhv8fy8ARxH26LKM6Hdfj5zPy3SFRBix+In7IH
 YUAJHqMeeRV77OEf5fFIjdV7MV51jFaoc0gev6+CmWvl+wrSjaQQJwWue/ImoNlxXKJb
 slsdjzPeIrzjAk4yBd3YQR9dWBAELxyWuhPLDNZNA4Zt6P+sW80EnSDAZfKQ5ZEYIq33
 H+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DGBR4yhVEVUiH/mTvdt3pOymiiSiQAdDtYWSc9ZGrG0=;
 b=prvHqV8XQNjXUWkZwB47jFn5h3bpy4kJG/NUb0+sep7Ye7FpYUtIV1Ase/TgkMsZTE
 rrCchpfE5T75aRbHmURrZB2ta4LqCXuk4Uo6p61hj2akwM0m8m+Dr7tXme2bF+sFNjnC
 H+1l7Oa13RlNA7AdQxFkLPYeAloT93+7XpYaeEKvstAEmgizt+wOau3kFYzxDFvOm1g9
 syk4rmcWdilN9qhY4A98AGenHuf3FNPkm1MPUSkMQ5fzKgnvpVCVcVlrMd4+giO4vJM0
 81ixgbl71EY1PBJHBYvpNfz3jE9iDCxi+IiLMI3JFTtaGKYOXwuXjyLLmTp37yj5wQrF
 ZIgw==
X-Gm-Message-State: AOAM533i+OKj5tZcUIrdAPhTexcvb6ppibkuYod5JY78miFaXSRyAqt/
 ae5YxD4DCOSliyg41kjVpzbxNQ==
X-Google-Smtp-Source: ABdhPJw1tOAOTgPniZes4U598/XcPfLUpeKPB4JjYZscOvDg5o6kWwj4LaxqChWBNH9QiouZWH2+pQ==
X-Received: by 2002:a7b:ce0f:: with SMTP id m15mr17858537wmc.149.1636734770410; 
 Fri, 12 Nov 2021 08:32:50 -0800 (PST)
Received: from amjad.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id h15sm6253796wml.9.2021.11.12.08.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Nov 2021 08:32:49 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: khilman@baylibre.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v3 0/3] usb: meson: fix shared reset control use
Date: Fri, 12 Nov 2021 17:28:24 +0100
Message-Id: <20211112162827.128319-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_083253_807729_944DC255 
X-CRM114-Status: UNSURE (   9.34  )
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

This patchset fixes a usb suspend warning seen on the libretech-cc by
using reset_control_rearm() call of the reset framework API. 
This call allows a reset consummer to release the reset line even when 
just triggered so that it may be triggered again by other reset
consummers.

reset_control_(de)assert() calls are called, in some meson usb drivers, 
on a shared reset line when reset_control_reset has been used. This is not
allowed by the reset framework.

Finally the meson usb drivers are updated to use this new call, which
solves the suspend issue addressed by the previous reverted 
commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared reset control
use").

changes since v2 [0]:
- Rebased on latest master

[0]: https://lore.kernel.org/all/20201201190100.17831-1-aouledameur@baylib
re.com/

Amjad Ouled-Ameur (3):
  phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
  usb: dwc3: meson-g12a: fix shared reset control use
  phy: amlogic: meson8b-usb2: fix shared reset control use

 drivers/phy/amlogic/phy-meson-gxl-usb2.c |  5 ++++-
 drivers/phy/amlogic/phy-meson8b-usb2.c   |  4 ++++
 drivers/usb/dwc3/dwc3-meson-g12a.c       | 17 ++++++++++++-----
 3 files changed, 20 insertions(+), 6 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
