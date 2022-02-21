Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAB3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dwY+9RmmSyeetTAHgMsOsGY7R+/GOjRLxOjtxJspb1M=; b=Gap6+I5XhyCC+v
	ay/dCDhKX1JkpJNwMwvYqn1++Ts8YD+7xBAZKRsja2cjLMNQNJv+PaEjR8sU4LJ8DoAw8SQlrNBzL
	l+VuhEBLLyESqGdbN1E2EW5cINIP0ckBOkyqdmd0pkHH9jMMlajrSfwSZkexh82/tbfn8QU85KUQq
	HBwYHS1NcsCSU2Ph7mJ7wEqpFc9+YgIhaIkgetBa96ubuHsBvQt1j379uxadpg3EhQ+O+WrD8EM1+
	sdtKqr7owXfBtZPGIUBxNKkT6M/7tx3BbKXroIR65/XQlCOL6KpALUpaJQCnYbHQNRE3BcZdMQb+k
	BuG2R4uu2lwMTp6ULx1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8QZ-005o2c-9w; Mon, 21 Feb 2022 13:08:31 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Uk-005Y5U-96
 for linux-amlogic@lists.infradead.org; Mon, 21 Feb 2022 12:08:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id s1so259406wrg.10
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Feb 2022 04:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tbukRrC7Ov9F7pBcIG9IeTY2nydApA5tOh+cl5c9cGc=;
 b=SdKLSu27cu2/hHwLhVv7Jo5NLGz2GrSxYcsgEyyOgzdrRUyITQbKY4U4C1U7WkLqFC
 qe6XvaUjxo8J+U50MFASy3E1yA0PwR15dPQnsDWRTVAC+ricUxOKvuthq3wG3aDjC6tK
 dKTfpKygLdl7yWXFNyH0r0r2OoqY6poyYz2Q1LAoIjmPuaK9OFuJBAJ79aGvmHNnaO7V
 KCLzl7lZC1NEBrYXotzVKPVaYafTQB2+4MY96hhBOrR6G4EXfebubkZlfg7Vz5DTDxCV
 PdxZovQ+CBNr264//qDUeHDh8VLnbSD7TSMK1D9etdED/q6eWCNJ04f6eI6/N5DmSQvQ
 Jb6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tbukRrC7Ov9F7pBcIG9IeTY2nydApA5tOh+cl5c9cGc=;
 b=ku0WTLIstkhU3tOP8q1gU/bW/9PGMDmxmQXvSpGUU86luhlQep1vawpNSQq90qxKTh
 x62oKe2UE2rdAME7hYfz0Y7Ezrmcn1v4uDA8CXuhF9yTU/ZqsHs7k5HiWEdfL+DyOw6j
 PWYM8c0vRb8bRonoWqr6IducGspcDsqnQLAKh5C5/rIln/aNd0ru4ql0NiHfsN45fm+s
 GrFhRTaeonI56rw1WMIzqtPu5TkAdYR+KjtRbBSgrSYzN7MhPyeElkSsSn1ncmGADW5z
 ipcOfWOeDEhGHcsn00/Mfe35ToxkQuHzPWGcCQa/Mu0Hg86siEQAuGiOcmxeCOUAhESg
 HRXQ==
X-Gm-Message-State: AOAM5304I3u4bQd/c6oX2jNxIg1bnRyWcRDj0PUFLT3jchoz2ZGHlmmH
 Zkw56/SFYt0+WsIkBQPPvhq1lw==
X-Google-Smtp-Source: ABdhPJy/cSnpe98uh3pMY3LAxU5hDt1WIksiv02kviAW0TkeCF3/8ErsTgLm6Koq7SSLTrdT4sgkuw==
X-Received: by 2002:adf:f312:0:b0:1e8:f4bb:5a5c with SMTP id
 i18-20020adff312000000b001e8f4bb5a5cmr14695631wro.668.1645445321994; 
 Mon, 21 Feb 2022 04:08:41 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 04:08:41 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au, jernej.skrabec@gmail.com,
 linus.walleij@linaro.org, narmstrong@baylibre.com,
 ulli.kroll@googlemail.com, wens@csie.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 2/5] crypto: sun8i-ce: call finalize with bh disabled
Date: Mon, 21 Feb 2022 12:08:30 +0000
Message-Id: <20220221120833.2618733-3-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221120833.2618733-1-clabbe@baylibre.com>
References: <20220221120833.2618733-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040846_432602_8E4242E5 
X-CRM114-Status: GOOD (  10.62  )
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

Doing ipsec produces a spinlock recursion warning.
This is due to not disabling BH during crypto completion function.

Fixes: 06f751b61329 ("crypto: allwinner - Add sun8i-ce Crypto Engine")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c | 3 +++
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c   | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 7cc496c03084..0b1ce58bdeb9 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -11,6 +11,7 @@
  * You could find a link for the datasheet in Documentation/arm/sunxi.rst
  */
 
+#include <linux/bottom_half.h>
 #include <linux/crypto.h>
 #include <linux/dma-mapping.h>
 #include <linux/io.h>
@@ -272,7 +273,9 @@ static int sun8i_ce_cipher_run(struct crypto_engine *engine, void *areq)
 
 	flow = rctx->flow;
 	err = sun8i_ce_run_task(ce, flow, crypto_tfm_alg_name(breq->base.tfm));
+	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, breq, err);
+	local_bh_enable();
 	return 0;
 }
 
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index fd7f1db863d9..5b6c51b78dde 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -9,6 +9,7 @@
  *
  * You could find the datasheet in Documentation/arm/sunxi.rst
  */
+#include <linux/bottom_half.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
 #include <linux/scatterlist.h>
@@ -472,6 +473,8 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *breq)
 theend:
 	kfree(buf);
 	kfree(result);
+	local_bh_disable();
 	crypto_finalize_hash_request(engine, breq, err);
+	local_bh_enable();
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
