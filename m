Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D08C79FB7
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQ3JNwRdVYanp9vIOAf8ihpg5m6BzmQqMMi51PNhn5w=; b=1HuSg3vZb+L8YM
	uBgTPkdbXhuuJaNJA1i7nZMFeZyXIfUjG1hP2es9JmnpMRW97DMzYw7ArWEQJ7l98tnb8oET1ae9c
	kbCRQXgiHmMS9xmrDQ718aertzBSTQ6XFngXHUTnmfIbbZfTva18C3mWPe436b1nNTEOSD3KtnOH2
	2Hq8vUnVHV/zP02wZGcxR0LSuWd5oKt4+e3loZ5T7r6Yj7CZyGx/JKPsUp4HMJNoN9ryYf5GUzPe0
	T5BgYow/9MwFb/R8vLe1IcfzwCnWdMvANFYZJGXDAag10BdCV+9ia4lGWhMAn/KsZcbtKI9tH45EC
	Fk+webFj9ru7mFWgJKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZCq-0000000DdAn-1ioW;
	Thu, 10 Sep 2026 07:28:24 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZCn-0000000DdAA-3WSv
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 07:28:23 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49ce364488dso10139115e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2026 00:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789025300; x=1789630100; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hf0Vxg/RVuff+NE1o7hBeSqcBx9matMTMP/dNlfdEJU=;
        b=FeOInSLRQsezx3PysyeXVrasBpyaMy7Ck+m8wUeS7v/0gBZqmQlCX5MTu32rZR6hLN
         EAPeaIZ68YbFBgojF3gZ/eJWZXXDl1Vd9O3wedVkS2863FI+/yXb0uDwI4fzOadlocHa
         wO7uhOFt7miVyXNzsbkIYOCnYh/VIHqLdXpTvBW1lJSy0Etjm3hXtHzpmGxsw2otbR9D
         g0DBUxExQ73vXc5TsX2C9OrxiWt+PDqQSP5+tT7Q7xxzkHq/9uZKDP4VvOizf5/2Wyj4
         RU1GzJ9YWSpYXbntbmGDThc7BI9jKOAdQpNlQFP4Xd2yCdOkMUedrhurZp2KBp+ylQDe
         zoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025300; x=1789630100;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hf0Vxg/RVuff+NE1o7hBeSqcBx9matMTMP/dNlfdEJU=;
        b=FwzcN/oKtV4B8hLnKNh8ezd03KVxFEcXM/uxyQGAya+hh1Ggnepc8aKqpf+YRpuNiJ
         L2/LbCKGJVyUF78pmNHbtHrGdKi2VEBmVFteD8lTV3mBp4kZxfyjbS6+/sEN/xxGWy4e
         i2hmYYe9rbOiTI/BlsShrO71O9vjHz4h67ePM0A2TI1dIgzxHb1bex3fl/pnidmTLBYv
         UtWz/YFbk48/Pai90Wp5TmVkYwYkSO8pvkeBiLrQI32ZiwJVz3jFRyXtV3+33IGRUU0N
         kiL2Rxq0cP+aSsu//2xUtVA+Z7jCiVhCKahy0t64Jxc9g6kTF7KwOZKFPD5qXIp1rSiY
         uLoQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFgtVWWWLwobW1CtD4RCcH7EoAKZp66q1MTp26Rf/cpGxRvDJ/k2cOb2iGuoW2ibqjQDrypebqxUjqucAL@lists.infradead.org
X-Gm-Message-State: AFuF++mROkk5dIV+ZFx0dbVBA3gZjHMs/izeCwGCkicKsaYvTpXe1SUc
	S/g6DzKr8G1PJbUoRT6nLpocANLxpLhy+82cp3hC5qiHhXsrVqboyLZVUeCQXiHoAjvwvV8Lkau
	A3yTwtaI=
X-Gm-Gg: AYBFou0WUp1EpUC937KoyhgujVKK+c6JaW6X2DnN8mVqWflGNfx/btgEazWmHtffKkU
	53SOFaOFoe+KJhQnOLBkxndBdZ2caJ16KRG0RrjpJi84NRZ5uIZktanpjcFnw+scp2KXWGr3lur
	dnfZmPsXK5vtWFqSC92U5ruHkcm02tR9/6n2wQhEmLtCoeD3ccch6xqbl5dmhM8nIB66TOrfs3q
	ialvJHAKdWdglWpyH4LcA1LjmUSZi1KtzGbHuddmXLjyFAHEZ7+DQWmvh/q0MkBqQWb+ac8HakW
	BEHAfcaFk0SYL5NpLo2PkEUb1kjCI3UU1lky7oAj4GFsjRQSReBVYAcy1HcEV0Yu5Z7Yw/rWjg3
	0zJB/scicqyRb1F9kqdT8UVftTEFpqRtuO0GpeUTar2PhsrFRBzLhIG3b8U+pl08xuPFI2IG6Id
	4YjlGTAjHhpi/RpmURYCrClNxYM/yBxVgpo76FkTwJeWBIMhijN9Mp5P00+Ka8R4DazhZllmbHr
	isePdxTZU23BvFdvAqSNECUr0Me
