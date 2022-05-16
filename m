Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEEBC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 May 2022 07:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MXTXWAexiEU8UpOOip5awf2bq9z1Hz/vzHCvL2zotKU=; b=lFJlTkVPwQGVy8
	gU1hSK2knWCHhBm6sjKry9/oz91axgwJs7wEKfUeQQmdrvw18dISycao4fxhFKjaGpZFADdYhVbhw
	dB8PtwJOED3rDYVBFBQSrc2MqfBZabX639d6JWVgW16Vj32lSu1RXVIwIHMZJWKCsrizk1dJBb0/y
	EA3+h4lKH/bf+f5l5hJ0Sp+I04H7t9K8S3IT7QDVK88fO+ldU5KIuGYe8qFSOA+UDPK8oD97ret0X
	H1v/aNr2C1jFO9Uv+fE2y8ECXn1TiByzVTWINYZca8oKvgP40rC8RTxoaDRPe2t0aNUl+RjpSYiz+
	r57/DE03RdwCabG22KMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqV4c-006QIU-BD; Mon, 16 May 2022 07:23:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqV4A-006Q4o-2p; Mon, 16 May 2022 07:22:55 +0000
Received: by mail-ej1-x635.google.com with SMTP id kq17so26856139ejb.4;
 Mon, 16 May 2022 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=J4zEfCzFiz2vNhPIgLN9iLY5RMLWZ9r2xPcP4Z+eml4=;
 b=jTx6tyW8v5C7uUHu9n5jOilXZA2LzPMgXOixCTPK5+D/Jos2D30jcno1+1YGy5S0kg
 81mQ+TktykWhoIXLgeCVvfJe/ANynH7qefCbFs27lSOfOaPzHMeH+VWuCHDYkACFJ6VH
 D6qjGciPRBkfjl7hP06guRP67uRVU5VSvGh2CAcMV1x/dzQYt7D3JVVees9uXQHTWPDf
 6bHSv4NlhPaW/fCHo0mc5Uq2Z+k1zvrUx5XR8Q5XqXw4dED/GDYBYcznmSmSc1XEIfFu
 k90oMvk+RG9ojmHrAc748Z9RXf0muP0LDy+GFweC18teV/rCfGOneP9OdFzMlaF7i4Yr
 Jv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=J4zEfCzFiz2vNhPIgLN9iLY5RMLWZ9r2xPcP4Z+eml4=;
 b=BfyvrfBwCPS58iF+X6W/tCYsTDGvGB6mnmIPh8++aQ8AX9thvH4LzUdeO0bg33Wia7
 oAulUM+srsu/MQXk39OffSAs0e2ZJ0422V57YCJkPh6KS4TXbSI7QmoOyRoqic+AL3+s
 7jHCZZ+gr4DFlw7cu3t2pG3tOhcecfsIcePiYz0XCFuStSf9Af1wpBoFlJvbcpWJU9JZ
 hz9mXIQ/Kj4GnWswZQkkvjLawBpF9cbIOMZ+57hM+T/CzPxxgouZYpVIjTRjWt/YToln
 dII2+xKELAIZB/wuN+JrvW/KU/V20R9sFeFRKlVl77o9u3+sWvZdwKTAjXB/rRxGLZhN
 cLIw==
X-Gm-Message-State: AOAM532D+Bx7Pocv/zVmdFv5kQu2p7qiOrLoW/IiBSfLe9cdR0slGuGv
 l3kHEK0RCOgbAYSieB2wYzU=
X-Google-Smtp-Source: ABdhPJwQJSawA7JRHf14WPm4hYYYxXwwXeH60jg1o4+rfg9vJsnrU3YGEdPPKSETS4TZktUGXcd/vA==
X-Received: by 2002:a17:907:969f:b0:6f3:dede:f2d2 with SMTP id
 hd31-20020a170907969f00b006f3dedef2d2mr13684088ejc.511.1652685769688; 
 Mon, 16 May 2022 00:22:49 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id
 el10-20020a170907284a00b006f3ef214e2csm3434769ejc.146.2022.05.16.00.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 00:22:49 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>,
 Dongjin Kim <tobetter@gmail.com>, Furkan Kardame <f.kardame@manjaro.org>
Subject: [PATCH] drm/meson: add YUV422 output support
Date: Mon, 16 May 2022 07:22:45 +0000
Message-Id: <20220516072245.10745-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_002254_157633_2E397039 
X-CRM114-Status: GOOD (  15.85  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Dongjin Kim <tobetter@gmail.com>

Support YUV422 output from the Amlogic Meson SoC VPU to the HDMI
controller. Without this YUV422 format out of the HDMI encoder
leads to using the dw-hdmi YUV444 to YUV422 color conversion which
gives wrong colors and a green line on the left edge of the screen.

Signed-off-by: Dongjin Kim <tobetter@gmail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Furkan Kardame <f.kardame@manjaro.org>
---
I've had this patch in my sources for some time now; originally picked
from Dongjin's mainline branches for Hardkernel boards and tweaked for
some minor renaming after DRM bridge changes were merged. Furkhan has
reminded me this is still needed a couple of days ago and now the same
issue is reported on the mailing list [0] so best to submit it. If a
fixes tag is required? please advise the commit and i'll resend.

 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 5e306de6f485..08529efb4405 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -218,7 +218,8 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
 	if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYYVYY8_0_5X24) {
 		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
 		yuv420_mode = true;
-	}
+	} else if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYVY8_1X16)
+		ycrcb_map = VPU_HDMI_OUTPUT_CRYCB;
 
 	/* VENC + VENC-DVI Mode setup */
 	meson_venc_hdmi_mode_set(priv, vic, ycrcb_map, yuv420_mode, mode);
@@ -230,6 +231,10 @@ static void meson_encoder_hdmi_atomic_enable(struct drm_bridge *bridge,
 		/* Setup YUV420 to HDMI-TX, no 10bit diphering */
 		writel_relaxed(2 | (2 << 2),
 			       priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
+	else if (encoder_hdmi->output_bus_fmt == MEDIA_BUS_FMT_UYVY8_1X16)
+		/* Setup YUV422 to HDMI-TX, no 10bit diphering */
+		writel_relaxed(1 | (2 << 2),
+				priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
 	else
 		/* Setup YUV444 to HDMI-TX, no 10bit diphering */
 		writel_relaxed(0, priv->io_base + _REG(VPU_HDMI_FMT_CTRL));
@@ -257,6 +262,7 @@ static void meson_encoder_hdmi_atomic_disable(struct drm_bridge *bridge,
 
 static const u32 meson_encoder_hdmi_out_bus_fmts[] = {
 	MEDIA_BUS_FMT_YUV8_1X24,
+	MEDIA_BUS_FMT_UYVY8_1X16,
 	MEDIA_BUS_FMT_UYYVYY8_0_5X24,
 };
 
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
