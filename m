Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E9ACA5FED
	for <linux-amlogic@archiver.kernel.org>; Fri,  9 Oct 2026 05:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lw+icz4XXpS6weUzKgnJLU6aGfO6m4Wou7XEjBUKdac=; b=p7tvtffmiZjbEk
	HRE3967hphDxGDNjQn9+hOQJAAKrHlKOae76K0+dExDc1Fc1MyNzSRATQzXawY+GiSsx0kZuYxPwe
	6LNNFF17jFSZXXNAnC43pqNeT6Sso/Q6wk3B3vh3o+RBMGrD47Nvc1KBzsuSr7kMZqHkkYafWVqAD
	YPXsRxm/FWLJ5y6pJSXvarT2cYYjR+RW3wbZVjUcmA+VBjAh7EFc8EVtaXvHvn+/HUr8s5249yTgj
	NRqLvpzzYi2fZO8vCgv/THYKQDB/Y+YMtjD7pu+yRrY5Kge19zkflQF7Vga1Um56ww9bC6Cr/taH+
	sgoG2QKDIUFBDJPiYveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF2z5-00000005WGX-3F4g;
	Fri, 09 Oct 2026 05:17:31 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF2z2-00000005WG2-20HF;
	Fri, 09 Oct 2026 05:17:30 +0000
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowADns0HieMhqH80cCg--.3235S2;
	Fri, 09 Oct 2026 13:17:22 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Jerome Brunet <jbrunet@baylibre.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: meson: axg-fifo: return a negative error code when no irq is found
Date: Fri,  9 Oct 2026 13:17:24 +0800
Message-Id: <20261009051724.3134644-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowADns0HieMhqH80cCg--.3235S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GF43KrykCFW8GFykJr1rCrg_yoW8Jr45pr
	Z3Gr90qFW3Gryrur1vk3WIkay2yFy7JFWrGFn8Ja47Z3WrtrZaqF43JFyjqr4jqFWrKa15
	JFy5XayrXFWUAF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvCb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26F4j6r4UJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkI
	wI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2Kf
	nxnUUI43ZEXa7IU5c2-7UUUUU==
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgcPA2rIYxA6pAAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_221728_919534_02FC45DA 
X-CRM114-Status: GOOD (  10.01  )
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

In axg_fifo_probe(), of_irq_get() returns 0 when irq_create_of_mapping()
fails to map the interrupt. The error path explicitly treats this as a
failure with "if (fifo->irq <= 0)" and logs "failed to get irq: 0", but
then returns fifo->irq as-is. probe() therefore succeeds with fifo->irq
set to 0, and the failure is only reported much later when
axg_fifo_pcm_open() calls request_threaded_irq() with irq 0.

Return -EINVAL instead of 0, keeping the real negative error codes
untouched.

Fixes: 6dc4fa179fb8 ("ASoC: meson: add axg fifo base driver")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 sound/soc/meson/axg-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index 75909196b769..fdbee44f5101 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -365,7 +365,7 @@ int axg_fifo_probe(struct platform_device *pdev)
 	fifo->irq = of_irq_get(dev->of_node, 0);
 	if (fifo->irq <= 0) {
 		dev_err(dev, "failed to get irq: %d\n", fifo->irq);
-		return fifo->irq;
+		return fifo->irq ?: -EINVAL;
 	}
 
 	fifo->field_threshold =
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
