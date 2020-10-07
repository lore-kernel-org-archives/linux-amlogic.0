Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42ED0C41604
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:06:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5284212CC
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PfgiTHe3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TMFJPn4E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5284212CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vMEJGrxzqCosMnAiqbYTI9HrB++6ZW4h2bMWljkgy4I=; b=PfgiTHe36Xv0CPrEn6CrMHbymU
	hZc+b8++lxtYWYgzxONINpl4hP+K+YVppMVZXH46DmLS4B9NIfCxY+Hx5ZVdkNsq4vPLQ66KUx/Ey
	PvO5MYw8vCB0z+L1TwkwtlPG0dIOkhWixKJiL2r2aiyVlyTK6Bhj9JcfnLze58kp+QRAxR4grGqu1
	9PrGPUTyu+NHTqWXSYFOzAAXlskhcyPlGoy2gYEJvuhFUhjnnr73CyXNSou+AIk7etCLLtLyuHyz2
	+cu45zKg38oKBk55EvyJCRWp+iceh6aRKPcrmjgmACY+MP4YkD14OgbUKdw3rxtGEdW2mKhlGlJap
	uXswYigA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6LM-0008HZ-GZ; Wed, 07 Oct 2020 10:06:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6LE-0008Db-OI
 for linux-amlogic@lists.infradead.org; Wed, 07 Oct 2020 10:06:38 +0000
Received: by mail-wr1-x432.google.com with SMTP id n18so1458144wrs.5
 for <linux-amlogic@lists.infradead.org>; Wed, 07 Oct 2020 03:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=njbWkdetKP4MxyBSpq/xPTQPrk5CDcrt7ND0CLIln7A=;
 b=TMFJPn4EqOHnkD+TYqxrD4l3/aMVgKQJxuMBZ2/xK+cOx7suIZxnpfZqDS/VPxlNrT
 UBADm87uL6bpvB9LNJzRlxZGfYNqQ5jj5/lHb3NxO3zDmWkZkbESZEkp8Hpi6Y03eKra
 8mrg8EqQd1M07k+DK6eai5QwJoagEu6W2drF+2p1QaujF3Oozp5hfgyPjLohzZSQ4Ncv
 6uYNLFwWlZUqk8HiUfWPJbHSt8gA/Ae42+u1q/40S2v8dK1BgOlse21W0coRCYsZzX9Y
 oB9Z/1QeTQd25DobuYBEdJuIOCweZr6ZnVZ4athoWpOBGQ+GhqrMWE0R9rviam3MXcmk
 o0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=njbWkdetKP4MxyBSpq/xPTQPrk5CDcrt7ND0CLIln7A=;
 b=lA9E6FfUugjLoL3O1g7at2Aptuksva6vXmG53Qpx94jMkm69YLvmlZe2+heeUWHdr0
 EuW907AOtLPWBFlvgLDSqNgdFK2WXca98EY/JNENCbmTg1pmv7JDOXX1NMvmfCJTPmfR
 p05DXQYtcfkH9ykFtVytY139fIhtzqiSOuMrYClRp4kIfriISGRbe9AHTY5hMYruun8/
 RgcFAZTHe5FCx9He+rtcIGYZlToERqeC68OFktzm+vVJ16B40J5KoRd1CO5FP40dKj/w
 FVNDdu4JsZ4ZQaLva6/tkyyA0quEHApwCEa6HmwolOsuZ0+SkrhQgQbEvMx2I+lXAB+t
 jx/g==
X-Gm-Message-State: AOAM532cRRup90jzIdbNg3Q/RL9DuYf67GHMWx8Pr0P3LEOGnXcxFvn5
 AUJzKmzsVwutg5Ppe5SrbzV2SA==
X-Google-Smtp-Source: ABdhPJy1fVxznG2JVnEmKvCX6YPeXlFAy5/rOnU4Kc0Udkn5RJhC4VodgA+iFONbGOIu6nirCEGkBw==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr2852791wrr.57.1602065194303;
 Wed, 07 Oct 2020 03:06:34 -0700 (PDT)
Received: from bojack.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id h16sm2214981wre.87.2020.10.07.03.06.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 03:06:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 0/2] arm64: dts: meson-axg-s400: enable PCIe
Date: Wed,  7 Oct 2020 12:06:29 +0200
Message-Id: <20201007100631.192348-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_060636_957312_478759D5 
X-CRM114-Status: UNSURE (   8.44  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the nodes for the :
- AXG PCIe PHY, using the shared analog PCIe/MIPI DSI PHY
- 2x AXG PCIe controllers

And enables the PCIe M.2 Key E slots on the S400 board.

Dependencies:
- Patch 1: Analog PCIe/MIPI DSI PHY update [1] MIPI-DSI nodes [2]
- Patch 2: None

[1] https://lkml.kernel.org/r/20200915130339.11079-1-narmstrong@baylibre.com
[2] https://lkml.kernel.org/r/20200907083300.14412-3-narmstrong@baylibre.com

Neil Armstrong (2):
  arm64: dts: meson-axg: add PCIe nodes
  arm64: dts: meson-axg-s400: enable PCIe M.2 Key E slots

 .../arm64/boot/dts/amlogic/meson-axg-s400.dts | 10 +++
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi    | 61 +++++++++++++++++++
 2 files changed, 71 insertions(+)

-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
