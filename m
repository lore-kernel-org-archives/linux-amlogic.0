Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED35CCC6B30
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2026 02:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RcQNZj4iFx47/fqb3PqAXKHbV9bIjbSsh/hHZGeBTlQ=; b=ZOgru9GRz6G+ax
	08WJmcShGp8uJ8bRe6rZO/ee/De4tCp7x5GAESIASvkxPSjyAW/1AkDOFkCQUUtD60+YsGEjb9oTX
	2vsGdpjEA2PmzkreU7mMrGX0rfNiYpFXXPsfd7IvqHZnmEW3rhqkw0Q70zWNB71IfAGoXYe2pAapT
	QB5nQQAK8WVVhNtg1EvFxXgGUxdby1MRj8+D5SjRDdro1EC64mIV8y/osUsMQd3OZqEyx6qjr87JN
	ZrcnXNhW4si3yDl5MIgsuqYOCYDoOEvnVMbHp43Rx524jqoihG0j3b8a4EZDt2JEj7gL8hDpCnOga
	qTjdyN0rLDU7PC+SZKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBPr-0000000GgeO-2S7O;
	Thu, 15 Oct 2026 02:41:59 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBPo-0000000Ggdy-3Rli
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Oct 2026 02:41:58 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-53396adbc53so11463641cf.3
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 19:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792032114; x=1792636914; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTqPyeSiS9COwId/RRKFhimUZVSM+7caPHhUGbIiHuM=;
        b=qI2+1Qv+gsGOGFdYydabSpvk7ghWbhf/Iukx2P9VhYkEdEE2pzEdvld9LGM/1ASWSi
         En0FL0Cuacq/jODKuMMLvwMlPTLuHATvUYCtNkYO5PLtpwRGWrZFbE1cOqSprK/JM3J3
         M3LmPghULyM9zVGv3qMThYDsFPQz8QgACxWkE2BoNxmXZAxv7CXnvo9pa6sry/t88kV+
         8PnOo3FapDAfBSiEZ+14NExYH6Yl217gaH3eAqeFxBA6u1hUqEgk4WZzWBGbmrX64CgZ
         kLfHLhU53bEXb1iM27fUtQ8tLiP3xi1VjzJeOlgtA1TI3+9irV6kpZL0qpVb0sVIO8Xq
         mRbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792032114; x=1792636914;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YTqPyeSiS9COwId/RRKFhimUZVSM+7caPHhUGbIiHuM=;
        b=PYSp9PiqUS3Roi7sqJu5eyHNPtnVhGDvmFRucJvKjDAyejsAvqN9C3WdrOQrD9GVdd
         R7EBvEvW/vaX/iw/N+fyiWfGgYTKtBKz6lu4Vsrl6yGMuyBE3DqCdqn2322xfbJ0t7Le
         H6pkEVmbGajZ1BXW7cJNpJSCP7ewxLO8za5HucyjctxVnae8NaqVSpXTALYHMPqtiMrv
         46a2mOHe4QwdtPhdYpSMLcn6nDZhdi4TOCxF+Qs6cjPj2kURVIIE4C6/Z7ujRgc3AQmA
         4QxiPAmvBdmIs3/m8ugv+abuNcE+SrjUEcdEFRFVPBAEcORLTo6/RmZ780Kc00NYMvnJ
         HDqQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMA8Xxe5JOfOJr1z4t8AYBssNrDCtaiCGGBUyjmix/mSfGibNseJobzY7ZaNrTrg0zq+h+GZTbVApbx5nR@lists.infradead.org
X-Gm-Message-State: AFq9FYKf3SE7h6hdqqBnJJXIR13kUQvaIBTxNdwqs2WYJeDsNknATgUN
	GjfE9Plr0QkN4klJ5CFD/LyyBottTIN5mxiK0uGy9iJ34F05m2WLyWg=
