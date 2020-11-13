Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B79BEC2D0E4
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:06:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78F91207BB
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 00:06:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rjrqsbHe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="m0sxsIVG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78F91207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H7qFwfGUX0+fcYZvYDJR4kSiiuCRz7JO51SlaOtWo9M=; b=rjrqsbHek32ehwsHUJtYkF2d1O
	/FZOcLG3y9Gf+4L5WKzAgSul4O4dTK/RUZEViYXkXtDCJza2N5M/SduZV677QWJxe4ZNAexcjMWrT
	soaCiApezhHGFJUGj9hqX9j8jeiUXYwOW3JB4lWEbGwpHH0sEf3RIqKmPe/t2sa9gjumVIWB/2pWz
	Rv6XRpguq2u70dTyX1zPE6Y+sJ3eEyU0Dcm1KL8OuWhtFkPUqu39Q2/HzEETm/m8v1nUaaSqmdXlJ
	Nsj+eF0vouuwphNr1SWBKtSDwM29feRKUksHEdsC4nT7TJxzZmBxxg5AGyYFWdhWDqNPFMdAWUf4v
	qdTGBMAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdMbH-0000UM-Cw; Fri, 13 Nov 2020 00:05:59 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdMbE-0000Ts-S2
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 00:05:58 +0000
Received: by mail-wr1-x443.google.com with SMTP id c17so7828118wrc.11
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2020 16:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=M/DNdhVAn+pj9y0xoI33n3R+K7GRe7kKavsf/Ah+nsk=;
 b=m0sxsIVG0ByZVmnxTxIO4wIiaZWWiqYENqL3CB0KdB+j6i07uxTXviGjJvMzBwHeTk
 be2JfgfJIsjWv6Sf8F6KATPB5wwYmLWqrw9nHdbZp43P/NAp/5kbiqINpmM3W1SuIINj
 Noa0/opEJVYol7p//o/y8VXhdSS9vKRIy9pI6bI0jL7SLj8ls9b3hgtck4FEcSaLXKfg
 JlS5yg89JjEBKnVOU0ojtvvss9N+42CGN3i4Mg/O45gW0R9sAVCZy2jSR3Imm6lPuHQY
 OqXu+glLJw0TbiR9tKPVEbNBTdsDV+034/11gpT0+WpXn103N1P62oAiXMtvCNTEQhy0
 nF4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=M/DNdhVAn+pj9y0xoI33n3R+K7GRe7kKavsf/Ah+nsk=;
 b=s9v5keS66RJcjWMHz1JPS326kbPddl2FrJo++RRGV20TYBcKSWnPmf31RMwHqeQk2F
 wcxwz4ePRFkl4sL0NG/rrPjXCiVH50XCxmbrX3+u8Yag5KhCUuQChxTHud+uzVK41hON
 XtE1zTTAyrJRcTH8S26W8m+rY/+atiN8scK3nm1pvVdW8XBeUIqCZjOnmliNr2cJOlSZ
 eqB1TCFqnweMwMnVtvoGBLxFmMlGRxJbZ11doX6uCdjpQpO/UucJr1sXsx9dg73UCaQM
 uAHtNXrNRMdxVRTjs2oYhe8aLNoZcBRHi5vdj65Yo4KTJeNdt5LM8VOgw5wLVwyQ9fLQ
 JpSQ==
X-Gm-Message-State: AOAM532rzTFjCZNEYG5ZSzSjI6oRtYC7dO/4HbMcva3Uhkb79y4FaAV+
 UmmSQAxCs279IyshhbalzAdWLg==
X-Google-Smtp-Source: ABdhPJyOfMhgxUx1TQm9cSxUD6UDuhp2p0OWAe5n5ufvbYsNNIbvJu1hetzgvu2L4r0uzBW0o4MSgQ==
X-Received: by 2002:a5d:4e07:: with SMTP id p7mr2397929wrt.63.1605225955746;
 Thu, 12 Nov 2020 16:05:55 -0800 (PST)
Received: from localhost.localdomain ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
 by smtp.googlemail.com with ESMTPSA id t11sm2010114wrm.8.2020.11.12.16.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 16:05:54 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/3] usb: meson: fix shared reset control use
Date: Fri, 13 Nov 2020 01:05:05 +0100
Message-Id: <20201113000508.14702-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_190557_062717_5040FF46 
X-CRM114-Status: GOOD (  12.37  )
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
Cc: Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
MIME-Version: 1.0
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

Important:
Please DO NOT merge before this patch [0] is merged, it adds 
reset_control_rearm() call to the reset framework API.

[0] https://lore.kernel.org/lkml/20201112230043.28987-1-aouledameur@baylib
re.com/

Amjad Ouled-Ameur (3):
  phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
  usb: dwc3: meson-g12a: fix shared reset control use
  phy: amlogic: meson8b-usb2: fix shared reset control use

 drivers/phy/amlogic/phy-meson-gxl-usb2.c |  5 ++++-
 drivers/phy/amlogic/phy-meson8b-usb2.c   |  4 ++++
 drivers/usb/dwc3/dwc3-meson-g12a.c       | 19 +++++++++++++------
 3 files changed, 21 insertions(+), 7 deletions(-)

-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
