Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C39A606A31C
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 09:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uvzkeino;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kw1DNwAq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5hGcwI5ObVMadJOTkJLZ4zo4+81PEuxwW1i+kyR1fv8=; b=uvzkeinoH/p+xGCnHakt+GdzVF
	7ZXIdiRepbbd5FpbshzCIcK7LPpIhjBtrTTF0LzLB0GJP9UQIoDEb4ZDzNs6bXeIt+4kvQJx+a9dX
	OKjV4vQAZe177GxKXAr8VZavJyt/eZ+J+w4U3/gW5IHBuGERALGH7GoIR3GsolVNWIOrzYBdAZ8lr
	iuN1BvbudN8yujOON92U/VXd1h1nkG1RUDkP9hwMJyXElzSPS1VCfXIpzV0qNmt5+6yNEZKh0aoPz
	R/9RjIJoZtMytZw+xtgVZXgEbfsKd+vwxWvttu83R+san/hBFNgkRoFjecJtZpCx1PW3VpXp1DTq1
	PDST2kLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsLH-0000000FSMh-0s6H;
	Fri, 27 Nov 2026 09:34:07 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWsLD-0000000FSLM-2vbs
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 09:34:05 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6b167ffd132so12232045a12.1
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 01:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795772042; x=1796376842; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=kw1DNwAqvKPcm9EHAFVid2zlPD15dBG/vO85Uj7kYAqCixFZRUJkXB0ku4+RB6SpXQ
         y9G3oD4VtkvWIBH812HAXZEJry8nECg+5cuJJbFp7zd8ziKvW0GEYFCBeEosW9LfH5jL
         IydPg4c2veb4LzRqeytQv+17HTX+ZMfUIy1ZRWo2a+xbONe9+shCFvFN8+tzfYNa3uBS
         L1tzwoF/g6EfaqgM/TPW1opDcQOH9L3mwtvV6coYwhAyn9GfwU9m9luki75YzBw+2Kk+
         jdq6IOjbkSpDN+bkBD9Byepe7/9rHjD6xJUpsyZ0rm9+oy8BezzYtpcEo5JV5R/KEoAg
         EZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772042; x=1796376842;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jn5vbA2HA26YYZAVHurR2qnRXvY7PEKSS/j0oDB/fbA=;
        b=HZsPuz4i2+paqMi8hF+/fYiPRcksfCW/SGP8WzS+kyJqaw7/tIhbUcvkDi0j0SyBxi
         GaTJmdFSH5E1t7vIFAn205wAzc2+LYrje1prsV5VvQqMzMkRByt2SSGiIKtM/8tEPbTr
         cbjJ8vODqP5TwY0xnjS02aCHsF6BMWhfzn8RvVMCL4Os1hMwWgTxY0O+5x47wOkmMz5A
         R7ekTQ8lWExHoaYnJSkGAHDJHZhK659G8/Ka6vbiF2KsIeeh9ajvkTyUHps3sVS7o6SD
         9KPUyu4MxONNN9ySeQoSHrDmaJRhx/L9zrCG4XWU6s+LSxXMy+0Wkj64EKfwU04wPdwy
         nYXg==
X-Gm-Message-State: APuU4Z8B2v2TJ/UUQXSpM0IqF8XPwe0Czp/KLaP00xVKVNEsJCQgswFw
	1LD4247K5noyNrS87NjkhFSyKUCDnO+jPv/pPa7Hzf5C1Fi0uBSAbBQZkAirGxfBwk0=
X-Gm-Gg: AZFdTZfr1xsSG/2vwkoS/J5/d5tISBt2vI5k1rhJO9Zo+SABq86FpfdtKIgRWKYwRr/
	T6vU3ufi5XGnf81ghYT4XTWGCqqQN7Sg8K8wqXvpit681LU7WN23ZbP0O7S1nKsH/YfW/Trnh2k
	1aiZzDWFh0qLruOjZ/rsKcwQGJmWhpiZo2QJMUt7CjSd2rNtpBdZrCogwEZaN5osaAjs9jABDVO
	aLofdYG9N+ZL4MtP6IlZiIwYNyHRoIiSQtqJM2VY35JlFUoBW0/R64rDk1sFzmW5UbFg3v9fa4p
	uVikwrO77I8DMPJjTN6v/xnmdp2VfqDZA81gysFySl/cmM3GPTxeGNjocC1kkrSME1c6bAaRqwk
	kbpzeguS5RL1iA1wllz7AFSacEzzczd+qm8seofBeTGuA1J1bOXrWMRefmOcY8Ogcl3igwDlvKw
	UNNRZGKcr05ZYJ+3Mi9IIbRjGgWMNWg8pXzrJCjOsvnn8NsHIjPgnJlaDLE24vXgIRAMc2T9hz6
	TPU4e3k11FSQk5zh9L+5qTRxCSf/LhIlYL/yIz3FQdmLQoKBuKRqIlyQAR6+Ttbzuwbjh8Wi1oh
	DEKuVqbcbaj7shtjMa/KcX1ptKrmxPLSM7MfCS7W7Km0kMPkwE+2IBPlaRxrlaswAn6uvA==
X-Received: by 2002:a05:6402:2403:b0:6bb:aaf:5d94 with SMTP id 4fb4d7f45d1cf-6bb0aaf5f7emr8353882a12.25.1795772041771;
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fc020sm10607522a12.25.2026.11.27.01.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:34:01 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Kevin Hilman
 <khilman@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jiebing Chen <jiebing.chen@amlogic.com>
Subject: Re: [PATCH 0/2] Add Amlogic S4 audio clock controller support.
In-Reply-To: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
References: <20261127-clock_audio-v1-0-cf3ccf6b2bf0@amlogic.com>
Date: Fri, 27 Nov 2026 10:33:59 +0100
Message-ID: <1jmrquwrco.fsf@starbuckisacylon.baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_013403_755613_A3413509 
X-CRM114-Status: GOOD (  14.40  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On ven. 27 nov. 2026 at 17:11, Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org> wrote:

> S4 uses the existing AXG audio clock driver and reuses the SM1 and
> G12A clock hardware. Pad clock and data selection is done by pinmux,
> so those pad clocks are not registered. The controller has an internal
> reset line, like G12A and SM1, and an audio power domain that must be
> enabled before use. The new compatible is amlogic,s4-audio-clkc;
> power-domains is required for S4 and forbidden for the other
> compatibles.
>
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
> Jiebing Chen (2):
>       clk: meson: axg_audio: add S4 support
>       ASoC:dt-bindings:clock: Add audio power domain for S4 soc

This title is messed up - Remove ASoC and proper spacing please.
Also you did not collect the trailer given on the v8 by Krzysztof.

Next time you send something like this, keep the series numbering
please. This could either be a v8 RESEND or v9. Like this, it looks
brand new, which it isn't.

>
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  17 +++
>  drivers/clk/meson/axg-audio.c                      | 165 +++++++++++++++++++++
>  2 files changed, 182 insertions(+)
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20261127-clock_audio-76eed7ee7ca2
>
> Best regards,
> --  
> Jiebing Chen <jiebing.chen@amlogic.com>
>
>
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
