Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE797606D839
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X9RkwuTG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IIWhKP5H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H/ni6sJFRGrZuSEyfWWno5ECVPU6ncnV6GQR+3Zz7+k=; b=X9RkwuTGyqa3mLqJy/a7MGCOqV
	n7hSeaAjo4QEIC506P4lD4ZgbG0JtRuNd3HN+ez1koUOVd5/TNQof73p18K7wMe+xwT+pQWLnHoak
	WjuN20QrLRfFms43HUY0zp3wWVC9yJ0oNwfJb6IBHkBZadrFZuoyC7c6rlgV60Bygo6hPlHIs+xcU
	GRgf5gSHCnut29O9JcMg5ICFCx+voQyCE69qx9XYejT2twbUV6SoABShIS+ThCu1GNembF2WBOXUM
	lVejtOdcikBSBrjfaDIzAox4YqMG6CbEOBRCCX/2XmLG+tBKiq7d1X4EdKVrJFTeroTIW/grV263m
	k6/oOmWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhs-0000000F3Nq-2XWB;
	Sat, 07 Nov 2026 16:55:56 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhp-0000000F3Hj-2yVF
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:55 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-490a0e72588so803723f8f.3
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 08:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070552; x=1794675352; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
        b=IIWhKP5H7xHES5XkK3LcIgoTVf5Sk5rMrB6vaR9RpIPMOxe9ZhB4BiJX74UWoguLfH
         fQF5jSkWCfe3g/EO2YfxSNRMbhVjv+5yqLm/gz9G+SzosnQyIa1uCtwmCiKxAfghjveR
         7YTSbBJr4wSxCPnYY2E7xaK93S1ILX/NmcI+jop6XxHCNNqZh0tq74IcSE8ZjOmXfjd3
         ge9HPwfEQ2DVEozIYu37PikKti/qUG+9n/yKDE7McUEedBmD7yc7sSNKG/4JZppedmuK
         cTwnaFAKBgmmGen7bBEkOjPXp7B5GkJVd0CXEH4/YZLKF2szzxHGd0ZzpBEQWqvqmIcY
         5B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070552; x=1794675352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TEGARoUazb0CZK9Y7+6uTs8sJWEMjS5uHIP12nGwzPw=;
        b=OmIGc4xV8UooK97HfzMHHjKZl8RH1qVs+zelaB4UjgnWSioKWuJ/flYmReRwbcOXvk
         bJilFTjnYNHV3YAql2o2iY1X3pppHebMnjUBrAyW3/02wlI/jDrVOkCo8XeCdGhk2QJ2
         F8ABu+Ta8IGSXQvGsEGGwU5E135+J4uZmKk3SdWAhVi9QtDBr6FNanSuaiIzqn2l+biO
         0hsOYXkXR2hJKo74VXW5UX4yHjl/F897jwn+bwzma/va4TPlxoDpqb26ft3HkNwROB6z
         8gqgOlASUahmImYg71DSyT2VuhOYDVez1l/zRjcQKPsEk+f2NewATwHG2S4m1Z9GRbY9
         6Ehg==
X-Forwarded-Encrypted: i=1; AL+hErEfNRZBPmrPPPaC8Ba8A+q5T93Mb8Glg5AAlR5veyO+rOCU2iGawaQwwil/PKntdGKUOUjcrVJfc0abGr84@lists.infradead.org
X-Gm-Message-State: APuU4Z/yDtSLqR0P4J7zYTo6EQ18khKU2Z+m2YwTZypIrayS5hL+1L1O
	wTVeYbuKNlU3tcMpTkrRyQHsG1O1Xql1R20BOyoRgnxSqVHw8oGoH9Ab
X-Gm-Gg: AYBFou2qGrlYG8MDAnBaI4b5vpNEe23JnAQHMuIP1eRyedGaWjcwXklobebRUwveYBz
	gcQi5qNUUMlckfZeLqSijSCSnVXDkNZSU3AsmiW9qKEVJ+M1rkmOHRdlX92DQsfrzjOuC+6Qlsl
	gipxUPBfsjZZlf2neUz2f844+Sii3R7x+/ftJc7ybfmt6hW3dBhZvStnrROqMsHbZXD6e+tsInl
	LKyWraqqA7Z6PTjN79fC2zRLNm+2wa3aXGHhtz1E4MwKSOBa02AKkpS9EVn7hXJYrHUbLFhJglQ
	NbJTRD5RQHJieK8d0HxD8ljVgc2bOeiVH/No1HxyxMwTUAbMD9nJhE+Bsk2utoD2grxuzc+zuh3
	FQEGAF2Xcn8n7sorZnf8JsYUKZHNONwEB8U9ITVmYHHhybzwbyFctB84QUqFRsfEW8Gms5WkRMx
	vxRH7p0LEMT4hcmKHHqCnPBKfya0c6JAubFS4serjjNtZtQRIR8xZy9rdzmhOLB68W9XkqNJv/0
	mBcBJr9+yKgyNHoaNTp5xKr85uAXo46weejyEf62CvCaoBGhSqFzZqKYdpPGqzRJsbOSQQQdPtS
	SzwW0EQYDOSh+JgsFXLolW/YGMFdeBW3Hib7AUAKNE+cWr7kmcKeYh0=
X-Received: by 2002:a05:6000:1a8a:b0:48f:bbf3:cf52 with SMTP id ffacd0b85a97d-4927ff37842mr12135105f8f.52.1794070551891;
        Sat, 07 Nov 2026 08:55:51 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:50 -0800 (PST)
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
	Jude Gyimah <jude.gyimah87@gmail.com>
Subject: [PATCH 4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:27 +0100
Message-ID: <20261107165527.576383-5-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085553_785097_DCBE6372 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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

axg-spdifout calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifout.c:(.text+0x9c): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFOUT unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFOUT=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 53eb4b7aaa04 ("ASoC: meson: add axg spdif output")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 10c7d59a5ad1..272639dd8eaf 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -76,6 +76,7 @@ config SND_MESON_AXG_SOUND_CARD
 
 config SND_MESON_AXG_SPDIFOUT
 	tristate "Amlogic AXG SPDIF Output Support"
+	select REGMAP_MMIO
 	select SND_PCM_IEC958
 	imply SND_SOC_SPDIF
 	imply COMMON_CLK_AXG_AUDIO
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
