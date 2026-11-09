Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C9606A31C
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 15:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=degKS2eX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=oJVI0SNI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PvSfJQ2N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EaAHcohRfNzr/qAmL2DDcTXQjHOF2493BC+jI4v9yo8=; b=degKS2eXqBPeq0p8ZvS3y4CVBU
	X7sqchexPVb3ErZkqEg0Wu086YbAXbD+NLjHgNuXjbQP5vCtrfqh0JIQjb7itG22B3wbGkgoUp0Pg
	nt9i8zam7OjldqzXFK/imtkDlX8CY7GnrAZZ6wbw20GudKXRK97gVEaE0hBu1bQkYeZubVrr7Otv/
	+uFsL5bvFM7GRX7G6YLnQ7woPUogKvFpue6N4XwImfQgTXPk+F0h+30fqKZcfTJMLJW8i41M3nrj2
	fC5s2vjzlBUVh/nFVtdt0pLvTjA1u7+muI8c5jda1blbPhGX3lQ3ZKct6FGBukX1F1pXFFmhDRGDO
	cTfLS4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVa-000000013R4-10Ha;
	Mon, 09 Nov 2026 15:42:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVF-000000013Ao-0A1Z
	for linux-amlogic@bombadil.infradead.org;
	Mon, 09 Nov 2026 15:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=; b=oJVI0SNIU2/1jEweIqcl0D3Cll
	Y5hskGLCYE/9ufi+XPBIiaWTMEIfWYvM9yqa0CENPd16w4EdVRusN6tLKS5MOWhgP66RbnenltbBY
	oK0KILYftNgUNkNepR8dga0UBog2El84Jj2l/EFcqbnjV3kA2xTVffywZz7r94kxEi01FMgltSDPr
	7PNdGMSQ2hS7/+a2S78A52wy5FMnBLYFfkY/FPEZl+q6GagQ0VOION+HA8SrdMQ/aHZ8408e+Uevs
	D8eTyNZABR37PCN44ca2N11Q74/3CZUx0oo7bvDK/3XeGeypSlE4kNxTZOUlJP0Upx35oxzyONTCh
	x7rc+sdQ==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQRVA-00000006tRB-1QDp
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 15:41:47 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so12465235e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 07:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794238902; x=1794843702; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
        b=PvSfJQ2NemtvonfqiZkFO7rBI2tn0GJg8MNb0uf2efkZ1tWX4Zd28rSrveAsGo2JwC
         eUayp6q7jHY850smoP9iOeumUSHMMcYLZH9qER4qr2v0XKh8eL4kG1ycyUSM38qyFl/z
         r6in1I2rA/iCrn2QGp+wY69RtcAun+dDhA6okxtAQirii4S7c9VlKwUfUO2g8BSfYVW+
         hgRQJzTOGirb2x0OvU26GXQ5aLVqPwXVfELCOXQmkGRHwvpxZ3KNT+eD4ADc7gtiLaNV
         o/Y5MbbSfCjUH59pmU21PUcynhFgzfJw+PkDwUkUkXauCTFxBKRFnyigzsvEQaADkH6o
         IXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238902; x=1794843702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XlmZHYOx1FRac3Sx6c2cIMbaPfSR9GF1lQoycwV/kHg=;
        b=k+Mlqy7FKRrPUGI7PCAMT3YVCYwBLw2M+BgKA/59Uv3D/M37+zJaSsYwYrMJAExMh2
         4HYp9ZuQ06aElFphc3a5c3D23RbeKEa1HZTjm358Ka+/tSQnMpm8FEbfDIxJjLfXZVTn
         rzesJV/11aASuMjGfAzwsK1i1FrJljjKW4B5TqOWr7e5wFjzCXHcLdsUzl/d1FfzSGTg
         cQZaIo3HvpGRwwnWbpR0C/Wu+ilZdfpSl88poGaaldfj5fd1/yF2yN/mojBkxoqOQVQg
         m+p/LfkoQZFfxDe0NwreDmxnR7WY0MqMr/j2WUdjBi1z0RloGWxgre/7bMTeZ+ZRjUIc
         CObQ==
X-Forwarded-Encrypted: i=1; AL+hErFAaTKumFiiFaKRH27/J483Z3tu/rlFvt9a7+5ARDKClxFypIsJN1bvuP2eRBsebTrYMEQ8BKaG+22GNDc+@lists.infradead.org
X-Gm-Message-State: APuU4Z/jE2eSjsqwdbdMS8dZmDLGss+rE3RfGtaRnEI+y8vgU8TWfMby
	W+XIZtyjmJKrSKIO8fPpWlJ0XR/IRofUyzemq6bK/bnHM0My0V2jtkqT
X-Gm-Gg: AYBFou3tl9GL+IpoJezNlUhIyvXz3jWTFfp6/VqmWWa++ILxg6LoBe4zElblTYqjnDV
	Vv4rUVFPc460dRmv8EETNDA1DDkjLOLmDRrliJ4OtLJau07GQdjKzJG4eUPZln4jmHnpAF3Bhpq
	u85HYbFgEKam0g+OvcuHb2rA+Xt96t7zh9/Kx1Aw/FHvcaCZqUbiyaTZ+vxZy/qgitgJVUBXLNw
	ZqscUTUYidv6s6IdZtS19ugaM/XGWQuYtoiQH/OMn0PnqLH05AtC26+QXsrSSxXLGmt+MfRtGxc
	/11bO1wrRYln18zI6EV3DIXe08SA2QHyztv/xRX0P48q/pS7VmEPCKNiDPz/FuIfkw4WwOU5vPe
	HVdKXAu0SaZg3CQOu+ygOAN+u/pGNh+r65ANjIsRBe4jER4LhDljx5DXM4E9qn9sQzkllV1OCUa
	G9z99SIpF7kmDqYbY4uUz+DoBpkmh2opyMuiS0Fd/KYPH0OHOlDBKkLsLr7v3c7uXK7N0zGqfta
	C9HOczdmrYJu0CWdEKxgIDYWWch3lyKrZpdWsuYvtUIaMrGVl8zVfXC5s88O74AsB563iZYr/8Q
	SstIDfSTFvLGnTo99Vk4ZRTS/+GZWXEKqwXiNOo+Lukg8nCdoPuGHXUKiv8tkpxYKzFgPncXThT
	uQw==
X-Received: by 2002:a05:600c:c114:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4b963c7c6e3mr61028555e9.16.1794238902401;
        Mon, 09 Nov 2026 07:41:42 -0800 (PST)
Received: from kreach.multipass (nat44-21-238.net.ruhr-uni-bochum.de. [134.147.21.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e32ad610sm561650375e9.3.2026.11.09.07.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 07:41:42 -0800 (PST)
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
Subject: [PATCH v2 4/4] ASoC: meson: axg-spdifout: select REGMAP_MMIO
Date: Mon,  9 Nov 2026 16:41:20 +0100
Message-ID: <20261109154120.592392-5-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261109154120.592392-1-jude.gyimah87@gmail.com>
References: <20261109154120.592392-1-jude.gyimah87@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_154144_346623_F482E7EC 
X-CRM114-Status: GOOD (  11.40  )
X-Spam-Score: 0.1 (/)
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
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Valerio Setti <vsetti@baylibre.com>
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