X-Received: by 2002:a05:600c:4fcb:b0:49c:f13e:e4c with SMTP id 5b1f17b1804b1-49d26db4274mr30720015e9.9.1789025299675;
        Thu, 10 Sep 2026 00:28:19 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be5b72sm46629625e9.4.2026.09.10.00.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:28:19 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: stable@vger.kernel.org
Subject: [PATCH 5.10.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Thu, 10 Sep 2026 09:28:14 +0200
Message-ID: <20260910072814.334323-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026090930-shopper-footsore-8dba@gregkh>
References: <2026090930-shopper-footsore-8dba@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_002821_896486_0E545AA1 
X-CRM114-Status: GOOD (  14.05  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

The following out-of-bounds read has been observed by Christian on a
GXBB WeTek Hub:
==================================================================
BUG: KASAN: global-out-of-bounds in __clk_register+0x1b70/0x2418
Read of size 8 at addr ffffd66320cf88e0 by task swapper/0/1

CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 7.0.0-rc5 #1 PREEMPT
Hardware name: WeTek Hub (DT)
Call trace:
 show_stack+0x14/0x20 (C)
 dump_stack_lvl+0x74/0x94
 print_report+0x164/0x4b0
 kasan_report+0x98/0xd8
 __asan_report_load8_noabort+0x1c/0x24
 __clk_register+0x1b70/0x2418
 devm_clk_hw_register+0x74/0x15c
 meson_clkc_init+0xd4/0x20c
 meson_clkc_syscon_probe+0x5c/0x94
 platform_probe+0xbc/0x17c
 really_probe+0x184/0x844
 __driver_probe_device+0x154/0x35c
 driver_probe_device+0x60/0x188
 __driver_attach+0x168/0x4a0
 bus_for_each_dev+0xec/0x180
 driver_attach+0x38/0x58
 bus_add_driver+0x238/0x4c0
 driver_register+0x150/0x388
 __platform_driver_register+0x54/0x7c
 gxbb_clkc_driver_init+0x18/0x20
 do_one_initcall+0xb8/0x340
 kernel_init_freeable+0x49c/0x52c
 kernel_init+0x24/0x148
 ret_from_fork+0x10/0x20

The buggy address belongs to the variable:
 gxbb_32k_clk_parents+0x60/0x400

The buggy address belongs to a vmalloc virtual mapping
The buggy address belongs to the physical page:

Memory state around the buggy address:
 ffffd66320cf8780: 00 00 00 00 f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
 ffffd66320cf8800: 00 04 f9 f9 f9 f9 f9 f9 00 04 f9 f9 f9 f9 f9 f9
>ffffd66320cf8880: 00 00 00 00 00 00 00 00 00 00 00 00 f9 f9 f9 f9
                                                       ^
 ffffd66320cf8900: 00 01 f9 f9 f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9
 ffffd66320cf8980: 00 00 02 f9 f9 f9 f9 f9 00 00 02 f9 f9 f9 f9 f9
==================================================================

Commit 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock
parent") dropped a non-existing clock parent from the gxbb_32k_clk_sel
mux but didn't adjust the hard-coded num_parents field. Fix the actual
number of parents of that mux by using ARRAY_SIZE instead (avoiding
similar problems in future).

Fixes: 7915d7d5407c ("clk: amlogic: gxbb: drop non existing 32k clock parent")
Reported-by: Christian Hewitt <christianshewitt@gmail.com>
Cc: stable@vger.kernel.org
Tested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Link: https://patch.msgid.link/20260623201956.1324992-1-martin.blumenstingl@googlemail.com
(cherry picked from commit 628b6fee9fca292f12d07f0f1bcf1edefa949d81)
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index cc99a828eb4d..d6c4667dd42e 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1302,7 +1302,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
 		.name = "32k_clk_sel",
 		.ops = &clk_regmap_mux_ops,
 		.parent_data = gxbb_32k_clk_parent_data,
-		.num_parents = 4,
+		.num_parents = ARRAY_SIZE(gxbb_32k_clk_parent_data),
 		.flags = CLK_SET_RATE_PARENT,
 	},
 };
-- 
2.53.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
