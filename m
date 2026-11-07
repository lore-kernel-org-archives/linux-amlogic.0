Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A200606D81A
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ddj1afVP;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L9e511v6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xqzZXrtjBozClQkJaQx9KR90XqDrtOJ265ndEHzHldc=; b=Ddj1afVPrKK0XFQpBuhZ8q0N6f
	V6UxZRM+y56akx6F9xWfIjhBq4RI5Jn9yAEtX09sDbdrr+SQhWh2Lgx0/4qltXjY1yXqhauzEMC6E
	GwqLseK7Eg7e8xolnSrA1NhvBfmQV+e0bvqhZH6mkU8Lo6gvLipzdteHOiHYjfqTBWVu7Az9/JZue
	P0eQbsEMxWTaGbTRCSzCya8vGcvPNkJ/Iw7GwCVZwXfdR8c2wu3U8epNDuNJVPwq0VUfVtf4iDOXs
	4zQBcXdSsxx+2waG7fWe6Vf69ocNUfXI8ybl0zjLakGaQ++7M2FVucO9eupiw5Nj8uh2+7uclcpe6
	XYurfeuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhl-0000000F3FR-2cLk;
	Sat, 07 Nov 2026 16:55:49 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhi-0000000F3Ds-2lgQ
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:48 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48b001cd92bso824856f8f.2
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 08:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070544; x=1794675344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
        b=L9e511v6P2fAQNliRv8hVE4aXS9mAZSnQNsCNRudwdPgl9Mbrk4wFFzHvfbp/RSJ3z
         +XPQfN6YejvHzpZZjLtQQuEww1iO/q8mW4+Fge2WYMhtyKVKupUZElA2pIfc1D8A5gnK
         4rozz+CKsONVkScXEn7l/eeZ4Bgl34M1lQDycGoL91YuoQOhgeovebyWVWBMJs7uQ6Ji
         FSVBtEsbIUEbHa6jzonJaJsT5JbyMnfxy9/WWU+xnasHg6KPMnHmsVvGrWmTrg50atAV
         RFipQ2pTJvvykg0ChcyHXrTvqzvK+u+7RJ3xV2VOXEc7d09WBBwam+0iD7v/oWt27C3Y
         pNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070544; x=1794675344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yB3F3iURSo2op220m5n6KYAkOCelQKBFVJEduVBmqr4=;
        b=fBSPR3yWnwS50sueKnxmNRFjnmZt+FCUzs6ZunI/ul3CxsY//Q7bgF5sBEk08z/86Y
         DgUlLsqXuMNMpSVdMlGHAZXYVKolwSziPuC1+4jITZ2lhyKL9movBh/ryjjxsjzGHTOI
         BDT0Jj2f1PGbzw6vyq6/o7n3BMOGEAQtXF/zahICBEAaUgGVXPPYIY8JWxbOJNK1LIpA
         kqRm5EJyrPaqSbdJ52T1C7Qudbokd3w8uT/ssOPeX/HP82igclHgvAvPlzwefB3HamMI
         zAz9WoG4MdTpgR+n6RpdmmPM9xCJkLdd/hFfc4RKazOWKZjBncbMl7X5kGg0rL9Z8zgy
         Lhgw==
X-Forwarded-Encrypted: i=1; AL+hErGRNzb6f3gpPY89BDIGnbFyBc8ZrruDpgNhRM6Zqa2H0/xB+Pqwhc9n0I/jNH0lN99Z2PJDpwt/y3KwC097@lists.infradead.org
X-Gm-Message-State: APuU4Z9WuZM141Pn58n0iRoAPXrbHopVvJqT2O8tRixom7gTuM+MMHTn
	qbf3vjrXM98p/rubDNc6cmAm0GT3AVC/1V7r3GjXS7QgttJeFtm8Kq8F
X-Gm-Gg: AYBFou3DxXwGCn3XeCer/7GcwSkkdsP69CXRoPQLHnxWSNifwj8PZssMBBljHUS9FzJ
	COukdjp6h+Ho/Y82Or2dYTr0pJSV2GAjP7wtJTUoSKJIV/X1iI9rNgUqeY7h49YQDfdgVN5KzcK
	0+/xsX9r8rVlAmUqPL8hTGI9gsgxiHV+IN5lSCbNMsdFacRaLMjArmJ0RBnbQg+CWz9HbsLr+SV
	AVUfnX/O/ffNOk7tfazs/G3aXVj032o2IRXrxSR2cRO2Gj/AvP0tFK1DO+6+tipd9HrTWsHraBY
	1Y7ssy35K2jp8Nx28Hb8vT5stL6eqOtlpWtUmvSX48mvGecT1N1mUj7srHBGT9nrzmp1eCu45yu
	zIRFCOLPmY9vq7KG8hYT32eYxEnaxwKQZNRHI+BJgTk0iaDnbOhKIpWi60Pj7M4UaDPHQb6BJTF
	h21xzPACWrYiLkTr42mhH5JCrbA5Gabwxf1bJJmRYCc1Yi0PWynJKCok43czq8ZEnQrJQVMafC8
	2LhPDuwvyCpULdZK6kCH2XLe1G1xL+jGU1dy6seAbzFAiQoVEgdXLlOtFnZ6Y4MC8JFNsaoA77m
	sTL4M3BLz2hcbPq4b6nSJbYjnNlN6c3A+Q==
X-Received: by 2002:a5d:5d82:0:b0:48e:6092:dea1 with SMTP id ffacd0b85a97d-49277bb30fcmr10474276f8f.47.1794070543659;
        Sat, 07 Nov 2026 08:55:43 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:43 -0800 (PST)
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
Subject: [PATCH 0/4] ASoC: meson: fix missing REGMAP_MMIO dependencies
Date: Sat,  7 Nov 2026 17:55:23 +0100
Message-ID: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085546_713810_244902B0 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -0.8 (/)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
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
