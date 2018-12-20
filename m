Return-Path: <SRS0=VwQT=O5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC464C43444
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Dec 2018 16:11:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC7D2206C0
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Dec 2018 16:11:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rPizaO/y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Vb5yVm4u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC7D2206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UwrQqsq5HN2foFD84WnVMHE4Gue7Y4eoi05B92jVcr0=; b=rPizaO/yJ0eA5x
	ROChep+0xqzbOp7PHg0ZRvhBZwm8KXDDW3UoQl4Nys9YSeErimQi93leqXTPN/4WHTlU1NRpOsqFK
	4rUiyq6IaX4W0UMXBVxLyTVrZ239jY1NaxFRNgDIaOc94/Ot/49mPijT9jq8E9mymHp78f1AzPhaY
	wfTQJKeIxy6xTvXA3u7Qjw5X+Gn+jFS+5+b+e71WtL+K6x0+HGrBBZ5JF2LIwCgDF24p/o1Rl+btu
	j39KwShRaAbvRePXpQYJl+ajOzxl0MlH4iGmWNNHbo0TKtmzheiPluuKyFwJt8f5/MravJ+X1Fh6p
	/4p7Y/CD8YpXZNoDzfvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ga0uZ-00074e-Lp; Thu, 20 Dec 2018 16:10:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga0uV-00070s-6I
 for linux-amlogic@lists.infradead.org; Thu, 20 Dec 2018 16:10:58 +0000
Received: by mail-wm1-x32e.google.com with SMTP id p6so2801397wmc.1
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Dec 2018 08:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z6wPduEXV3XXEuMg2tHDSa+K2V0jh+6poqtPJAz5Pec=;
 b=Vb5yVm4uaaT7v2BVpMx2iilJ3pWRQ9CAUIXrtMcJ5YS4xl0euy3fypl8xLs3B/Hj/B
 Jvq3py6A/Znw6vDkEOEOPKeLEQpYlSXnzmKS4wGbSR5nHoza0XBao0kPepJQRFLK17RW
 C8lq+GQehrxgCfXwDz3nK6G5TUki+GOxQPamM9Zoo5R4IJWgfEJgwQj8a4C8J0jvIGj6
 CQzwBiG2R10RMQvOZZ0/5F6/F5bRckDh415WYaUpRgunm6ildbTqbx6ob7PEqM13CAj5
 UB6+uaL7/TFrMEGzLkTpQWdF6msPWnTjUyVgFFqgafvIwmE5jPlsFoak2Y+BvIpq5sLF
 bg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z6wPduEXV3XXEuMg2tHDSa+K2V0jh+6poqtPJAz5Pec=;
 b=Sekhx/oqtwP/c0g4zs374sHzgzjKKIfEqyYwKPSOZtP13tT/DLZqSy0WAO6dqjgzlN
 Wp1ll6bWma43ppcMsTllaTtoCETjmA51ApN9fLHrAvNvJiKwoiw/qSDhvYre0gjTU0Py
 l/28am/RZe3dCYoe16H+VqyvHINkBJpjovbfzLZjjT2Ijf0a12zTIxCXBWCAmFyF/aiG
 rZZTK1JRGXTMDeB6O5wLD0MARTmEhqyvS5kYY7BJYuvfmtlU7ym+6vH55Dgjgw5XSvTj
 8WuSHiwYaHQ/JnRgyKSebgrXddE7g2H8EOo4PdQyNG1GlB0tGWrzRVfJZBbk8eR/d1BA
 qZEA==
X-Gm-Message-State: AA+aEWZO2qPTxZ0l8rGQJWoV7PcH4osKQUR4IjRMKZjUA+wRonWImcvT
 Q61v321CvreQbPZhoQyeprZLp2G6WxA=
X-Google-Smtp-Source: AFSGD/XtoNMEI7iaBRDll2v24vsMtJOSri84lhYvk/AmV3zJaBC1/98hAcqfY53TFPqYvX3ofkSy/A==
X-Received: by 2002:a1c:8548:: with SMTP id h69mr11465403wmd.11.1545322242934; 
 Thu, 20 Dec 2018 08:10:42 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id x10sm10941186wrn.29.2018.12.20.08.10.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 20 Dec 2018 08:10:42 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Subject: [PATCH 0/2] arm64: dts: meson: libretech-cc: emmc update
Date: Thu, 20 Dec 2018 17:10:35 +0100
Message-Id: <20181220161037.23756-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181220_081055_227166_E6D0EBCF 
X-CRM114-Status: UNSURE (   9.52  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patchset provides a couple of update for the eMMC on the libretech-cc
It should remove some error message for those who don't have an eMMC
module and improve the performance for those who do have one.

Jerome Brunet (2):
  arm64: dts: meson: libretech-cc: set eMMC as removable
  arm64: dts: meson: libretech-cc: switch eMMC to 1.8v

 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts  | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
