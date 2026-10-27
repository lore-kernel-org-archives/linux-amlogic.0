Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2D1606A32D
	for <linux-amlogic@archiver.kernel.org>; Tue, 27 Oct 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C8xziIrN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nYKvJhmK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aAFKXsklpxnrUosPOB7VJ3lqhPjlJ2n6G1yp755rxqg=; b=C8xziIrN466mxJOJOGat9jI+kY
	Kgndg0wPj2nYDs4QYYgWcTTLQ73wN+kq32PcFVTpoLnWpTKMJgeR/UUcSQgkI8v7MNf+ZH30H/Y1k
	FZ726uJb8hOpe0BOLPhVmZZ2+FKbaGksEbFE97bVBCgwPysbUORCi3ZWBkG5cVltHm518lZ18IprT
	7L5nU1SK6AhTpsHVmqQvY95I+pg8FfxSThzySsXcq14AuSS4crNjbNpWHMrNwcV14ND2/0ZkzNe+Y
	raNrOC3Q5047h2JtyKeefGFhtefGuAHluu7Q9S0UvtbgW5USgqXsgs8ZU5X1VvW72E7AJL/RfT3bV
	5+pjkGTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLinj-000000057jL-3EuX;
	Tue, 27 Oct 2026 15:09:24 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLinh-000000057iF-2T90
	for linux-amlogic@lists.infradead.org;
	Tue, 27 Oct 2026 15:09:22 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-3550c917fd3so6296282eec.0
        for <linux-amlogic@lists.infradead.org>; Tue, 27 Oct 2026 08:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793113760; cv=none;
        d=google.com; s=arc-20260327;
        b=sxpMzko5tuuduouAsoRRmphdg+TdyrPcBl1L53SRtDOT641yUtwVbh1ALdAAlj0uzB
         VzjTh3SVnoLAVLbMi1g/6ejsAabaO2MPLfoJDvG4wv+5P9qFQDdDzL/ebQ0R6BPqhWjn
         IOc1rbo7F/XFk2TI1XpfBhy0jxChMMsB2K03wBiKDLYIipXRkTQbNltpNpBLffExeyaV
         wBcq5xZaLbGbjMVHh/egogTwT+MZgXN+jM9/Pr0/YqtVYMQGAsEOwUt2C/67LqIyAQAl
         RguoPDOpSFNhNOYYwJAoblg4EY8vc2z2WgVfZ+afdzT/GCmNazu+Hy8iE8m0m2l85vct
         VBvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        fh=YFObOrXmuKfSfOLdjn31vOqbqQdrBDb7l+Rbd2/NfSE=;
        b=eEfbOn/ifIE6Cy7a0NK7McN3fVBBZxeXbWp6Pga/iBydL6lrQyh45jmYXEfwFg2uq0
         maE0YGWrm8mFlXIRDfrxHaitBH1qWjS4mH/1fgE8qeKh7j0E6jo0h5PCCOofohoUTHbs
         oDaXQ8Dq8j5FkzkVuIIj1FKavK1daF/NUsdW94fgp9ETC3waQOdiJjv55uVDoAfPc9aU
         pqLb3Sxmm2nh2pxor7Y6nedvr0cuFeOU/wzmWbtctTKz8kww1KWnA9RmD+jSmEmiTpcA
         AFYx02uSnVyDUjDHkr9ze0bRvQ68y3ze1zh86K3HCaDIKPYQAL9FjFjezXLqT0xWZvgr
         4hwg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793113760; x=1793718560; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=nYKvJhmK1+cdzxvUTTjCqgegflkqy6MB06Ae13qZdUb24xUa0RQfOryqlOZCKp3hud
         BhBKOCcK/S1dSyktKKKb0YihmENCJcYI/QMXEfSyOCX/tosSnVmhJ/NjUN3rIzvvH4cm
         QPwr6jBRz+sHtjIboCiea5Yx156rEGSBuBj153Vf5KZyxyYAxCsnKFLRcYtt0hmRWKkW
         eil5upYinof5tMqt3A7776XcxyoASU6nIkNSjuoId+j0OyA732LyWPV/2rlpiOpUk+8/
         FX+s8x2Gez7XyQVFwAOhmSciOxwuPANizHxqPi6hQDcwjJKtQaWbPP0FUK+SqqODnKfR
         6UUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793113760; x=1793718560;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oAHxKAOEiqLhGsEJj6uWGojbuVaoZYDv1iJ7mHdZGsA=;
        b=C7vggamViphJqtfH9kKoGIhY/cKxx7RSXEwxjKST0XU/2y/x2FBPGG/z5TIP61ysBX
         QWL2gvY+rAOmKtHhsSW7wjm1idGuvLEdjRza+q9sFdN3E25OHJgSzgGerOn9OhCf79J2
         NpCIUWK14ZnZdmuJhDqt16yLDlVJzGXRB4Kdy912NCDzDojjTKl7BbQk+L6r24/T8UyP
         VV+BrgkMuo/2KYf6ZV7Z0np7eDE8hVc/1n7zrM1MWRsfZqNnzt+ph2NVcljyxuLTUuNx
         mxqi38qJstI4N+ocG64ZAuMS+YqkpDMU+9tsqLCaxt/D8itNJRBv4+kHVCg6oiZ9OjcA
         eOhw==
