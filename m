Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1A0C04A6A
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Aug 2023 20:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gxeauY7oD331+4yTOHY7E8cunKA1GPffR4zwOK2aUWM=; b=kSfHA7ktKEwOVx
	ys977LpbXbChIrruLQoMKo4OYZACtQilKYMxEwP8XWSkCHxWnuaDScyCOANbvoa2Dh0Ser/Gr2LQm
	Qp3xjiKYPVtA9MDKlpgFO1OtJ+fLhkPsf5yw59cuwqZHZ0D/DV3Vd/BVaCiUZ44SUeWNP2IhI9Cwy
	5umggNWvqi+OmL9uSrjZO0ew/mz3KfxfhhsExZPiRKfg2iq5To52Vu8OhJ1R5aO6BNVi3RGHTCC1B
	zCGcORgxfcFb7IWZ+gie+qIQjBz8YIIRH/boS+vTzpCVkzJWzIZLwU/bT6D0GrTqmA3ziibmSC/5u
	Wi6ovxQiMzui/6z0YyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQw4X-003GHC-1x;
	Tue, 01 Aug 2023 20:34:25 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQw4V-003GGR-0B
	for linux-amlogic@lists.infradead.org;
	Tue, 01 Aug 2023 20:34:24 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b9bee2d320so94337781fa.1
        for <linux-amlogic@lists.infradead.org>; Tue, 01 Aug 2023 13:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=libre.computer; s=google; t=1690922060; x=1691526860;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8CNOi8uqBp0VRqFV2aTvXXvJ9qTZ+ISs6tIho5/zJFc=;
        b=jMrHmV0Fn1J9LZX9Q+oeZzwky5JFNfzWGfl20uxacjMXNtznmhPw8NwvkhfKZKSVfX
         pTST3SKomLEg5fSrIYfG5qdOrruHjXAMeqUOwOf5Nvlz3CWa7wtHQOAiVeQtNnkKvjP3
         nM6IWZpAy8L0ZweWxA86FHgwrCc+Hejj8ZCqDS/d3LEbYYFQyCdT1ig5jB7t/NmS8SBb
         3PzLN4AFCvSpGIt8XgG4LYwS2NB/jWPhZZMwsd+0sqnu7FhFlgG2Zu6unnMh/zDpuDqQ
         DgazoF46QIbM+8aqEyKytvSGnN9Dg8yt26oMfafamHGxVe8AAtf7jkVlY9H473FsqtDT
         D8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690922060; x=1691526860;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8CNOi8uqBp0VRqFV2aTvXXvJ9qTZ+ISs6tIho5/zJFc=;
        b=aNLFa1IY5N/cWun924rEnYtohixwYfhVOV1F9OPgeJ/aye4EI+cltYI/usBMC7dLYR
         KzebJ0JN7WQzzo/0v2RTypjjBBgqg4Qn288KfrzXe5VYte3ai4P3lV0mqMtBl30+M5Xt
         yrmHnOaCQCON/Y/aVsi4qP7p6XG/hOlJtDg0/QODE9h7BtcVy4iKXzlG4PBFbnM1JJQR
         la1BFnflQk0iR6gEQvFLNRC8cxRcoYPBqaM43A9QXrgEbo1+AvDVAQShLJHxsnaegW/J
         1ki+sRMiA8RmMAPhjkQJuve/zsNdNVX9ZBTdieiyS1aST6n5soJ2/+o08ymifX8CuWWt
         7tQg==
X-Gm-Message-State: ABy/qLZOzfAZ25KHGr+4c4V72C4Oi0l7qyIF9DeXkvHCf9ilPsENfTAm
	uEc+BrpOvaFFPwiVWFnJowfaTYAiRQhpFc0yNWA3
X-Google-Smtp-Source: APBJJlE46sMvarfXUzqQY3u0s+ouqvsQOql4QLvrIpO8sJ5a0ka8FFJgcq8qtRzSEWzNqKvDaXV4X5I1x4D2G4JRLjU=
X-Received: by 2002:a2e:8256:0:b0:2b6:df5d:8e05 with SMTP id
 j22-20020a2e8256000000b002b6df5d8e05mr3245440ljh.33.1690922059651; Tue, 01
 Aug 2023 13:34:19 -0700 (PDT)
MIME-Version: 1.0
From: Da Xue <da@libre.computer>
Date: Tue, 1 Aug 2023 16:34:08 -0400
Message-ID: <CACqvRUZYH2NkOooE78SK6=Ow07y=YnE2QOSNzyb99rV4vSvxpQ@mail.gmail.com>
Subject: [PATCH net] net: mdio-mux-meson-gxl: set RESERVED0 bit in REG2
To: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_133423_126265_DBD8A024 
X-CRM114-Status: GOOD (  13.19  )
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

The first RESERVED register bit needs to be set in order for the PHY
to come up. Otherwise the ethernet device stays in "No Carrier".
There's no associated documentation for this register bit in the
Amlogic datasheets, only the default value to set for the entire
register.

This register bit is normally set in u-boot so it is not noticed in
Linux. During my testing with u-boot net disabled, this problem crops
up.

Signed-off-by: Da Xue <da@libre.computer>
---
 drivers/net/mdio/mdio-mux-meson-gxl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-mux-meson-gxl.c
b/drivers/net/mdio/mdio-mux-meson-gxl.c
index 76188575ca1f..210a52d98112 100644
--- a/drivers/net/mdio/mdio-mux-meson-gxl.c
+++ b/drivers/net/mdio/mdio-mux-meson-gxl.c
@@ -17,6 +17,7 @@
 #define  REG2_LEDACT           GENMASK(23, 22)
 #define  REG2_LEDLINK          GENMASK(25, 24)
 #define  REG2_DIV4SEL          BIT(27)
+#define  REG2_RESERVED0                BIT(28)
 #define  REG2_ADCBYPASS                BIT(30)
 #define  REG2_CLKINSEL         BIT(31)
 #define ETH_REG3               0x4
@@ -65,7 +66,7 @@ static void gxl_enable_internal_mdio(struct
gxl_mdio_mux *priv)
         * The only constraint is that it must match the one in
         * drivers/net/phy/meson-gxl.c to properly match the PHY.
         */
-       writel(FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
+       writel(REG2_RESERVED0 | FIELD_PREP(REG2_PHYID, EPHY_GXL_ID),
               priv->regs + ETH_REG2);

        /* Enable the internal phy */
-- 
2.39.2

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
