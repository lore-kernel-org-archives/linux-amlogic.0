Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDD1606A339
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=D6VqjYDb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=CQacqZdi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HncVhQVXuVVC5wLLeeSILho984PjyB+mHOiiYm8x4Tw=; b=D6VqjYDbokl5k4V9ml3qmHpV+8
	PK5SyhhmP40Hxx6/+dc1ZrKOaLoZNh0hdf0HAtvL3A+dXQSBenxJc8rHitWLoogM8lHqb57AWdOCk
	ss4mJflpNJiL7BZfoOO+Yx2uT54YNiuBPi4pAzU83t2q/EWSunqyeSLbLnTOphtGwiUZ5AZZEO/t5
	BXX+JX/+mwLrBe85erzjQF2iORlfDp4UeLadPGLv+992xejAL/fgKUYY4H2HwyMuFFbaYViVKqOTi
	DkBpMCSIB1REqlwrcTRXcdv3XNJ/nHYFK+7d2iAxqShjJ2GE/HyhSMt9l+VbOd6EKh6eyBYp2c6fm
	8L17gs5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9l-0000000EuRg-2TiM;
	Thu, 22 Oct 2026 20:12:57 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9e-0000000EuKg-05iD
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:12:53 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so84045f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699968; x=1793304768; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=CQacqZdiC2QpVZEq6qXVF9smpzK6wEusVWEDR67P9E69qbnP62BbHbzgaWLR7xLB7l
         UcX4KUYXfIEa6uDUIJOoQcsSs16aMYQg7UX5Cboyy7WGwcEym2EJiHhgjyDh2gYFaKeC
         ZrK0xtI/y/VAuBfY8mSGWjQrNag8i5rVypa2fSuuqbEb/eX1hAr+6MFbqRvL8IA2a8bS
         ZKVhEu/cKvkLM6qUeiqH8AJDwg9Mj0qylSmEcJMKDNNreI6yuh9kCArXZCrnuYJBSbso
         Yz0ZHy01cUS1t3QpTO+YHPM/H/sNahu3pJWDMLMozg8jXX+AfUD6gAhoqoxk34pKugdt
         KlnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699968; x=1793304768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iq3tU2hJqbtFbeXtd3ktVw3J1WdeojLrkQfua2mm+s4=;
        b=o9xkBbEylgbATNJxc0bYtQQ+y6rxNlPa/ywuiblviPQCultyvutXowm9/8ydAYlMp5
         Cy2KjRQePB2dqKA6dC+7XfCMAD5cCbcoY364r/m4pphIbbPUAj4hl6wLauYSpWnSuJo7
         Rxj6bXcHJMWmScUF49GbHYg4q01El00Us6Bnz/MYiUhyVjNRmpHlcnhuA0NrKRgU2VNX
         OwH9SUejZ+KOWm1xTUTYGT+JoT5+sqXN2srad5E6Ujw7icYKla9+SSlE8Gvt9EqxdhCQ
         iavq2v9On0RXkYwWDVyfCPASRB+kv99RpV6Jg0JJQdvZoLV/zpGl1bUoSoIot9f1NkUi
         vLVw==
X-Gm-Message-State: AFq9FYJ9+xQNTdcD7b6CypCBn3l/Lvou+hpNFinWTmr39JN0H5FkRXB9
	GkLDYnSI+lhU8btQYKzQw9GSaHwn1vlBHYFwXdx7tPwmJuRiSMd0AJPCNtoE5zJNhxY=
X-Gm-Gg: AYBFou2xFAtH5SbcxeRb/d877voNU+GqBgKNZ0b2EX5GJ1Jfketm5sBN0VWdJPmTx0B
	fIfaBocK7JbhXBTpRNkkC+rvZcLT15f1UWJW+wj5WiZQ5QdbYDUBV+eG4QBl/WVbcW/YUCs9+DZ
	aa54eb17FUjrGmqJzpTxdOX4euAdC0s3O+bchQwoXZXNHWrtFzMrRhQ4xminzswOS3ZurypSgmx
	5+QGf+rVIINmlQ6Z+wGAChYwrYTRku55nkxJCNSS1Y4WX9PKBEKWRNxes2hbBVa6G8VgUhNsTuW
	VASMlRPioF98zsVZ82jcavtlP9JOZjIaaeQGe3NpQ2vI6ZO7m7giLmswLyCy1iuR7SR8IHzsngP
	MpGdohwl+aY47biQgGgbhvdI6jKznUcgLCjU0YuOmZMcy+a5FrTnrpfO6sCVa8rU9WOacz4Q+lX
	YJzgh9/QK4KynRA1XnGFFsHLDrKSIMkHkbqz1qIuQAElxVtaTZNR/JskFxYBngfJVakw/vP9aXb
	PR9kae93vH9JR0kict7OjUlCmcbMjYjU8NvKNseJ573NHtKbBaVy676Q2JXmUaOA1fUECtXXTBo
	nfr/ZaT/deWKj5Bigu/azcvX0frJ0o23Cl0zGbTL/Q==
X-Received: by 2002:a05:6000:4206:b0:48d:faa4:af9a with SMTP id ffacd0b85a97d-48e2d102ea3mr7429893f8f.9.1792699968427;
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:33 +0200
Subject: [PATCH 2/3] clk: meson: g12a: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-2-f1b1e10a3d84@baylibre.com>
References: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
In-Reply-To: <20261022-upstream-clk-encp-sel-shift-v1-0-f1b1e10a3d84@baylibre.com>
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
X-CRM114-CacheID: sfid-20261022_131250_125245_C3EC026E 
X-CRM114-Status: UNSURE (   9.83  )
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