X-Forwarded-Encrypted: i=1; AKwUvBwq3w5vvEsHr34Xo53uV6gCG4499sWl7gaMQ0MvI6BwYrgAsXF6zBYScoKRTlp++Vf4Eo/FkEeVn60VOqeI@lists.infradead.org
X-Gm-Message-State: AFq9FYKcdX2VnE06aVqgqrRYjZJf0CqhruNnBq1oprsr/F2sihSZLc1W
	YA8ZuU6nMkp8xExntO742RCt0VYONGKybw1FXkhJmrC9jXgGeSxBchuhLJ8O7bv/yDysn742Lja
	V/Lg5KVY3iGFN7VRo72N7BaT1snQF4d0=
X-Gm-Gg: AYBFou0/XCtAHLUHA41cIRxsFr1uq0pcOt3ujzPYM1BzQnWvaxrUXxgbDBaLQi1OxRP
	nECzzdNib05YOMmv1uB8EVPGSCdgmXwUwfV2KDWtSWcKlOX9jgK/46QUpde+G7QBn2GGSSL8h77
	KRUdAzAyAvmfaw2/JTxYKoiNqUurmNGIo/Iv2SldNhReqvA0olCZYdpPU0+9IwogrL7itEjl+WQ
	JrGDtg5hNLHbIVY81dPBdDhL7OISIxOjJvff5aUVicOrVgD0icorSnp+MO8pzdPp7XusomuPM2Y
	KSHnmuvi5b3zO9DitZ8p21V+df02UdVzWZS1zsbQ33HYsH7GASNaXY3LyE8sYmPdoAWEM12bYrq
	v4Fry/qSZnjA1UnwFe/nJ/q+eMMoEtRymn87XScLXfDNLtcKNQm9UHjkxSm4S96sSsHnQ2eGXKu
	3UNo4cXRc0GQHWcH2OQg2R7Z0I5h8oHxiZtWRGldqp/WljZpbO4ZLZ8Q==
X-Received: by 2002:a05:7300:e024:b0:36a:158e:f917 with SMTP id
 5a478bee46e88-36a158f021emr2604437eec.6.1793113760079; Tue, 27 Oct 2026
 08:09:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027124954.110697-1-zoone.rupert@gmail.com> <20261027124954.110697-10-zoone.rupert@gmail.com>
In-Reply-To: <20261027124954.110697-10-zoone.rupert@gmail.com>
From: Kim Jinseob <kimjinseob88@gmail.com>
Date: Wed, 28 Oct 2026 00:09:08 +0900
X-Gm-Features: AclHuK8H6vSFxFswuEXecNS4oxgF2wzBLnY17J5ZgNNydJKg-55kp3rBfAwA1Kg
Message-ID: <CALMSew+nhZp9BoqS5tOgFdiVy13U1r2f4UQa9Sd5zc9pSt_YcA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] iio: enable context analysis for all drivers
To: Rupesh Majhi <zoone.rupert@gmail.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Benson Leung <bleung@chromium.org>, David Lechner <dlechner@baylibre.com>, 
	Guenter Roeck <groeck@chromium.org>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jonathan Cameron <jic23@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Remi Buisson <remi.buisson@tdk.com>, chrome-platform@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>, 
	Bart Van Assche <bvanassche@acm.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_080921_627175_8E6E6821 
X-CRM114-Status: UNSURE (   5.90  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I independently build-tested the full v4 series (1/9 through 9/9) on
top of jic23/iio.git testing at 7d80b4b383bc, using Clang 24.0.0git
with context analysis enabled and W=1.

Results:

  - x86_64 OSF: 5/5 translation units built, 0 warnings/errors.

  - ARM64 OSF: 5/5 translation units built, 0 warnings/errors.

  - x86_64 allmodconfig-based IIO: 723/723 selected translation units
built, 0 warnings/errors.

As a control, enabling context analysis with 9/9 alone reproduced 256
warnings and 2 errors. Applying the complete series eliminated these
diagnostics, including an OSF warning resolved by the conditional mode
claim annotation in 2/9.

Testing covered compilation and static context analysis only. Final
module linking, module loading and runtime/hardware testing were not
performed.

Tested-by: Jinseob Kim kimjinseob88@gmail.com

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
