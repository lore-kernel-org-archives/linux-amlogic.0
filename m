Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CAFAC10F05
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 14:15:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CE8E21850
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 14:15:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CROskHuh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nNCFLy71"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0CE8E21850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jH26sUyFVhyit98W++HSWpnEXS38LsUxo59X4CvIPXM=; b=CROskHuhrQ5PC2
	JdLeNcnP+5DBXwfZ3a7C/rpWR+NbUb0D/PlFGvhobHxcYhXG1Z2YuCsobQiUwDLCNNH46w5Y/vtZg
	aYxKpwCjZ4AO6OTMvCgiEhUlBg5g/gU7szWmpdAHneEQd+DHfqWUUR2dSPcMoG1+bAKqCm8Mtm+ib
	ChTRItnYKLlbg/dZ4vzoSdMXZF8Fp/lqqkvfhKs1CPJqIqjN0knlIGcAzcooCneIv+SMgq6ZAAnmR
	xjbc9F4mIxCKoH+ZxeJRpQ82AM3I9/Igq/1k2A4UR8t8nBWWAkHlVO1i//vQ8zBTC49jR3qfPC3mM
	NSwB6Iao7d/dpb1er86Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h9sI6-00080I-26; Fri, 29 Mar 2019 14:15:30 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h9sI2-0007vf-4M
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 14:15:28 +0000
Received: by mail-wr1-x443.google.com with SMTP id q1so2837955wrp.0
 for <linux-amlogic@lists.infradead.org>; Fri, 29 Mar 2019 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gSe5MubfDDFMdYdBkB1bnX6EGj1Asq+NDs4nOR6+nzA=;
 b=nNCFLy71Xa6tRPJm4FKbbPkUtQBCXU0qXOFc/MaRzVDdhl1WZD5FT8H9zfyTwQ/Gx5
 t6ncWGK7oFbDFULtZXI036nkABx3sCqG8z+LmDW4GGz9G4AaKFzkRIzpgkm/FQ6RSUw9
 WqtD0yb8O8UDBpDgl8tuCDVcGzkC0tKIQVTo0N1YyBYAgZDaD3QyCCUov7gzDDA96pEB
 KQ1u4Q7YwEAoRK3/8e20NuGEGiYRkJ/7DEqnduq9Gi2JVqEPEGz9XsBVh5htTTBGx5BU
 4wCqy7H7kj2AkmOWKJFmMhNdmnRLNpOKvOrlBnvYxQVZ5Z0oG2Y6bnIZhbnYE0iBKDBm
 zAVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gSe5MubfDDFMdYdBkB1bnX6EGj1Asq+NDs4nOR6+nzA=;
 b=q2dS9tcGvBEepycg+6bTM5I3YsyPJnMpn8eEhbeG22tIIEc8GeHK5Um9eSAHUycnXw
 uh8I1IPx/JigJVts4JVZ/0J88DFOas8Wh/rfJz++K/0VFdPQJLT9y9Z9Ed0mO4rL7vrM
 0kQCB1cuu8F7kEc/2t+g3ytDzQZlAzfCP1Q5Jp9JYmh/DuCo1k37vmP5qXkHaH5/8rCW
 1Lk5RYOePgPKYev5NR+vKpiqI+xjFLBvgWUsHWCw5l+YXYrf95Q54HQbHCr8pJW3TWgW
 UsiXL4ry7lEBEuVCHppgMZI0yrP7hB0K7ipgUB7gDciTb4mf/b/iJ8W/Ep5KKiD5nQcv
 4IMA==
X-Gm-Message-State: APjAAAWWZN69F4llgeP838euz6iAVRappGifaZztgvjAp3K0N1OZWonn
 O9O4Gs4K+e1K6fVm0+MsAlIkFA==
X-Google-Smtp-Source: APXvYqzen2VR+W18Mc/lnJd0tpThij1hXdlUhEPX2/aN3JHhaHX5BQm2HqG0pfdCSTies/Cl6naetA==
X-Received: by 2002:adf:e692:: with SMTP id r18mr33703384wrm.231.1553868924508; 
 Fri, 29 Mar 2019 07:15:24 -0700 (PDT)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 67sm2464333wmz.41.2019.03.29.07.15.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 29 Mar 2019 07:15:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH net-next v2 3/3] net: phy: meson-gxl: add g12a support
Date: Fri, 29 Mar 2019 15:15:12 +0100
Message-Id: <20190329141512.29867-4-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190329141512.29867-1-jbrunet@baylibre.com>
References: <20190329141512.29867-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_071526_179464_D72AE33F 
X-CRM114-Status: UNSURE (   9.69  )
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
Cc: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The g12a SoC family uses the type of internal PHY that was used on the
gxl family. The quirks of gxl family, like the LPA register corruption,
appear to have been resolved on this new SoC generation.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/net/phy/meson-gxl.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 0eec2913c289..49cad0f4c79b 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -237,11 +237,25 @@ static struct phy_driver meson_gxl_phy[] = {
 		.config_intr	= meson_gxl_config_intr,
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
+	}, {
+		.phy_id		= 0x01803301,
+		.phy_id_mask	= 0xffffffff,
+		.name		= "Meson G12A Internal PHY",
+		.features	= PHY_BASIC_FEATURES,
+		.flags		= PHY_IS_INTERNAL,
+		.soft_reset     = genphy_soft_reset,
+		.aneg_done      = genphy_aneg_done,
+		.read_status	= genphy_read_status,
+		.ack_interrupt	= meson_gxl_ack_interrupt,
+		.config_intr	= meson_gxl_config_intr,
+		.suspend        = genphy_suspend,
+		.resume         = genphy_resume,
 	},
 };
 
 static struct mdio_device_id __maybe_unused meson_gxl_tbl[] = {
 	{ 0x01814400, 0xfffffff0 },
+	{ 0x01803301, 0xffffffff },
 	{ }
 };
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
