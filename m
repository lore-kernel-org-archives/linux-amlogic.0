Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA093606A330
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2026 15:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RG9C5Yw4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=H3XB6BDq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qZdpRJIy9xgB22+sKpwa8ABh/oGJI+BvowMi8N+a1Q0=; b=RG9C5Yw4hf+r0pn5XaYqDUEpY+
	gEEbyv1WsM3G88Iy6PnvU0RU49mXXkdoCJahrvKJa8416McHLxYBkAm+/SU1ieihErB7r/Fexq7Sa
	NNZi7YyEA/xPdb0O4C/YqNqC7Y16CeH/Ls1zZdjn5vUjtCiFG3fBPWfeV5sGNK+Y76lc6zNCq6kre
	BPCXufFotrpZPyNAbWP+9Twtk2jzCA9hmhM04a3LLjsXPqOsoymwsIsmSX+tIF+nEjY0WS01jdE07
	yxQKEDopQlmas3M4lVrYzAv15xDtZucvozC35iLoVKCK1ed7Xjv2D92CZiUo1ci058pgCjBkozJ6s
	aSn+asdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsvB-0000000DK5T-3nA6;
	Fri, 13 Nov 2026 15:10:33 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRsv7-0000000DK1E-1FAz
	for linux-amlogic@lists.infradead.org;
	Fri, 13 Nov 2026 15:10:32 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-49d64a88222so233010f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2026 07:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794582627; x=1795187427; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
        b=H3XB6BDqTwfszXbuq8xWaUMUbTd1bfdEwcKPm0i0eSiL5xl70C1Qvo0N1S9ltV3r5W
         PhyVG2gFJSmGR5C79SDt+DE6ssJyDLKazhzciuTlQAuPxcnAtTFk7efoeYC6Hp2O4AHT
         5KtygBuSY3/t1ZmHNuTimmzf5DjBu8Y9IU+0UIjJ7gNP7ec2+94tgkxlePjSmk4c4L8T
         iOnhycgDlyTE0EJHceZXwnYH2jcPTRDfevBL6S0ckdUGaK8zhjayyLv4LoN7PtQnGI9g
         g5ZusTKFuM1Bj+bUnUE0eFXdnkwwEbchEqMwM5JmfFi3hgrtip8sSL5KSfw4fqNxmzKD
         xu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794582627; x=1795187427;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bOZaKuWDgzdIBtnYxUiBUDvqzx9ophFtd7ONrx4yPs=;
        b=LlAi+kFtjDs2NvM4fQn8i6i4hpVr2lEE975aKWyz2nk+2R9vvevWy95wUmqkOI8J1H
         kLOzwdQqzyCzk0KUJ+hh1adnZsAyFhwBlAqLzQM0s3c8vRsJk5AUg9+bYilt/m+vSBJo
         6qyFLajHvCokZuBqguZQ5uLifSurXb+6NrEkxkiR3ebWU5ZT486gk2qtxtyKcU54steo
         h7WiKd1znC6Ol/k+EVmpvig2zDaRluKmVimMWNdhtGuPULjIh/hwWpA28v3gHvMFfmI1
         gg3JgnD0Fg2ggraZG/KSN+iFsV4I95En/N7vwmOTsAWPZpg60aZ+OffmN7nswm0IxPzD
         yDxQ==
X-Forwarded-Encrypted: i=1; AL+hErFBzdKlt9f6sja7VT3dTkXSiw7tgAE+4L+Gls2dittoNUZnVhC0L67hYIrt55Ks4YDJs1p5r7knaiZDC9Db@lists.infradead.org
X-Gm-Message-State: APuU4Z/wUXiNo9zmM7eH+k8HrURthQ06vjxx/0ut65/mb354vZskOO22
	LeZGuAVxm6G2MYk0SwULb8lu1riOcmJFTrCOwuH9gBYJsygi33jB6u969U8Vbsb2dSM=
X-Gm-Gg: AYBFou1JOH0fOBk2refLwLfZcr34vaZbyXKRXRr7DKVnyOwQNH5hNX1t1spSAOIJM4N
	K6EfqbEy18l0R4dhQ2snagt9TVfJ+fDjXdMkWjukVAvUqfqB/9hA/70K6jWmWxegibtJ15SFn+g
	RzsrS4fQjaf6uEgZs8HZpo5xYM0ZrWLh2ufDst5S8AUEjx0n3VJgZfw2KtUgnjW0kKYjBGG2DHV
	X0fhhNkMhu5fILF0+cQ5dhllOyRRBSUjS6gDo7zg0JKb1cPcikN5qaYU+ovnyj/LbuswD9/Kw0h
	aDKPINrnK68G+yNH8YdOZkl/ij7yvjfi9GuJjIhJsqIrhg5XXbx18FQblU2KiEDt77yT1sz9HNZ
	H3PGFj98iUvEmddx/ctQYa5fcXPW7xc4XGtNpoGgqKnUIuPhH2BlxgAfXNCuD+XTxZ+jdlwhi6O
	Nh8zGSmO+U5DecXOQMbfv7O7CahgcTI5aFnpIATVXgVTg/KqY+E7mr/kcVK4PODOGdKq/0mZr+D
	dDiUq+DBCX5aRiJl25q4qSWMQUtlsYV5L+vh+94HMlIy5aA4xR68Jy6PAKuflSECAXrSp2+e2t4
	ZoyJ/Bgw+xYfL0edll6j46wlHg2FA6vOa5sZbuESW0unus46
X-Received: by 2002:a05:6000:27d3:b0:492:aff5:da60 with SMTP id ffacd0b85a97d-49b01cf341fmr9163986f8f.13.1794582627273;
        Fri, 13 Nov 2026 07:10:27 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d615sm5879282f8f.56.2026.11.13.07.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:10:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, Valerio
 Setti <vsetti@baylibre.com>
Subject: Re: [PATCH v2 0/2] ASoC: meson: gx-formatter: change stream lock
 from mutex to spinlock
In-Reply-To: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
References: <20261111-gx-formatter-use-spinlock-v2-0-763241aeca52@baylibre.com>
Date: Fri, 13 Nov 2026 16:10:26 +0100
Message-ID: <1jzevczs0t.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_071029_689107_FA0F22C4 
X-CRM114-Status: UNSURE (   6.45  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On mer. 11 nov. 2026 at 11:12, Valerio Setti <vsetti@baylibre.com> wrote:

> Patch 1 fixes a pre-existing bugs, present since v7.3, reported by
> Sashiko [1] while reviewing the series adding I2S input support for
> Amlogic GX SoCs [2].
> [2] depends on patch 1 to address Sashiko's comment.
>
> Patch 2 adds a hardening check suggested by Martin while reviewing v1.
>
> [1] https://lore.kernel.org/all/sashiko-outbox-176054@kernel.org/
> [2] https://lore.kernel.org/all/20261018-audin-v5-0-4b8cc13a1b22@baylibre.com/
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
