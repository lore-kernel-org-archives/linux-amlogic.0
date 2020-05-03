Return-Path: <SRS0=Edwp=6R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE00C28CBC
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 May 2020 22:28:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A32320643
	for <linux-amlogic@archiver.kernel.org>; Sun,  3 May 2020 22:28:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mThofBQp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="g5CtopVi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A32320643
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CaSxrGK/TcF9r9D3LW3ryWvcuXaz65dJKBPyC3jn8EI=; b=mThofBQpB9GgpX
	xE7vqoaIMqqYZzPwbLHzinGttpO3B/ky8l/ExIlfyDZsHvNw85ViUxyK0Id76Q/G4k0NPrYhemCmf
	/TZDg7v+B7FX16yV3g75tcrdOsEJJH7BjdxKXiMDVPDjtUHBVMvP7r6mn6SBWRLjtNJu6jWNiXGcI
	jl5l9N0Wqpr6VLViNb6YgYQqMxLjs01i6uMYuAM+e+8Flxs0HZ1sx3r6HolczjdI63BGrrZxmO29C
	SI+9EvwjPYyiLlzSqBpwvEYWalu4OukUflLiANNXY3IjUx/7fy43hXPVWOcqC9FlNH0erQQgXOxGU
	xWMG3M8SsB+fX7hO6xFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVN60-0000Lb-2K; Sun, 03 May 2020 22:28:24 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVN5x-0000Kc-1N; Sun, 03 May 2020 22:28:22 +0000
Received: by mail-wr1-x443.google.com with SMTP id f13so18659944wrm.13;
 Sun, 03 May 2020 15:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y69lAmBUHqgE1AImwpWCVOk5aRft5ihzG6qW/7B3meA=;
 b=g5CtopVisuuYHom2E36JzSmflZ8Vpts4weEltBoFA5PHeqZuw7xpF4tDEugEIDRJTT
 TSB2h+14aRVNkj+RQbcbjhQQdnxc8Kq2mlRrdjUItjzh1V4liq3aYuRgmnadNQ8usjgA
 YM7ogrF4rnFPdpKT6rijBFR9aemkr8yt7UJRt/Ke97sabnwNNB3HqBewu9sbrEh9QOR4
 wCHVpKdtEzfjFb6Ji23FM4HfLGh/FdkDPnpPZWY8pk7HycjmCWAWf3xWDNvYGOVKQT8U
 O7KmlKYW2V/+xzF56s5uTVYaBP3Fmx727jy1s/DXxOdh8wRJhR0IYipKQ8Jck434a0ic
 Ttqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y69lAmBUHqgE1AImwpWCVOk5aRft5ihzG6qW/7B3meA=;
 b=Kk1WN6mHSiwoYpFSgR4V+fNG/0ai1klzRCbZ2gO8gRC4rAj/AxVhQ+wml2jXx5BSz8
 YEMch45HfrAxd/8gjUBKu4OZ88XCuOEFdM00oQE0Ew/JNrviz7073gNW+KRQ7vPgvmnJ
 vRcDKHrqp8jAziOZyOanh9K3wYJpzg/lXLtx41Cepq62U99IuvxVCwbEnDcInsNEK5ZF
 1awA8w0Y7JbO5UNGxCJGXOVXBjKQeT6h1qZwGFmLsJhF29Sqpwf4NqG9fEIWYa+Dsofn
 4j4H5vQ9y2EHBY6V+cfSvS4ck8U6mZv1vZACdwbKRkAbeFpQDPxt5Y8u+TTRxj035r/l
 9Ptw==
X-Gm-Message-State: AGi0Pua/zGWklgrtSirnWgb7/MnTNHXCnPvEuVRz7vQPY2Zvka8am22Q
 UhGeFQA3EQUb+EIm7dPjEoukuy/g
X-Google-Smtp-Source: APiQypKTFvLpzJxWxC/mVKGKRYn8CTyLnoU9CuxJncu5LvibrivSYXR2dENDCWKJUUC+YmHk1ohmUw==
X-Received: by 2002:adf:cd88:: with SMTP id q8mr13169106wrj.67.1588544898444; 
 Sun, 03 May 2020 15:28:18 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F137142E00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3714:2e00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 i129sm11200081wmi.20.2020.05.03.15.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 May 2020 15:28:17 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org,
 ulf.hansson@linaro.org
