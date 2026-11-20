Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C956C60A6F7C
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2026 13:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yzJNV9XI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fVT4txTT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/SjuRDuQTt/fzLRmuvuyAEOW4uoZih704gs/JHeZIms=; b=yzJNV9XIcLZ/VES23n77ujANZi
	YRG6TUs1X+RomNppdizOfu89HxAX4oGv5lGvXQssiG+XmdWTU/fjpVoY+4ulru+vtloOogrCKyMEs
	KcCBJLFSONtO9K8e/vsfxfe4VSstbMafq0v39dyhOI3s7Xs6X2JFBfHn/WTY0BaddTK1WUziz74TK
	DE1mddf446Ji/eTgsn4cWrWfZFau5k5h36TYnyjfYvkB9ulGEpfbcUgpO7z9xAtynLA3dTTxzISfm
	T7Aw5gwIOgSGNqVmYHBu7ZEMryL7sn6qfObqQhGzbYwqMHKV10X3zc8C6/xA8UNNTFi+P0nzwwY8k
	S42epNDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOx-0000000F3jZ-23K8;
	Fri, 20 Nov 2026 13:11:39 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOOl-0000000F3as-2Snu
	for linux-amlogic@lists.infradead.org;
	Fri, 20 Nov 2026 13:11:30 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so7393005e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 20 Nov 2026 05:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795180286; x=1795785086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=fVT4txTTG0LBC3KbvJFIQ/HrjxH3vkAmv2G6tUEPCn2A5YiYFJu9AnDvS7RBCm2ArA
         NSGZCg9CUyB+8j0Ztrh9Hm1pT/9460nxlm7r0v4lp9nPQvAsInfyI0GEq+73ehcm7/fj
         567m8xYo58i93c3+RtBsTE/LLcvsFXa1oMikVUHw0Dh/uYXrZCiBO8BpQtC5weDeRaIV
         7827TMUjWkof2J0FibHpePChV72M5aH9oCJmBpyzWU5oRPBgFNxEzUn/5XoSdaiHxYeR
         KgvN4DfZ+x4ygF2KF3wQfRZdNQu8ZC+A8k6IJdKA7e6uhd+6UAj8VpxbPI1tKBhWRRFf
         lWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795180286; x=1795785086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiiquoDpQ0fORfLwcpAgt6hsMks+0p+aM+8XYir1U8M=;
        b=XIKMx45+IqQrU7odSvW2cLuv5LdksbyqsIFoI0tr27Op/JC75oXDs8ANJjrL7yKAnN
         dwGnp7EIbb7TgmhwDQHGhSr7TmcTcOsfRa+pCeK5sjVHrdvurqllm+G62a7Qvyva4v8c
         fWxenv5hfxWFHpAD2/4TFC5tAR+Wp62pvyIC/Xkn1W0BzQwH1udXMsVAwVii/O3GWHoi
         /Jyms4L17F63FSO669hH70Rntgy2FubwYq014xrnXnDK4FW0xOd1cocwNGvcAJsII4GF
         sQwSpBIF9Oq7kvz47MIUrVA3wryrB/TOXsJ/emZr66wnZPzwnz0IvBtzRxQQZCH0R2en
         lTEA==
X-Forwarded-Encrypted: i=1; AL+hErEy0n2obH74kdS+wGDnQzA7xHGNrDcbd8pnhjh0k8e6wjsWnyL4OJ+USaOS79S+QTONaY6Gv+kmbwXyVICo@lists.infradead.org
X-Gm-Message-State: APuU4Z+8HaRYFvi0QLMnzBkDK6ymq6rbAjhJ7PRz2GW69Q5bFFYywB0K
	jEzm8t4CjmbWnWuhgkEPmG1wPXvstBalReZzYpYW9CqefThaHtIw3Ki3qDRBUyQfGe4=
X-Gm-Gg: AYBFou00rJB/6/twNd3+38LuE65YfAbUVnZDJXvYI3eNTTI6NLE6QL5+iC7nC4W++gb
	hUQ+DzTY6GJNgYfNj8cFiJapK61lAQxeprvVaDILDx1kN++7wpa1HuudNKJJO3pua1oOWp29fRR
	FXThE8phJMfZDkLyQT8zxQ47BHRfRFJphmx9RQjM0d+D6Z5bAWgPhaV+x/SInUjmqiA4IbXEIpX
	kDLtqJa0EjcIoSn9fR8gjNNYoPVAytqqfROhGfZr2LabWR38M5FemVEwUEzodd+Mg7AgC63E80F
	uAC7PLbyvtP+zrwyaPUlSm0zQKTCx9ByhCqSVtst0MXpWBWITR28sJDUapIVIi5iT4fSrg0udf4
	PrYfTcTy5JSCNEq9+qEaFe9KZ4mJUDJUbsTRi4HCqVBAgusUaoIAda8Pg1A0Rj4vDou3XScOUMW
	5m8MWBUahXS5dtz6Qg/S5NAysQsDb0MA7FRHlmzoNM0Qlb7jXyyPP08x1rFLG9/jKa6u6+JV/Cv
	qkHKIB097An1wRtMz+itLlUfBXqvCQQoZcnoiAND0BzWrgthVbXoaYvIoE5dIOkA8InA38pGbRX
	MQ0gfCLVGx++S62vYjb8GatFNGXkMAZEpZdZVPHCglGznduVhw17XOd57oFzUiSdIdqJxHNeZ68
	JRsUJXGTyLbZmHEzSep6719KAJCcL1E9KADm9LlnlEYKh/6zQP0GpNZc2hu2D22dZgjMI
X-Received: by 2002:a05:600c:4e0d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4bb88922a67mr67265015e9.31.1795180285567;
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960110fsm43497995e9.0.2026.11.20.05.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:11:25 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 20 Nov 2026 14:11:04 +0100
Subject: [PATCH v2 1/6] clk: meson: pll: Support PLLs without a pre-divider
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261120-upstream-s7-clk-v2-1-856cece3b9f2@baylibre.com>
References: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
In-Reply-To: <20261120-upstream-s7-clk-v2-0-856cece3b9f2@baylibre.com>
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
X-CRM114-CacheID: sfid-20261120_051127_706845_ED9335A7 
X-CRM114-Status: GOOD (  12.50  )
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
2.56.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
