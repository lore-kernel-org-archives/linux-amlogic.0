Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DA6606A324
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2026 08:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pDjvYhGZ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KuRwqttm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GIjNijMnknrxHKxinvM4KibnvrI9LGt3IwE8VdnLS/w=; b=pDjvYhGZW7SY3d5Xj1rgzZw7pX
	kMClpA6MKX/ujgN9AQRf3uF06LkfDyYrXa51YUReouCldt0w1+X85lVufg64HzjUekQlJrx0PAA0U
	cbXa5SwBi7B1X3nyiVxbscCFqypSzASqm8q4mb9xu+LzBrfOrPKBLJhBaRgHHYepE51CUWUckqUBf
	EP8IC6L4nqycZb3jhYSqa/vH/xbB/2eccMHihdjd244Wr7oGuLWY+Cj+RACsglErI5MjINo5tsJP1
	s/LJC2lfRkI2gnOhVU69xWglIyGJvYjAo6Mf4Okd5ky7Z/TSAu4GkfYcm20knClkHmc2Kj263bs34
	R2T4+caw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9rx-00000001XE4-2sL3;
	Tue, 03 Nov 2026 08:27:49 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO9rr-00000001XCg-1OBk
	for linux-amlogic@lists.infradead.org;
	Tue, 03 Nov 2026 08:27:46 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1946451f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2026 00:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793694460; x=1794299260; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
        b=KuRwqttmGsJEEbBO9Bb1YIzNmxwWZ9r6dbv79DJ5TRx/uWCgOMRhX50g5/hdY2TSid
         14yx3yYGpQ8Ut/DuM966N3UrCro0C6OgdoNReIlGML9fIl3WfP2yxFGWrbE5uQGLlnAU
         m1O6tyYkIjqvNoJlnGh1RBbLbB9Jgoe/iLBMjM2Fy8NcOGOYDUR4QtrsB01DVz4iuSLG
         gyQCCQxHsGn68n9dFTmH5+PHhQ+QuSZStVg+GwBILXryo/2ZzPCM6F0DpGZIGFSHiL2g
         vRwn/V22J2HBwHwYT2QITBBETeotZPCgCUCAAHgP//EqjJdlQh4AJAhqCKOlnhhut6fp
         HZeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793694460; x=1794299260;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E6pq6ak40PnPg7rzCuFYJAL64PxLZCXIE6ht0rHomGY=;
        b=D/upsSAjhJbx/Ar4pgzxhy8ukfRJ/yJOlvrHqpWvc0HSFtFU2ugyC/C9z/k1MWmnOC
         TQGCtxX0A0eC5lz1KUREPkmLr4V1p761e0NF7GlHefsoXXxAdMQVyNNU75teiulA+yRe
         LLkfIipQ2XTD2tm15q7P+9/G8Gj84GraE+aLEK7g4Rb+qEMH2JqWLATECnGRL+uzGf0C
         uXsF2FWj86FuKkNjBhO1g8lqJ8YAXCWs9nWcz/qm7i3X3CxCg7zURj8pRHRr9+oh8zhc
         uB+UoN+biighjNtbbPuf0UAil67S26xTFVZwJ5dHEa7lvANZDE4GpeOpkdUj1NYpiisI
         UWqw==
X-Forwarded-Encrypted: i=1; AKwUvByFZqKdQz05TmR30HCvjfEmwcy3nFtpeSg/aWgSm5oi/Zc8TITaGWT76BnwJ+WRi/lBMEzTolUABh6OOeSC@lists.infradead.org
X-Gm-Message-State: APuU4Z+A8BFnzEQyOqS7rxp08K/qZ7y3vKdpeqOxHvdBpK9LWYO6Cdiz
	2Q7S6Chm6hU8kvnoxdX/teWpb6BYU6Vdsufw+ZY7EvqaPPt5WLBCx2LO711vWiw1KOI7ebhpmwh
	1XXIXzm8=
X-Gm-Gg: AYBFou2HUW1LdVwE14wO7gIz3cVcnk+OvSc/HqkFmP+8e9jrbef1Yl05IiI/vr4t4BI
	FIZymth47p+GhIH630jhlvlkc/W9DtjE67nzP7QMggCLVG9nETs+eh379UgfqQzkeOn8qWNlp9t
	OmDWhXYvNdI64smVGW49fsVHa6aOI2e42InZyuABYZ1beOESMfFN4eXTjVVT4ZEezSYVJRZTVoo
	4onk822K6gAbv2UGAvK6K9upiSvW34FyKyMOdtrrgb21U5BRnrO/DgTgIs+w5MLhLuVjRjYf5dp
	PqYpQ93ea3EGYKNkVv6Q6EQW5mnAkNmW4uYK8Pl7LVe3dY0dYVeTPCrMIT9fS4g2pbGQ2F+F0M2
	DDsms0gbfc4wXNL+N42e2r2KxtxGWI+fimYpEnPpEpuqPr7/tz82+JqU7Zs3QUKiPnz9t3uRAMf
	JgwPHesgVNZkNO5nc5MbLkGI4jyoKt+OMyq0mcvj34L9C4bJO6f++fg4ApHenOIVsKLgNWZikIM
	rWwbhDH8OmWSVLzDVfYnJG5B+xe505QK+6SEMx73v0Ib0JaZJJFKNHVJ5CL+igfxxUQm7ealssq
	yYhmdTYm+PZv+RTam2vkHHpyKBw=
X-Received: by 2002:a5d:6f0b:0:b0:48d:ed30:f863 with SMTP id ffacd0b85a97d-48e6e304aaemr28242503f8f.30.1793694459888;
        Tue, 03 Nov 2026 00:27:39 -0800 (PST)
Received: from [127.0.1.1] ([151.61.248.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm7666552f8f.54.2026.11.03.00.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:27:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: meson: axg-fifo: request the irq with the clock
 enabled
From: Valerio Setti <vsetti@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
References: <20261030-asoc-axg-fifo-irq-clock-v1-1-f8c170ac8b0d@baylibre.com>
Date: Tue, 03 Nov 2026 09:27:33 +0100
Message-Id: <179369445362.97387.1853118570427796429.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=384; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=w36hV1IUYMxpRRFJ0VIcI3DKJb88rpzFhmqT04FnZko=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFkvZ303F1f/kVIiF3xAbXN2+m1Do7+9s9VvKp1ZdKF+1
 e4U/gusHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZjIhDaG/wGCL4X0gr64XVnW
 4nnGLO0fd4zAeeE/ikezsz4f/fVOVIfhv5uquuzhF+1N62ce/CKqYaxpXFAh8qIu6No+Nr+z96+
 HcQIA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_002743_403342_C6A09FA9 
X-CRM114-Status: UNSURE (   7.00  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The fifo irq handler accesses registers which need pclk, but the irq is
> requested before pclk is enabled on open and freed after it is disabled
> on close.
> 
> Request the irq after enabling pclk and masking the fifo irqs.
> Free it before disabling pclk.

Looks good to me.

Reviewed-by: Valerio Setti <vsetti@baylibre.com>

-- 
Valerio Setti <vsetti@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