Subject: [PATCH] mmc: meson-mx-sdio: trigger a soft reset after a timeout or
 CRC error
Date: Mon,  4 May 2020 00:28:05 +0200
Message-Id: <20200503222805.2668941-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200503_152821_104266_9F7B2B84 
X-CRM114-Status: GOOD (  13.97  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The vendor driver (from the 3.10 kernel) triggers a soft reset every
time before starting a new command. While this fixes a problem where
SDIO cards are not detected at all (because all commands simply
timed out) this hurts SD card read performance a bit (in my tests
between 10% to 20%).

Trigger a soft reset after we got a CRC error or if the previous command
timed out (just like the vendor driver from the same 3.10 kernel for the
newer SDHC controller IP does). This fixes detection of SDIO cards and
doesn't hurt SD card read performance at the same time.

With this patch the initialization of an RTL8723BS SDIO card looks like
this:
  req done (CMD52): -110: 00000000 00000000 00000000 00000000
  clock 400000Hz busmode 2 powermode 2 cs 1 Vdd 21 width 1 timing 0
  starting CMD0 arg 00000000 flags 000000c0
  req done (CMD0): 0: 00000000 00000000 00000000 00000000
  clock 400000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 1 timing 0
  starting CMD8 arg 000001aa flags 000002f5
  req done (CMD8): -110: 00000000 00000000 00000000 00000000
  starting CMD5 arg 00000000 flags 000002e1
  req done (CMD5): 0: 90ff0000 00000000 00000000 00000000
  starting CMD5 arg 00200000 flags 000002e1
  req done (CMD5): 0: 90ff0000 00000000 00000000 00000000
  starting CMD3 arg 00000000 flags 00000075
  req done (CMD3): 0: 00010000 00000000 00000000 00000000
  starting CMD7 arg 00010000 flags 00000015
  req done (CMD7): 0: 00001e00 00000000 00000000 00000000
  starting CMD52 arg 00000000 flags 00000195
  req done (CMD52): 0: 00001032 00000000 00000000 00000000
  [... more CMD52 omitted ...]
  clock 400000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 1 timing 2
  clock 50000000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 1 timing 2
  starting CMD52 arg 00000e00 flags 00000195
  req done (CMD52): 0: 00001000 00000000 00000000 00000000
  starting CMD52 arg 80000e02 flags 00000195
  req done (CMD52): 0: 00001002 00000000 00000000 00000000
  clock 50000000Hz busmode 2 powermode 2 cs 0 Vdd 21 width 4 timing 2
  starting CMD52 arg 00020000 flags 00000195
  req done (CMD52): 0: 00001007 00000000 00000000 00000000
  [... more CMD52 omitted ...]
  new high speed SDIO card at address 0001

Fixes: ed80a13bb4c4c9 ("mmc: meson-mx-sdio: Add a driver for the Amlogic Meson8 and Meson8b SoCs")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Ulf, I consider this non-critical because as long as the meson-mx-sdhc
driver is not merged we only have one MMC driver for these platforms.
I don't know anybody to prefer SDIO wifi over SD card access, so this
can go into -next (in my option at least).


 drivers/mmc/host/meson-mx-sdio.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/meson-mx-sdio.c b/drivers/mmc/host/meson-mx-sdio.c
index 2e58743d83bb..3813b544f571 100644
--- a/drivers/mmc/host/meson-mx-sdio.c
+++ b/drivers/mmc/host/meson-mx-sdio.c
@@ -246,6 +246,9 @@ static void meson_mx_mmc_request_done(struct meson_mx_mmc_host *host)
 
 	mrq = host->mrq;
 
+	if (host->cmd->error)
+		meson_mx_mmc_soft_reset(host);
+
 	host->mrq = NULL;
 	host->cmd = NULL;
 
-- 
2.26.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
