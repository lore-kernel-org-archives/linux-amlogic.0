Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F960C44507
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2026 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=smOQxxPCMyjj3V5YZMngIrQEYFAVFN2S1eGCQ7Ui4LE=; b=2GAvU75oJVi0JA
	iOzm3gE1Z54Pz0JdbJ79NR2vr8a4/oHbTZsfDpWDrf2HuKLNxwHLXwS0O/lqNCbtFw81fNB+O6Him
	gbeVplvQvQQvsZo1oUn2u67y6HkkQ1588w9fselmsPh0qDBiH9gQzrCuT7/ZFx1g5KDoAffqN0Y1I
	jGu7/YP9J5kA8/GpTLYyNtX1gwWl/Nu3yozsn6PgJEEHretF2zjfYsPrqEJRFwmlxbawXEdHvtpOP
	2ZoGxWdW9NLalJQnDjeUYdCshxDHrMwIX91HfkEx1KyVJYPuPx5W8JQy9hg2MVyvB/KsloBSpGVcr
	HZPZ44a0tETVBozMuljQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFW3-000000099zA-2Eu1;
	Mon, 13 Jul 2026 12:12:07 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFW1-000000099wT-08j6
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jul 2026 12:12:07 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso2769786a12.0
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jul 2026 05:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783944724; x=1784549524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yPxreeozyC9OlzBX8SeJZagWhfw9u0AGRhVPID7x7h0=;
        b=CVQ9qVHrhpdT8Tn017WPlmouXXLThonLMGsGlWeG4yfXffo6W6yvr1+Ff4ikwIVZWj
         8TC2TAhrNKJH7rpMfSUUziL03H8Cfl4d04Blj3tf2/W7vB5RoPIDEa70GlsAgLT1XGeb
         5QNXd1EP/3Y4HoPqpMncDthlAKDwGeYgcRO1rATxcLqkE4s/saStWOKSdtgh2dyjJLJ/
         jGHmhfC1GM90ybKZKzLlxSJGf56kvHckWox//lBYzHDOSdiXlS8Ms5RQftvLgzw5ef8E
         mIo59an09WzCTVq+a/r4nibvfhbMm5fIvVA4jIqPcR43Uq85AP1wA5h7KbEdINMJUaAG
         Qw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944724; x=1784549524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yPxreeozyC9OlzBX8SeJZagWhfw9u0AGRhVPID7x7h0=;
        b=d8mL4blBWQZYF8rB6Ff4iw2emnNleJsTEyJnqmlP08cL0Me35mKMd8ai/gvdWAERJm
         Nv3GQoIwu8rI/90Mb8ztE/ZKaNl6aAUZOdDokkq9mA8qIS58Sf8iXv37jHCkDet2dDg9
         fwRnS92l5TljecP+p+dqwGeDa6w9wA8nO9sGdstRMdRsJ9+w9uNdR3jD7PhUnJsA0V30
         8awwazCd5hrNycv+aT+g6mOV9n+sL1x/eMHJy05Tufjsk8sm/ueHOj3dEgOXWo6JBlsM
         8BVr2K3Eu4BwzqB7PgWvVo7Ed40a4vekm0wuPq3OOSiK76JlQCbn86ySRG72d/5xA3bE
         Kl0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqaS7kpDujxc/SsY+zXRucg/gz4VAYisigXOAeLEu7OX8NUyu9tmUm4KvBXwVF5u9lxJIL7kQXcS1bbA5K2@lists.infradead.org
X-Gm-Message-State: AOJu0YzVaguNTKtFeDPG+BySb5bfjsOGLdUnMdmmqNbemcesubAc5K1w
	8Fi2Dh6+2oned8RM96e6qXOAWx8J0IesUIiaxMDaq88zeDOrO8cSVnQJ
X-Gm-Gg: AfdE7cnH359QwbMG4hz3ZXRYeCf5WjxYvEi3Hw2iZlTdGG0hBDyWFY87mWJPhaGFjFo
	Tgi4+udt8g7RzSVmsQCB/dojrQJiHDeB5vdtyOOU8Srrk1nkpYGKfilfHE0nSpr57F87elnAKzK
	SLYDFK/rMRKsC5n/hTrPzWdnjfCKnv30vhqe0BElHVu/oGTJpinkvnQLYzet/6/04RSrIp9rNFc
	HvyEKLW0MGMDfpa8TlJT53Ys/ybVLvdaV6UN63E7iTSlb8BBLEVdZj6n9VbP8pyMJnCdHYECGfg
	93ec6aj8YS9ArK9c2S+nQxXZ0wlT3HFcVfLlCwf1uNqyfSsAoqlKXTWl4SRftBQennmyX+UcyJw
	8KPBb8Y+LUUNN/iJC+dibIfbLyXYry1uPPM5Klp/hPYEJJ2RI3Rz8Nytkb0TnpGUInBOyECl6eE
	uHi1rKcD1mPtsn/dheafNdBfjxLrL2/Js=
X-Received: by 2002:a17:90b:4cc7:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38d13768de2mr15332791a91.4.1783944724165;
        Mon, 13 Jul 2026 05:12:04 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f7293sm67756935eec.3.2026.07.13.05.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:12:03 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:DRM DRIVERS FOR AMLOGIC SOCS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list),
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM)
Subject: [PATCH v7 18/19] media: meson: vdec: Increase VIFIFO buffer size to 32 MiB
Date: Mon, 13 Jul 2026 17:37:13 +0530
Message-ID: <20260713120840.17427-19-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260713120840.17427-1-linux.amoon@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_051205_112047_B0122FA2 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: Doruk Tan Ozturk <doruk@0sec.ai>, Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

During 4K video playback, the hardware Elementary Stream Parser (esparser)
can rapidly push massive burst data payloads into the Video Input FIFO
faster than the VPU decoding block can consume it. This causes a buffer
overflow when stream usage breaks past the allocated hardware boundary:

[ 1852.587956] meson-vdec ff620000.video-decoder: VIFIFO usage (16779003) > VIFIFO size (16777216)

When this overflow happens on Amlogic SoCs, it triggers an invalid memory
state, leading to stream corruption and fatal kernel panic lockups within
videobuf2 error rollback handling routines.

Double the parsed bitstream swap exchange memory pool (SIZE_VIFIFO) from
16 MiB (SZ_16M) to 32 MiB (SZ_32M). This provides a larger canvas window
to cushion high-frequency frame reordering spikes and prevents the VPU
from crashing on demanding modern streams.

Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index d33cbebc4453b..824e2f156adeb 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -29,8 +29,8 @@ struct dummy_buf {
 	struct list_head list;
 };
 
-/* 16 MiB for parsed bitstream swap exchange */
-#define SIZE_VIFIFO SZ_16M
+/* 32 MiB for parsed bitstream swap exchange */
+#define SIZE_VIFIFO SZ_32M
 
 static void vdec_free_canvas(struct amvdec_session *sess);
 static void vdec_reset_timestamps(struct amvdec_session *sess);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
