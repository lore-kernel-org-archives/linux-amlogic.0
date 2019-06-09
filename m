Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65144C28EBD
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 18:07:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CFDA20652
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 18:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ovsBdDxj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="A3czi1Dd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CFDA20652
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iVLnMhd7YquJ1x3YweQSZj22/RSJabCs1X6Wx7wlcJk=; b=ovsBdDxj+7cqHF
	r41DgMr9NOUcA4Tn/nmrHP1B4KhaQHJbcVngmpWs0VL9EYFM6NU+eGYqZg22QUQMVzyu4xgV7/AoT
	apGCazEmoVnKzvKIlSELdn36pn/MEFpUNfnVv4LLGA2epn9+fio32/Bf//cRN8m4O9UYioBFAwLjk
	DDJFMeTOon/DRMv5OoRX3yVNXGzg+6D/WsIS8qj/1s4tPbtl/2ubpa0V/LBFR+IBkqiQxwRr44TGr
	BOH/9cypEx+5LRr2XdMELcdTXvNVHBlRxysNWzZFITgPscn7I/WaTfP81cQoQX9hYoM1hoggeufan
	38WNDv6YWenoZ6aTPUFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha2Du-0004C8-FN; Sun, 09 Jun 2019 18:07:18 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha2DK-0003cn-0g; Sun, 09 Jun 2019 18:06:43 +0000
Received: by mail-wr1-x442.google.com with SMTP id x4so4229564wrt.6;
 Sun, 09 Jun 2019 11:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v1cIgIB/50o1TbuP4h7H+LIZ4pZcg3N52gZnolC5tNY=;
 b=A3czi1Dd8xVadhyrRlkBaDwSqjW0C9T7e2gfiqTTqXBWnEx1kL4TX8qXuj3Xy3qfM0
 5iny+h6uiPG/9QeP7zkvWcBhsfeCKwy8CGTIMEvub+SmrvjgDCwUoDfQaHzyiyIDEa+k
 tWDKdLgoefImiuL1ZqWnHWTvo5c59Wq6zCHt/Vv6ZRmsU02qdpxTsPPS/lTTUNkBCGtz
 vdCrDYoSvMO9YuyBmmRGpts6a17UQjzMJAyeAXOZdnpNrhhAGAKW+FZXIi562prgpzQ+
 1QDEdy6DOYRCzaSLxU2HiUEllLqYYxBMD9Ivg3yXp8csBGAoHjwsyF5E/2bbPrtPWCnF
 +pVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v1cIgIB/50o1TbuP4h7H+LIZ4pZcg3N52gZnolC5tNY=;
 b=BFb/QOZPzrLoXRn/hOgxjipB3qkuW24vgCFsVNhrCb0mXLoGJ+B2IGzpBZ/isVl+s8
 j7ryuPugdsCmUkXrgzacE6w0VJJqTzd6VanYcehTh/heRocM+V4o3e4XDiz6O8LcO+2n
 HrA/23SPsykOsrkIHGMDax/zkuPxx9ZmULJ5a5TjGCzgcc1rld/fPw2e9hreNbffGXHw
 4yUvhDiZILeafn1/W97F5VMjYtj+xT0QBMxBLSaVnigGNfmf/jf5CR9vtOg8SqHGJgbA
 PJJTXHWDm55thc1uZfoVQtVe6g04G+6zXSdybfheBFaMcbF5lpK8ynRDHRiGnKU2sEpD
 Z+1Q==
X-Gm-Message-State: APjAAAUaXXacP7EJckqrEhIpfOSKmY4QE8GPYyApU5CQzCtUAN+E9ITM
 FKt262dypETNg+dp+L+rcz2pQvQF
X-Google-Smtp-Source: APXvYqy7+SScjAXQjSTLA2olnCPdQUH0aM8+Jocv0daXnj4LKMXvOjzcZLeXAUQkW+23xSiMaGdOPw==
X-Received: by 2002:a5d:4311:: with SMTP id h17mr43160091wrq.9.1560103597686; 
 Sun, 09 Jun 2019 11:06:37 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400B42D8EB9D711C35E.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:b42d:8eb9:d711:c35e])
 by smtp.googlemail.com with ESMTPSA id h14sm2007731wrs.66.2019.06.09.11.06.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 11:06:37 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com
Subject: [RFC next v1 1/5] net: stmmac: drop redundant check in
 stmmac_mdio_reset
Date: Sun,  9 Jun 2019 20:06:17 +0200
Message-Id: <20190609180621.7607-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_110642_055465_674E8710 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

A simplified version of the existing code looks like this:
  if (priv->device->of_node) {
      struct device_node *np = priv->device->of_node;
      if (!np)
          return 0;

The second "if" never evaluates to true because the first "if" checks
for exactly the opposite.
Drop the redundant check and early return to make the code easier to
understand.

No functional changes intended.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 093a223fe408..cb9aad090cc9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -254,9 +254,6 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		if (data->reset_gpio < 0) {
 			struct device_node *np = priv->device->of_node;
 
-			if (!np)
-				return 0;
-
 			data->reset_gpio = of_get_named_gpio(np,
 						"snps,reset-gpio", 0);
 			if (data->reset_gpio < 0)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
