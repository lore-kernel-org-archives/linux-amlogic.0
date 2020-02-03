Return-Path: <SRS0=mDOd=3X=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	URIBL_DBL_ABUSE_MALW,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98712C35247
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Feb 2020 15:38:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B0992082E
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Feb 2020 15:38:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C2TxYgpO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wAxcZo2/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B0992082E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h2Kggwue26qhO/kLb7JaWOvQd7mkg2IfJl7idg5v4fE=; b=C2TxYgpO8ggI5k
	xDdLrd7cSm/2ui6Zddxz3RyCVZxHl1dImkJgZR+10Vyb5gwXrB4nFy7izxw22Anp85kk3e1zjitAL
	Oxwv6xmIfOSgbm5y55Zy7IpgItNga5dr2I+4mdsPeyphFF4V1ppP2Ub474CL3XPmTI4L0d13BuNCU
	yx0PZVZBC7QF1vp+ilrNnD9xyVPkLWgB6zOHxBqOTCJ3eRkqtqunPM7Ti7sw0e/nrEpz6JWZ2Zmmz
	9ZcSo5NSlBCUmRikhPlDwPRwNFGToR3+2jq5lmAoWcW86odrKBNUGMH5amUgv8vmrwO7mLDyOG9RJ
	olTqot+rLSgVzewMbmNg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iydnT-0006Vb-Pv; Mon, 03 Feb 2020 15:37:59 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iydnQ-0006Uy-Fb
 for linux-amlogic@lists.infradead.org; Mon, 03 Feb 2020 15:37:58 +0000
Received: by mail-wm1-x32c.google.com with SMTP id s144so159899wme.1
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Feb 2020 07:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OdtMuNC+zLvKbk5Nofs4l77z9+OEwsTQwmbFi2ndFV0=;
 b=wAxcZo2/vCiggPyoHleZLuWlCJ/o8Lw1vpmeBGn/ZVlem21Uaea1Lr+dHI4MMd6m/c
 ZP1uYCa5mD1FC2YVqWLUfmID0o5cBXyAcLc52xgQVjJbW2ntdm5GGced8H+z+jESCkUT
 go7nCzqBi2jzc+K/eoc78//72GPsv8sh1aAO2SawjC5eT2LX04Z5ORI39nBHJG26CcmM
 4zm+yvm5xChXoxKnC80zAKaZtcYjE+Gm2cpJ2UBZ/NkvKDOztlAr3A7bd69GKCliN53p
 cD5mTLcebeROmPb77S7K5+nZHtZJ49zv1bTFqpQkgvlwAKF4D/dRyv1tBSwl74+ESXgz
 drKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OdtMuNC+zLvKbk5Nofs4l77z9+OEwsTQwmbFi2ndFV0=;
 b=gyMkMcXpZJLN6MbdtpOzL5BvW2ROqjrwvYX5SeRrc3rrviPuEYYSlRoC9AokGE5R+B
 aAyUhTtOuw5MMkBjU3R20Qkyv9RKCQSeRnaLgXLpD49K2/Tf3hI6t/c685GD6MFOX0I4
 ppZcuFppszEtteodiKAIzsVm/5jBJr1cIEbK+stK69pyt52MeEie0oX5FoefTp5uAu4X
 IbgQ0qeHoWbPQrGLr2+V4OFbgf00WeRZpswPEIOJrPLaLifh/lknAZHmsIo6uyr4IE7u
 aDnwhFW4gy+137JHC28qGyPCAuB5MX19LVpvhYJsSWqFZp0Jsmh30iG32+6j2ygmIZvW
 q/Gw==
X-Gm-Message-State: APjAAAWZwrWS1ArjOWj/06l28VHpPNwyy/NJ3L8L7Ie62nEsgJA6KP/Z
 4O0mKg8z4MCnSvhq0h69BL2gBA==
X-Google-Smtp-Source: APXvYqyyWlDS9Jk6Qgc+UXAvu7bIzovWgTrTsjkU/khCS8H6Xn3rinPpNDI6Wkn14/aHMlFv+XAYTQ==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr4973234wmi.58.1580744274288; 
 Mon, 03 Feb 2020 07:37:54 -0800 (PST)
Received: from localhost.localdomain (195-132-149-87.rev.numericable.fr.
 [195.132.149.87])
 by smtp.gmail.com with ESMTPSA id f8sm9855595wru.12.2020.02.03.07.37.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 07:37:53 -0800 (PST)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: linux-firmware@kernel.org
Subject: [GIT PULL] amlogic: update video decoder firmwares
Date: Mon,  3 Feb 2020 16:37:35 +0100
Message-Id: <20200203153735.14674-1-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_073756_571673_84FA8FC3 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: linux-amlogic@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Arden Jin <Arden.Jin@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello linux-firmware maintainers,

This pull request contains 1 commit that updates existing firmwares for
the Amlogic video decoder, as well as adding 4 new ones for new chipsets
and/or codecs. The support for which is in the process of upstreaming
kernel-side.

More details can be found in the single commit description.

Regards,
Maxime

The following changes since commit 6d9f39910215a7dc56df3629e7d46b71a592be8e:

  amdgpu: add renoir firmware for 19.50 (2020-02-03 07:26:39 -0500)

are available in the Git repository at:

  https://github.com/Elyotna/linux-firmware.git amlogic-vdec

for you to fetch changes up to fb505a691b2a37b9d1fc20617433dfd52fb6e27e:

  amlogic: update video decoder firmwares (2020-02-03 16:20:05 +0100)

----------------------------------------------------------------
Maxime Jourdan (1):
      amlogic: update video decoder firmwares

 WHENCE                       |   4 ++++
 meson/vdec/g12a_hevc_mmu.bin | Bin 0 -> 16384 bytes
 meson/vdec/g12a_vp9.bin      | Bin 16384 -> 16384 bytes
 meson/vdec/gxl_h264.bin      | Bin 36864 -> 36864 bytes
 meson/vdec/gxl_hevc.bin      | Bin 16384 -> 16384 bytes
 meson/vdec/gxl_hevc_mmu.bin  | Bin 16384 -> 16384 bytes
 meson/vdec/gxl_mjpeg.bin     | Bin 16384 -> 16384 bytes
 meson/vdec/gxl_mpeg12.bin    | Bin 16384 -> 16384 bytes
 meson/vdec/gxl_vp9.bin       | Bin 0 -> 16384 bytes
 meson/vdec/gxm_h264.bin      | Bin 36864 -> 36864 bytes
 meson/vdec/sm1_hevc_mmu.bin  | Bin 0 -> 16384 bytes
 meson/vdec/sm1_vp9_mmu.bin   | Bin 0 -> 16384 bytes
 12 files changed, 4 insertions(+)
 create mode 100644 meson/vdec/g12a_hevc_mmu.bin
 create mode 100644 meson/vdec/gxl_vp9.bin
 create mode 100644 meson/vdec/sm1_hevc_mmu.bin
 create mode 100644 meson/vdec/sm1_vp9_mmu.bin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
