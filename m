Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E91C3DA59
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Jul 2024 09:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SYa3NXqbXtKuBfDvSw91wJXlQ5LXnMS7lCT2p9VuIpw=; b=eP7Xw0nVRcJBFt
	okBlKXDnqRWG3TZqiBJfQTl8Ft9ZmnVzABlwHrqNg72CG+CJ5lHvc3EO0IwpgPQH1B8N6caeg34tT
	ZTbZ/6asKGBHXD9BIKIr+JSIF/ZrCk6GUnVo5+IDsOHeGXTqSGLZ3+pQ/7W1L1ntDOsXGxoMyVB1L
	bUrpaArXRrl8yuH5vmEQrG+qeu570S0r+B3chAJUik/9Uy4I74a4PqXUBpH8bxGIrkeiFBQzcgrt/
	FgLdNNKWRwxaq5Mlvsq1/97adyrBdB3VZfgRNxcgyhLsHuMGQJTmvXADflZAiu0970RALrBoLOinT
	Shx/1yCIAktXxucYEC3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTeSm-00000009sSv-0TEl;
	Tue, 16 Jul 2024 09:27:12 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTeSP-00000009sNY-2WAB;
	Tue, 16 Jul 2024 09:26:52 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowADn7+fIPJZmC_qZAw--.55159S2;
	Tue, 16 Jul 2024 17:26:32 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: broonie@kernel.org,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	yixun.lan@amlogic.com,
	sunny.luo@amlogic.com
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] spi: meson-spicc: convert comma to semicolon
Date: Tue, 16 Jul 2024 17:11:51 +0800
Message-Id: <20240716091151.1434450-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADn7+fIPJZmC_qZAw--.55159S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw4fuF48ZryDCF45WryxGrg_yoW8Kr4xpa
	nrG3yUWry7Gan7urn3K34DZr45Gry0gaykZryFyrW8KwsrWF1qqFy5JF4rAFWYqFZ7uF40
	9ryrWrs8Wr17GaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r4UJVWxJr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY02Avz4vE14v_GFWl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
	v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
	1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
	AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
	42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbFoGPUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_022650_038566_5090C3DD 
X-CRM114-Status: UNSURE (   7.79  )
X-CRM114-Notice: Please train this message.
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

Replace a comma between expression statements by a semicolon.

Fixes: 3e0cf4d3fc29 ("spi: meson-spicc: add a linear clock divider support")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/spi/spi-meson-spicc.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/spi/spi-meson-spicc.c b/drivers/spi/spi-meson-spicc.c
index 8838a98b04c2..1d05590a7434 100644
--- a/drivers/spi/spi-meson-spicc.c
+++ b/drivers/spi/spi-meson-spicc.c
@@ -655,8 +655,8 @@ static int meson_spicc_pow2_clk_init(struct meson_spicc_device *spicc)
 	}
 	init.num_parents = 1;
 
-	pow2_fixed_div->mult = 1,
-	pow2_fixed_div->div = 4,
+	pow2_fixed_div->mult = 1;
+	pow2_fixed_div->div = 4;
 	pow2_fixed_div->hw.init = &init;
 
 	clk = devm_clk_register(dev, &pow2_fixed_div->hw);
@@ -674,9 +674,9 @@ static int meson_spicc_pow2_clk_init(struct meson_spicc_device *spicc)
 	parent_data[0].hw = &pow2_fixed_div->hw;
 	init.num_parents = 1;
 
-	spicc->pow2_div.shift = 16,
-	spicc->pow2_div.width = 3,
-	spicc->pow2_div.flags = CLK_DIVIDER_POWER_OF_TWO,
+	spicc->pow2_div.shift = 16;
+	spicc->pow2_div.width = 3;
+	spicc->pow2_div.flags = CLK_DIVIDER_POWER_OF_TWO;
 	spicc->pow2_div.reg = spicc->base + SPICC_CONREG;
 	spicc->pow2_div.hw.init = &init;
 
@@ -721,8 +721,8 @@ static int meson_spicc_enh_clk_init(struct meson_spicc_device *spicc)
 	}
 	init.num_parents = 1;
 
-	enh_fixed_div->mult = 1,
-	enh_fixed_div->div = 2,
+	enh_fixed_div->mult = 1;
+	enh_fixed_div->div = 2;
 	enh_fixed_div->hw.init = &init;
 
 	clk = devm_clk_register(dev, &enh_fixed_div->hw);
@@ -740,8 +740,8 @@ static int meson_spicc_enh_clk_init(struct meson_spicc_device *spicc)
 	parent_data[0].hw = &enh_fixed_div->hw;
 	init.num_parents = 1;
 
-	enh_div->shift	= 16,
-	enh_div->width	= 8,
+	enh_div->shift	= 16;
+	enh_div->width	= 8;
 	enh_div->reg = spicc->base + SPICC_ENH_CTL0;
 	enh_div->hw.init = &init;
 
@@ -761,8 +761,8 @@ static int meson_spicc_enh_clk_init(struct meson_spicc_device *spicc)
 	init.num_parents = 2;
 	init.flags = CLK_SET_RATE_PARENT;
 
-	mux->mask = 0x1,
-	mux->shift = 24,
+	mux->mask = 0x1;
+	mux->shift = 24;
 	mux->reg = spicc->base + SPICC_ENH_CTL0;
 	mux->hw.init = &init;
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
