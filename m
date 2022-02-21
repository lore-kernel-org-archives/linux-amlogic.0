Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697C8C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 13:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dZPwiTeB/k0sDLlTVym5CV83h1NgJC9c/tOpJx9+qYs=; b=DvO+8U9H5QA43M
	i2bmv5obB4TuOGAdpszf0wyK47/mbVXZbxmQTnzMDoS0AUoJQYAYwtnoIO0gnIYyXJwBu2iM+pQur
	R8oLHs7/KgdEn8P8Q5CbJSwDNp3TQmCrWqj7Ac3rQBzZYiLnDZ7zIHdblSzov6DVsVqYTsHcgEJs4
	rZvldS94HV6mlehi6Eeg0cnlMWOOP6SRF1Oy4lRp0lWyAaUIsDCCFUNF2/W/WO4ymF8uag5rU60Qm
	PooXSKWG39Yc5SLtXZcRCz5vF6XNKg+fQHgwiKVFaDSTqOzZ6+qC6guTeVx882/V67CpK3OBmRjA3
	rDIp/9zGxJHVK4LoqXxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM8Ln-005mnl-9E; Mon, 21 Feb 2022 13:03:35 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM7Uj-005Y67-Ky
 for linux-amlogic@lists.infradead.org; Mon, 21 Feb 2022 12:08:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id o24so26712150wro.3
 for <linux-amlogic@lists.infradead.org>; Mon, 21 Feb 2022 04:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eRwXQ22zhUvx1o2PZ7ENLpRDM+5TmK2L3Q+xebz6RZg=;
 b=qmw5zddLshVBKDNx9LmeyGeFD06unJdxUalh9qYp20aANFXunS0qfedH7kKreKAi1B
 TuZ66MDF1UKDbxZfJtTct+TBv4WAKrXribxlOnzuChMAnS3sDdKtTRU18+ju9/hFQSxs
 EhLx/h9ZR4eCkZxp1ViV4aDidIOXtwLywqNfVkjll1JeohtBMUWIZN98n1+RDri/GkOj
 vLCnqS9rwSkHDW6XYSZV9Oe834ro/eJCV+XoXF40hYLL4DMMubP/riKiaLy7jIuAEmp7
 wi+n0NwOGdXFC6avheY2YvwGHhX3elgBsAo6php6McGHit+QF9Qq9ovwKve12Rs6xaT7
 cVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eRwXQ22zhUvx1o2PZ7ENLpRDM+5TmK2L3Q+xebz6RZg=;
 b=IeAzqsSF06/iiLH687ClzOCeK3+L+IwH65OCrIGrpv3fvUlF+A9PUQCsD2VSLVp3yM
 vFQHzBY/xlrtcVSXdPElf0HWVZlFrmH64zhcQHslk/ja/Ly96EQsp31VRi9A9VGeSP2H
 cLnO6aUtfMMZ4QDSfS3N8WTI4dcXrhb7TEsf1F34FDjwbTlRri52APgPYwo+aL9HX6Im
 xR/N9oA956Zbgw+ETKWdxVmp1P3R6iXPLRTl8GnmPVjtdAGKr6PMZUA0dR4cnj6/chyX
 esmY+3QXcZPGD25udcuahCBqT/EpG2oVZYpGk9VaVVR3efNd3mn+Hs6fcdvm5jPSdS+I
 q1xA==
X-Gm-Message-State: AOAM532QWVezPpHjrZVZ/0SD8qZXpXFrsNuAYTpBVugEYK/nC1dfJ/fB
 XdBmphJKmcwyIE+FHTfhSk1Pig==
X-Google-Smtp-Source: ABdhPJy6vbpLlKF2o118HSZXUs4RfBWx6RmuHRbHpvyirVgJKBWwM1e3MmCtrMzPWWHPKMXOLsmeIQ==
X-Received: by 2002:a05:6000:154e:b0:1ea:7622:64ec with SMTP id
 14-20020a056000154e00b001ea762264ecmr676608wry.600.1645445323857; 
 Mon, 21 Feb 2022 04:08:43 -0800 (PST)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id a8sm11821546wra.0.2022.02.21.04.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 04:08:43 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au, jernej.skrabec@gmail.com,
 linus.walleij@linaro.org, narmstrong@baylibre.com,
 ulli.kroll@googlemail.com, wens@csie.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 4/5] crypto: gemini: call finalize with bh disabled
Date: Mon, 21 Feb 2022 12:08:32 +0000
Message-Id: <20220221120833.2618733-5-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220221120833.2618733-1-clabbe@baylibre.com>
References: <20220221120833.2618733-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_040845_738394_92D101CA 
X-CRM114-Status: UNSURE (   9.11  )
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

Doing ipsec produces a spinlock recursion warning.
This is due to not disabling BH during crypto completion function.

Fixes: 46c5338db7bd45b2 ("crypto: sl3516 - Add sl3516 crypto engine")
Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 drivers/crypto/gemini/sl3516-ce-cipher.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/crypto/gemini/sl3516-ce-cipher.c b/drivers/crypto/gemini/sl3516-ce-cipher.c
index 53e3fefb81de..14d0d83d388d 100644
--- a/drivers/crypto/gemini/sl3516-ce-cipher.c
+++ b/drivers/crypto/gemini/sl3516-ce-cipher.c
@@ -264,7 +264,9 @@ static int sl3516_ce_handle_cipher_request(struct crypto_engine *engine, void *a
 	struct skcipher_request *breq = container_of(areq, struct skcipher_request, base);
 
 	err = sl3516_ce_cipher(breq);
+	local_bh_disable();
 	crypto_finalize_skcipher_request(engine, breq, err);
+	local_bh_enable();
 
 	return 0;
 }
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
