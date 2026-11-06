Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0406B606D80A
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=07ykGBqP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gsOMIzkk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Vwvro2vaY6eumOBK+l0mzqcZ8J5KKHARTSFKeCk16j0=; b=07ykGBqPEjaqbMYB66w5AsPE3f
	ASrPJy5AWfMwWMTAY3T8zs/Fjt5GPvOIIJKWpQCG8LhbVlA1chtAq9pnSsAj5smT2NT7VR8YeLVOE
	gpt3jO1rEA+tSxTzYnw8dWbwRO8zqgfhN/XU/Jj9OKfSworSDYaii3+EsmOBQg/gcJnsYfVKexk2X
	ZOHX2rUfZ4PfYs+mEWg60lc3isYdk+KoctFTKqDvaz+QTO8zZyDmSgA10t33u+fzaV0b/0QU5iYq6
	JuoDoD/ulxsBocVJVVv6EiRKcdv0mIYYQxyoMpyT9mtRiix1SAs960hyiyBWXvZmka/tiZWfe0I6u
	3N/hHH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLM-0000000BZj0-1nkO;
	Fri, 06 Nov 2026 08:30:40 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLI-0000000BZdc-2bSd
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:39 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e4831c028so344337f8f.0
        for <linux-amlogic@lists.infradead.org>; Fri, 06 Nov 2026 00:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953835; x=1794558635; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=gsOMIzkkmN0k43F/sL22KZOsLm5Fb2CvZvG1pPwgIr1dFLMZJjt3qx4Eq64UN2+nnn
         KjcF+X8MIJJxbTJ2gnmtm5qjiyCjv8lAQQT5HUn8SgtXnSmWr9nx0AfyyqYo2h9vh/tW
         sU0CeiaMXoNwAuuTULzbf69TLJDZoAtPSj5mFaS8glgUNyyL3rO0knEOX2joikADyRgF
         GRjNEdm9czcgBY2jhxzvJd533ZO/1dn2Ewm/7E4X9PVWfD1PszP+P3gCSM9j0fu8tx2Z
         /Hhyld4MjHsHxK0h1I194wVAgSPD3xvSt8t+Hd68VKuqpHfTUwusmuY4B8k0U08ozXBx
         EdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953835; x=1794558635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VLpvOWiOg/0agPCz0eeaXl9nhZwnrqFnecxOWRAu+hE=;
        b=NcAKipq+B8ABvL+lLq9XGnzP/FdT7qBhZos76jilxouJcTU1TQJ0XKXYaxGMrnd6lG
         hf5nuDLrpHNyxSiA5268a2VFNuDKL6SLO04lO9FNcPs7rNs7tOzZpEpMVjnqs3wfS6Xh
         0Gz3SWMs2SOYcyvfjVaPmwxoetMTXDr/H283Ae4wPlBIHDwByncE+ADMpFHlEKsHhLHJ
         A8EMhLtRdtEp+KT5HWKhG4eW+xCqzHxdWT1KEy2bOnudeE+zQzcqCuIHmqpjqqSpBBGy
         5Lng35lU49FJ17arxbD0c91ufN8coGxq5fxYPMImmVFQVGbI66x0qcWgOJePbPhMu8DO
         yxHQ==
X-Forwarded-Encrypted: i=1; AL+hErH/ZX8UeJ1pSjwTqFjGNbXaFwwx1bLoslPUFz7oYcbzUukSMkL3vau0u/qldBFWpTeyqO5y+1NO+wcWCIGj@lists.infradead.org
X-Gm-Message-State: APuU4Z+rBsOZ0OREGLa2up4AvFM5BPqPjmZode6nxr2IbyhVFTqsKwiM
	RfSIA/TPd5LaNOdak/V0VD9pKtq9dhw0x3f+MO4jACb1q0ZB+KxLSklRGWrbl49GDR8=
X-Gm-Gg: AYBFou0oyabZ1eQMS9qiEJJV4XIPPSfWdOOwHprM3pMCPwH4fvJMP0ZSrFBF5Uxwxd/
	rBwaFMVxvyBlTuooFWiphm8LCuSWW5oE7FTIxHJW/mT214KYWgbC0JoWLC4SkBG2xbEdDhQRZeh
	Fl00HDWfIPc95WVgpWSV4KIaiwXvyTqB4F23poOeDx+XHeTmcGmZjxhb0NzRK47yJ7k+k1F2vRv
	r1QHfXfhtcyj/BPvdFjZDN6bURNG31KxwxzUeSE5K0S8O3ic/zPcLutlz0FpooxWv0C1AvxqNus
	gdFRz8zzwcJu9ZbYZsFf/9tG9q6bLIbQFyVL5xu5GYFlufEKRN9MlJ5YHLFM16qP/ih8/SWyYYD
	hCy5L+++EkGIeGN3kRJE7uc+gwToku2st0jpETYY34GuBhsS4M8Nv80xa6rLfd1rQuUwmaq55Q2
	EWkfgBEk4/jfsDSidSg2UjcOzqfG+l7EO0Lr03MS9ypqdvODVE1KtQ5OkqoEMOHuxjmS3J8ocOV
	Z5NhE9wCm3wtHPclbPPScRZvIM9lpQJfF6bD9BMJLnSITK7WmOTVOJqf7CRxLzSfdOwlbyfUPB3
	Pd7mP+wl60hvYijdZ2zqRe11SE+faMrSp/1VNv7JQWftrPiHI64tJjibihZwUXCtjO6QcyHT0Tr
	XG8GAFHktorEqJYPnCjTldch8bOlnMjzmxAwVt62amUA7CA==
X-Received: by 2002:a05:6000:2384:b0:492:b880:53a7 with SMTP id ffacd0b85a97d-492b8805664mr3030579f8f.5.1793953834697;
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:34 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:25 +0100
Subject: [PATCH 2/7] clk: meson: pll: Support PLLs without a pre-divider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261106-upstream-s7-clk-v1-2-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003036_679728_955A5F2B 
X-CRM114-Status: GOOD (  12.42  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The common PLL code assumes that every PLL has a pre-divider. This
does not hold for the S7 HDMI PLL, and the S7 GP0 and HIFI PLLs are
meant to run with theirs set to 1.

Make the pre-divider optional so these PLLs can use the common
implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 1ea6579a760f..44b33051405f 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -76,7 +76,9 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 	unsigned int m, n, frac;
 
-	n = meson_parm_read(clk->map, &pll->n);
+	n = MESON_PARM_APPLICABLE(&pll->n) ?
+		meson_parm_read(clk->map, &pll->n) :
+		1;
 
 	/*
 	 * On some HW, N is set to zero on init. This value is invalid as
@@ -174,7 +176,7 @@ static int meson_clk_get_pll_range_index(unsigned long rate,
 	*n = index + 1;
 
 	/* Check the predivider range */
-	if (*n >= (1 << pll->n.width))
+	if (*n >= (MESON_PARM_APPLICABLE(&pll->n) ? 1 << pll->n.width : 2))
 		return -EINVAL;
 
 	if (*n == 1) {
@@ -437,7 +439,8 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (enabled)
 		meson_clk_pll_disable(hw);
 
-	meson_parm_write(clk->map, &pll->n, n);
+	if (MESON_PARM_APPLICABLE(&pll->n))
+		meson_parm_write(clk->map, &pll->n, n);
 	meson_parm_write(clk->map, &pll->m, m);
 
 	if (MESON_PARM_APPLICABLE(&pll->frac)) {

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
