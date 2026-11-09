Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8406B606A333
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LSHSiyDK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b1GhxGlQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OadDoTfJy/jBg9XORNjiyGG++Q00XlPCSwD5+BvIx2U=; b=LSHSiyDKW33CQpXUqyd7fRDCAC
	NNn5nsnvfwJV0tbB8M5wrzNALinEcY2QuoGzt/U4ECeu961bQbzgU5vRL1GMi+BjcmevDyJ2OGGsv
	BZxEQBhd9JzlEq6Tytr52XLdNTaCXPmOT2mlzrcvXhwtK+dFskANNyUCs6hLaxcv/7wIZjiMuqzAh
	zf8VtifxU5e5tSwyfNcN7ai/nr6SbZiwns+Afdiz8xcw2DtGoQ/9XpDX/k3y78tqn78KMfk81ynQd
	1wDO2U/QEEEUki/zMCAeas6gR3lAaEFrWn89YL5X9BGIKEvV1ybxzKMcKuK8pBNOV4DGAEKeZaoap
	p/VdXhKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVF-000000013BF-07cW;
	Mon, 09 Nov 2026 15:41:49 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRV8-0000000137t-2tvy
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:47 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a214af2076so7452035e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 07:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238901; x=1794843701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
        b=b1GhxGlQyB+4iGdbiGInsJVfUxqM48BzLiNuRAYEMH3ywWye8wldcJmmcykpp3B2DV
         jtL6H5mKfFj9UdLoSpueKeNjOibhS+niDqhix/XbcKWLt6AfU+LYD20YCZ+wdLxRYw+b
         wU7RYJQ9hMR9zUHs/tn2Ga8h9WltQ5W2Ypm6FxMby7At9bQhgF8Myjm2BDt+fvn1JN+h
         FnKHYYyCNFW7KFxeStB/KAnaE7l42bkcOfTphC8ylmjI/EKaRk4E9XpqNuBMVsFllP5w
         jNweAi9+4Yq9cxDn2/bYn557WcpAhMDRFr3FI9ZJfXYcORlNTqe5dyhd44r5kAtJwCcG
         GNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238901; x=1794843701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=585xw9jBGIafN94+2hL8PTvVRoZk2mBN5Pq+TZee7eI=;
        b=PWJsjFj/7XHw7ielBqsw+5lgJ/pdVGwpIncCOsw8SpyxrCIiDVXv/ONE4ePBjod16g
         WmIJOapFUfm4y6T57pc7j8ZDTf38ofs4X/LVLsJUEbqM4s4i7rS7U4vdU/5xpFM55F49
         O8IrAZ7pQbJThg5z/QD3+WWzLfQLCu3WmvRM/2RilMCnStLMotkR5R9ROxoVpI45XVxg
         qHh+lFl1ttxcDrIlSPYhgZ10dGj9KE2d6MdbuLKWKQbm7M0AtX+Ktwk+Abtk4LheN9Xu
         klLwUWTNefTnNe18pyy84xdtIIf/XREEMD8Ysq9YhiBoBX2RQGzmz2mTwCF7MInVDG+z
         5isw==
X-Forwarded-Encrypted: i=1; AL+hErF3wsq89uDVkzCFXDREa0S+oZMGZbvSCPWu3Cv/W/EMpr6ntOFU8SeuBsL6T/j50KaPdJW8T16UGgochztY@lists.infradead.org
X-Gm-Message-State: APuU4Z/odgvXBUa3SYTloyK4a3Ju5Amn6H4nkw7J5mBKnqpSElvla0pX
	in9NrAdacw0Xu7Xfr6bqvgGlGAs+pS6d+tY7tPacNGlB26rCg2B4a3bR
X-Gm-Gg: AYBFou1J593cUOeJB59pDZ4aNcu9JAuxvb40RNOO60uxRGL8L5NNND5HpRU6xPeH2iT
	w1Nk1zHdh/RXANJjYYk3ElDR4wIbrfF6p9qBYEBPQi6QdPis9gCE7LuJt7P2KLQ01VXduPBrN7x
	/YolBQl96C2b/7GubbLM1e5QvV6KYbUNHUQVn/XE7KehfhoLjfrf1Sr9dyohgxwb8vfeH+TzfBa
	0uip1WYzsWdeC86OZnxOwPQbGr3reQFV9dAKV6YcRvfZmKmmVW72Ylf7u3vmROjoiWyNex2qH5R
	FVSAcWOczm9bzcEb++vLSc0ierBp5ZexSiYS2OuVs/O2Rzrk+tBnScxriB4IwQ8y1fSCeMEHUCf
	xwt5nZC6FPZR2dUNbuiiwCCASz2Va/zFQnHt71hHRxWVrsp/M9OZoqyACfuYaQnLKdnJ6X5bppd
	H7tn+vfldsXHEzY25vXME7L5ont48rPbGccbOzL4JhvhdaGc87mTctlGRi2nvQ9eiPQoLZEH9wf
	j8CT9gFPucPA9yWSmYB9nhL1HhRal1XCMxVH1On69c3nZYsOKK0VPJXpGrylK4lTRPpOmO6eC0/
	Ru0Jwnc28WBH5Pku/k/iu+Uaag3d9LAfgfIjaS7EXxZEwuiM0CKTqHb8I1MpEdcVoaQ/lOgVjvk
	+zQ==
X-Received: by 2002:a05:600c:4e92:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4b94d76c213mr90091485e9.3.1794238900743;
        Mon, 09 Nov 2026 07:41:40 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:40 -0800 (PST)
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
Subject: [PATCH v2 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:18 +0100
Message-ID: <20261109154120.592392-3-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074145_676169_8DF9287A 
X-CRM114-Status: GOOD (  10.80  )
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

Several stanzas in the same file already select REGMAP_MMIO,
SND_MESON_G12A_TOACODEC among them.  However, SND_MESON_AXG_PDM does not.

axg-pdm calls __devm_regmap_init_mmio_clk, which
drivers/base/regmap/regmap-mmio.c provides under REGMAP_MMIO.

  axg-pdm.c:(.text+0xc4): undefined reference to
    `__devm_regmap_init_mmio_clk'

The driver can be built into vmlinux while REGMAP_MMIO is a module, in
which case the symbol is not there at link time.

Select rather than depend on: REGMAP_MMIO has no prompt of its own and is
only ever enabled by a select, so a depends on would leave
SND_MESON_AXG_PDM unselectable.

Reproduced on v7.3, arm64, with CONFIG_SND_MESON_AXG_PDM=y and
CONFIG_REGMAP_MMIO=m.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

Fixes: 2cfc123eea74 ("ASoC: meson: add axg pdm input")
Signed-off-by: Jude Gyimah <jude.gyimah87@gmail.com>
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
index d0f60f8af2b5..4b06a9e7c72a 100644
--- a/sound/soc/meson/Kconfig
+++ b/sound/soc/meson/Kconfig
@@ -92,6 +92,7 @@ config SND_MESON_AXG_SPDIFIN
 
 config SND_MESON_AXG_PDM
 	tristate "Amlogic AXG PDM Input Support"
+	select REGMAP_MMIO
 	imply SND_SOC_DMIC
 	imply COMMON_CLK_AXG_AUDIO
 	help
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
