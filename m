Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5096C606A331
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Nov 2026 22:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YgbvHqkv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=BkPKF4+K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=khJB1Xl15ZipyoFGew+gG0F97wgNduH3YLGXoGHcxKs=; b=YgbvHqkvL3prURlL4jXLdjooB/
	gL5pTlxumooF+eMVGPXkVVOnDU3OcXZGQgMd2JxQx/ht79xm6qx6voAKeyeZHdEYZDxCDAtBtle7S
	aElhb6ZS/4Q6IY278dEfBh7bv93YPozJniKqy30AK8kb6D0KQtuTAyvEjWbo0jkn56BCOXAu2aQGA
	ARVB1p337pgcw7eaNImvpKJw3ipgV92AywU4ZxBzPetHX3ZUmJ2wSl5/tyrzEd5sqWtwyBmItIJwf
	ffibkEL3IKC/lyTA6rQLet1RfCYz3gnK//Mwh3r+OfEEnN6zxcuZYT8AESVfSPb4BiK5HY28a4s8O
	p4CvxUXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiv1-00000000gYh-1E8z;
	Sun, 15 Nov 2026 22:41:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSiuz-00000000gXg-2Gle
	for linux-amlogic@lists.infradead.org;
	Sun, 15 Nov 2026 22:41:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e46e449e8so2205973f8f.3
        for <linux-amlogic@lists.infradead.org>; Sun, 15 Nov 2026 14:41:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1794782507; x=1795387307; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
        b=BkPKF4+KY96XX9ZIzHKQt5cauB0gjeE+JHV24kZ6HS1GL/MwDtZEyGiKaORpv8pwM5
         wwhgvtH/4Ktzxcjf6GZ/NYIWIvnz9EeRRvi2ubixz7W6dCewLD62bP5AUL2E4uBik3F3
         t8A3F3oTAVgGRT/94kazjy673JZWrVLuZEFf8fBPN4pZksdAUd0JwmLH/TiCXq8wf3Eq
         /sKaiQJ5VUC7GLBIUMCtkWj7YbJqf2zkKvWwG6oSN1Uy9UdLLLM9Q5n+nzHas9afPeYv
         xoEl2weT9PWyEwLRNWEGbce+OK0kOTuGZ3zBz8QBqhMoTSJPgCY0tMqwOqtPDz/1bRm5
         eMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794782507; x=1795387307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx3glkhH9vs3/X3w1l5/CUCQpaAzGp+qGYgSRk6Y7Xo=;
        b=G+lO6SZOfB9Q6twj0t3710DTNTRM5+J/Ceid/7+jZHKBonke6NpC3My1x0d2rsoBpl
         Eeb1QAWeANYwpzdT2w05HZfmFNWPTrWiMHLm7CKzhc12o2QhO8Jqy/+Ejesp1PaSAO9I
         7hoG4XWzC5B0ZdGwH+ZZyQlmY6y3edEMK6prOVe845cmK1gXl98ctSLcfLdsZeHSW2LK
         oZOS2NtwbELwgtOd6bCbRMEAzOaC3kyr3m4vavEUHceCQalzrppG4KuGEGnr+FNrU3oL
         LEM5hAqFAkzp8hnvYLJJEigxCsg+9vuVw5xLkVlpcmne96QlGzDouOJB2NF/eQ3ZGnG7
         VyxA==
X-Forwarded-Encrypted: i=1; AL+hErHj3+/BtvZStxV19wb9oXH3PFtiZJvVM9z4PXGp5yIXUzQRkZp4mwyuVPGHI9RrwytU6TM4OannjdhTVOhd@lists.infradead.org
X-Gm-Message-State: APuU4Z86TiJoFIWm9sGKa+ORFmbb214BfoS12j7E+5d0ktftQKSdlifM
	qKLMpG2i83K5/zHyMnsdABeNWxI9bPRe8k7uBT211lvWbg1hWXHMp4q8
