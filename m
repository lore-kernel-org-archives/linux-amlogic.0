Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856E2606EE81
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 15:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lPA/9NxH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHWN9+cf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mTfI3hGyZQgHROJy8YgEwDImPLpB/ZZ91O4SfY3CJNs=; b=lPA/9NxHZWzV+mvxfnKTZVMkSa
	xA8dX4K0f0ynqRUFsKDyAM93PevY82NRm+bAb2Xdz9ltHk0b9WRINw2nYYLwYP8xX4q9Z9Gx5OEBG
	llAX3gVaPTWMwaETLJqma6J5hdA9Fj4ybUDHfbLLoKwFn6txTo4Ln3v1v1LgJHJdEJ+W7OtKG9DZE
	JmayVyX2f7/v0jreiAeDGfbOCDiaVRsawjOlfaIkPtZ4yA2iHn5/TdrMFmH1WDh77LSos5M1xRx7K
	8J8fOesGi+oBayRdt1IF+gOPqfVVL+QB/3aGNplnQaymOGHKCl9i4zlusShwe3jJI3V5+jVjIDKud
	QR0W/YGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVD-000000013AT-3sMx;
	Mon, 09 Nov 2026 15:41:47 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRV7-0000000137m-2Mwx
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:46 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a214af2076so7451775e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 07:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238899; x=1794843699; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
        b=CHWN9+cfeKiCA6/s677rO1OCod0OGDGy4NnnVQW3J6QqAUpvJmNqjpkeMvemvL2Wk6
         N/rhdTJCcEUia/GwwFN9TtiXPwCS77b/eaYlZQ4hBfHR1ms/oIogUeTFFuvNO9QrbnF/
         4fGdeoRm5b7jltp3IEAF65Wtc9HYXAZYXvFHiiFzj4SqXVA5y+aoZLLeEzZCaBSbv789
         LjZxtFel80vvE8PC2V23yKI0MFeuj0U9Y7hyl/bvX0GX0w4eftU4tO24ALd7nDujsnkD
         B8fmBk4Ixpz566/9f30BcokRJqHAnDLOfUE9eGxLjK+JNCsNdoby3y2iFv9GOZG9+ugR
         JgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238899; x=1794843699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rwRazV2LN1Vepx1ZuVqp56gfdlRWSnLSTloj3LBbshI=;
        b=JEYf+6VQqvYmNBYjfd7Ip8HKtqSrGeYcb7AfNn8r8D6K6TmoU/3ZW1ay3NKRPTPBot
         GGq8amwU2YxxA1NQ1KcfgzVLHkUfgtg1IwGzT27vj5Ua7TgwtG4FuENBZIGmllVt6Szw
         GBS9POgC97cz3ETYX8nK7g4Kz/7SqwNeuDWxpnJtM9vIjIupC5//SOcNGdAROuGtDC1x
         /rKJXYCn2dK/oclIAN9DxZqDPUP0jV/rrYqzyISzeHKWThXHlE1Nih3x8wxEC9Vgvs4Q
         eIUIG4oa8NYNvTcgQ0Ov+UIs7S8sKnGmqZsaZ8uilA7SCyQ4DpNrsjIguf0/RodZp6Yx
         l1cg==
X-Forwarded-Encrypted: i=1; AL+hErFP95mRpLO7FLX0yAOsWRpFkYry+wlwra3g8ux/hJSK6B3IvcDyc/ingUYMttqqToiE8DRPNzOKHN7OEC+6@lists.infradead.org
X-Gm-Message-State: APuU4Z8mtH0wbShMbQVYXr2HzU3n+3UWYomHr8+mbfP8w+sPyuHokWGb
	uK2qEO3W9nmjShSZ5feYh4Ci3AMNFB32JFkG+y0kUfMLO/75UwpM7e2W
X-Gm-Gg: AYBFou2rZJk2spngzB4hM7weyrq6DxT+f+AbuPYS8VDwB1JozInZmtDMGBGMDhQy2H4
	PCFXYCkONJqA6yNUbr/Np4cxYiM3bT6C/2Og/1DOD3ZDpjgQbJUXWuWRDmpStB436yBHV9i/IHM
	RUzGVrp1dpgf7f3xCZrI3Itph+TfBonzqFXbb1dMAo78aMVpAdxxw+rTohORE2JJqRzkL+pufIM
	UMqClxVvHtH0xkEByLkUHp1YpB4jhpeaT/H6mdEAb7+w8OhpBGdOraFxZdxCEv08JoIn+P6xIv5
	b/agVwY88XFPIqbJLljN3UsNVhxUOTPZGHtuACrw6yrwtc7vZ+GCNPtIlQtbPhxJT9PbnK/1Gsm
	EIBtUXhJN9Nq6JH03EtmxegFCdDLNeaDBc0JBOqQyj27Lh3iLAuSZn7gilJmRUxm+xnQ7GU7Q1T
	cLPkfM3EK6chFwsxI0Gjc/qOg90d6ZMXkzD/pnb7qvPEcEftxN6j0vaDXJ3cCEiKTi742paLN3i
	MAs6osKOmRmkjCCkOn4Ljkc/+pEr2ulF40WdMELD3OI5pKwHIWbqAvGpfSmVc7r0O3r5jSfrGOL
	e6GSp1kaxa301nKyrDsm6o0a85W3/2MO1juyvXeRfNpL61JigEdi1uuYw6vamDQqsA5M9FP17ie
	51w==
X-Received: by 2002:a05:600d:19:b0:4ba:a5:b920 with SMTP id 5b1f17b1804b1-4ba00a5b92fmr12877165e9.16.1794238899088;
        Mon, 09 Nov 2026 07:41:39 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:38 -0800 (PST)
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
Subject: [PATCH v2 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
Date: Mon,  9 Nov 2026 16:41:16 +0100
Message-ID: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_074142_016979_6EE17FD9 
X-CRM114-Status: UNSURE (   9.44  )
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Each of these drivers can be built into vmlinux while the code
providing a symbol it calls is a module, which fails to link.  The
same shape in 4 drivers, so they are here as one series.

Affected: aiu, axg-pdm, axg-spdifin, axg-spdifout.

The fix is a select rather than a depends on: the providers have no
prompt of their own and are only ever enabled by a select, so a
depends on would leave these drivers unselectable.

Each was reproduced on v7.3, arm64 by a vmlinux link that failed on the
named symbol, and each links once the select is added.

Found with kreach, a static check that compares what Kconfig allows
against the symbols the compiled objects actually reference.

The checker is at https://github.com/JGyimah/kreach, and the
reproducer configuration for each finding is published with it
under results/.

v2: Patch 2/4 opened with "These three do not" without saying 
    which three it meant. That sentence predated the aiu patch, 
    and the context was only in the cover letter, which git am 
    leaves out. As a result, the commit message didn't make 
    sense on its own. Reported by sashiko-bot. No functional 
    change: all four Kconfig diffs are byte-for-byte identical 
    to v1.

Jude Gyimah (4):
  ASoC: meson: aiu: select REGMAP_MMIO
  ASoC: meson: axg-pdm: select REGMAP_MMIO
  ASoC: meson: axg-spdifin: select REGMAP_MMIO
  ASoC: meson: axg-spdifout: select REGMAP_MMIO

 sound/soc/meson/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
