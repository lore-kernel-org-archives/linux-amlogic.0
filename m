Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D14606D831
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rx9OQiyK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EyvcwBct
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lkK2lCpNYS/rxvPNOjeOzT3R4eRaSU5DWq5SGT8Z9ic=; b=rx9OQiyKpSy7YtReVBTYO85lyH
	w9eLfGruQNh6mbmoB2TGCmB/Vv2efVfd9dGweE98D1EDC9AfoeBntIaQ8523t8iXZQmxnkaLU1pDg
	pEefT654uv22yYwKv7W9GQEA7K0r9aZy7YH1TS3Gx/Cj/osAw8fK6A8vroxqinxdRs+Hg2yQ/T5a9
	Ege7rp6C80BB9ST2GFtb/1/arp13bFefcAcuA3z2eD4Ht5Sj+Ba9YmOhNHvdtteRRVClhDVnGdlQQ
	KtutE3uDfK0IbKhfKveQxDeNSHejMQVQPy6UnyJDvgleA1LkKSvWb24AQ/KaaWwSh0x9Mb2EfOZNQ
	oOWcHRmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhp-0000000F3JS-12hC;
	Sat, 07 Nov 2026 16:55:53 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhn-0000000F3Fr-081M
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e4831c028so1659802f8f.0
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 08:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070549; x=1794675349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
        b=EyvcwBctnT1lABSPFa2hJsTwCeDCZBoXBOzWSwBpUGXGXgfG9g8AKBpZmP37Wf5qdO
         Z6mRV1OuAd6lWzseEVIFMRE0xeHeD1XIIvwfH0L+SE18XQcdlSUll/4luCXxep0Z4heU
         8+KY404D0JVMaDb+FbD0DPEA9gzHnJAXRwZxMrMVDh3kj6rHRuW6ZoqqgZ4L8esOYLtx
         k2Y95BjM/dywnBzpAss/2CQcO3tKpSwr7AsgTHjvaW4xuWdErgnx7g48/qXtt6lX7lyp
         VUrZHZ8IpWhbq0CHvp18QgeRVeFmkBlaD+TFiV+nl7R3l1rGK8BuHsVh9e3RrYIrtD5E
         Y4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070549; x=1794675349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Ftq9kuGRF2mqnT2pNXkfcKGmq0aRLkEtAjKZxJ0bq0=;
        b=tWI4tzLTM59D0Lq9b04biZNRfEvQCLB8U/0vIFOcC6O7yWQAUTc7xiTbiVeD4StPdA
         guCkVRC2NZpfH0q4c/m89kiiebnki4hf4KWzorEixQ1J5kCFaz3JvXXyNGzD9PvNj+sf
         DIuSC2gncwRaEdrDdxoHk2dKHZatT7qXT7eY/5S/J5uLoc9PF4RifGZ+q40YnE+yGHfH
         CEnv2JYEyzAkyQoydCLyNr188GeaybZW4fLvD+GFLqB2LZvkaFZl1pUa8iwNJd6TpEkN
         JeelTDR3RVA63bGNmsUVmkI+dnn7nZoNBeDZFIgTZdDfbubqGo3xELTSuygIU8GFAkVj
         Q8WA==
X-Forwarded-Encrypted: i=1; AL+hErGv/6QvmTopBlp0vt2S+lxGOygWZPYl4HkVE3g3zkXLdNye1Ex3OT72cInZPlM5Pys2LlmW5FBJa99pXwM9@lists.infradead.org
X-Gm-Message-State: APuU4Z+UFtpELnfZ87pxquFGPQ0Xiwzi8tRmekcRh0xaQLYsaLSWV6RS
	NXedLkjT58Aw+asYqiTVwUO8h5Zo8ylkpNFGPkoLo4SobF7YCZe7FFL+
X-Gm-Gg: AYBFou2XNSMdT0isWACZLRr4j0viN0Vbp82b3AAq/xvVRhizjkBUZNl61aZWud9DbWq
	VrydFlJzFTSwk6J2IeI4jxak0uiQmC8Tz04G3iCzl0Vb2Ncyx7twjNbgUMWebz2h3bxBm8WRrn5
	QF7pEOT+BTUgm29MqgP27f5/JsW0APvqUTuHF1qcU1AeOm6FKWtlh/8Qd/L0370VngE1Rs+jg1u
	r4Pu3icAs/nv1EOBlwDzYHE/xzbd54KXrxJOtJWqZHSgzDDVIdjaFxtiDd9nnHvIXWuVSCKeo17
	WGNxoylMQc05+zDguXbg3i3i5IJ/EvGFElzSUSQNIkgy7/AkEDildwMTFhzs21Tx/sh4HEIs5GR
	693Gaa2e2rO3uS9goKm/EulLsyFN7EM00poe1OuyKVbRsoMQXayW06mfuy/tqQw8lzuRCkkclH8
	9cEZIuiRNqnghaSyPwIC0kWWRqAwXdbkMJL5ond5PsDrSlvnf1JoRU59Xa0WwtenvNzcXuatvkf
	Om0gDWlnt3oEpfa6cKCgoOQJBoj1DtBW/0T8Le6qP00GfYIiMcBnzjAYZiYvqHLuV3FrdrEEPWr
	v7+16HpZLHX/yQvQj9AY+Mi7pYni/RnCgw==
X-Received: by 2002:a05:6000:2384:b0:492:b880:53a7 with SMTP id ffacd0b85a97d-492b8805664mr13284591f8f.5.1794070549260;
        Sat, 07 Nov 2026 08:55:49 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:48 -0800 (PST)
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
Subject: [PATCH 3/4] ASoC: meson: axg-spdifin: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:26 +0100
Message-ID: <20261107165527.576383-4-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085551_093697_D17617AB 
X-CRM114-Status: GOOD (  10.73  )
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

axg-spdifin calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-spdifin.c:(.text+0x154): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_SPDIFIN unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_SPDIFIN=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index 4b06a9e7c72a..10c7d59a5ad1 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -85,6 +85,7 @@ config SND_MESON_AXG_SPDIFOUT
 
 config SND_MESON_AXG_SPDIFIN
 	tristate "Amlogic AXG SPDIF Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_SPDIF
 	help
 	  Select Y or M to add support for SPDIF input embedded
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