X-Gm-Gg: AYBFou1R/b27Rce9+vePvgNr9y/Bnyv4GNTbFJBHmIK6Gw0vRncsDejQrna8D7wRWwy
	1rBz44ax8ufUaSKp2od3Fi5umsLp+o4Sy9F4p3+Qobk5A4xjaJb6EgG58Cs+d6Zb+w9VfEu1CIt
	LB69Hw0EPeshARt+X2wq3VAfz5RzdsDtHPZ9Xhd4/sA3HEVvbVUjvCLh1Dtp6kso5m/VFIuGJLV
	WaVpMAMHB0vylkfYURZfmXT4HQKqWwrEkzV1EpktLP9aV/Dcaqb/JxbbkXjjFCqozuVN0KnTqv9
	bz6DDCN68xt89kWx/ujlJPknHYEqkvAQ01Gz81ICxL1UHALyej+RlQFBcRukRniUBMU9CaRtODY
	rAtcsUt1/oY2BmmpQJsMQyuqRM+/aZda7TrKjQRoJf3qRCpXJudVkeNesy6kUXCGXkOaG0g/6ts
	FOToariyXMl4KvfqFGuw+DfMCIrcH1g3iRgrp3fhbDH7rF1FxfT88senuaWdaZ+R7WJa9ct0KIm
	K5/BAJEtFu5LYa5r6W0ljMGHzwPoolVWUSal4uCjaNmnP/qWfta+JZMmVoFQXIkXE16DnBs7vq6
	Sgt8MggfQ8Y6yHhYzZKE0EJH/HKdOPeESOxfSxHou2Zsp1C4GKBLXhGBRA76nynx68VyOFUE2qs
	94MzVC7OPx6QcfQRFGh9+n+J7aoA3Uolj5MEUxJp6TYRlXRz6SXhRFac=
X-Received: by 2002:a05:6000:3108:b0:492:7efe:3fc4 with SMTP id ffacd0b85a97d-49c711b7ee1mr19686269f8f.21.1794782507434;
        Sun, 15 Nov 2026 14:41:47 -0800 (PST)
Received: from blackbox (dynamic-2a02-3100-9c24-a600-021b-21ff-fe38-46c2.310.pool.telefonica.de. [2a02:3100:9c24:a600:21b:21ff:fe38:46c2])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5fe373casm17986572f8f.30.2026.11.15.14.41.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 14:41:46 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linusw@kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-gpio@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] pinctrl: meson: meson8: fix I2S pin group names
Date: Sun, 15 Nov 2026 23:41:36 +0100
Message-ID: <20261115224136.818305-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_144149_583148_C31549DE 
X-CRM114-Status: GOOD (  10.52  )
X-Spam-Score: 0.4 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The I2S pin groups are registered without the _pins suffix, but the
i2s_groups array still references them with the _pins suffix.
Update the group names so that the I2S pin groups can be referenced.

Fixes: 64f6d07ba74c ("pinctrl: meson: meson8: add support for the I2S and SPDIF pins")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/pinctrl/meson/pinctrl-meson8.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson8.c b/drivers/pinctrl/meson/pinctrl-meson8.c
index 3da7f3799c3f..1f58752637a3 100644
--- a/drivers/pinctrl/meson/pinctrl-meson8.c
+++ b/drivers/pinctrl/meson/pinctrl-meson8.c
@@ -923,9 +923,9 @@ static const char * const i2c_b_groups[] = {
 };
 
 static const char * const i2s_groups[] = {
-	"i2s_out_ch45", "i2s_out_ch23_pins", "i2s_out_ch01_pins",
-	"i2s_in_ch01_pins", "i2s_lr_clk_in_pins", "i2s_ao_clk_in_pins",
-	"i2s_am_clk_pins", "i2s_out_ch78_pins"
+	"i2s_out_ch45", "i2s_out_ch23", "i2s_out_ch01",
+	"i2s_in_ch01", "i2s_lr_clk_in", "i2s_ao_clk_in",
+	"i2s_am_clk", "i2s_out_ch78"
 };
 
 static const char * const sd_c_groups[] = {
-- 
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
