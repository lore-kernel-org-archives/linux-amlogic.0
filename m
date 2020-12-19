Return-Path: <SRS0=kh+7=FX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19190C4361B
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 13:53:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9961F2228A
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Dec 2020 13:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9961F2228A
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xLiijkZYfUppRJYNwvXCalZot5CROMYSzEesxosLQoY=; b=0XscF9y+i2nPfcGaivo5gifza7
	6+3VwwwKR3lf2v8ugdrG9tDXV41NYkzWV4OEB5ZKFbJiVRkFIH8afua7RRGQbLIVm3UaV0Xx0NHI3
	Ptj9W5W3nrpbCwMehcY13Kh6Zrft2uuiuRjW98hzLfySUEBXZDJ8TRk0N9U06VG8E4nqFHyaMSxLG
	VHg1UyQ23aI5Rxjm7WjtMZGIiPwo8VOxanU1bI6Zv5hn6jBq2sTRk1vDj2h3pKOJplLRwukuIm34W
	rEi7MkXM7P1f7sIkZ8SqO9rOxMA4/1N16Vi54yHBJChDsTzou6peqYHGJiEjDo/r31AYuYcLeubIV
	wVf4ZLcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqcfI-0005bn-IT; Sat, 19 Dec 2020 13:52:56 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqcfF-0005bH-OZ; Sat, 19 Dec 2020 13:52:54 +0000
Received: by mail-ej1-x631.google.com with SMTP id n26so7277173eju.6;
 Sat, 19 Dec 2020 05:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cScwhsBDy0n9T2wqbVdNhwbfWnu1a8RovKqaENONwz4=;
 b=nszt3lSg8u2a+DKQJGUP6VbGxeBTEE/qgMQ90FcGJpGEpnExbZUvjyvBI0DjcOizjj
 kdu7+9dC8UI4j75AKBHuKcQxXOrbOQc1hJhKKLGibeenNBvLbLiAUC59oKBg/PPTJf4r
 4S3kIsEt95CYHB7h+moqQqUuTUd6Egn4kVALTErqj6kvn+dBz92Ggga0EghHzyuZX7CA
 ObOvYQxIlg/nlwmJhWWinegugQ6JiqPz8HBGYtKM0HP/sOW7wB0OkAaXC6yQZCvyBQHR
 6YN9a0sXtTAeCFgc6WWCc10axj89g/dr/ojAMIwDDwTm7oF/n7q61h/lwS9kEidinCKw
 8L9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cScwhsBDy0n9T2wqbVdNhwbfWnu1a8RovKqaENONwz4=;
 b=Dxbufad0napyJY+1mxHbrtHfAUFK7fuI+sBcMovKzyjQ4wu+26SMmnct/dzlgQ0vtl
 ERtJiP2kAMsiUdX3XgfBqcdIqsM1jOKEAL7GrH8BPu2IHnz38L5B+/ge47TE8TmtzmpO
 5mZRVhYh65fzOQ3nr1DZa5PsbGZpBsDgcfL9KqOamYO4Yyx6WQqOx9CCNVRdDLyMT91v
 xw+oHJhS4rbWigSTip0fjLly291Hme/10mf2LwEYt/eXIGkSCuNGvHUfL9g/YqxfDEU5
 lCafVzokvWYUbUVxKFRgHAabR7PyJab7Q8rIRizmkZxms0qqvOEZaoVYKro3wCQ8nBms
 dVbw==
X-Gm-Message-State: AOAM533QjeA6ZjJgeveytyUOwOhfFbiZdUSQ5TtDqAP9BgIbY8v7rMEm
 TTUIb3MoligEhpQu/NlVkHM=
X-Google-Smtp-Source: ABdhPJye4mu3SslUsrOAPhFcctjWk9HUb8WOw+y+woblvSNlNSjhvmvpKNIPWAnCXjeFfHVzukqsJw==
X-Received: by 2002:a17:907:3e23:: with SMTP id
 hp35mr8522020ejc.254.1608385970812; 
 Sat, 19 Dec 2020 05:52:50 -0800 (PST)
Received: from localhost.localdomain
 (p200300f137299d00428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:3729:9d00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id s5sm6823063eju.98.2020.12.19.05.52.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Dec 2020 05:52:50 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 davem@davemloft.net, kuba@kernel.org
Subject: [PATCH] net: stmmac: dwmac-meson8b: ignore the second clock input
Date: Sat, 19 Dec 2020 14:50:36 +0100
Message-Id: <20201219135036.3216017-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201219_085253_844546_36787C9F 
X-CRM114-Status: GOOD (  20.14  )
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
 khilman@baylibre.com, linux-kernel@vger.kernel.org,
 Thomas Graichen <thomas.graichen@gmail.com>,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The dwmac glue registers on Amlogic Meson8b and newer SoCs has two clock
inputs:
- Meson8b and Meson8m2: MPLL2 and MPLL2 (the same parent is wired to
  both inputs)
- GXBB, GXL, GXM, AXG, G12A, G12B, SM1: FCLK_DIV2 and MPLL2

All known vendor kernels and u-boots are using the first input only. We
let the common clock framework automatically choose the "right" parent.
For some boards this causes a problem though, specificially with G12A and
newer SoCs. The clock input is used for generating the 125MHz RGMII TX
clock. For the two input clocks this means on G12A:
- FCLK_DIV2: 999999985Hz / 8 = 124999998.125Hz
- MPLL2: 499999993Hz / 4 = 124999998.25Hz

In theory MPLL2 is the "better" clock input because it's gets us 0.125Hz
closer to the requested frequency than FCLK_DIV2. In reality however
there is a resource conflict because MPLL2 is needed to generate some of
the audio clocks. dwmac-meson8b probes first and sets up the clock tree
with MPLL2. This works fine until the audio driver comes and "steals"
the MPLL2 clocks and configures it with it's own rate (294909637Hz). The
common clock framework happily changes the MPLL2 rate but does not
reconfigure our RGMII TX clock tree, which then ends up at 73727409Hz,
which is more than 40% off the requested 125MHz.

Don't use the second clock input for now to force the common clock
framework to always select the first parent. This mimics the behavior
from the vendor driver and fixes the clock resource conflict with the
audio driver on G12A boards. Once the common clock framework can handle
this situation this change can be reverted again.

Fixes: 566e8251625304 ("net: stmmac: add a glue driver for the Amlogic Meson 8b / GXBB DWMAC")
Reported-by: Thomas Graichen <thomas.graichen@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 459ae715b33d..f184b00f5116 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -135,7 +135,7 @@ static int meson8b_init_rgmii_tx_clk(struct meson8b_dwmac *dwmac)
 	struct device *dev = dwmac->dev;
 	static const struct clk_parent_data mux_parents[] = {
 		{ .fw_name = "clkin0", },
-		{ .fw_name = "clkin1", },
+		{ .index = -1, },
 	};
 	static const struct clk_div_table div_table[] = {
 		{ .div = 2, .val = 2, },
-- 
2.29.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
