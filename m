Return-Path: <SRS0=kAN4=4H=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 759BEC34050
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:18:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4293F2176D
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Feb 2020 14:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qmEIjC4t";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="U4ucAUEA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4293F2176D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NYB5qBF2Ly3v0/nFDwS7DzBaoP3FVbUFTFCOwlis2SE=; b=qmEIjC4tKFrVZp
	eVAbFSnYKFCIkku0Nz66VFeYXvcDP/ygiNPpsQGHc/zEPSh442B9JWXsN64QPUyTDL0pYELTWFNAo
	WaP8daMd2fyEBngv3+xmX0HgDFxh7OnENrxJYlZTWLIW/qBZf7izs43DTRbKuc+zZArN7bqT2XgUu
	Ukoom91PVWtbS/0+KbAgY487B3npJ9gp0My0DzjWVbFM2c5x7M/r+Z2t1m7KXaaRFu4Xb9DPwsnwl
	txeva4fS1W+3HXjxzOXEQCzLtaMijBq9h1BCG7QQjh9jjr5zIoup7TypHx0iIPYZH36ppUCHjnGm1
	KgtqDK4deoS7c5IC4dfw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4QBP-0001zu-GE; Wed, 19 Feb 2020 14:18:35 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4QBB-0001oD-Op
 for linux-amlogic@lists.infradead.org; Wed, 19 Feb 2020 14:18:23 +0000
Received: by mail-wr1-x444.google.com with SMTP id m16so696513wrx.11
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Feb 2020 06:18:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n73JnDmg0VzOPRicTQwaM/KnoVwGL/4pXuBOrYc7ef4=;
 b=U4ucAUEAepCuTndLcLzujqnjNO5Vw7hsLHtU27Dk3BiCHkZTHeSfe4LRR7YCwX9+Yt
 Q1GvFaJiQsdwMyFrYNSrKr9u7wYs2uLspG1a5fo31YVDsaaTOdff4HDdkNnZ1Rod84LB
 NWvZOTy15qlcYLWMcU0PlihDccGWQQVYlzMbeVaaiYGYrQuK+64m00E0CdG9ZDtNAip8
 xFBBmfhEE32XXk/uctEVJemKHTXIH+BRQmPVWwttpax63y0HMK6D0H2WUooPXyvk88oq
 UGjAYwi2CbuFuQ2B5PZ8m1kCYNtO9glDPcsdGKbyVKN7dsySr1skOJaMpDZ/ZowcxiGc
 uyYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n73JnDmg0VzOPRicTQwaM/KnoVwGL/4pXuBOrYc7ef4=;
 b=SHn81jjW36xEMFUfd00NZ4SJ4UHx2eTCA73/N+41QvYUWE8O0lBS0py7TKZ/GiGADq
 5xYmT0CudcWTVJQDjx2WLczfFugUN2FrBhjPb1Ak6Z7qAD4HU8RPtAk7qt3j8a0I1Ep9
 Zq1OURYiUTTGJsRh9I2nXlg8mPEvvzFPVC7rxK3coBoEWYFdCjHw2z/uCzjA5CrvF5N8
 Bhwv61odCnK7OTgxzs55ZVxVRW5ZMTnGVbOvxY3ohEiAOTOcrWmhNlgp+Ob+l7z2dlHt
 UjXp/a+3MbKO8l0XIfwtuzJDc0bZe6aCVQ6LbOW2+4wkAFtj5xjtoFw3pCHlzeaDhoPv
 n/bQ==
X-Gm-Message-State: APjAAAXhrV464QpBdDbxZ7bRXayzyjYA7mzKAs5D3fX7CFsPXbSrmxKc
 mjXNzn19d/S961kkF4mIBkV5bg==
X-Google-Smtp-Source: APXvYqz4yAg1bD+S0svdzIoD9J0ZoAZj9d9nIR9o555HoYP0tBNnux95dFcBJ/pcGkZq9I0WWoDm0Q==
X-Received: by 2002:a5d:474d:: with SMTP id o13mr35628480wrs.309.1582121900311; 
 Wed, 19 Feb 2020 06:18:20 -0800 (PST)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:510e:e29a:93ab:74c3])
 by smtp.gmail.com with ESMTPSA id b11sm3337772wrx.89.2020.02.19.06.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 06:18:19 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: balbi@kernel.org,
	khilman@baylibre.com
Subject: [PATCH v3 0/3] usb: dwc3: parkmode_disable_ss_quirk on DWC3 controller
Date: Wed, 19 Feb 2020 15:18:14 +0100
Message-Id: <20200219141817.24521-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_061821_808854_C5FB5D9C 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

In certain circumstances, the XHCI SuperSpeed instance in park mode
can fail to recover, thus on Amlogic G12A/G12B/SM1 SoCs when there is high
load on the single XHCI SuperSpeed instance, the controller can crash like:
xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
xhci-hcd xhci-hcd.0.auto: Host halt failed, -110
xhci-hcd xhci-hcd.0.auto: xHCI host controller not responding, assume dead
xhci-hcd xhci-hcd.0.auto: xHCI host not responding to stop endpoint command.
hub 2-1.1:1.0: hub_ext_port_status failed (err = -22)
xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
usb 2-1.1-port1: cannot reset (err = -22)

Setting the PARKMODE_DISABLE_SS bit in the DWC3_USB3_GUCTL1 mitigates
the issue. The bit is described as :
"When this bit is set to '1' all SS bus instances in park mode are disabled"

The bug has been reproduced by Jun Li <lijun.kernel@gmail.com> and confirmed
by Thinh Nguyen <Thinh.Nguyen@synopsys.com> with the explanation:
> The GUCTL1.PARKMODE_DISABLE_SS is only available in dwc_usb3 controller 
> running in host mode. This should not be set for other IPs.
> This can be disabled by default based on IP, but I recommend to have a 
> property to enable this feature for devices that need this.

Changes since v2 at [2]:
- rebased on v5.6-rc2

Changes since v1 at [1]:
- added rob review tag
- added Thinh Nguyen in commit log

[1] https://lore.kernel.org/linux-amlogic/20191014141718.22603-1-narmstrong@baylibre.com
[1] https://lore.kernel.org/linux-amlogic/20200109101535.26812-1-narmstrong@baylibre.com

Neil Armstrong (3):
  doc: dt: bindings: usb: dwc3: Update entries for disabling SS
    instances in park mode
  usb: dwc3: gadget: Add support for disabling SS instances in park mode
  arm64: dts: g12-common: add parkmode_disable_ss_quirk on DWC3
    controller

 Documentation/devicetree/bindings/usb/dwc3.txt    | 2 ++
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 1 +
 drivers/usb/dwc3/core.c                           | 5 +++++
 drivers/usb/dwc3/core.h                           | 4 ++++
 4 files changed, 12 insertions(+)

-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
