Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66957C76196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 19:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GnZVajcZMaqn52q1wvRiIFxDYsJc8jy21yQMrcQ7rpE=; b=aiROCap0tdNm+w
	L9tlr8uMWRycmJMxKOBnZQamBxSxTEviH41nRebZDNOWQQKPffXIGifQ8guVqdxSxcQrPMhvieMQ1
	bJqjgu79xj/Dphn6FZXYaUVe9DvocK+0gFYfWiPYI5EQ6Cg30FlVvPCSu9gubMQ2fLFlE1vWEWLQ3
	9qk6CeE6x/Y3RClRJNcNjEnK+JrZFXkFL2p4qvPWfEbsupLvqmEI3bl+nfd9LlScjgHXmm363tAfH
	XmJW0+bYnvFQRQmx82/a45cXru0ZCSEs5fdENkomhcZ7ROZr9K6uK3sNmzRZoCfrfd0/T/U/Z0C+6
	XiAKmmCKqLPZmqST1+1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPy9-00GQGn-19;
	Mon, 03 Apr 2023 19:35:57 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjPy6-00GQF7-2J;
	Mon, 03 Apr 2023 19:35:55 +0000
Received: by mail-wm1-x32e.google.com with SMTP id i5-20020a05600c354500b003edd24054e0so20519276wmq.4;
        Mon, 03 Apr 2023 12:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680550552;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NZa4opcsQoodNo90FIgyVx9zfFS6hTIMu8uKrI/HoBE=;
        b=k0MUwoon6K0lNUnxM5Krlg5gXyH3AhpXn+KQuT/7o9NEjfFF83EqYwFWGNq5rbC4Ry
         k4az95ATeNfp/F8JEKiyDE0JXvqkddGNevtGi5TfKsNmrv96WoQSZUiki57LWHVD0K49
         DxQnCBTFTeOaSef1LNcNTp2gUDeYaHOEj+VZ5Lc7aAAYJiQtSDC9RdADB++8wM4MUp43
         zNd7S/1SOgqCHVjRqZpFhFookWCiqZjC+rO3+lceEGKSo2zyfeI9/Jca4NUmONavz96+
         4J50BMLQO+EqAcKHOV5SPAs+6jbxp36eOxp+slhGow3kyPhnyIIhg9VMgdILd1i9H/lS
         Zikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680550552;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NZa4opcsQoodNo90FIgyVx9zfFS6hTIMu8uKrI/HoBE=;
        b=WGevWj86bPrpYNIRKbf0k+A1Hu1QZXzfKHgrs99L9axjBX5vGFDPdiTnnkotgfXcvB
         aZ3oydju0VXiFPwwsgClTA8K+6g80a02cI3lHKDMaYmkriwq3cG9D3KBtMQv5ZZW5f9C
         12hvkWyBbjzX1/YBwrbbE0FhgtYzbkSY8g4AIi2p9fskHH3tgtzalmUU1DPPkTVNzZs8
         XnvYdTHyZS/GXo7L3nuvhUHCI8AyUuiYxOA/IyJr3lxvyNnZlZEJHA1I2TrWTvwzXFTT
         IafEmObhw7hzSpJdrLOXfgkomIf2+y4mAcdg+pF1NpW0dY0nD7Zglq7pWF2FwXCzdayT
         SG6g==
X-Gm-Message-State: AAQBX9eCfjhyiBDMmt6Rld/a4y6vxFBVvGzATxZtNbvNafPMeR38gc6l
	GW6kLwen3VUIeKqdyrIZYT4=
X-Google-Smtp-Source: AKy350aoK99yeB0PWJO20XA2MQsMGkOoctlQcatFgis+Mzn6VXzxU7reL+CTXy9enPnSyw8EpYZsrQ==
X-Received: by 2002:a1c:7c12:0:b0:3ed:29e1:ed21 with SMTP id x18-20020a1c7c12000000b003ed29e1ed21mr381957wmc.37.1680550551618;
        Mon, 03 Apr 2023 12:35:51 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b9a3:9100:5849:b3bc:e358:e393? (dynamic-2a01-0c23-b9a3-9100-5849-b3bc-e358-e393.c23.pool.telefonica.de. [2a01:c23:b9a3:9100:5849:b3bc:e358:e393])
        by smtp.googlemail.com with ESMTPSA id u17-20020a05600c19d100b003dd1bd0b915sm20412682wmq.22.2023.04.03.12.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 12:35:51 -0700 (PDT)
Message-ID: <8d309575-067c-7321-33cf-6ffac11f7c8d@gmail.com>
Date: Mon, 3 Apr 2023 21:35:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Chris Healy <cphealy@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: phy: meson-gxl: enable edpd tunable support for
 G12A internal PHY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_123554_753233_49480F63 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

Enable EDPD PHY tunable support for the G12A internal PHY, reusing the
recently added tunable support in the smsc driver.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/meson-gxl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index 3dea7c752..bb9b33b6b 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -210,6 +210,10 @@ static struct phy_driver meson_gxl_phy[] = {
 		.read_status	= lan87xx_read_status,
 		.config_intr	= smsc_phy_config_intr,
 		.handle_interrupt = smsc_phy_handle_interrupt,
+
+		.get_tunable	= smsc_phy_get_tunable,
+		.set_tunable	= smsc_phy_set_tunable,
+
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
 		.read_mmd	= genphy_read_mmd_unsupported,
-- 
2.40.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
