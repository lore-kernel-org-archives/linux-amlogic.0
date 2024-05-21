Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C0BC25B74
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2024 18:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l9AvoiyXjvJ6EzMk4vNkun1NHaoKG7CeccBlp7D8/rY=; b=WYLDnZTv6IlJkS
	eNNkEYwUBja54bOeEAG1n14IgsqY/3cNuKg7xjXUE9uuU8bq8m15gu3BWP/gwU5vRFv0OecPiNLwH
	MMXgr/Qhsz/llhVGImAaQw982CCV056BU0Yhj2pzS/r6P8o8v11cXbTrFWTJ/I3U1ig/2dtrM7Uw4
	+aELFBFCxuspTsrOFNtJchqu7pbFlyEKIWJ10EYRrWsCs9cBepDqHsY5/48jqskw4Moz+cy0UnXS1
	gkcisrdlSAaWtE00qvRO24zkcTZz8rqLL5az7Q4D+LrMHwPMj5Y9bXj3sAS5qzZ2bIUGBQ0iPRDNB
	QGpd1WSsX0fYr6aL2k9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9UfX-00000000qR0-3kLn;
	Tue, 21 May 2024 18:57:03 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9UfU-00000000qPu-0JBU
	for linux-amlogic@lists.infradead.org;
	Tue, 21 May 2024 18:57:01 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2e3b1b6e9d1so67200091fa.2
        for <linux-amlogic@lists.infradead.org>; Tue, 21 May 2024 11:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1716317816; x=1716922616; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wK5e67Jdl5vfjzEOu3Eo6/JgeP8I4p2OioGReqzd8h8=;
        b=JmmRy06N6nYnUXCY1TeH0/5m9A/6l6Eh/g8cfjDxrIbmU/+MWMH/MIJ+ZJ4i7d2uY4
         WLCtY81RKsZQSx6imAEJLCCm5n3dq42HqPgMgJXUmRc5GK6e2n/E0CWm2tKye/a8Tdcd
         uag5r/HI9E+3Nw/kBKmOvgaIhk8LGrP9CiVpgRGKsNvH2Ae1NTZ48sqijEZB5gYU8Jqt
         Fn9hvQi2DlizdPnc/cLZw4il3AqLsPhTBtch6sbHOOTryU7MD8VKOGGEyldY0fgKkZfm
         w7b/BV7z91VPQjBpJ1I1P/q/sVCB3iW/JisAWh1ufSjbUEHnDn4KSMqTowuC2NbtrpwZ
         po9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716317816; x=1716922616;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wK5e67Jdl5vfjzEOu3Eo6/JgeP8I4p2OioGReqzd8h8=;
        b=RG8m9fHTsOy7Uuu4EsMYT0QFcm5rMH20Q5NTP5kxTeJaJWl7fSvgA6IvHPWoDsmYhe
         /qf/xbzXzZlGimI1yoQC2vuBhJROmg7SVohvWDrQn/73+1SJuBnyDjf59cYj0Ck5dBPn
         3pkPUGUO76X1GAVJ+vIRt3c5MEKDkdBvo0ND+oyPrBOBh1q+p4Hrp1ZeRnHzUfOmrflc
         bf3wb76uinJ9wb9lyr3Ym83JzrhFNo0dvqHnZ0kHNfViC+yT+Rk5C0Ax1weczeG6n1ov
         VwrBKrTErJsmuL+l4VmIxZVi6dF7F5CV+Jh0iRd1KjnE9MlD/mHaP8zlPL56+mHbf/rp
         Pozw==
X-Forwarded-Encrypted: i=1; AJvYcCWtWP9Nfk22NjAJUx2Gh/P4WlACW6Fj4bZ7fqy8/m9SYmMVlxSR7de9t4NbyBqGIyf9P1BQL2AxOB6/85mRTY5oX4IwZx+ObqhNsoBsbd1lwJk=
X-Gm-Message-State: AOJu0Yy9DR5sTLQHmU3KcKtEgL3HElZtU9v3EuYG05sMM0blls/ZqWw3
	f5r9+wZWMpm0u32boF9fthLbv5eUxzNfJtZLjHpb/sw/wl+CrLmecesofLbp/Rmi73ok3KMiyeO
	Fp9esI6mdUFqp/DL/QfEuMJF8TjbJPl+8+Guk
X-Google-Smtp-Source: AGHT+IEqPa+du8fjYKGXkpILJkupqk3Qb0cGifkvSVqA1SHvtN7Dt3pRQ9a8SeREQmZzpASy17m8MSkPD92GjkUvBm8=
X-Received: by 2002:a2e:a58b:0:b0:2e2:891d:5f62 with SMTP id
 38308e7fff4ca-2e51ff6692amr237140221fa.29.1716317816220; Tue, 21 May 2024
 11:56:56 -0700 (PDT)
MIME-Version: 1.0
From: Da Xue <da@libre.computer>
Date: Tue, 21 May 2024 14:56:45 -0400
Message-ID: <CACqvRUbx-KsrMwCHYQS6eGXBohynD8Q1CQx=8=9VhqZi13BCQQ@mail.gmail.com>
Subject: [PATCH] net: mdio: meson-gxl set 28th bit in eth_reg2
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: linux-stable <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_115700_417241_EF98EF39 
X-CRM114-Status: GOOD (  10.97  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This bit is necessary to enable packets on the interface. Without this
bit set, ethernet behaves as if it is working but no activity occurs.

The vendor SDK sets this bit along with the PHY_ID bits. u-boot will set
this bit as well but if u-boot is not compiled with networking, the
interface will not work.

Fixes: 9a24e1ff4326 ("net: mdio: add amlogic gxl mdio mux support");

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c
b/drivers/net/mdio/mdio-mux-meson-gxl.c
index 89554021b5cc..b2bd57f54034 100644
--- a/drivers/net/mdio/mdio-mux-meson-gxl.c
+++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
@@ -17,6 +17,7 @@
 #define  REG2_LEDACT GENMASK(23, 22)
 #define  REG2_LEDLINK GENMASK(25, 24)
 #define  REG2_DIV4SEL BIT(27)
+#define  REG2_RESERVED_28 BIT(28)
 #define  REG2_ADCBYPASS BIT(30)
 #define  REG2_CLKINSEL BIT(31)
 #define ETH_REG3 0x4
@@ -65,7 +66,7 @@ static void gxl_enable_internal_mdio(struct
gxl_mdio_mux *priv)
  * The only constraint is that it must match the one in
  * drivers/net/phy/meson-gxl.c to properly match the PHY.
  */
- writel(FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
+ writel(REG2_RESERVED_28 | FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
         priv->regs + ETH_REG2);

  /* Enable the internal phy */
-- 
2.39.2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
