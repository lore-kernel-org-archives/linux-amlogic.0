Return-Path: <SRS0=khaH=J3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 916DFC433ED
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:28:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB5BE6140C
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:28:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB5BE6140C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ilZjWVVwMBFUxFKReEjO4p/iXekO5jzZD5+m1Lx/VPk=; b=B3H17pDGdEp8MsX6xAEaDLo1rx
	2EjHp6c6iXegnVA8g5XRuKsvJ327H5gunkahxSne6eazeXegh36Dv7VVauD38aYUzC6CszqrFNfui
	LOAgtv9uGLNccSTn791AXuWeXXKZPVkwZuJ7D/3wgIEQAZKHroDVBLydaVjFliW8Pi2CLqd3xvHSi
	f486LkDNUzyE6CmnJCjjLAnEqfvMWOKklisehZPtWWFSYijp/GprW1GJi57rHCbxm2Qx895A9uaYw
	ePdAHtqpwsVmoejhs46QY0gNncFJPu+Mwf0MS02Qbt2iZk2ZnAn35Br8MH7Rbch40XbEFEB9fRFrn
	QrNqwulg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcOVJ-007V9L-GM; Fri, 30 Apr 2021 08:28:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOV7-007V8z-R2
 for linux-amlogic@desiato.infradead.org; Fri, 30 Apr 2021 08:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=x12D1fSgMXo84/StrNDXFY95BOlA8w3dEtySPm5wCgQ=; b=tVb4WECt8UGsRPAX/SZ27yxtDI
 J+NGkc7h61RW06ZQNBQyHIY7ktGo37MQwr/gjtYuez5N4JcYc9q1uyNAqFQy/J8VHwtdx8Vp/nqgl
 VC7SFWQbWfUQjUNHiwgV8P6CQV4T6ywG5FNsDrZdHAwJR3sLrQjFoeX7jnYBwUUtaAks+065QSpN/
 oBoG4WjlUKxHSqiyi5mJPb5m68837iVBbXv2BRglG1HVBw5BkY7yQMZ+BnaGaLCZGUwJ5gqKXQroW
 AF8yFTjCscJE7jrIwDTIc2OaXUTShBPf+2FeAqwh2fzCGhV1eh2B4P0d969lXT2h2wcpGqOzVKNFK
 mKkUiCsQ==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOV4-001F1v-Mn
 for linux-amlogic@lists.infradead.org; Fri, 30 Apr 2021 08:27:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id x7so69540306wrw.10
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Apr 2021 01:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x12D1fSgMXo84/StrNDXFY95BOlA8w3dEtySPm5wCgQ=;
 b=q5RkY2TEzEE6oWZZbW+87d2glkkz6bArkK6G7aeyOTL/H6i5S97xaGLHvQ7feTUwKC
 1yaM5gV/avDemn8LUsrGG4ttN8Njingl5hDQcXiFweWa77q5BSlgh8DTBXxWlaQQXQ4k
 r1lSJznmcSEPRoyRX6erX7SDkpU6d2SLI6M8bWaGqGtY1ruPepci6ZZIwFNRYe5YKJa3
 yjAHDDUPwDNtlN2+gWew99O3ATqgPaq1drQVwYnfKrBxevD6IPejzjmuF6NGbn7gSLsS
 uOmK0IYiYEIpsf4jXL+Yqb+Qsa02G5V/KRmeYGuii/TEAavD6FHr3X7gsIieEtzPeQj7
 wX1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x12D1fSgMXo84/StrNDXFY95BOlA8w3dEtySPm5wCgQ=;
 b=HkLZ9cAkpni8IumktcN9iFOPqRdAUrppS/5mjLNdyiRyNM+utIrke5SYd+nLwX347f
 jHj5eSKf692GpRtcbws5KwkX+A4zaWP8HWDZxG6IWgHnn1UyYzkIXfTyANkEoSv8hc7X
 +ZoPIvY0rgSCzs8lSqU9d7o24XOID7bheXhDL8ks8+KTMJpmZp2pSWXntq4Mt2NEgVrd
 Vqu3AQyXPPDXa+AOOwnVhZF6EcCmN9XxXYPs1gAB03vmyJXxlhdC7Jym4hE+YJmhMHLf
 Y87cq9qC32C2uP/Ynvf/jxLSzo35/ZkBKY/HkbfN0XQ1plKMm5U3+CELG7D4M7rKUWI5
 ERUQ==
X-Gm-Message-State: AOAM533ZJ+3tn2hOXnJlDTq2ymfk2L+Kb3/+5mU4itByYEJaJNFGMBb4
 mesZSxIE99HbA4MRp8cfWl3Ang==
X-Google-Smtp-Source: ABdhPJxGoyaka1SwUgXjXPuWPXVdSHHYtgAfq3tVpjG7MANHxCuZPbgUWnsHDmVM463gHiGYmCPtyg==
X-Received: by 2002:adf:efca:: with SMTP id i10mr1630979wrp.284.1619771268768; 
 Fri, 30 Apr 2021 01:27:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:4a89:8c32:4adc:fc67])
 by smtp.gmail.com with ESMTPSA id
 e12sm1336677wrt.51.2021.04.30.01.27.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 01:27:47 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Stefan Agner <stefan@agner.ch>
Subject: [PATCH] drm/meson: fix shutdown crash when component not probed
Date: Fri, 30 Apr 2021 10:27:44 +0200
Message-Id: <20210430082744.3638743-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_012750_761058_071E2E0E 
X-CRM114-Status: GOOD (  11.44  )
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

When main component is not probed, by example when the dw-hdmi module is
not loaded yet or in probe defer, the following crash appears on shutdown:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000038
...
pc : meson_drv_shutdown+0x24/0x50
lr : platform_drv_shutdown+0x20/0x30
...
Call trace:
meson_drv_shutdown+0x24/0x50
platform_drv_shutdown+0x20/0x30
device_shutdown+0x158/0x360
kernel_restart_prepare+0x38/0x48
kernel_restart+0x18/0x68
__do_sys_reboot+0x224/0x250
__arm64_sys_reboot+0x24/0x30
...

Simply check if the priv struct has been allocated before using it.

Fixes: fa0c16caf3d7 ("drm: meson_drv add shutdown function")
Reported-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 453d8b4c5763..07fcd12dca16 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -485,11 +485,12 @@ static int meson_probe_remote(struct platform_device *pdev,
 static void meson_drv_shutdown(struct platform_device *pdev)
 {
 	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
-	struct drm_device *drm = priv->drm;
 
-	DRM_DEBUG_DRIVER("\n");
-	drm_kms_helper_poll_fini(drm);
-	drm_atomic_helper_shutdown(drm);
+	if (!priv)
+		return;
+
+	drm_kms_helper_poll_fini(priv->drm);
+	drm_atomic_helper_shutdown(priv->drm);
 }
 
 static int meson_drv_probe(struct platform_device *pdev)
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
