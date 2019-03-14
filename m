Return-Path: <SRS0=SZaW=RR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0BCAC43381
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 13:50:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32B62184C
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Mar 2019 13:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NF3OTjBd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DEK3e7jX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A32B62184C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PW72wBaiuvgmhqrPhrg9LexpNvGxIZEy2nzVyI4fw5A=; b=NF3OTjBdisZYnq
	OsEYZT1QpxqNdQzgf19jknKjaBBXuh2L2sf3T6GmHN3UYnVo0Jz1wFF3I1219+DMpd+xLuKjHMPT+
	A9FB5l3UfjAx3tn4+j+hda3HSD5SvNlNUk7JuINF4kVyAGLHZc4Z0vHPTdy2X1bkKcvA0BqBMhgoq
	/CE8mizaeVOQkmqNQQwFu8Qy/kO4GWAdxdSSyjBKWuMtO1VB2d/4Iss60QHZtw8CdE+7I2oF0Kt8L
	L1p5E4KgEMWEHyd4IAb9ncrZxvAwI1YgvJQbXxO2+P7q8GrKn9YqdS/IKn1LNclAdtG9JfXJlGv9W
	oFCQnJY5whB2Tb+rcw9w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4QkH-0003rZ-FS; Thu, 14 Mar 2019 13:50:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4QkD-0003G7-C3
 for linux-amlogic@lists.infradead.org; Thu, 14 Mar 2019 13:50:03 +0000
Received: by mail-wr1-x443.google.com with SMTP id g12so5952024wrm.5
 for <linux-amlogic@lists.infradead.org>; Thu, 14 Mar 2019 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LopwxDimRT8UjyEYLKdAqKMp3HyHxeVVB6mLtEYK2Pg=;
 b=DEK3e7jXnx99b+eK6vj424kE8CI5tN/CLiNyjBVJ18/VABvP911FtXthdLqTHmqsKX
 z+rE5vXM55cY9r4xuv205zn6gwUONqfphvFtket9SqkAVLCKK04iW9MfE2zCRYl8wyZ6
 shz7MU1wR74gXNfXPsexZLOgMXvjYOp0WMfee1ruxEUGo7PiYE9Dzwg449BcmEhyyWQ1
 QOcQDJtvA9o6dWef3TfopSC05US2cbVmkW5Rl0nCLKXyWq8VGvzegNpTTww5f1d8M0jF
 LZ44RKAkfxq3QtG5rPc6cwVyp+wMb1+iR+gsRpXPwt0NBu02xOvGqLu64uJVQxsW2n3m
 ETlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LopwxDimRT8UjyEYLKdAqKMp3HyHxeVVB6mLtEYK2Pg=;
 b=looTHg/+vOcTFLtg1AygmkF55cCNTvIp+leyF5JpSaF24i6Nk7VvmqWaqqc6B10d1V
 q7YpSdXlka2qoOtyzMvgAuCqbpM2s96MXsxMZWkmtdeefW0tkqXj8LhETBh3SvdSbH/7
 +p3U4Iy4S955DYIRfddSV7oA4LXXaivcdsZ0pkYmcwmHmkdmTpw17OFSlVEdpGPlgMZz
 ZbvvfjKkpEp7JvY++9t7uIEDniz5DNBVeBEPXcik2N/MaJs7yezvklx6cpxzbNobUlbg
 2aWyq23U+A2bJcFZomg0xTuawBMlbF8IoJp0YssxzGqIgcN9LOL2FlecJ3fSFTiRvT3G
 ud8Q==
X-Gm-Message-State: APjAAAW6YIs1VEmFHqFkUWcZ7Z5p6WWdoR0oxAq0Bc6yt9J3JffZOasj
 VKimBZvbSru7DFA0E10HUylu5A==
X-Google-Smtp-Source: APXvYqx/kBNzg0o902tB4RLR8XzW5YSFoBpOwlFon0LDhyLKRvqEPlgLXja/PTNtp+PohvLWIvWXsQ==
X-Received: by 2002:a5d:6643:: with SMTP id f3mr11213036wrw.120.1552571399328; 
 Thu, 14 Mar 2019 06:49:59 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id y8sm12079963wrm.8.2019.03.14.06.49.57
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 14 Mar 2019 06:49:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net] net: phy: meson-gxl: fix interrupt support
Date: Thu, 14 Mar 2019 14:49:45 +0100
Message-Id: <20190314134945.17300-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190314_065001_477700_B7789989 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If an interrupt is already pending when the interrupt is enabled on the
GXL phy, no IRQ will ever be triggered.

The fix is simply to make sure pending IRQs are cleared before setting
up the irq mask.

Fixes: cf127ff20af1 ("net: phy: meson-gxl: add interrupt support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/phy/meson-gxl.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index a238388eb1a5..0eec2913c289 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -201,6 +201,7 @@ static int meson_gxl_ack_interrupt(struct phy_device *phydev)
 static int meson_gxl_config_intr(struct phy_device *phydev)
 {
 	u16 val;
+	int ret;
 
 	if (phydev->interrupts == PHY_INTERRUPT_ENABLED) {
 		val = INTSRC_ANEG_PR
@@ -213,6 +214,11 @@ static int meson_gxl_config_intr(struct phy_device *phydev)
 		val = 0;
 	}
 
+	/* Ack any pending IRQ */
+	ret = meson_gxl_ack_interrupt(phydev);
+	if (ret)
+		return ret;
+
 	return phy_write(phydev, INTSRC_MASK, val);
 }
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
