Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B519606A323
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Oct 2026 18:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2DoIB2hI;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=WbgRtcSw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HncVhQVXuVVC5wLLeeSILho984PjyB+mHOiiYm8x4Tw=; b=2DoIB2hIbFPfhrzOcb60I/URNQ
	0Aoqhbjqh6ijIJNN/mtTvwq8IvPtj8tEFBUCLKdcwLCcrlabH+VxNLBVu4eq8u+Ne/n6WWm/ldr2Q
	8dENmZF+Aaz19pNV4Coq/bxSjFYxZ/kpR4zBFmLD8dE2dgV4u/hoRluReP5mubYdnJCLnnJXr4rcn
	5LnhKP779/gy71uBUHyMX0IbBg38sSNxDw0qJGzqDfx1ROifhzAj3xRa/L6xBs4qX7CZwuwp8Bo70
	JUQxbldWMK2cOQq94F4E2Y6JZ8CKGlAnZjc0yqqr7Zq5nFsKhCiSBByuWrNll0LBNPi/GsM7DohE+
	OsZJxM9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0m-0000000A7qR-1Bnn;
	Thu, 29 Oct 2026 18:38:04 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMV0d-0000000A7k4-1H3T
	for linux-amlogic@lists.infradead.org;
	Thu, 29 Oct 2026 18:37:56 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so15521205e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 29 Oct 2026 11:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793299074; x=1793903874; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=WbgRtcSw7HgzdiNVKL4xifqbrZAShjx+1a0TAmLh0GC0U03vvymH9GqW3E12BrJYlq
         blm+nsX0U2g5t3RpBf9DZDGUHk8N2OweK8myQ3dJ828Rx6HNm8W+VGbe0Cs+9Y4cfNWW
         NhMdefM4gBpIvRm9Rxh+T4nkx4Ml00MJSwFAReBt9KScu7bx6xYG/yTz93hlY0pm36pk
         kNbvm6qiM94JWVHZJnRfJK6gS+K8nEzonLfCBw/bseo9PJYxcD9a0pHO6T0MgMI9RM9I
         Ovqk/57wlpK+KpxsZ5u0BHnRR44kvbtgnMawQ4HORjuWp1hrxv7TaX7NfQelaUOqtnb2
         Qq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299074; x=1793903874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=TU3j5Y6HCfZjPcjTXkj8B4UL4CZA3/TjaJVuJB6fRFX0ChLCnnM64FQewD/+NPpZgp
         YF5BzZ/rSSNKz8ShvCqLfS7QcQlyQhI2cOyslCJz9fU+I3xje0jkKJAPhouxfA5e3RT2
         Apta5/Flq7owr9tuL2wp8ij+n0uw3QkjdZOb8c0WoXvs0ztaiTLBDJQmDmj2t+V4rdJX
         AHM1da57BtymoJ0le11CZGU1PVBiJTDd53se24WYZwnLedqWTDJ5PLER+2dGmwHJSje2
         wM2Skf4/H8mQd1Vn9OqFbS05A/UDDmA+NNwFeqbHkFYnyZQ9Gmsoe78oq/reiyPXrb1y
         KfjA==
X-Gm-Message-State: AFq9FYKLCNTom0WZBFKl0mzE3eDqKZYe/921mUmK6X24wEGqDOyRGf+E
	bFv134evfGLsTLr1t2VHvJSbSMcWKkzdJ3Z57jcy0jsd9iGU6q3eyI/MzdXIJdanQBo=
X-Gm-Gg: AYBFou2mczF7IAY7ZkE7PIxZGoEVrpMAUFM2nm1EOFSiloe1lfX/Sd+a0211OXSDoOW
	OurRyD+cHOSowzLhmWpmKAwHCEhYV34+65+GRsqAwjjHibxFdOJc/DiU/klXEVTCPmgVQODgCxD
	x+aJmKSEY9AwmHuCodDIsClyuxiSBNb/M5MNefHP+sSlyhu8m9VkgyIIYARI1ygv79m9VUMYrA3
	jSfNkGosyUQEuk/LuEVfFPIO6HfAyG1zaBhkz18DwjfsitQZWENJUyYoNv72E4EnbA/hmnV4c+o
	gqnLP5HNSm7ZGLsNl0+SlezfTXrUX0exobs9rjuBAHoE8i9ao1CQbn/6XpWS0SLyqnLzhh9CJEK
	/HidI3WgrDcLEO1DLC5bfd79fT6oCveuDlWmEFx4q3HyUWRB6/P+UF+l5mDl/EnuuxruBLPvJRL
	fpabdHSNndQB7GsqfYSsYLYd9e86BVtaj1Oq3mLx7QFcdD/wx1X6EnrMrtf84x24Ruxk30qPSuo
	PEIuhHOOlRrerhkm6XlTXPs6B4lrikWmY4aCJf5mXwBUBkp3H4ZzSwrvPsn5+702TZxYDfXX52x
	nyVXCPDKLP0czaNQcbtSoRrwH1OC2CG/UeAXpPz5f7PDFStt+lnjWJNJlwRzpo26z8q44verQ8j
	h8x1WZySuu8/r5t4xFg==
X-Received: by 2002:a05:600c:3144:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4aa8823df43mr85280425e9.16.1793299073743;
        Thu, 29 Oct 2026 11:37:53 -0700 (PDT)
Received: from [127.0.0.1] (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa820492cesm90118305e9.13.2026.10.29.11.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:37:52 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 19:37:35 +0100
Subject: [PATCH v2 2/3] clk: meson: g12a: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261029-upstream-clk-encp-sel-shift-v2-2-31ffbb6b82af@baylibre.com>
References: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
In-Reply-To: <20261029-upstream-clk-encp-sel-shift-v2-0-31ffbb6b82af@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Yu Tu <yu.tu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_113755_375288_B9C48711 
X-CRM114-Status: UNSURE (   9.59  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ENCP clock uses ENCT's settings by mistake. Change the selector
from bits [23:20] to [27:24].

See the S905D3 datasheet 0.2, Table 6-109.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..fdf41572be84 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -3666,7 +3666,7 @@ static struct clk_regmap g12a_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = HHI_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = g12a_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
