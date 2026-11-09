Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8300B606A323
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Nov 2026 11:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=niYZ7Lb4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LPLjkYKQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=6qBGLb5CCeooFvfEcu7IkSPbWHScUc//5Jz6OQilZLw=; b=niYZ7Lb4STAFRkmWrlQHq5ZHiS
	Syn1OQPJShJrGfuX3azbFkhM5laZFcvViJl+0y8nhqA8FPssY2n/JzdLHMlRRLaECDsNkUsGikioq
	2HF6LbUcpu0CWE4QHMbsN9OvjCDfvp7alSUDazQkXN6EnBtMlqBvrSbBxFfPlvMOnBlSuJ59kKcE7
	eghIrH2gW+Gsi6+b6XwXPZSvPg9K8+DDK3ITt67ICtjq6IkJHOTwYqUx3tHjH6SLIT1q8oqI8u67o
	aqvxo2zeQvMe3Yz48ODiZHkzSo+I/3TjWbkHKAB8HH6x1YuUTPfmxXj/GGrzMXVSoiIOCQ39vFgcC
	016b+wbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNBY-00000000UB5-1JUh;
	Mon, 09 Nov 2026 11:05:12 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQNBV-00000000UAL-2SnJ
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Nov 2026 11:05:10 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-490585eddfcso599344f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Nov 2026 03:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794222307; x=1794827107; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gruXRLrwC50Q+01zYBAKobujyZnt2WH+acLyGLcBGqA=;
        b=LPLjkYKQ9bkbxfJFovmGZSevy/OEEOVMm7LMEt+fI7VKWcQfEZuuTweTSC+MFD0XRA
         E2xDVE0nWJvmA6sAaVrIXEXihKppzF8d9L2V1Wf7d7OXrlpDXbxaGizdaq3oDc44MRsS
         dS83bNV7Zme/i9s8sHf9MOQijbd9xiwbVQ15HCeYjDwjwCZ1cVqJPoTBOhiOEkQspQKE
         kCZzIFXWS1gUzL3zT3Xwji19mHcUTCgT6GYAhxmKTmRPx8JHfOQ7gCBQ+cLhS/Ekcnc4
         osJWM/E8h9B+JglEIDro87aghBjBbL+AZbVo97ObHC8wRq7HbrotQFxib/JaEOx4IkfC
         4pOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222307; x=1794827107;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gruXRLrwC50Q+01zYBAKobujyZnt2WH+acLyGLcBGqA=;
        b=M2N0yDtSNBinshu6sck64wgWWwS6zGw3Lsxo1LUh1OqkfEnm6nBnav6aeubWewRGTH
         3cqHkzlF+J+LVECrd4FFooyHzwtSEnT6cuXnHJVyuJnesoZOoZQyo9Y2ozM7EX60o/Zk
         BhxW5o13+kLA90+hxAvR6prQ+bd/3Z+cPTRRVOty1dJlwK5DndNSH8r+dqWxbbzfmFrV
         OQaASFdrV2LLheuL5hiGKcbYOqnjSHcwHpBmS7AKhK4w/thiLmDPvtUpXQshhhPu8ChE
         WqCPYg9NahnIG0AD7RyV1yFFCoF/v51GqXJyp/f9MInv6Nl21G9+Sd0DlW0yAswOwpvC
         X7gg==
X-Forwarded-Encrypted: i=1; AL+hErGxxjVeD5lnJSnNt/OWJiEPayWiUrMFUwOUxrnOpnoiXD3NEEhfWSZv+AnY4E47M3IvhCfsLLnqp0H5ldwp@lists.infradead.org
X-Gm-Message-State: APuU4Z+AFDnbXoRt4KsNrr/C74Vgq6pGk6SR7iYDVlkJ4rKK56JMwBzV
	V8KDIE0ViY67L5UnCbWKwpeCU0zGp81DbNoaRp4tS5BTYQORp6f84hmwyyCNV3IF48c=
X-Gm-Gg: AYBFou0FQStl5+RwkYRrxMLEey+lb8gElint3y3fguJXm8dh4ocJO2UYWrvbwhmD25D
	5sooeUldpcIjmiITTr2zcaDwagHXTZLYwP8H9P+qX8UE9FzQuxFQoD8k8c/v4aRFdFfW0SjAhat
	RWVfOWgpK8yCYuXxHqDBg8dkcP8XSWZgsLU8tFR/zrM2k7Cm4wf0PRidYN4zgz8/oeTttodO2vl
	O2MR7WCBhQrRnG0h+1eCbj6Lig7DR9/07Z//k9ZEiGSMomPgmkpNPbH1p+oJmStbTI+jwzcWxxB
	cdepV0HDuJUwBa+NSWFELiB5w0/u3xQrnSqcHUDor8IhQzJSsYfdoqoH6U37dic5shw9HCW+Ka9
	AcxDDgt5RdxfXo8zfEGz2j4ve3wEoPIHNJ0plfAvg0FV48YW0OgtyeWATdSxX3H0DUaSRq14O0i
	abeVwuhsSnNSboq1Oz8pG2V5yVs8JcwIdkR1/d4EY6gW8P+csAuX/Q86hP7jR6ETqHsdrLCyEBR
	u3r++aMycbtY8uuD0fiAb9bgW1GMGs9s5P53ncobVPcybNrXcRgYy+Vn+o57gSjNwtNnSMnog0W
	YbbKOMj4SZOSfJg30RrvldWvo+BkIfrq8+lWVGNOLkc=
X-Received: by 2002:a05:6000:2501:b0:48d:f460:2c62 with SMTP id ffacd0b85a97d-4958c0beec1mr7604586f8f.33.1794222307486;
        Mon, 09 Nov 2026 03:05:07 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596f9ab09sm8970489f8f.28.2026.11.09.03.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:05:04 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Nicolas Belin <nbelin@baylibre.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Shigeaki Asai <y-asai.0816@docomonet.jp>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, John Williams <porschemad911@gmail.com>
In-Reply-To: <20261004-meson-gamma-v1-1-6347558e2bb3@docomonet.jp>
References: <20261004-meson-gamma-v1-1-6347558e2bb3@docomonet.jp>
Subject: Re: [PATCH] drm/meson: encoder_dsi: load ENCL gamma table while
 ENCL is disabled
Message-Id: <179422230388.1497673.3746542387809770384.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:05:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_030509_687313_9F9B66A0 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Sun, 04 Oct 2026 23:50:17 +0900, Shigeaki Asai wrote:
> meson_encoder_dsi_atomic_enable() programmed the ENCL gamma LUT right
> after meson_venc_mipi_dsi_mode_set(), i.e. while the ENCL timing
> generator was already running (ENCL_VIDEO_EN=1). Writing the LUT
> during active video stalls the hardware: L_GAMMA_CNTL_PORT
> WR_RDY/ADR_RDY deassert and the ENCL line counter (ENCL_INFO_READ)
> freezes, so every remaining write times out (~8s total at boot) and
> the panel ends up with a corrupted gamma table (wrong colors).
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)

[1/1] drm/meson: encoder_dsi: load ENCL gamma table while ENCL is disabled
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cb7f6d9e4b1d0a411b628ccf78695ad41c66570

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
