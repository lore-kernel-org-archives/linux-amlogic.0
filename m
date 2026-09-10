Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D01C79FB9
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Sep 2026 07:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mgEFkHTxnax6nFtUqQzYjHpb95DfDHCPOGgckJ19J3k=; b=mTs76KuwHRCaGS
	+jxqBX8C+TM3ZiNd/xGAhmucbMIIWi61iZ82HWrpj8L4AInQ5rKafdpBs8ksvk3Bo8vkCRleeRhe2
	/UCeFvUJbU8A4MAMlsEU+YOIHb3UBvy3qzr5rrdH9U/MNsl82BzOnMwKDRcnt2fkQHI9/ZKg0CBp3
	FVs1Vjz/kQCqBejAECb9DCn3577daSuw54m9GDngXD59uXvd3MynaZ88a3japZBUei5idADjf1IWE
	cjJgtITZXShY8+gYrEqXcyF/NcW0gH5SqeeM54xWEbs4mMnyK5nBiAEgB2hon4LJS/yu4CsDr28E0
	Ike5O7iKkIEHy2TetxSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4ZA0-0000000Dcly-3tIZ;
	Thu, 10 Sep 2026 07:25:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Z9y-0000000Dcku-0UcA
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Sep 2026 07:25:27 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so7725990f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Sep 2026 00:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789025124; x=1789629924; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a0jIRTzqzV3q4uOQGdtY2jprNAQRxNJzHauEVeey+qw=;
        b=AsQgpK2ldEqLKGz5P4ZIwplYOeMBrIOz3WoZgbIRNymqcn4IXZU8MPj3dFV18r+6fG
         572Y5xY/o6kwEaTqCQgCacClBu1DAV6/nSa6LXr15bHgXfTAc/XjzXahblJ0z4WC2N+J
         R+nhXBhZXFX/r622ZI+1qUttPp4Ln7MRMdY1gX3Qo5YwG+qGVhYJXRN0Ffw2UCCM9O5R
         aGZK7f70Gpvu6Fo50N/a5E/o/CdTC/Bbyf21OXr1i032l/JNplMJ891TFEXN1UgKWJlF
         3o46GzJXucGRs2A9xD3RbSl6SqWge06sggMNrTp0F1QqAxefFZmjJhga87KChjipLEv1
         sAIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789025124; x=1789629924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a0jIRTzqzV3q4uOQGdtY2jprNAQRxNJzHauEVeey+qw=;
        b=LZxIaX/Rm/F3pA2dqeYCACwB3CeXbEDqtv+oz6++qIHl61DO/fjBv2d4G2L+/HW7ab
         z9WazS2PofWJk3HPi2u/gpbqF/ZcSS40+yXp86P4iHARAUceXKbNO+h+u1GwCc7TnrWR
         2yT9egf59XMutXvOQpirCm0r0J5YHZqAuD9S5eWyadrIU34LOpJj4uFdHzQUZDoHebnN
         s/s7MVZMvdaYmciqfulUfA0pAclz4Ig4JPt48v/5JMc8AA8kT1MiC/u9ZaZ0RtAylBUa
         MmS+knNiOawQawg5ZnEYdUW7OrYJIG/+5xdN2IXPCoKRx3h+TOkblG1fC7LEm/KWC7Ou
         Ti+A==
X-Forwarded-Encrypted: i=1; AKwUvByi0G7DjPvIyg1WGz3HlK7/GZsO6VENlxoudozsGE/WZDEArZ2w+ux5CS3MOPkxjD/U+wehg8i+PrzW+kuW@lists.infradead.org
X-Gm-Message-State: AFuF++lJwhezD4neNKJ6m4JcnVCw4t5VZUltIq00b6+zYyQe3IxdHyX7
	ZJ2zySCzaz1v1Dpe5hCc6XOnSCHMfgEPosMLgb4vtZ4QZciGmiHDfnuOFdJSpyfPH3c=
X-Gm-Gg: AYBFou3MG6/zoQ6uEyldsskQpbAellgxsSBdQHXWwqqPN1i1LDLjHWLliBFqdFouak6
	a6aUdWKaWIz9KtZGSex6qeMJroBl0qXVIMx29b5TQwWI3yn9DrIW46dFc9K84uT0bEHqJtTbjQe
	c/9CUEorZX0HcqYAtB4K2y2mEIb+3yeO6MJr5ws3eBDdMK9uDN9ZAatJ4C1zy3LoWlRAJSA3RrO
	PX0yYypqX6A51DIU5FlM1DsXUvyGlNLnzpF1wHNvdqu3JMg63KqJXcDQ637XF1fFDbgEUwBpgHs
	Y8pinVTGgtWTh46/seeO4tKYvU2W4Re0BTdC6WZaKwZEtFprjZr/+/TUwxLHdyxwaqZnq5PXOcc
	UyhiyiYddKaz0M6PXl3+omj3BTC3lSOuppXfalhvePq2r55Uw3P6717MiAc8cKQMe0y0xjf7Sfz
	hPgKwMQZUjNHBwKKaoGdCMCQTx6+fbZhBeW3XxaXZwvh9jMOrYDV6tsBS0c2pREqyt41Lr64x+y
	E4chk6IW2/vI49efuhZZR/jzQ1j
X-Received: by 2002:adf:e00f:0:10b0:485:ac35:5c5d with SMTP id ffacd0b85a97d-485ac355d0bmr6295306f8f.15.1789025124165;
        Thu, 10 Sep 2026 00:25:24 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d2693e8sm48309362f8f.3.2026.09.10.00.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 00:25:23 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: stable@vger.kernel.org
Subject: [PATCH 6.1.y] clk: meson: align gxbb_32k_clk_sel number of parents with actual count
Date: Thu, 10 Sep 2026 09:25:18 +0200
Message-ID: <20260910072518.322125-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026090929-giggly-entitle-58ec@gregkh>
References: <2026090929-giggly-entitle-58ec@gregkh>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_002526_178769_5E2F8769 
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
index 6f3918f0a782..8af08853ffe5 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1303,7 +1303,7 @@ static struct clk_regmap gxbb_32k_clk_sel = {
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
