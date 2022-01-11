Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9100BC433FE
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Jan 2022 09:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aNBGUAwVrgVW63dn/lzuhUJKiFy/eXzxm3evtUhOx+0=; b=ana7VO+hYWVV+2
	rMf/1sLm+AtxkqU5pGZUHDbNWBLv9BvOkLp3UyvPD5GhP0NopgtEUd8yHhbwkAGRqoQEbUziLNMzV
	6mxpyopOSXfxFdPy7Wq4gQfdM03xZ5KsmFXaSMQvdK10NMtN7+QaqCwSlTFY9OLs9TD+Kg6Bm1QR0
	cIH5aQJctpfXIMLZg6uc8YZu6BVlC9AZnHzvofkkuU9V/6s9hr4nL0rnK5Y6i4VmIVAbrsZJLEsGW
	SW29SkDOoywLSE0Mpr03xr1MPxOb7oge6bZW/H0oi8uZHHGEg59htJbtVgf+U3xMZRFgShWSnQIYy
	KPRee5XE2ZB5EKkmPxCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7DqD-00FfVT-0E; Tue, 11 Jan 2022 09:53:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Dq9-00FfSR-8h
 for linux-amlogic@lists.infradead.org; Tue, 11 Jan 2022 09:53:19 +0000
Received: by mail-wr1-x42f.google.com with SMTP id d19so1336768wrb.0
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jan 2022 01:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hG9rUK4IkVrQ+8ACrhWPxZRakkSjKpRWQoFCkTNn/X8=;
 b=DFFuwIP1QgjMS3n63C11s7si82MBSKADwXDsS6TttMcsW/l7YvB4ym40GSsD2V+znz
 ABi6b5LyWhV0M7JYJCuGU2JJCu6YMwDcP6pDnCAGx17QJxSXaptukJviXcrBGtLVx/xT
 A78CeKN/nP9s3tRxbekgxmuNFJ0BrhKuTEYNYB8UjRPlSz4xw/zhvPqOZoD7ntmFSF45
 Y4pyJuunlxo09nA9LuD9NzGasP+DTw26KFLJsdMNH+Sg1c+IvLPQAuk33JwLqH047A+4
 JB3xwuFQXa65G3sRtEwG0YN6YUrarvT3V51QmKVrt7cwPZe8PXvodzzCvEAwOPSppFg1
 2p3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hG9rUK4IkVrQ+8ACrhWPxZRakkSjKpRWQoFCkTNn/X8=;
 b=vCN2mpLCRF78KoZUxUXDdcVjD1BcPNNprI9laLMmMHNRNg98ZrAQjYTeIFibShW1QL
 +bLPJDBiVWjNY6C+AJAb/j2+UB2QNSkA0hQxeuEncB+7JmJRjcTeBSI/iHWFEDZ0jK9W
 99lZdmDR785l2wM2a1iQ7SucvixlKay6ZDjq0CUMFNVYNlMohy1Ti65jx2i3+01OzBKn
 PgRA/EkIZlRnDFHqGk9dNT4k/bxcx4U5y9aA6KQIuAxsTGQciMf13iE7kum/LAHbpw7M
 Uit2R6tOGHdE5sSM98/gZkRwhy0haZbj2D20lCrJ1sKeREaPFgoVYqKXgMk6g5KpQCw0
 SGUQ==
X-Gm-Message-State: AOAM533WIV6jdzL4Lahbt7FSOMjMBOPZCsk/uvIbgT0w8950rgCyO5wc
 U75hIX1O1EndKx9nbdnW7R1SrA==
X-Google-Smtp-Source: ABdhPJxvFffbttIKz7Na7DPiLiYm3YnyCQTdRoBJ+lM//JF3O1XkLpBPZEnlqZ/8dg6bspbaSdHVAA==
X-Received: by 2002:a5d:6f18:: with SMTP id ay24mr3114077wrb.694.1641894794812; 
 Tue, 11 Jan 2022 01:53:14 -0800 (PST)
Received: from localhost.localdomain (203.247.120.78.rev.sfr.net.
 [78.120.247.203])
 by smtp.googlemail.com with ESMTPSA id l18sm1248916wms.24.2022.01.11.01.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 01:53:14 -0800 (PST)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: kishon@ti.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>, p.zabel@pengutronix.de,
 balbi@kernel.org, jbrunet@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-phy@lists.infradead.org, vkoul@kernel.org, khilman@baylibre.com
Subject: [PATCH v6 0/3] phy: amlogic: fix shared reset control use
Date: Tue, 11 Jan 2022 10:52:52 +0100
Message-Id: <20220111095255.176141-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_015317_376721_9EE762E1 
X-CRM114-Status: UNSURE (   9.88  )
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

changes since v5:
- No changes.

Amjad Ouled-Ameur (3):
  phy: amlogic: phy-meson-gxl-usb2: fix shared reset controller use
  phy: amlogic: meson8b-usb2: Use dev_err_probe()
  phy: amlogic: meson8b-usb2: fix shared reset control use

 drivers/phy/amlogic/phy-meson-gxl-usb2.c | 5 ++++-
 drivers/phy/amlogic/phy-meson8b-usb2.c   | 9 +++++++--
 2 files changed, 11 insertions(+), 3 deletions(-)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
