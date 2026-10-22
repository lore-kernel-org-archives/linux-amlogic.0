Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D55606A327
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Oct 2026 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fbNUwNw9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=XLOd2+Dj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=JMs2AGd296+25ndyQzJWHnIBnaa7k5vTT3CtV7AWPHo=; b=fbNUwNw9KYBMpBMNL6GdmAyx4k
	vLhe/QJOkAGwQi0uAiH0s9VIbJgZtUjLCjNwMyXzavU0ZZy3LAJXJBzcfgdz6dxvc6BDe4eLDgmvA
	SMhyVj5zwRaYg89ghvYLj9JzjNZf+iuLwE4GPe4v8RoCjNEAbEjRa3v6BusRI53mBcUKI4FkjB/eZ
	Ir8k/FKI95xFsrVmIZ9uCUubyEmAlkZ3ui5i4J+wcTLcr7nsme577Yic2J5Lsk7CFTpNKQhW5yrdx
	jl++BoPYxvF0drBrklx2msjOlJ7o2jvGM4HTU0HJJB61CcMJhiR871EYUasWu2pj/cmbEKYbUarhV
	OE6ljO6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9l-0000000EuRI-1gqL;
	Thu, 22 Oct 2026 20:12:57 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJz9f-0000000EuLE-0zgG
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Oct 2026 20:12:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so1673895e9.3
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Oct 2026 13:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792699969; x=1793304769; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
        b=XLOd2+DjNBEfwOUJDKBlGD83Rf4HpW2vGa67Cr9ByRnaK7CzfVDjyonkLNRwd6PCBg
         zbQ4jE4zb805PqeimRAYWg2v3gd7U/bN24OFgumzOv6RNvqc7HseDzzcdzJNRsuEWgCR
         8KIoSAEFziTS66juDgaC+QkXg0MWG/2NreYSe6ZccVdZA4k/3fBWTcp/UfTuUpo3Y4J2
         kbnvNTm2DAW0jxt/oygaUEQe/ot/L1BGWk+aAtH/pLonMNT/BTwRGoDnbSykNZYrkKH7
         UMO+77q7Qqnem7ynzdWO4EFUM6DyyjMFD87VhGkO02XyRScNTSDBRZYNBJqAiSss+PCU
         A0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699969; x=1793304769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OB+7yEfkqPGhUrV1LhFska/bkUN2ZnD0Ocu5Dl1ZKqQ=;
        b=gQI174d6ZBwT93O+BuYPKgLoc3KTk6+uuVGLOqTriPIvSEqkMArSJYvq/9Cyr1Bt2Y
         z+QX2ou+eQ6wIV4XialXwWw1ut2/5HDURQGa3cASl3qh5g2D5u3wDRALZyIJk6b/bovP
         9ZAOLuE5CI6RXBuhuIfvD3y6Fp3Zm70BiT/jePIMeYJPdlEwODgSNkDLtpG2BptiSVbv
         bywo4YdfvCFXoaS4nYqSS+Ot3sbIHSUL8cZJVct1Bi7NSp2inAZ1K6BKtgi68CBEM3WP
         SdRnrqSSsF3+/Z+1ZdZGXVHRBfWZznPn5GXeGcMhqDWjHHN9gOI8WWKZDdzTqYhZq8i5
         mvyA==
X-Gm-Message-State: AFq9FYJvXHK5e5MheammbM8d/VMXMMrH0nKbk+2YPont5j7QTkQEJVkm
	deQibmRiFlYYGV4OVSKa/cqodziRR3OZ6kmzLKpa6Fpta65PAUYSyTAdQFlYCv4emjg=
X-Gm-Gg: AYBFou2Z23qE0ExU0qqBjXcFntcoeppYxCdJc7TWA2IKFABxUdJ9jNJHx5n3A8dK8SF
	lCgjH6NR9K8Ys0KKxWFdUBZOAMG+68kpch+lC8tPALuxCb+vQsGoaZbDXML7na55a0/ScNFgdHC
	3H+tLqSI41MbeZGZE9E4tixgZlMMJvqBuYEKy/EpMlFHLG2J6E6ZTOw7nf3y2UI/HhxJuXHohWg
	sGe9U+6tBsDStdkIgFMnDZu5NyIZ/y7eIATBY7iR65kHSUu9aLPfEEYTzlHSz7OcaVb2OcogSeG
	5aBpEmO/riNFZ4wUuPLnCuzZz62eYYtZ/2vUgrWHryJLG2aqvHvNLOyelbPNbuS36RbMbWdpJZU
	dYV+rE4IsMepEK3XONCfBc+86025HDw+GtWZi+xTXMLrEJUMJT2mBrZhPFaiFb99ieM6O9zrk5y
	AIHYclsjqxuq489vrJWY9fMSlkqXOl5JHDINi3Gn2irUN2fwmEdjU0u3Etm9L5LJEGrneUYV2mO
	5AFLkVlZlM52LT5fuiVNhypkUuOsXpL9y23FQTLl874rjIG12XszZ34XOkKYSkZs8HOvZPG3ERu
	+we5e1hziyi0sfIg/GsVAynByMTpxA11ypeJSCX6+OlJVHoTRMAL1ZqZmV+eA7E=
X-Received: by 2002:a05:600c:1c1b:b0:4a1:e11f:b2d5 with SMTP id 5b1f17b1804b1-4a211c7870cmr2773875e9.2.1792699969349;
        Thu, 22 Oct 2026 13:12:49 -0700 (PDT)
Received: from [127.0.0.1] (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e380575d9sm224286f8f.44.2026.10.22.13.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:48 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 22 Oct 2026 22:10:34 +0200
Subject: [PATCH 3/3] clk: meson: s4: fix ENCP clock selection
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-upstream-clk-encp-sel-shift-v1-3-f1b1e10a3d84@baylibre.com>
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
X-CRM114-CacheID: sfid-20261022_131251_359781_DA86E493 
X-CRM114-Status: GOOD (  10.15  )
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

See the S905Y4 datasheet v0.7, Table 7-58.

Fixes: 57b55c76aaf1 ("clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller")
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/s4-peripherals.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/s4-peripherals.c b/drivers/clk/meson/s4-peripherals.c
index ba41fcd90588..33573eb85927 100644
--- a/drivers/clk/meson/s4-peripherals.c
+++ b/drivers/clk/meson/s4-peripherals.c
@@ -1114,7 +1114,7 @@ static struct clk_regmap s4_cts_encp_sel = {
 	.data = &(struct clk_regmap_mux_data){
 		.offset = CLKCTRL_VID_CLK_DIV,
 		.mask = 0xf,
-		.shift = 20,
+		.shift = 24,
 		.table = s4_cts_parents_val_table,
 	},
 	.hw.init = &(struct clk_init_data){

-- 
2.56.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
