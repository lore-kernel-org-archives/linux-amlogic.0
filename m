Return-Path: <SRS0=e4TN=VY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A93C433FF
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43AD42070B
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Jul 2019 19:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MAVfp5Zu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KeD8rklk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43AD42070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mg0uJIOPeULhGkVSekVXFgyTqq2UUB5A8yECPeP8OyM=; b=MAVfp5ZuAh8nF1
	QZVRZUV46GCgmGzYnU4/GmxIjWZx0NuuIvlAUYfs6JRqhyv6W650ec24Xgmvl4HBPQ/2dRIlvV2Yp
	XwhfQ51wXoJ1x10vP/qi83stpoVTWNJUgdAyvSyPwzz+XnBR9MQO46f7G7mIDIhJeiSulPXxOp9Ye
	navMipBcsW4pF+O7s88lWvLanMsK+OeaOxFQ02M/2pqf/6b2C4SjbqxBdKg78N+VrMVUh9+hCFBh7
	sK9vOegFO6/GXnYIuNDMm34mhBdZcCDMP4wR7l5i5W7Lqg5Slhc6lQ93EM2UzpPLfLEqYpWAVkEie
	ynJOEnB8X97R+xEizGtQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrSGh-0000sb-AS; Sat, 27 Jul 2019 19:22:11 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrSGR-0000gB-Up; Sat, 27 Jul 2019 19:21:57 +0000
Received: by mail-wm1-x343.google.com with SMTP id f17so50195868wme.2;
 Sat, 27 Jul 2019 12:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyCMqJ+djgLIJwfAojIwyPh/X7V6VrUbmzh9dzFGvRk=;
 b=KeD8rklkvJ07qbonyHkVcFLm5trOxt/Yee63IJFNjuX4015xbXSzXntmaTW9aTImNp
 oxTVmm5xSmXNVbNAfrkPp/VZAXkjM4u28ujlUHDrkhN6SFHf4Ng3cgumWYB413NUB1w8
 w+3lFm1IIB1qmSR3ddBEyzWZ5eGLZEmUlt8Z2nZm8RnPftx8W0Hj2NoBFSSNL6bnabZ+
 tRCtzXGiyYZpdBAwei9QqExKmbxAEpA0bponZxkmCU87Crd5nR/qmTrnGP9AiKcHUm9u
 i/7QJHnYUuthCTji0lgypHmuUnY/75CQaKghqbwmCixPlBumwxkUnpRukBV1ElABFEPI
 IbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hyCMqJ+djgLIJwfAojIwyPh/X7V6VrUbmzh9dzFGvRk=;
 b=hNVx7wfZpMzcofE+/zzFMzfmDflzxnBeOPvLHJoGjSRQruuLSa78r5tYl7yob07QMT
 k52BZSQ12xX73pYs3Meh1QYzStgHmsGf6/Qz4NJloaR+vHiww0CpbSgQfLbNnZoqEkHn
 psH4jyISmhvfy6hb66j8fMSyPtnjDqoSn7IE/J+Y2I473Upu/ZZhKQsfv/v5ccneHzHu
 Wv7psLJY9hfmPVCjpx7mTo7U+iXtexX66N2It4UTRhyZ/r/nsLdYQCxBghfHR4QrKSJH
 +XlUC9KjpToPEoCdbR9QvUyLe8wxjZm6gpGhE4rWDYciSA+/WfUlvsiB/RCZrUg5allU
 f9bw==
X-Gm-Message-State: APjAAAXvZyid747kI5koPbSxtQihDs2CLknoUAR9w5BFtSVODkhwKU75
 QURLaQtn0bFFfIw7zbXQmvQ=
X-Google-Smtp-Source: APXvYqycHw5s2j9png7x0EIKV/GvqCO1yWsvU/74NThd+ynVk8oiaeULI52GZ8XNSc4h/2Wj5R34WQ==
X-Received: by 2002:a1c:63c4:: with SMTP id x187mr86098580wmb.4.1564255314634; 
 Sat, 27 Jul 2019 12:21:54 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133C65C00B418D0F4A25A19EC.dip0.t-ipconnect.de.
 [2003:f1:33c6:5c00:b418:d0f4:a25a:19ec])
 by smtp.googlemail.com with ESMTPSA id v15sm55542326wrt.25.2019.07.27.12.21.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 27 Jul 2019 12:21:54 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: peppe.cavallaro@st.com, alexandre.torgue@st.com, joabreu@synopsys.com,
 davem@davemloft.net, netdev@vger.kernel.org
Subject: [PATCH] net: stmmac: manage errors returned by of_get_mac_address()
Date: Sat, 27 Jul 2019 21:21:37 +0200
Message-Id: <20190727192137.27881-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_122155_995069_4C61EE70 
X-CRM114-Status: GOOD (  10.31  )
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
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Commit d01f449c008a ("of_net: add NVMEM support to of_get_mac_address")
added support for reading the MAC address from an nvmem-cell. This
required changing the logic to return an error pointer upon failure.

If stmmac is loaded before the nvmem provider driver then
of_get_mac_address() return an error pointer with -EPROBE_DEFER.

Propagate this error so the stmmac driver will be probed again after the
nvmem provider driver is loaded.
Default to a random generated MAC address in case of any other error,
instead of using the error pointer as MAC address.

Fixes: d01f449c008a ("of_net: add NVMEM support to of_get_mac_address")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 73fc2524372e..154daf4d1072 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -370,6 +370,13 @@ stmmac_probe_config_dt(struct platform_device *pdev, const char **mac)
 		return ERR_PTR(-ENOMEM);
 
 	*mac = of_get_mac_address(np);
+	if (IS_ERR(*mac)) {
+		if (PTR_ERR(*mac) == -EPROBE_DEFER)
+			return ERR_CAST(*mac);
+
+		*mac = NULL;
+	}
+
 	plat->interface = of_get_phy_mode(np);
 
 	/* Some wrapper drivers still rely on phy_node. Let's save it while
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
