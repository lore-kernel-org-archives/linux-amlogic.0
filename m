Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796A7606A326
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UUonUKfN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=T7qLUASh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UbWq7T+1DyWmqbgND50DkqtWZsm84q/SmLFd2Pv4Gks=; b=UUonUKfNWO8a81rnfrOXrY5Wz+
	HLlrEnVrXqQut+EiPCUV5Sx79Avb/9nLgocwX3jfF7VPGln2GuAk6XiT5I3MaymX0c4PgPVjxPeyd
	xhfjlic3YBJ47RQfBwW80tSZv53LRKZ8Xvsyt/4FOLiH/PwgWzc+qqTrgWzvGJJz56r3kS2bxOpLo
	55QRNeKrAYgwDJyYg4ft6H/8D0+FJh/fS5i5urQ+lwq3fRzFSIFb9hN4l/rfoj0U1Ox9Z/n2FOqcb
	aQBHJItXx/ma/z3bDFnE6uwYnOHKTitHs8zMbdqp20PgF5juHQeh1RJIIdguUNLyyXbXO9WeUAqgm
	UQ45mlCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkSI-0000000F7NP-1uy5;
	Sat, 07 Nov 2026 17:43:54 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkSD-0000000F7L2-26h4
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 17:43:53 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so11430435e9.0
        for <linux-amlogic@lists.infradead.org>; Sat, 07 Nov 2026 09:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794073427; x=1794678227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
        b=T7qLUAShhJd0k3zQS9+k/8HH/3gnFHUd4YxqtYTsIHJipclrbK2Ovex932vhBmOaqv
         +u9ODhpbX1FFYMEVzuWzKtgI8BTIaHmvszocEBdwpKRizzCrx4ZaZufzyOUoP5BoOxZG
         3eumMoeYBxAAW1C+zx/dywPwyBOrexY1PXLQ78NV8skreH0D36F8CcXd0ThEtMMT7xre
         c9X/TOwPf3xgVCpPSv1aMM3azng45Vc96E1ykoSOlNye0PfBeMrJzFJlJKqHOatngIe/
         rY27QfXck/en6SzKADrS4fF2dR0/D89IaL22lu2QFh105DnNAYTaaN8czuhQjkXIs2em
         Q9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794073427; x=1794678227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=peWVPhRlZ7hn/ezXyD6N2KX4kKjmXKdM8KfCK+LMazg=;
        b=kvuLKlmM7G2NyJ3igRdMAwojOnull5lxcFwiTmIcbrrftUFHtn+ORys9rqCCBcsLzd
         O9dDEG9tOCNO1FnYKtfHa+KgvToZU2DV3Pm5CrlInltDcU+L9Mh+AiVTO1mLvC6pSOEU
         h4uUsmX8FcBheE2cEqdds8yzu6U74XUvkNRgePo32glCsDVZzCigMCKVaw7A+raetr4S
         7+EBUqm32TmL3YH7mJsszYzfkUVdNe9OL4L+Yq3l+UVfldMS/4tG9+Z511XVIEeIqflZ
         fnxI1SNCuVgM09lU+rgjZ+3EqixaxRG9aVACPZ6RzkZl05DY4lrqJyx8g215xe2eTb2C
         SpCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHngxAgdieN/HCGM0Ng/vpr/V0Lu+XD1ABOmR4koZJ84eRVlTZnsPl5n6PATZ7iuhufRarkAdhronsWcPz@lists.infradead.org
X-Gm-Message-State: APuU4Z8GVmt4Hg3qJaXzHhhaRSjSgk2e46SX51AeewPXNHUKoRjVpqKp
	1WHQBo93zzboP8DHatutpP4C+IYZgEMH8+WL87Yp5H9bUYRY7DsZjvte
X-Gm-Gg: AYBFou3eTMqp0zKMF2JBsY1UUN3zQOrXkEUH6yLm0K0Yi3i9AkKPvXpnlShp2xEwh8u
	NVc/Oxh8cRNrBZHqT94S6Pf2CXju1ov3GETdILAgmlOVWBln9CyHwOVFO5cukmSwxVHtdZ5kLVm
	4UlH1mEML6q+PN79v1TMAz7hjcwSMupE1EDym4Vi00rR7WwRi6giRSI5cntkTTNsh4vLo8253NU
	Fz5b7kQwIf+Ac/gCoiHkleDIRZ8SQqR0Zj2Ks9wb8fUfI5ddhzXty5kFiSZkLSl8MtL/tSVRZXn
	l+HxA1FGVb2SjJq5GEXIcFQs03PxPoeltu1F6ASO1TyOJqPv20u6ddpwnze5IIYtgw4T7vhueKP
	e65VsOh8bdHPJrlnr6/PpedFh9CtRXaricUXRkSu3iq0qK8n5mlt4bSWkzoSQTWRDjC+fDc0kgw
	Rox2KM6LJ5F6NdlUrsM2ELjrhZzkMJx1s04kE2VZ85b8HECP7eXdSrLQ3rNEVNZrVi9pPxCIz52
	E9y65wb6zWPm0+qpFsWtouruETTtmKGurUvvfSuWMKDaVV0DNm3ZBkyJcWr0OoSuLpcFu5YRSW0
	hkacv6eOGPDGIy0vP7ewV4ZVf2sslW2zCA==
X-Received: by 2002:a05:600c:6814:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4b6df4f2554mr125464935e9.31.1794073427028;
        Sat, 07 Nov 2026 09:43:47 -0800 (PST)
Received: from kreach.multipass ([77.37.5.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e3291526sm91814315e9.13.2026.11.07.09.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 09:43:46 -0800 (PST)
From: Jude Gyimah <jude.gyimah87@gmail.com>
To: sashiko-bot@kernel.org,
	jbrunet@baylibre.com,
	neil.armstrong@linaro.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: meson: axg-pdm: select REGMAP_MMIO
Date: Sat,  7 Nov 2026 18:43:23 +0100
Message-ID: <20261107174323.577410-1-jude.gyimah87@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <sashiko-outbox-203084@kernel.org>
References: <sashiko-outbox-203084@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_094349_552371_DF5189C5 
X-CRM114-Status: GOOD (  11.49  )
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> What does "These three" refer to here?  Nothing earlier in the commit
> message names three stanzas, and this patch only updates
> SND_MESON_AXG_PDM while the other stanzas are updated in separate
> commits.

Correct, thanks.

The sentence is left over from an earlier three-patch version of this
series, where "these three" meant axg-pdm, axg-spdifin and axg-spdifout.
Its referent only ever lived in the cover letter, which git am drops, so
the commit message never stood on its own -- and the count is wrong now
as well, since the series became four patches when aiu was added.

It should read:

  Several stanzas in the same file already select REGMAP_MMIO,
  SND_MESON_G12A_TOACODEC among them.  SND_MESON_AXG_PDM does not.

That is accurate at v7.3: SND_MESON_AXG_FIFO,
SND_MESON_AXG_TDM_FORMATTER, SND_MESON_G12A_TOACODEC,
SND_MESON_G12A_TOHDMITX and SND_SOC_MESON_T9015 all select REGMAP_MMIO
already.

Only the commit message is affected; the one-line Kconfig change and the
other three patches are unchanged.  I would rather not respin for this
alone, so I will fix it in v2 -- please let me know if there is anything
else to roll in.

Thanks,
Jude

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
