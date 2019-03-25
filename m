Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A1E7C10F06
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:19:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD5002087E
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 14:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Uc6xPljk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sCQjknSn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD5002087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CqzZ1Myzw6sekvhtU2irRlFVQXHyBlRGQAnLmtnN7+k=; b=Uc6xPljkmPTGf6
	RvxMkGPyTGZ3QIF7q2vxSo+DBdkC7l0BKp6utFce3+kQ2XlPGUJf7Gh0qlEJ2GJzpzmXDbKDItpvv
	mPZEzKlIvTOXi609Dk9jt98EnMQCfAF1MIgzwltUwTWH8SEzgljxX7HhYwjVXCjIvHb0JNfUN34qB
	gH97UOrPZnsY1doiITy/ndTOGSo4zzFuxABCpk6mn4HrgMX3odGvFXhvXHumXG6Hiv/BF+jvBjREL
	Pegz5BuwuphZrbw6B6EDW5n8XBLf/K4idgmH2VqedUGHB7R2SV4Q0L0fJWKd8lzRycoUpCZydZ8Js
	/LuYfSO3/1LWmt8zUHew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8QRK-00085R-Kp; Mon, 25 Mar 2019 14:19:02 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8QR3-0007i9-Co
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 14:18:51 +0000
Received: by mail-wr1-x441.google.com with SMTP id w1so10399756wrp.2
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZHAlhhZl4+Tb6D04VMXd4+6C74wYfqvuN1/1tdvht8=;
 b=sCQjknSnFZ5hPsApj04J60Lj9X6JNqXn2GB6s4LtNWPUTnQyyoV9CxqVkQrajMUBaU
 6k7IvHzFmSgtI9MCV37Fyv9bADnfinMB1CMfgck2q4IKK/gn830683MZJTJKrQCcVOD5
 oG2igSmdLWiLU7whmPnnprpWxW8jOGJiC0zEB84s1w0Lnnh+7ZNOadXsxtHAJ6A4Fze4
 5pCkMwdM4l5StXCPTQcxQhk07RsuMxCE7tWZ/bqX0PYujjg7LFImvHDkVx39+Jo8+Lnz
 r2bE/edSVj8tB67aQf2WYLvb8FrnlyTqo3sJwsOnbDogFiz1H/hhrGEayrO3XFRGI2AP
 nT5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZHAlhhZl4+Tb6D04VMXd4+6C74wYfqvuN1/1tdvht8=;
 b=ltxjhv/axba5Oq8P/qzpKzbdGaWvmLZD3RVtfNYApf7gRGfRZ9mof7w4tsS8Tz7RaO
 OhWFBCQHS1EAC2Nk5mRBCLXaUMRMCKIappNWEYixG0jzeRjqTNckP39i4ZfeNlzmmkDv
 SVPxiKTBecIIaM+R1/H+Ff0bTQkjj0p3e32XjH+9YIVn+FdTddWpaQ4VOd5UaoeLug+W
 1AF+jNLKMPKsyzbN5hOVeHyxHgCjqVFFFuCF8Qbc9+af+g5abYhKWYpnddHQNsfhwOGE
 llxfsUyzUJ2YL0qiBxshFJDsVwGf0YjuJNCcsvmPnCpdqQmlwEYdhmlpaG12imB3psR5
 Y55w==
X-Gm-Message-State: APjAAAUqEuu5GJsrjoJzkatNeXz6a6S4slXD2BNFrNbwqPq6G0H1irpP
 zv1j90zQPa/tC5CVyeDvw8SEYQ==
X-Google-Smtp-Source: APXvYqz7TZe+GfPDXgH4vnTFw9UMh3w7TlDUMzE6Dfqc8AZpcbL95itv4iTLnlORU77tW9jxuk0yHA==
X-Received: by 2002:adf:b64e:: with SMTP id i14mr16685292wre.10.1553523519418; 
 Mon, 25 Mar 2019 07:18:39 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id 132sm26976794wmd.30.2019.03.25.07.18.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 07:18:38 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/11] drm/meson: Add G12A compatible
Date: Mon, 25 Mar 2019 15:18:23 +0100
Message-Id: <20190325141824.21259-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325141824.21259-1-narmstrong@baylibre.com>
References: <20190325141824.21259-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_071845_456025_5845076F 
X-CRM114-Status: GOOD (  10.09  )
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
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Finally add the Amlogic G12A SoC compatible for the VPU driver.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 079d22299d78..faf1b1b0357c 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -447,6 +447,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "amlogic,meson-gxbb-vpu" },
 	{ .compatible = "amlogic,meson-gxl-vpu" },
 	{ .compatible = "amlogic,meson-gxm-vpu" },
+	{ .compatible = "amlogic,meson-g12a-vpu" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
