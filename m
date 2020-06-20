Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B56C433DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 19:27:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D61562463D
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 19:27:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nX7oX+f+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qbC+poHv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D61562463D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=feerGYlpmu4OgKaUrCrQiQQVUvyNrj4KPifRqLwCQX4=; b=nX7oX+f+Kp8oAx
	DgJKl1VlIr55SFfNgrESFTFZFjEYLuYh+InvWpQfdr3IoyH5xXfVNhNbgVG/cUaDY5AagcPP3ZAtv
	WZCvEjeUTZy5DgpI7qiHwgmHxdQdzseNl6MVv5XbdWGVV93isQTCcqA7hIsK4zDNBoyL1DzkkaDPn
	eveAg/cfuSfLkdDvXIoKjnZPmxt2sTjIIGTxpsWFjt3imxRZLXxyHddGaSRFcOUio+xk9Wa1otPr5
	ZGyryEOXsjK+w1HUqugrf9nlzHoSWc3Hb+tEXklaatYBnQHQasqEjBdJ77JeWN4RQMXVaIQjd65Fi
	cElBta2d6LwjmiBrLGfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmj9Q-0002dI-RQ; Sat, 20 Jun 2020 19:27:40 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmj8r-00029e-Hc; Sat, 20 Jun 2020 19:27:06 +0000
Received: by mail-ed1-x544.google.com with SMTP id g1so10457888edv.6;
 Sat, 20 Jun 2020 12:27:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=scA6CqquoWk914rmLn3+nLtaspjuXK54NYNT8t78XLk=;
 b=qbC+poHvs39ZVCGTzMyJeIJUpytQ6pFd5qeGE3oFWIyiMKZEs3zbCIIiubSaxryjqV
 fHZRmmlzPFxZAmT4fjc315VsprFu9yXwFVTZN0vi4+ogvLhR+DUhLmUmDWlARfH4lqP0
 r6IiIGw2ywL+HM32SWPgf681lb9qGq8eGvDXWEeP7vGDUbWHKB4A3orCW0P0W8Y6nkSZ
 OgbgK/AvNr8N2kaXrsvn/ZibEN+NvJI3DnlZF4FJWQZOu5Cuhzmm1vvW9LZurAgweB8C
 cz7vBuOmkMsfWs5srbSEo67PGDoGURRN6jPG9y+GnpFnomPdS9ocuZVCOabSLdFbm0uZ
 2lHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=scA6CqquoWk914rmLn3+nLtaspjuXK54NYNT8t78XLk=;
 b=HzLq4R3cQBVWEJ60N8fnnDQu0JHSFQZRoPeQ4McstGdbCumPi6nGSv/rNbUsUWFA7Y
 8HJeLmY7GPukJhClo976UaLPwt9JC0IaALK1b3dewWqxh3g+9mzZ/4W106u44W2wtgYI
 vOsOqi7kEoSTPJbZuPVpBU3bf3XFn84J2Q+iQqkeHSDLykWBdEWtCg4H4YyOaEhr45f3
 MVw9KVb9XXicpZeik152oJsIxfnsQEMqfzpPlHl+LfqvwMfZPtmWdb7PgDDl0g73P9wr
 eAaSUbFHZEl5VrjHNY3e0GLOlUOHwwYuovDMnhkH2v93btnY5typvmQ2+KP0o6Iwn99/
 32DQ==
X-Gm-Message-State: AOAM5333veUqHzkSE6ZYzxzEPbJPapbWZPMTA5PRdm+G9c32fh9iEMMD
 0B+Phvtr+0gtswR4t2Lct7qOJ/Uo
X-Google-Smtp-Source: ABdhPJy+PKswvEJEFTPfiOtJ7Poy9kSHj4bTMlki+nCfU+FckH9OWUmHYVZxY191m6NdiJ0yfebZbA==
X-Received: by 2002:a50:d78f:: with SMTP id w15mr9700997edi.245.1592681224048; 
 Sat, 20 Jun 2020 12:27:04 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id
 gv18sm8034044ejb.113.2020.06.20.12.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 12:27:03 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: davem@davemloft.net, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, robh+dt@kernel.org
Subject: [PATCH 2/2] net: stmmac: dwmac-meson8b: add a compatible string for
 G12A SoCs
Date: Sat, 20 Jun 2020 21:26:41 +0200
Message-Id: <20200620192641.175754-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620192641.175754-1-martin.blumenstingl@googlemail.com>
References: <20200620192641.175754-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_122705_577000_FB3DD67D 
X-CRM114-Status: GOOD (  10.74  )
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
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Amlogic Meson G12A, G12B and SM1 have the same (at least as far as we
know at the time of writing) PRG_ETHERNET glue register implementation.
This implementation however is slightly different from AXG as it now has
an undocument "auto cali idx val" register in PRG_ETH1[17:16] which
seems to be related to RGMII Ethernet.

Add a new compatible string for G12A SoCs so the logic for this new
register can be implemented in the future.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 234e8b6816ce..544bc621146c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -491,6 +491,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-axg-dwmac",
 		.data = &meson_axg_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,meson-g12a-dwmac",
+		.data = &meson_axg_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
