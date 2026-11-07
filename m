Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B710606D82D
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 16:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AobVq01L;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZGYbp3a3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=lv/d6Lht3yU+sNuQGe3ue8fUTWTosAV9ju26YcCAyrk=; b=AobVq01LpIwnKlYPk9bd/9fibb
	NPf52FFKtkfeQSl2vx52/MPPdqKYOBgpYcKS44zvM57/QGVOurZvXWmIqOXtaHTuLLjIqZeUjDWa0
	0UstSzNpbTjzFCPMpZsP3GtPRLJ3WWZhZ8j/IDiPuS5CHeWiRExbsUb/JQdDIxTCe0/bYsBqKZw9T
	ScvQdeUMjKlu3SIXo4SuZpPtR+aOQ4lbgi/oSBGAlv67FIjaPAeWr2a6dxO/kpPC3MDYfYsej4lYu
	PIVeKJwP3NtUXgXTR6SxaMOcRdrnYrXLSjljvwdZ21DBn5vffXjSkbPPyOw2W7O1+1CpQ7ZQRgpem
	BRmCnn5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjho-0000000F3Hv-3IpU;
	Sat, 07 Nov 2026 16:55:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPjhk-0000000F3EJ-2jy5
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 16:55:50 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-4922523d1afso913352f8f.0
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 08:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070546; x=1794675346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
        b=ZGYbp3a3ip72WmBCmyOhDqV1xBtkmvUZo0zVFtjq+MuW7+04Ga6K3mUY3RJwKi5z5U
         NyjeK/ScDYhCL05m2OIZl5yKy3Oc2y3HsXSzq79fMYUXcSLqzxabIDTsxdZhkvF9PWAG
         gboQnAAonWbDZEs67+IArV1F0DsDfmL7bqTdVYWh2AC+ZFfMskIYGBt6tvHSa/+G2JoH
         FkYp0RnngNIMqi/DblACLAGA5fkPizAo6x/D0lAEjwyqbaBP1/jETK7On3SW+8hraSnB
         SV42NB/sG79+2UN/m943dYpIOisCJ0T+rhu/mRzL9zziuEhbWGRRF/a+3kSIHlWbIVFK
         8k0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070546; x=1794675346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OG4qIIBetQYpr4S2IC2PulaSdrMca/uGch1jgN/saD8=;
        b=iWh3pp2pqvFntrKWPwgfU2AEqOmChM1bA6I3jaNHGhfaQy8WhX6aN/yzT7nNYvR4ER
         3MRx9tWQSSlNGr824Tv8wGGCEOEbgOAmdUY7+LfG13+haZqc4KUsD/eD8+Vtod5uR+I1
         7pH/kux8jxa5kvgYDFoYHZ8vm3a2u4fBmv4jY9qfClfOWokXng2dtiH2SdvQmgxiucwg
         TyiNERjSmxZUYiZ9BIN10IgMZR02ZOobpndzywn81uyUE7ZTyw6fNYYgvrQaEfsZEyf7
         FciUingAgk9FrV9Sie5d6I+WZd2dOCskRns5/SU0jW7BbQ6r7tLpp3TcZYSPY6EmMQsl
         uRgg==
X-Forwarded-Encrypted: i=1; AL+hErFRWyiCPN1sQL0UMeezsKWhWWzXwO+3Xam9Dynb9hbH03thDBdc2P2whrgadsPjrkgOA4rocdoQeAZ2NDQz@lists.infradead.org
X-Gm-Message-State: APuU4Z/NErtnv1Ev33nZXlgFvXzd4N+ajsjABDkJV42+60RH1je8IPdl
	7l9XCJkqhoN/1IGCB98vzokXklZzZ/2ALdgtK+Di1DVgh1TvLLJKLdQh
X-Gm-Gg: AYBFou2wBTYHjex0S3nDZnGyV2MiSULlt6X0IAaH6Ja2j5tN4we5TfPmOpPfgWWyp7w
	4e52KhkwhZsdH3j7PzdmyVyB3iZR/hIT7FLM3WEfWfXEiut6jCqL2cRJO4Cn9uKNV5879haIpNa
	rP2mlomns4E2sIRQNJj53aDNUUBX1GY6lmv3nhaFAw3gl0w5ay5WzHwdvdT1/Nm1645GjFIiyyL
	XZWXMY1dPdTnB1hXZdaAJWJ+uYrf+M7HaRmxDxwbInLM7Tg7eX9ehfmXLyw41RgJrCJrQtDJV9R
	NvqjxE1Mz1npl02Ta+n9YnB/hmyHmqVJesH4YGhmalifZDeeSFE3UdZkz0TKk4uly65jAnwfDT+
	YLjmUaU8Qd6BIsOzJNOgAdmW7823PWcplX0b6qvOTTj89hZPtrPgYMICAlvWjzPcZ20KD6a83sF
	I60YV31PKJB7BerP3NIEyNJwNS81CME2sfplaXPhRYkVJwd99OFgqG8qKn2liOf7WhVtC7S8Jwk
	zxkD5zYbN4VTtA/ks8Ab20GwWUtaar0NUG0E+HoCHss7sFITXAEZHvCzjxYrAFQyuH/pbHsK8dq
	Wmi4cKvWDIdQ2DyW2V6Tw3jrfpV68+eUxw==
X-Received: by 2002:a05:6000:470e:b0:488:8ab9:f74c with SMTP id ffacd0b85a97d-492733d1ca2mr11716934f8f.3.1794070546480;
        Sat, 07 Nov 2026 08:55:46 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10544837f8f.21.2026.11.07.08.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:55:45 -0800 (PST)
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
Subject: [PATCH 1/4] ASoC: meson: aiu: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 17:55:24 +0100
Message-ID: <20261107165527.576383-2-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107165527.576383-1-jude.gyimah87@gmail.com>
References: <20261107165527.576383-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_085548_729256_E182810D 
X-CRM114-Status: GOOD (  11.08  )
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
