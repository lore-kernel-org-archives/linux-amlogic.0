Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E313606A330
	for <linux-amlogic@archiver.kernel.org>; Wed, 18 Nov 2026 10:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1JqRavg2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=hiul0ny6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7d+dmohshxp0hOoFH3WTfaoYHDpRVSuJfeG5YsAQ4nQ=; b=1JqRavg2ngFUG6OWFU704I+7PV
	dz6OmdftHczlyZQgv0nWAcPdhYiyzFkes6GJ+Br3Dh79f2WWnjVBnwVoYZf0FZt/mK1NdVYUew4Bv
	aky+wB+dk8I+gsJXIlfU147IP7oSW/QB+7IM8zvSspYgqGwdyagPORqA/28yQA/zYw+PSsjVnjCpH
	NZL8exBM4Lo8ejnIpufIov65yFLUuF0jPHK3tKmEcpm54BGNBtdULT7TT1j0cTqahFjHKjD4CXcUd
	1ErTttcf3NDM6nvqJX1i3DqVW+laiIfd/1h5Nz/xE5CPp+Qw4Zpop5IimrIXCubHXy8T1ZvgfBA97
	Mx6ri9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcUD-00000008U7a-0kft;
	Wed, 18 Nov 2026 10:01:53 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcTj-00000008Tug-0xGx
	for linux-amlogic@lists.infradead.org;
	Wed, 18 Nov 2026 10:01:24 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48dee593f18so586677f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 18 Nov 2026 02:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794996081; x=1795600881; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=hiul0ny6AcHf35SIkI4idMG3Q+4gle+iMCVDTnMBF/OJZl1tKC9t/aYP3f8Ng9s0xw
         i6QkAZiEYxGJvucIJBzL4jIivlGmfvC9XbkiBhUMCjJiIivrkZRtkOv+/ULOmkFLXvG+
         RD/r8iHF5OKND5ijLhk8Jxyk4o/yHw4XJRNiIu0//ykgxj8dAbh4icU4POnKUb5bjFtT
         6RlirpxGzVDB7/heASHhU7qOGj3u3UQobH09F7QcKiQrYImeYsyUTmRrNNhci61UtN/o
         Hk7WgjZYQYtwp44DIUNSOI0KlyOMCMYZ4QBkc4P/Jf/fWXV/cFWl1ARki9w38sgHXdhc
         pK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794996081; x=1795600881;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz+hOXXzBRP/gLMriNGtkNpsg1THjB/csTcrFJ0tk28=;
        b=QB08CdgDB3KQrT6fUZURyahMPU79u1iSIGEuy2iAGFY2VNqIG/4TwTW9pS6aJD36PK
         jWjCoWN0dxV49u3/XshbbPVN0BO/Fo5Z0ZX9XaJSN7NWXQZ1m8PSxTINl5hA3Hm05I1j
         zTQYeszZpI3HsJqZyrPPFFqz1BRSwo3h1P4Fg8ui+e1JZ2YyGJEm9l9mvJKT9O0eqNuS
         YgeHy/pY99ZqEkBy7wKvsW7mVk8x/8cjkf3/c/sRqxbGU+e2m7H4Kd5b75cCl3A9b9o/
         ghoudBorVW5Dwj/FsD9wWnapdcgnbuXcJBUE7svpZWHs4WrwMM3fTtBMZO8PhBRHQpAH
         0pNg==
X-Forwarded-Encrypted: i=1; AL+hErHlbYWPqjkszBRx/cRcPlM/o25tRtOS8Ok98vxd7L+T8i9kzAqVNlHbJ6hp2Tm+8Si2FrEoJ1l9VnL7c9pv@lists.infradead.org
X-Gm-Message-State: APuU4Z9W36YoJVqoSO9og6l2q8U0my/K2YnQly8KXCc1wzTuCIKRv2kS
	cRFDqghx8fbzfljL9dnnS9YAg4JvKdj5+pABkuuIiuvFlwkm3nENONu7yxxml/O527k=
X-Gm-Gg: AZFdTZcSrWz4mffRWdnq2pBTxRVrtYmPPJgrQwu2KybtbSkcpobXume65rN8nQkIARB
	2ReXL8KvYa0y0uk5WBR3VQCDaE/0VDhKJBVsLbSwvxP0Ea04teIYG06ULLNR7h4OVYr9AA22jdB
	NLwg+9uBVhXJVWajCjFn9OiWpiEmGr/Qp0WE05lOyds/NI3/MrCH3qUwuVSX6rwG5kWKtC4Rs2G
	vDsWC8We9xmCe2Em7GNYCv92ZVY6KqbGFlOBQ6h7dLJ+I1XluoZduos4ZN7A4/zncJeDjwct2lL
	aknR6CtFmZbMUDKWB41ROrBUqBEjkcgoXi4K0d68tbbhglIQR4d8/NRPfkVfqZ9hV5TZ+36N0by
	gHO7OVARCfNAfjsu0XTuZRwMnRcBRoZFqcJygCO+A0IHq4j4DjhaskZGo7HLBtMCjOUwctI/2Wh
	bBqhayk6yroQmA5erqKqx4dSTx6LcDRp/7jtefVNiwtfevkCgRBU+v1CT5e2/ohe72w+2v2Tx4o
	nD9xsf1xDh7urW5ALUohD8fH5NiZdkQ75mYWIIUA4klwaGrYlHPA41dCOLTli4onhAtKNM7BcZF
	uozrHiJP/BQsQfSaWR/pInHHoLMtQBdSHA==
X-Received: by 2002:a05:6000:40c6:b0:48d:f14a:9182 with SMTP id ffacd0b85a97d-4a6385221d2mr4182620f8f.20.1794996081159;
        Wed, 18 Nov 2026 02:01:21 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c257sm3680960f8f.13.2026.11.18.02.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:01:20 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 4/7] dt-bindings: clock: Add Amlogic S7 PLL clock
 controller
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-4-7d501d62621f@baylibre.com>
Date: Wed, 18 Nov 2026 11:01:12 +0100
Message-Id: <179499607256.413320.16082664027719861712.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=429; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=PtXjyJ2j06GU7bMSY1qzWJs0ZQx1vl5iBDW33+FUIt8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFl/y3M8boiXW+kLOhSXHZTU27xnp5PmcweXk7N8ZknuX
 1v0M+5xRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACZSGcrwz2CTn+HNd5EWG9bu
 uVr/eSPv5Aat481OXnkbIqTyq5p/+DH8Uzpp5HBPWOtsl+SVHVlxdlVPN89t+rGZe5WDQ9zFwIm
 ijAA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_020123_310857_03550AA7 
X-CRM114-Status: UNSURE (   7.20  )
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

On Fri, 06 Nov 2026 09:30:27 +0100, Carlo Caione <ccaione@baylibre.com> wrote:
> The S7 PLL controller supplies clock sources for the peripheral clock
> tree and receives its reference clocks through firmware-controlled
> oscillator gates.
> 
> Add the binding and clock identifiers needed to describe this
> controller and its connections.
> 
> [...]

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

-- 
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
