Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA4F606A320
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2026 15:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AdcrX7Sm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CYTXWcOe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h7L7mSC+oRFqak6HbwhnugGLdIGjNEqnfMguwA4Ll0o=; b=AdcrX7SmkYEYoZXjQa2dymj5cF
	yCVIekiYIweqdDeTTWDCz0/RZjlU6I3w7P+JIIMc4cOeWXZS+gc4nEQFuGICkfuzfpqeHDqQLKmUy
	zIQDuwnNOCGoTC5Q0eSuDhwf5muxeACjVEiqH5xueJ+1ZknmaSYUBl+sIBEb+BXNrKfnNvf8FpvL6
	JlkrVapmpUQ3+3CZetw3m/w2WT+WLV8mjhK+M2iinC6+YxeJp+IVbYsr7wYTXS1/mddr+i+nX7kZl
	Qdfw444InOM0hLf5WdGNcM1Kg0mtfy6/uGrxJbpHgwVKdYcte/i+LVe8eHz8X6vGZe3TDd3pw4NTy
	Fok3sFgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9EV-00000001F94-2sY0;
	Sun, 22 Nov 2026 15:11:59 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV9ES-00000001F8B-12Qe
	for linux-amlogic@lists.infradead.org;
	Sun, 22 Nov 2026 15:11:58 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so23467585e9.2
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Nov 2026 07:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795360314; x=1795965114; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=CYTXWcOeXl7hzGYQ/GPsVg9e+Zvz9c2RIIWxrBmXUqa//ckylw8Hnjj3dlVuc7p21x
         fLtUBwN9LMayd8sZz5K5hIRnLcIZsE3u3VEOESilNoqmIrmmmRI6Umo+LSsbQKuk3MhV
         lnHZlJ7+iNtmHi5qvnBf8Gnmq6KSa55SowdC7d6/7bcBLw5MUAiPcWJxiQUoAX2voBUD
         Q2a7pOPGis4cAb26j0BbnqbaezRlVMcUBZNCIN7paCVNgZL/6U3M/27jjwjgaND7A3Xy
         dUWQyP/LuzyJ+Bst4TS8KHvMpSovjazfUYkW0bF9C5SnqpWJDvyZWxK546Pr5sgIGvFD
         xo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795360314; x=1795965114;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Z291C558lsUtUj4LPUhpkrr2FrLmzRC4TeFBwuiY8c=;
        b=Olrw0CuScG9XnyhfyXCLQ4Y9lDC6DNv0RMIY6BD9vg6UMsZv4bOL5Zvn8xeJZeoDW9
         ozO4DaNzXhEbUzZrPuLf9K2C+jrTyRTmFcXr25kFCUCy8VkfEwS+FILxp9axYsSJz4QX
         8u6v4PxSDYiC8VXPJLlHGed0+cKf8tJ/HHUDBhj/2yzsP7m0mZPBVVwZzUj4WGEs7wHU
         2QIpPU45kvBLg8Vii4RrflDprauBgSR8sE7RgYxhoQhkOLMw3E5w7Q8e8QG2N9AuE/bO
         nuYosWdctwClfl/A0s6hz0n1XSlKmSsm9iG1R0M0V6V7NNHQ4aoOy9HeV6XyytCgOLLt
         WdCw==
X-Forwarded-Encrypted: i=1; AL+hErFPhhXRJZwKIR1Udg6JPNKF7XHaaI/o1MThzjRh5fruavWDb8yx4CKhSGozhUBWRy++Rhlli1VTj6aw1Ibt@lists.infradead.org
X-Gm-Message-State: APuU4Z8/OtL8aI4AWVNFMqXBZoHiEj0+5wM5QVUZUBHkWNJ+ZFJkjhdm
	80n8eRE/zYLNWq4n9wxyqTETraQNAHesZw41SpS2m/1Aj3m0laCzBghhhCVKkdTHe64=
X-Gm-Gg: AZFdTZfElot+sa4QMdSgw0IRWkJDxJweU1Ils9nq7YLZAUetrSD0UaoaPpZrjouy2p3
	Hz0ZI/+cr/4Gm/J3iv4fqnrA9XlhTOpSvZ1UNpy/AO/9FpLYjG0XQBuByJrvYTrj0dZ83cILQRQ
	i1aBLypSvx4iNo7G6Wlof3xqjNeWw+9Y4Wj1asS3poVDHyk3p0T6tgQ1EIjDCDdZK4REbvV82Gn
	FpuYWIyJ31IkE5qJnVgRMAdleOVMBnlMIjqGiz/17vzFMu6HAMNXByE0gOfT8KJIlJFLO+k+xP6
	z2djguyO4sx3BGNcrIRp9oZ9aCQFwHsuzxq7cr2p3bAyrXNTW8CNRTluhPC6/LO50xuR9zb/nSL
	+uYccCgcTE0p/Ino1oLDNjoOoiddcEkxjvq736fa/nxXdXnrZqxi7ErlZTMCIYFdl39eRQJdXMU
	Sm0pojL55Rz9nYuixCirzhGguailqHOXOU2vRtefG28M+pCFE2frQWTrG9PeRxF7a2GvSCZFnIT
	5hZBehZTRmqmHhSdS0byW4sBKSNm41nVJYXgdTou0SOsfVABdxoD2IUHV+AvXLEvK6aU8pZz4LB
	2IeyjuzXuRUxRDz1fJn+qJEqkCmAnIoXdnjSXYPijZTMK87r7UK4LWfGNzLZmc/bVyTzJQ==
X-Received: by 2002:a05:600c:3484:b0:4a2:133:45e1 with SMTP id 5b1f17b1804b1-4bb88812f16mr189053065e9.24.1795360313921;
        Sun, 22 Nov 2026 07:11:53 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b2050f1sm16789049f8f.38.2026.11.22.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 07:11:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
Subject: Re: [PATCH v2 0/6] Add Amlogic S7 clock controllers
Message-Id: <179536031124.2724645.9771781564056139591.b4-ty@b4>
Date: Sun, 22 Nov 2026 16:11:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261122_071156_308314_556BAAA2 
X-CRM114-Status: UNSURE (   3.73  )
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

[1/6] clk: meson: pll: Support PLLs without a pre-divider
      https://git.kernel.org/clk/linux/c/0068f78e25a4
[2/6] clk: meson: pll: Support active-low resets
      https://git.kernel.org/clk/linux/c/288015e923df
[3/6] dt-bindings: clock: Add Amlogic S7 PLL clock controller
      https://git.kernel.org/clk/linux/c/7230757fd4d1
[4/6] clk: amlogic: Add S7 PLL clock controller driver
      https://git.kernel.org/clk/linux/c/19206e1b1299
[5/6] dt-bindings: clock: Add Amlogic S7 peripherals clock controller
      https://git.kernel.org/clk/linux/c/ed4da9fe19c7
[6/6] clk: amlogic: Add S7 peripherals clock controller driver
      https://git.kernel.org/clk/linux/c/20c6003759a5

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
