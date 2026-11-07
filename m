Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA7B606D82E
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bmQz5N0T;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u0cvBqOu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SSsAHX/3UneV37T+IMOuir2zhc3bhWmZKvGeYrTlvK4=; b=bmQz5N0TJow9ytdL0y0+YNmLqu
	yaGEwJICoMZ6x9nRIGSCp/WKWusG2pJcyZJ4bLbD3BeeB2BSzd+dwh3eadx4L/hyHglScqvkTPbfJ
	cG8iQco+mj7dgoKFdD2PrVMIbQdz0Fj50FUf/uyrPCq+n6Q+RhhEYy49UxjkaYrJJ5t3p55iWK1u3
	5Ei3Iyk1yXEHsji3QJIQ0UWVis4z+z4lvlsjJJ4FGrfpjtQ5R+TPmhpA34STh7lsUuSGefXDBHJdg
	1D7yhMHcHzFqdC2BY3cIg8hwc1CL0S3KAj/N1VU7Oqdfe994lUEFi/b8wlD59owvXPKMaVzEClSc+
	UOO8TNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjho-0000000F3I4-3lIK;
	Sat, 07 Nov 2026 16:55:52 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhl-0000000F3EV-0dja
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:51 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-490a0e72588so803685f8f.3
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 08:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070547; x=1794675347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
        b=u0cvBqOuZibGYXlrmK7VbAJfhc7U3mouUd+L7FxTaiEr2hPNYNLZN46I8MbDhyMGEa
         zXgtQJnD+W5nu+SfWER+1KL1/PNdcXfCElr19k3Ste7qGjTvv4TXIXy6TQMMmmnq6fTX
         R+MHqNCKmQrUECUH2TBstq0GNCQ1BSIzNqyK5yWoMTeD9B6fjNYDxHf6fggGpiA8Kf73
         AVinWpEL78XWm1cqCcD4HRdACZRs5LkZh8gbsSAXxiEI9jGtD5fZc9FK35DicLyiZTgQ
         Lhe5el+AxrjGJAWAb4ldKdufWvL6JMnw+AqSj1AZEschEuMiMU4HcDl4ePmpzEuGrDrw
         96Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070547; x=1794675347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pu+Rl+gMqP9If0Ub7sYkKuMz0VatAGisa2iKuQxjj6U=;
        b=EnuvWbnvfHlcEfsMW4dCH56yIzky1JlIanE5qqeolkH6iwHZmC/QRlnE0r5WHoP8Hr
         zz7DnNFrOqe/LxPKRUOeTMiDiojP8YWrCIOGiLYI8nLFmIGYN6PlCCTfRWlIBEhIRCqL
         jWOR0dlF32s/jfvZAj/VuYwIuySZrmBlF7LFBx88nfF9FPagV6u/uFrivP0MLD6l9bKV
         3JkHAheOYubVgWFmpQ/CL/Kzlay2fm/B9osx1YT6XeyppUOBtEv4s/vOPrH6KqhNI1wx
         eYxE7RHKrZJNoLMQAFMibANKda9LSRTXOIkOa+zcPOQNsOVZptQpJex8nr+2Cd+Zw9bB
         5Omg==
X-Forwarded-Encrypted: i=1; AL+hErFXIz4K8/OdK/tszMuRI/df3Tizk5k7++dyhyednxDbtZRXt0j4LBXeY39E0LLEroR/DUp9j8ZjnsxqLJ59@lists.infradead.org
X-Gm-Message-State: APuU4Z9iXPvjBH8OiLOocUTcB6z7f9yCb2AIrUZ2qpvGUhAuPbOE483L
	8CGYskDb04x/jWtYghilgCVEfwPdNDcKWy//C3Lhwod6Z9J4263JlRdj
X-Gm-Gg: AYBFou0COdweP81y4leEVjVdVKHAhn1q8mq+/s9Y5WUSE7Z518DmzonpS3VaM6gyRJd
	yQ/oX55zDJrltRBST4JponxDMYnD54nbBZgnvjbvdbqU2PL39OZkI1eRPzIhvr1Su1rfYWAwqOm
	2kvFzKtiodqNkNE1cExId5yFSImqr3U1hXS9pBYp1qvLpkr+sJo1+i7XDgWy5KopxZvlnhgACQm
	XQkPbYSPw3UMoj7hDc/vJK0JHmqvfFQJ9qGR2Ht7CTfb6kENqMnM89ZRLO4VsKHY8gEVD766owL
	h+cd1up1HArUtYM+OCAUkSVhbC7J0Pss5ucdV8V21IwAinU+BMAfIIYdFZFcbFpUT1+Ewhwmu2x
	deezucTYf1n9bu+K5dDbiNZPldRPRiXltWBE3El7VLzPmjp8VoDQ/Xia45RhmvKzl6a+E7yIYEy
	opjVzgxIB4ZkWQ2Sfmx6YNgRqdTKAURk1+byFpgb9kaAgHQq9i9GBcC+SIKRcdv4f5XhIAGjR5L
	25F7KBJvsdEUFT9AKWPFtUk/Q9hzl4e4TUJsmyiqzr4tSxXpJ6WkJGhVC0OdhW2KDLR8Foew5z1
	ICU67KQquvdEeC0CIv1ummmRejXIWM2TxA==
X-Received: by 2002:a05:6000:40de:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-4927ec0bb02mr11650221f8f.29.1794070547458;
        Sat, 07 Nov 2026 08:55:47 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:47 -0800 (PST)
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
Subject: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:25 +0100
Message-ID: <20261107165527.576383-3-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085549_204141_35078A65 
X-CRM114-Status: GOOD (  10.40  )
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
SND_MESON_G12A_TOACODEC among them.  These three do not.

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
