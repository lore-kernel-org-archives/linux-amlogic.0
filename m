Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874F4606EE89
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O70B2rfJ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pV3LgCgl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=49OM71corm//O4zfkmRY7+YXIefgCh/KHiCQQiCSwOo=; b=O70B2rfJPPzL2zROj9S8h1zpHH
	TeWSgmCFBFjmO5Ir6zFc+4kkaot6bI6RiF8Z2Abt+f473Cr+kmhuQSuqAE/JM95qzxhj5EIGBTadg
	VsQXmAfShYfQdxWChm00Ji0Op0LQ3lI3Yq59lsHg/XRHBIpO2oBxZuWF/CQnUTNvI1eIgOulPSaUr
	wBUTW5eFpbdraEFEFY/TY4efqSgNal8Hm+1alyYq6MLoVgnYITKF7QNdJAbR1RKAtjlgjrLPQuSoV
	Q0MuZVX73Zxl41/LURMo4OXhAUWf64JyqMlEEBVjx8roCHNswH2hkOlXPupUmy41nnb9UbAtxWbnq
	UlaClIRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVE-000000013BA-46t9;
	Mon, 09 Nov 2026 15:41:48 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRV8-0000000137r-0OP4
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4b467581b98so9709075e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 07:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238900; x=1794843700; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
        b=pV3LgCgl7WrvPa+XE8hId5tXKg6jUNrEdQYEF3jX1cob7Zu/NUnk2vEPP33qshmAEn
         S9hOlD1s7+cC2MseOAvF/XhtR7afE97iLHF5U3CAbW88T1ezS7oqNN2SVS9cQAt3VuLS
         nIfZsxmOFdQdmrOk/EPHNDgMoeIS1X5xzy+3lv8BWa1Lx+R9cdMCjMSRpM9QcnGeyLYi
         JbvXpVH26bAh4LtgZjhd+oEGpp6lFyhWMreTVA98WHQvhWh/oizExlo6Wd0G3ltI+iuw
         5qw7j4P/h/yJLyaqCgujIM8iS/cIoReg+yJaM/cxlP9hinslTS7dDz4VcqEufL4gMSQe
         t1GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238900; x=1794843700;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gmgl4U92sUaeq/fSzBRONwmIvK9ejAxa0Sr1yFZjy/8=;
        b=TdA548HaSVt5UNT0A9UvdhCdHAfr4w1colKKo/rxTSUpMTu00IcPHIq1qLtxdsMlON
         +l09Ee49sFx78vTByGUiUg1L3KGd3gNHxvpq13SR4nxqZzchiaP5m1WqLoFmAZ3lYtQK
         qFKjxTmBwY0P+jBcxQ2w7sDn/D17W1x5B7X+GlH/hWuxlcHyub3KwQGhs11Dl8KJ9Ho7
         Um8RZStM66Y4TGAhhA+IA44ZzUYRKMfGroCMUKZe9a8cexnbAayXXOKDPBc33mGb41EW
         88fmg96YgWx0jbFbWOsna0tPytyZd0xF/yA4bx+sIleNqpTcNLoQKY1Ugh4c4zYyNrzN
         p18A==
X-Forwarded-Encrypted: i=1; AL+hErEahJjmbPBMy+9QUPa9q2nnUVCJEl0x8jFcNsHrbwGpshBJmnTyWN469bXTcel7rk5mAz/OACcmnXEWotnC@lists.infradead.org
X-Gm-Message-State: APuU4Z8uWFB5KwxVOrqDDcAr8bRcUYdsBvXrpHLSRiNiruZZWmO8o2aC
	e0YuUquGFsGhSFottodXww3EJBnsa2YePJ80FStR5VNCc5aMuB4eIovi
X-Gm-Gg: AYBFou0+T4xMnspXXTgVR/By8ePA8iX/xXAYBhdGgUjxxtgNWXQfM6lrMSaM5QkbRgV
	scAFO0bIf7zBep8LV6F4pA6Mtry9qqCMZyvpoh0A7SorNhTmsEZYvddOzYxFiilSx1djCH99362
	/MZLi5ZZsppiFk+bBDW/2nTkAJ4aHIN37eRlFbaaOLVfkskERriQsM/cFc+apTeNC19VI6WdB6v
	PQnfgTjnWZIj+IwtInB6Xn9bDcmOitZrNRRV9xupAx4Ab2BMNsi2hghMqPucM9LDUsddmW6oj+l
	KjmdGG+uJm2l6iwtVz0yTR1e69R9oT9H4d7mU06Q2IKWEF2g+ao+MHmHKxF0wPSUW0dPQtZJSUU
	YiiHUD8hz7ECE058BQHYmYXPgcHjdbFK0sBf7yn5BOkNJZf3GCg/wIlgx7KvI4HuJUgPhRPZG++
	RTWERuZViUOF2A426nOxEVhDzbI7ErgZRbRCyikK/TOJw7s2LYqHqxtksYrC9pa+lhxBiBNn2QV
	v8dBsWFcMnMwf6SffkJFqklAHYXe+fFLiRf8psbo9jEh5h+lp7PR1VQqSVIlnLU107tEmKgHXk3
	G3amYOY0HT2qF5OkvNQ36F57pR76dcqFOZESgzr1Z+RN2f3umFaA2aJMZXvkRLI=
X-Received: by 2002:a05:600c:3b87:b0:4a1:a45a:88f with SMTP id 5b1f17b1804b1-4b963c6d630mr91396875e9.20.1794238899925;
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: jbrunet@baylibre.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jude Gyimah <jude.gyimah87@gmail.com>,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH v2 1/4] ASoC: meson: aiu: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:17 +0100
Message-ID: <20261109154120.592392-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074142_149573_3DF60022 
X-CRM114-Status: GOOD (  11.59  )
X-Spam-Score: -1.9 (-)
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

gx-formatter.o is part of snd-soc-meson-aiu:

  sound/soc/meson/Makefile:7: snd-soc-meson-aiu-y += gx-formatter.o

so SND_MESON_AIU is the option that decides where its call lands,
and the error below names gx-formatter.c rather than aiu.c.

aiu calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  gx-formatter.c:(.text+0x74): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave SND_MESON_AIU
unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AIU=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 6ae9ca9ce986 ("ASoC: meson: aiu: add i2s and spdif support")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d9a730994a2a..d0f60f8af2b5 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -4,6 +4,7 @@ menu "Amlogic"
 
 config SND_MESON_AIU
 	tristate "Amlogic AIU"
+	select REGMAP_MMIO
 	select SND_MESON_CODEC_GLUE
 	select SND_PCM_IEC958
 	imply SND_SOC_MESON_T9015
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
