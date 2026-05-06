Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F69CD3439
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2026 18:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/9ypPpzpoheT25nziMkIixoyMW3A4bUfv3p2t0/s9pI=; b=MpyzTIiqdj+WvF
	ZErfl1IryIY6iOK3b7aFOaw1GTCfGgbJgUgNTP4U2wkUaQ7cUYFewwOnfE/LvTJeFQp++GL8imraV
	2H5S0k5c0Ei9EreWAM0Kwvo61KvYNtd5oClmjsQUDjVqwbMDZrfETFo7vejGqScSzh9XEzaM3zMAi
	ARZeAwS8BmoPLihCP/V1z04A6AUUwqB7DwkSUGxLyZHlLkXQTbsx+wczFb2plbGXbogdynWccAPQK
	PqNIYUFz+1RnpXLoc3mU7G8X8bONWPaeN2QbnXYLmToCTfo3WGkFz1M9BhRFqnZEcdTr5yckXA4WT
	WoAPHpNZHZ/jEpB3USxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKh5h-00000001mjn-27S7;
	Wed, 06 May 2026 18:35:25 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKh5f-00000001mjL-1PeH
	for linux-amlogic@lists.infradead.org;
	Wed, 06 May 2026 18:35:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-48d10c981e4so39095e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 06 May 2026 11:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778092521; x=1778697321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9aiXsZhpAfPQ3ReCQcd6NEJTNdjNAL2vg0ii0mpvxDg=;
        b=MAyco3dWYJs/5EQ7rEKWWKdo+dzRbvg1w8j3ErR4Cw0992bwy+jYzhaQKk9z/jMV2C
         CIGTu1I1s3i4j7xT+9HHIqBp6fPpNH4Z85+u4ddyk3OFShX6+YPHEaQqyc+greDK3uu1
         XpjiEa8gv7O3Mmy0447yMjbYjWmZBPl6nsCJzK/oerVdEJehnvDlTJkmp6gTBEiWJGPy
         Do0//XcM0JCCYO5B6yx+nKIe19wxN8HUkuMnzMv6fF3lTEa2Pk6Rq6DG32aBiP9naoWv
         fjjJkbQBUrxxGMHqKUawD4RExRgpei0/FIZuAmMNB/uMnN7njTPl9T8S0ecY8ozbyZJD
         aiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778092521; x=1778697321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9aiXsZhpAfPQ3ReCQcd6NEJTNdjNAL2vg0ii0mpvxDg=;
        b=Tnk08NZMoyXtvoulfIZvg8XNQSOupDuPRjr3GzZHgrTaoR26NixA90ouiWqKgodMv9
         PuAA1o3ikEfsTDSA9sG5Q4kAYA1DOfk5HEEl7P2IobudO0WNNqlmR0v2Ed8OmBRSYtAL
         LcbUjGPErBmXtPnY7n9ez8VMta1sWsrzGJ7WANDLoLZ9zjWtGvr5JNWAVuOrp3+hZrA/
         3V/WKBy/UXtk5/XH91q95xQkvTlYIjdn/DsdxoKpeoA2baArGRu0SSobOticxIBxQFGQ
         s64PqmGkgqREvzZ6EURkRG9RiESVH3vrOLEolxtjQWFnvEddbyfOs17HLSSoJS/Bc0wi
         pv0g==
X-Forwarded-Encrypted: i=1; AFNElJ/9WhHULAyacSfcaFgsXPSxcJ1NbQBLskGVMGDQu9l7/ok2clyGoLKTLweLmdLL/64lbyJDA6shj1wd+fEo@lists.infradead.org
X-Gm-Message-State: AOJu0YyhZZKN9+kyoqwvYR9ZwG/upIGaFZZIYxwGc4M/1uZ3Mirg7Gum
	UriGGGTCDWjoQoIlygUpy00mnrknHHNcTV+la5Y+BJdpERDDAoz3oC0y
X-Gm-Gg: AeBDieuxy1/je2iLY5958s7CuMlikwMYlZgUnoIRjG+Y9cd7+oi7XSLMqPs73ghHopE
	1MOqNejPfTfzILCSfIU2qpmRPz4spK2eSQ7nApfLeD+7LYL1lXdSqcyGTpz93gIHjHiR59T13wJ
	aElzgkhe0sVrM+CiD5PXaqfV7OgheS2J9HwyxHSZ97ADcsOm6hxO7G0du/DkLs2nG339Oq3q2op
	sBJsXJ4+TJcN2aU009HFOVB4n4mrxt0knizJy3Jq8TMRiEuLup5SCH7UpQ4lWLHhpa45WXaT4bq
	DBQKUsTwg/UY3zoIylRhFFT1JCClgRGziYaf5xp4PvxHfOE/nip7P3p7dy222IqkDGuTNNP85aO
	ccF6x0lzEB54IkvAlWT3rYB3ztN3OtPC3zWvJADBaXMgoCOQqxHrelURMdP7WVXCDYmb9Y2y9UL
	+3arj7cW7vHSIm99EFUtJvvFn/easzaMey0Zd/9VSJU9HQ2vJwYPsx
X-Received: by 2002:a05:600c:1908:b0:489:1ca4:c999 with SMTP id 5b1f17b1804b1-48e530d8a88mr35424575e9.8.1778092520483;
        Wed, 06 May 2026 11:35:20 -0700 (PDT)
Received: from LAPTOP-9UC0RPH4.localdomain ([82.215.118.79])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45052a48911sm14398468f8f.11.2026.05.06.11.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 11:35:19 -0700 (PDT)
From: Stepan Ionichev <sozdayvek@gmail.com>
To: sunny.luo@amlogic.com
Cc: xianwei.zhao@amlogic.com,
	broonie@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stepan Ionichev <sozdayvek@gmail.com>
Subject: [PATCH] spi: amlogic-spisg: drop misleading NULL check on exdesc
Date: Wed,  6 May 2026 23:35:12 +0500
Message-ID: <20260506183513.482-1-sozdayvek@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_113523_386975_C41C9DFD 
X-CRM114-Status: UNSURE (   9.77  )
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

aml_spisg_setup_transfer() takes a non-NULL exdesc pointer; the
function dereferences exdesc unconditionally later in the body to
populate the SPI scatter-gather descriptors (tx_ccsg / rx_ccsg).
The sole caller, aml_spisg_transfer_one_message(), always passes a
valid pointer derived from kcalloc().

The "if (exdesc)" guard around the memset() at the start of the
function is therefore dead and misleading -- it suggests callers
may pass NULL when in fact they may not. smatch flags the
inconsistency:

  drivers/spi/spi-amlogic-spisg.c:314 aml_spisg_setup_transfer()
    error: we previously assumed 'exdesc' could be null (see line 261)

Drop the check; the unconditional memset matches the unconditional
dereferences elsewhere in the function and removes the inconsistency
that smatch reports.

No functional change.

Signed-off-by: Stepan Ionichev <sozdayvek@gmail.com>
---
 drivers/spi/spi-amlogic-spisg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index 19c5eba41..b2a916496 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -258,8 +258,7 @@ static int aml_spisg_setup_transfer(struct spisg_device *spisg,
 	int ret;
 
 	memset(desc, 0, sizeof(*desc));
-	if (exdesc)
-		memset(exdesc, 0, sizeof(*exdesc));
+	memset(exdesc, 0, sizeof(*exdesc));
 	aml_spisg_set_speed(spisg, xfer->speed_hz);
 	xfer->effective_speed_hz = spisg->effective_speed_hz;
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
