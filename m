Return-Path: <SRS0=EyLh=XQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A904DC4740A
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:04:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F3922086A
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Sep 2019 15:04:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NLxkIJ49";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="U4wBRIWk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F3922086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ivG/cT6CxVisOHPVpozLICaLv6IPbJTUqbelVfi70ZM=; b=NLxkIJ49h+gVdC
	HH1wGrxhw+SA1TsJ9azSYPmdS2Enogo6o8vc1ztzuD1DhVzPYR0HZtXdQF/QC/+9hpMZCxGWu2qJQ
	T0s/eoiBa7AmyKSDKlxPlRTaL66xfujNru44qxQEl/t5e3meNZmuN0/9xxODPHx+ok/VHGoaaFrDb
	AA7uu8+b4X4stGYPUFxYFn+jReYNTVeMrpr1wq56FIHYrVl2FlkbvOicyE3rRv19ziT0/HfMJjahp
	1G9BAI0LoMtHrPgbSzQwemfbFycBd4p66ZXI4Y65zs8DjVc/G4pH60EYlRBfsxbhTDdKz4YssYtZF
	OGFjutzJfRWqbEOOOmkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBgwB-0003wC-2x; Sat, 21 Sep 2019 15:04:39 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBgw8-0003vp-OU; Sat, 21 Sep 2019 15:04:38 +0000
Received: by mail-wm1-x342.google.com with SMTP id 3so4902279wmi.3;
 Sat, 21 Sep 2019 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LGv9DZLsLql8R0RI6uFoY3WPJO94bAE/bq+K0Di3JjU=;
 b=U4wBRIWkDsI4icvUsrtiriqteXBT0yMa+Xqw/3INETjgirlcoMtLUbdTCSP/DZ1ZQ5
 21NjqIWk1uACxeE90JxDe/JQtX/5AJS2ZBTdwW3Hh2d1YyXU37iLuTPWkHV/wW2yxqN8
 SuKZ2PkqY6F97Z0iSvzZRzGLw4aBw+f6y1ndSn6NHGGEmy59WJqlmOE84SXbrgFZKjOL
 WKi5zMpjOjVQJA6pwb6INga0YJ1/wIhO8Vu88eNkS4mB6LZZd1CiqWWxOav2KD2rHvx3
 V+GroTZC78nbo6KpCUinANLvJ0Gih6krhAtwkot15FwCBluKGKarVySBPS762dMsV6KA
 Uh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LGv9DZLsLql8R0RI6uFoY3WPJO94bAE/bq+K0Di3JjU=;
 b=T2sx9Inq6PSsmYJ1ANanCN33XeayjSradYwQQHqH7IG9VKkxVKDvb5dlcN3tbb+KWT
 jMNV3XsSSSdXw7NnBoNa1dZ1vj7f4T3RqcoDbdh+P3ezaOzGxFJSJEpamplLbMyTZPQR
 BB7oZEr8DS8LHg+Vs4RUCsnUZchJTlex5UBNgTjfCW0Hk72XXakO+pPDNP7stAE/QCHC
 yoTlGmfpnQ/+y9l03GxEXeZr5T3gAsH7N/6sTDirvbtbDV3ID2IWzC2KHVhoLp2tEVfp
 w9fdiArcimVwFIDvcNqFYALdS5NkN7I7MrbtSC7jOhfgT7rGfECMv4lcjYwyVDYbOZeQ
 eIbg==
X-Gm-Message-State: APjAAAUms9PC8/zNyr3i3eouc4C+GQoaUZvFL6y460aRVaX7SuEUdMHA
 wXxpRwXPgRPvBLYOjWnkESgXy+S5
X-Google-Smtp-Source: APXvYqynjJRqs2bHOp/DdMfbh05bDAD/XBKHx85KCLbrsN0bIXyPSuRIggxSw4x+yHMqdHzbOENSfw==
X-Received: by 2002:a1c:c789:: with SMTP id x131mr7235719wmf.20.1569078272512; 
 Sat, 21 Sep 2019 08:04:32 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133CE0B0028BAA8C744A6F562.dip0.t-ipconnect.de.
 [2003:f1:33ce:b00:28ba:a8c7:44a6:f562])
 by smtp.googlemail.com with ESMTPSA id r20sm10987422wrg.61.2019.09.21.08.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2019 08:04:31 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 1/1] clk: meson: gxbb: let sar_adc_clk_div set the parent
 clock rate
Date: Sat, 21 Sep 2019 17:04:11 +0200
Message-Id: <20190921150411.767290-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190921_080436_823624_540A8504 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The meson-saradc driver manually sets the input clock for
sar_adc_clk_sel. Update the GXBB clock driver (which is used on GXBB,
GXL and GXM) so the rate settings on sar_adc_clk_div are propagated up
to sar_adc_clk_sel which will let the common clock framework select the
best matching parent clock if we want that.

This makes sar_adc_clk_div consistent with the axg-aoclk and g12a-aoclk
drivers, which both also specify CLK_SET_RATE_PARENT.

Fixes: 33d0fcdfe0e870 ("clk: gxbb: add the SAR ADC clocks and expose them")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
This is a small consistency fix which I found while debugging an
unrelated problem.

 drivers/clk/meson/gxbb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7cfb998eeb3e..1f9c056e684c 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -935,6 +935,7 @@ static struct clk_regmap gxbb_sar_adc_clk_div = {
 			&gxbb_sar_adc_clk_sel.hw
 		},
 		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
