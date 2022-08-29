Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941B7ECAAD2
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 18:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y+93suJ+oSOBcYbYD04w3PJKyFt9sIGTM7XAL7giSPY=; b=r4ARcr0PWAn221
	DUUGxd5ETj7pRAoMUzNpbQHu16t8hY9+I+9y7jYHoiaoaxSOcJh1vOWhlWd9oTxQyXp8PkoJNcsKg
	07E+h9mPm4FFQxaVKSULDOOkyCZbkvqQsSzHazVtgQgfhyBVKtkZ84dO60G+wtO4qaAZKIctaxabp
	CSEdXpcGoIZ/AY8wI3jwpp/IpveZKnW93avj2ekEJwjqImn+ACyo5Y5dYghHiC23Zyi5tzjN3EEgW
	+R1v30fbKDlagD4ESiCiGmK6T2WNZufy4F/q5vzTYVwsplqj0BtAlMQx0ZlxCuCNW5NgzVXdZHZ7M
	Ikhiv8rOIGDCB1Abbtug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSjso-00CLtP-WB; Mon, 29 Aug 2022 18:53:15 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSjsj-00CLpI-4k; Mon, 29 Aug 2022 18:53:10 +0000
Received: by mail-ej1-x62f.google.com with SMTP id cu2so17614319ejb.0;
        Mon, 29 Aug 2022 11:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc;
        bh=bilE99Eb8g6jOTqIlIz0GtHBknDbsLMQgwQJTTDAk+k=;
        b=qc6rrlx85JJlXnN4/QMcUIuqn7m7I+JuinUIdf7FLnhCZNgaGuA8PpHLqE0MZ63oix
         5Z0YI6iLfgkXEuo//Po6Mot5+EAh0Vbo/35DS4XL7B/28009T41XDe1UDcrh9ZCyrzbK
         TaZphlHbqZaOlc8lsBtCa1mPyc2CycGKK4hN3hwr8kYeBZ8IqTv3wqht8J29X4o4Y0SW
         qGX4OSP206+KW2hnol3z1gK7o2/rsOtmD8/0gVZmlfmkXdP1Har2ywnhSJf4kCKHV0Wq
         nciunIX/ejj5q5Li4/6f2BJSfYKHkek3e4+63Y1ThHXzZfbZoRqr7WRsIMWBBh+lkA6e
         gr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc;
        bh=bilE99Eb8g6jOTqIlIz0GtHBknDbsLMQgwQJTTDAk+k=;
        b=Sr2Pm3lW4o2STvVGMBaPhQHaBThjb80cbfPBWo2RwIjWRqb0IZQYwZqyY5D4S0UVb5
         MK/IM0BW0D9AW8tgVR0U6shhhNVyKZ2rarTTX7YJdWtjjU/96Xfa9f8z7YR3N3CAhEXV
         702q7AHQERR4W8UTZoCu/1TX+Ca8klEXnctgwoGqg5i9VcCSJP6yxtXJsksj/9ZERFO/
         /efiPLKmWWUKtqzgnE3QGiIRz4ma2o6NPB+8R/pP1LnJRjBIVNoTNcDzu+4gJOF+18FQ
         kggn+Km8B9Qkcjz3XQd7lSOeDMUtRTH5UcYoq/xMAdLfUXbh/7IUUHfdIrOI9piKwXCu
         TAEw==
X-Gm-Message-State: ACgBeo3GabDQW7WJHo0u2CxahEovXwZZhdv5Mo/GnMeOilXAjIq6WqFl
	Rt85CT72uDgczcbyTyINC/0=
X-Google-Smtp-Source: AA6agR5mIoOyP3KHtsikmDLLgnbfSIOc8Wj4E+WeGpMCPSo/Yz/BsMARoy5kgZKhteqWbai5RFrBpA==
X-Received: by 2002:a17:907:3f88:b0:73e:484d:9d6c with SMTP id hr8-20020a1709073f8800b0073e484d9d6cmr11571943ejc.283.1661799185511;
        Mon, 29 Aug 2022 11:53:05 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd96:2400:287c:a714:9c3c:aa54? (dynamic-2a01-0c23-bd96-2400-287c-a714-9c3c-aa54.c23.pool.telefonica.de. [2a01:c23:bd96:2400:287c:a714:9c3c:aa54])
        by smtp.googlemail.com with ESMTPSA id t23-20020a05640203d700b00440ced0e117sm6048138edw.58.2022.08.29.11.53.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 11:53:04 -0700 (PDT)
Message-ID: <a801afc0-a8f2-a0a4-0f2b-a7201351d563@gmail.com>
Date: Mon, 29 Aug 2022 20:52:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] clk: meson: pll: adjust timeout in
 meson_clk_pll_wait_lock()
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_115309_264549_47060A7F 
X-CRM114-Status: GOOD (  10.05  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Currently we loop over meson_parm_read() up to 24mln times.
This results in a unpredictable timeout period. In my case
it's over 5s on a S905X4-based system. Make the timeout
period predictable and set it to 100ms.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- remove an unrelated change
---
 drivers/clk/meson/clk-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index daa025b6d..53b8e17e4 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -277,15 +277,15 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
-	int delay = 24000000;
+	int delay = 5000;
 
 	do {
-		/* Is the clock locked now ? */
+		/* Is the clock locked now ? Time out after 100ms. */
 		if (meson_parm_read(clk->map, &pll->l))
 			return 0;
 
-		delay--;
-	} while (delay > 0);
+		udelay(20);
+	} while (--delay);
 
 	return -ETIMEDOUT;
 }
-- 
2.37.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
