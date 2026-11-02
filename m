Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FE96084420
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Nov 2026 15:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vXR0+1VL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jKPf3Exi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AcUDBjj+YcH8J2YG2w5apRE69YWdWH88uLb6GsyHt8E=; b=vXR0+1VLwRo32M5/nnOZJBO60E
	MJ5TqrmdiavqlXB1CumcdyMeipa7hsMqeFDenVVKfR42EDoWjB8+KuX4ZY5/vfUMmRLF1Iygi7J4O
	XreuzerJhy/oX9WavRizbfewGWoXN9XaXvjzSog7ho0hKolhpai1Eium69pV+TNnN/6xyR0fJ1Lzt
	DAKBN5WAFzO1DL3oetxNQX4d2dzgmmwpoUHwnEvkABLzokxHkGsIfCmtA/iY2XzDtX8xkDPscKFgn
	bF3nbzBOKMx8ntwWNzguVMZoO5KPJkQIRs5daOw0PQIVascV++w740OVe0L1EXVhAUnM9KtoVF8uz
	kdpCztiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNty4-0000000H6KZ-2O5t;
	Mon, 02 Nov 2026 15:29:04 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNty0-0000000H6J5-43Oa
	for linux-amlogic@lists.infradead.org;
	Mon, 02 Nov 2026 15:29:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so25555385e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 02 Nov 2026 07:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793633339; x=1794238139; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
        b=jKPf3ExigBBb/F5bcZV1g+xbBuzXset8pgPVcBXkdaggDzvE1Wj5jyruqDPNUwD7x9
         SklfBlKpTWtg6t51R9tEq84w/y4LtpRja0xtU0IzcZ2n4UP4MufxQF/uzf3o+oeLDUzi
         oJCwoH1Oskfj0rmkpDnJ+n3lj7I1WS5qi2UYyXVZeGVKY7Ob5hCE2hQFWh3dG3JRh3NP
         8iZj3wWwAA7dAMkA24LjC7lQ1hh00W0zW15SezVVwqN7FRVI5XxfO/FG4HJK857vr+QN
         ahxKq+6PfzZgPKGZLKcZDWDavcS4eC9l3F7knuuWupq+eHPizjleni3gYdThEI1WL3/a
         c7Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633339; x=1794238139;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpYgEUXMFRpLpzuh6rGejLrl0sGWdYLAgubwEkCkQFg=;
        b=ZyGSRIRbxNY049ticWzAKQWdCrXxKqE9x6hwtF2IBjCI5EIHZG3OA0YwdF7CuCK6nI
         D9Y0L1ET2EDzN10K2BlYUVIxy6WZPmZnXM948lzdT11KDvMsK6sqLGGkx0wjKdVqVoWJ
         QcrBvE1vaYnUS/1Fq4dyt+10CMnXKZotJlK/DMtG7zksMQ2EOXpcOeaZnihBlVtgsDhS
         3k4QayhmMKu+iZSD0xds+olKzjBuaB+BqJ6QgjKMOBSamtF9DgSv11IYTtBeWeOYX9UJ
         RcqPYh2FYM9BuL6BEDXuY22X8GD7w4QtuV8f3rlpYyzlGll+kNRBCEfdeFziCIwhvwf4
         bFfg==
X-Gm-Message-State: AFq9FYK6i0tbZqfbTXf112g8px2tm0mCLuVGBAKQ3l9MTchddFig4y8w
	62mP9+Vd3SqXPik2CpBuagqQjykLr8mIEbVg3CigMpW2FIat8W44jiIg8F6BFIaP6P4=
X-Gm-Gg: AYBFou1pRNksbyhKJvyJT+ogAot4kEpuiiuPE6Zd7IKgDqQV68bA1qDq7XJspusGBCO
	OGzxWSxL6vsLSDrtySXkt3mvXqYoiK1QzuHhXIxGSknsCu9HX7Jpm0gjIIB349z46w9wj3fFls1
	r/R+gGkytI6WjIYYG9Wj9SfbW9rgcRShYjYoNUUXaHnecoQvI34j9EdCfYPyfI83aQXD9ju/Z5J
	LqjTHdqVIVnbQx0JwJa9Q2MxSXndPlUw/3ys0xBHWAT0kt3vtUp5qx3QSQen3uhS/c541osi8vN
	PsMIe0e8DPgsNF8ZxOfQ/qHUFqlMovmxsXYj6Yq2X1CKN3bdVi80YundOLfuI190iKOccGIDqEw
	7luwy3xa122ePRZwDdUOSNU68W6IONeN+QyPjgZSO19B3A4IHme1umcomWQg6esuC1wajSwOIxE
	4mF410sg9A0WQr7FSzqTc6CePNZrED7w6Kw9QIW+faQb5seCMuh/0lAdkluKJuRwzTFUCCxgAu/
	UxcFgspR42jri84EovJG38AfIcLtHh7lE4FzmRK3KoyqXa/cDKBeMbw6gXO5SRuvFlIHWHltqiP
	5XTxRWTIOLrPtGa+Y2AKKtMY6vdhpDFDVrgZHuThB4rFhnuE
X-Received: by 2002:a05:600c:4e02:b0:4a3:59c9:a758 with SMTP id 5b1f17b1804b1-4ac19705e02mr225316555e9.32.1793633338944;
        Mon, 02 Nov 2026 07:28:58 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b80eb1sm21907349f8f.34.2026.11.02.07.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:28:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
References: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
Subject: Re: [PATCH v2 0/3] clk: meson: g12a: fix a few clock definition
 errors
Message-Id: <179363333450.2870673.5521256341441057002.b4-ty@b4>
Date: Mon, 02 Nov 2026 16:28:54 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=475; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=UHmtYAda0lGZObY89vb/eGPORt1iA91FW+pe6vRHRPY=;
 b=kA0DAAoWrRk/eyua5RcByyZiAGrorDmjByjJBe5tD6E7zTW8n2IfF2kAowjccC0RauvXZtFJ9
 4h1BAAWCgAdFiEEfAt7F+4ZKvSalyzbrRk/eyua5RcFAmrorDkACgkQrRk/eyua5RdrYgD+LgqT
 qJyhqFLLMsiGPmZJS71z+tbVLAhGGnJjxQ01/0MBANcj2HeO4569Ea1fKVqMVdwkzp6fy5qRmfB
 qRRwtdUYI
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_072901_022041_D3DD4A92 
X-CRM114-Status: UNSURE (   4.69  )
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Applied to clk/linux.git (clk-amlogic), thanks!

[1/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids
      https://git.kernel.org/clk/linux/c/9458f994b92f
[2/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for g12b
      https://git.kernel.org/clk/linux/c/c56b8550e390
[3/3] clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for sm1
      https://git.kernel.org/clk/linux/c/5ca65bc758dd

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
