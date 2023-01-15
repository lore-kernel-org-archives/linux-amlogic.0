Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1E8C3DA78
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Jan 2023 15:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tgtcx2bbZsba1MSSJ+veREshK6SCaV6viotfGS4TVFs=; b=nF5CmEm2c5IsCZ
	j7iAy5CHIy+D+rOsT74dySf+XqQwQoXIxAQ5yhVSjwQEXlp/D7Y/o5D2Kd40UsFM9MclIuYxln1Oa
	e7/zb8XEtXtrWUBkAXx82whtP/z858pUlTcbKi29u2zcFcmryoyOAIiYYYN+FsEPWPaUWYev2+6bu
	PH5WYOeJgmo78y2qN0Wq40JejRxs8GiGJ8NkggNJALxaETV8sLEPubXKQrFVhtHODZmzesw2j5z/J
	G5CBeL6maZeXD4AyWNZpySA6+il01vLU0bdtlYJ68Fy63p/2+xc2FKwtMQ5dXMGneczjpSV3z409W
	ynudbzVxyd8pvxTMc+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH4nc-007Yrc-6J; Sun, 15 Jan 2023 15:19:56 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH4nR-007YqO-DU; Sun, 15 Jan 2023 15:19:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so979508wml.3;
        Sun, 15 Jan 2023 07:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eaCPm5Hinn1eniYbRr5OWrqTj6tTQJAVUJSjLSS/QD4=;
        b=jNvf7rJeU+1mgCIJLh/onx2OCkFCPpMuASxmlALSJKTiAg3E/Sj3Vt4fJesJu0Yiho
         +x2P0VGq5N7/MlIZfXL63t7Mh5SZMqHVh/HVcLXNP/Yw/s9IvXjVOBNdpUeCaREXiMAj
         8MRYgvvI84FzNeo0jvnJ2mlHS9Yd4t2SXL1mmEcFKHuG+4XIZQBT9CkOF20m/cEPE8qM
         bukE4u7M6nwCHAI4Qebff1lvSw2dYQlr5Wuq3FoTUHbxiwlJYD12PldT7DL9ap16kyCJ
         1wGdkrBkYRC8OM5Uuk4kXMih5HrwMwGMLB45dPNWtQVswZuSA1scCGAEjOA2I2JnNsAo
         kvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eaCPm5Hinn1eniYbRr5OWrqTj6tTQJAVUJSjLSS/QD4=;
        b=NyZh7R/UJXmdaLv53uXEsAhALIH2psxrk/ZzukVEVXedGss+NXuHPkvS1bEoboljgN
         mVUED5ZRYAI1IZ7ff+DFJKiimcUA/cGXEv9TbkjeXY2WRJ4Om7ucutoAdr5j7iz3YPpu
         I1FXz9EaGNafT88OtLmSwRlR4mUauIHvYOv0x/nFOzNbB73CW2nlrs97VNmlmOpjDgtq
         maKaDqQXAmjvljATXVEspx7xZK2K4w2U8coAVACQ0Rz/dLJ1siL0ZC5KK5Kmh/oUZnAq
         Kw4hrF6KPFvWfWLnZMAT7qv7IShIZTZVRNuF2DnUptg4k7CiBctD5aINoGU06RUv52Qg
         zgpg==
X-Gm-Message-State: AFqh2ko1NWFe3lNoQoz0+lYsepfLD4yi2acEc6cFTXnYP2f0BYI6PITX
	3DDuqtNjpxLCo2chbcOgZFw=
X-Google-Smtp-Source: AMrXdXudPxk8N5DX5zzZlJ0F+fu4HIYrlmr1R3gJHjK/XhsOZN2QxxoX/tyatBMtbr3YdYIQAa1JOg==
X-Received: by 2002:a05:600c:c10:b0:3da:f5e6:a320 with SMTP id fm16-20020a05600c0c1000b003daf5e6a320mr2753661wmb.22.1673795982958;
        Sun, 15 Jan 2023 07:19:42 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e61:8c00:154f:326e:8d45:8ce7? (dynamic-2a01-0c22-6e61-8c00-154f-326e-8d45-8ce7.c22.pool.telefonica.de. [2a01:c22:6e61:8c00:154f:326e:8d45:8ce7])
        by smtp.googlemail.com with ESMTPSA id l24-20020a1ced18000000b003d99da8d30asm35272436wmh.46.2023.01.15.07.19.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 07:19:42 -0800 (PST)
Message-ID: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
Date: Sun, 15 Jan 2023 16:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next] net: phy: meson-gxl: support more G12A-internal PHY
 versions
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_071945_484886_5A7CA2D4 
X-CRM114-Status: GOOD (  12.07  )
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

On my SC2-based system the genphy driver was used because the PHY
identifies as 0x01803300. It works normal with the meson g12a
driver after this change.
Switch to PHY_ID_MATCH_MODEL to cover the different sub-versions.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/meson-gxl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/meson-gxl.c b/drivers/net/phy/meson-gxl.c
index c49062ad7..a36d471b8 100644
--- a/drivers/net/phy/meson-gxl.c
+++ b/drivers/net/phy/meson-gxl.c
@@ -262,7 +262,7 @@ static struct phy_driver meson_gxl_phy[] = {
 		.suspend        = genphy_suspend,
 		.resume         = genphy_resume,
 	}, {
-		PHY_ID_MATCH_EXACT(0x01803301),
+		PHY_ID_MATCH_MODEL(0x01803301),
 		.name		= "Meson G12A Internal PHY",
 		/* PHY_BASIC_FEATURES */
 		.flags		= PHY_IS_INTERNAL,
-- 
2.39.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