X-Gm-Gg: AYBFou1TrG5GKD93nWlwiN4YWN9iPdIa0EzAWGSJ6lRFF8JtVpt3xPnQXPyPAbajvEO
	GsKK6hAjOHO6rkZ0tJ1gtt1L7gRNAPE7IAnt8Gqn1T6p23V48EEWYWC1Aox8DLCLtz1GzvNbWqk
	XEA/ePKXsgKnpjlJemS/gRnaVNeBmgATXdWMOZAGM5UuFSsHhuD4FAuJxsZoEhfd59G2n6VBoEU
	dx/GFSHdmRFZzgrwIbTe8DyJBOIfmW39CqaZFUeBTpNCcK+1al+oUnDeRnRKoAv4+V4OiXJTTSt
	NKTe5fUMTNG0PRV7EvfVBimeNrxjypnd6zhNGHLNjav5IVp2Dk5w8Rp9ktFKUozXTGU0sG4hs3f
	WTFUSdo3DAN1JHGocDBSmEHyl09hakhLMB50fhWelR4r3Y6Yic4ubRdrtPFe+ReS3uPoJAx/ZPg
	/VQQgiYjj6ISN1ho8yIejs8XE+WM3P3i7PwYfRa2OsmaN5OtsqhmFZFTcupZYF6mct2B7xYxXwJ
	Hbg4nHC/B5jBCvu6sglHJ/7oFR/PW3aCgj6g5WVFsn7Ez1qJSYS3JwF4J/dNtC6FFiTMv2LD5N4
	fbo529L0O7nwuxFb9xAirYqDcHKM
X-Received: by 2002:a05:620a:28d4:b0:93e:f5bd:7e13 with SMTP id af79cd13be357-93ef5bd7f23mr1294170685a.64.1792032114246;
        Wed, 14 Oct 2026 19:41:54 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93ef50b6c4fsm644965685a.47.2026.10.14.19.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:41:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] crypto: amlogic - Free channel IRQs before disabling the clock
Date: Wed, 14 Oct 2026 22:41:48 -0400
Message-ID: <179203206852.2659709.13834828335447558448.G3@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_194156_918690_F9412E94 
X-CRM114-Status: GOOD (  12.23  )
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

The channel IRQs are requested before the managed channel array is
allocated. Automatic cleanup consequently frees that array before
releasing the IRQs. An interrupt handler that has already read a channel
completion status can still write chanlist[flow].status and complete the
channel completion after the array is released. A cipher timeout allows
such a late handler even after its crypto engine becomes idle.

Release the IRQs explicitly before disabling the bus clock and before
devres can release the channel array. Do this after crypto_engine_exit()
so normal requests retain their interrupt-driven completion while the
engines drain. Use the same cleanup on probe failures after the clock
has been enabled, preserving the channel allocator's existing unwind.

This issue was identified as part of our ongoing research while
reviewing kernel code.

Fixes: 48fe583fe541 ("crypto: amlogic - Add crypto accelerator for amlogic GXL")
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Compile-tested with GCC, W=1 (arm). No runtime testing.

This bounds IRQ access to completion state and registers; hardware DMA
handling after a cipher timeout is unchanged.

 drivers/crypto/amlogic/amlogic-gxl-core.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6ee..333db2e 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -136,6 +136,14 @@ static int meson_debugfs_show(struct seq_file *seq, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(meson_debugfs);
 
+static void meson_free_irqs(struct meson_dev *mc)
+{
+	int i;
+
+	for (i = 0; i < MAXFLOW; i++)
+		devm_free_irq(mc->dev, mc->irqs[i], mc);
+}
+
 static void meson_free_chanlist(struct meson_dev *mc, int i)
 {
 	while (i >= 0) {
@@ -291,6 +299,7 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 	meson_free_chanlist(mc, MAXFLOW - 1);
 error_flow:
+	meson_free_irqs(mc);
 	clk_disable_unprepare(mc->busclk);
 	return err;
 }
@@ -306,6 +315,7 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 
 	meson_free_chanlist(mc, MAXFLOW - 1);
+	meson_free_irqs(mc);
 
 	clk_disable_unprepare(mc->busclk);
 }

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
