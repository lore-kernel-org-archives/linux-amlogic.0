Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961D7FF8868
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Apr 2026 17:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dpQ4rc7Q94q+ptqZpytR656m3ALjP3/2BFj4ymk6TL8=; b=z0UYIl8Hhe20Ea
	jcxL/6ELxeZ0dWWwwWf5fkJY5uGeK3ExBO8h68cPIMTjd9NGQNyE0DXgl1HhNloV4EISOzs/cJofR
	IerfawxWz+3KwTXcMHkmc5FY0mjGqEV6AtAg59oqhpBHxOKRUiqZi7tbPaJMrMDgdGD6eep1MANlZ
	sMH+xT5VUmWZqbPivfqoTobX2UC2iu3BRsn9dZYWEUPhHXyvDXZt78Sf5eyAN45d3iEdnl44xcbw/
	Un/gnWZGvU9O3pthU8yRQZy0DLptFZ7n8ztjeRYAHIbjn7Y3pwW1OBHNlU1DX2fOIvtJF7Mq4fVxW
	9Y+T/XEBLg+bso4TmtiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPyB-0000000HVBi-2s9j;
	Mon, 27 Apr 2026 17:42:07 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHPy8-0000000HVBJ-3J2N
	for linux-amlogic@lists.infradead.org;
	Mon, 27 Apr 2026 17:42:05 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2b461310af5so41579905ad.1
        for <linux-amlogic@lists.infradead.org>; Mon, 27 Apr 2026 10:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311724; x=1777916524; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QXUKL96HHtXT8Swed26n3AhG8V6vfxtBOdftEg8YXiY=;
        b=X4wLfoRFqTkvO67/J86Fx4Xa00FqaEgqusziZcGeutJUmLjQkTz8BYEoQfqivBy/Mk
         y+k3DxRegUznpgAOxcYje5A9fo6PQPHvHOqPlZt6fy76tcRFuGOkqAOHQFjzNcbXgBBZ
         NSX+dHk2ME+CxuDGQq08PArVDJ0efcAplYBLC0I350woJhR5a7bwVI0NjFlUkZWc/2yK
         qDGtBYkAR8rSPAtstSJmwvFBlQny94m2arWerQWJsS14AMp2XOPR1bP2RnPhd5ji/LNP
         CUNRITlOGdE+mNfvfwI4IStDrFRjQn0HKp6ekKur1mExuj9OCzOVN0icW2DjDAAroGtR
         1VPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311724; x=1777916524;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXUKL96HHtXT8Swed26n3AhG8V6vfxtBOdftEg8YXiY=;
        b=OLjFO4+s6iAf1LlfsPsSwKqfR3owP5VlYD2btjsytOtEZrcOkaCZvniHgHVbdB++md
         kZUj4WdEk3SluntENEghvUYD3u42a/hj1DIGVqpX0V/qdNQKqsp5A7/uDmjvb477ddYV
         1dJo4GaGkM62lgnGQGd56L8OpFczr53ClKt5xsMZtZUit1V6eiPgdSMKsIZ5YNZ2L+us
         6ewNOfEH0Woz6Pa5uI0Hh+B3SYcBTDPLolkpY6aXJib4Q8QNFzgwJqetEinjLYW6mzsB
         N38UjCvWrfYA5Srl4CT/OINBSKJ7Xd+217I/mIhn/jx7F6g8DCLQyZPNtNH83jEJxYWO
         oLCA==
X-Gm-Message-State: AOJu0YxkWOavB5G3/llLiKfAyEf9IoIfVdcRGObG5dCMNHbIuAHfLS52
	PdU8B+/4nqXm2IdWzANBirSQnyp1GuYGp0teHG9DTSQgd/BQ27i0Nuyj
X-Gm-Gg: AeBDietg8x7KfSIAFecxPWe1qCi7sdckZMOSgVfZ1NqCH7zK519S7Z5bt4xlL4sFptx
	XBzPvz1lEKR9jOrnMEoszdOvWsnPcWgk6QmFKR5adda0+/+Kq3EbYQPMZGU7iFltgDf/P7LD9yw
	SWXbJts8fXLNUOtl/W89+V5ZVQEUPedGJADpBDr385wKYPYGbVuB9Rauf6w98HJqWPOywZxhNA3
	Aw1zMh9ITk8n+UPfKMB8laRg4FLNxfWKCODjuOc5JsRuN1Z0C1gQMYsSaeCe0FDoOTaTgXaxIxj
	6pl+AjrmNk8FmIFcxj04Py79XqIbv7leH+BI3d1rB2uy9e/BKqospBP9NIC7Wa9ZXjqKRjsIiRE
	EhZiNGs0KfdmlovkgY2PTVW4In9VrpOXsVXdhHd8HRsN6Dh3E2Q92sBYgEw9nWtIpALEMZKqQjK
	zRfLjZrMBwdson4XEqENBDBjDk4C30Cd61+mHNU5dlGYwOb8/IRXPrJrKcFAEWtTkr+0PfmeRhx
	7S5yyJ9owgM5anzX7Fz8Y91x5bWVF8=
X-Received: by 2002:a17:903:2f4c:b0:2b2:5070:8b with SMTP id d9443c01a7336-2b97ae1a058mr216655ad.1.1777311723609;
        Mon, 27 Apr 2026 10:42:03 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aaaf65fsm755695ad.31.2026.04.27.10.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:42:03 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Tue, 28 Apr 2026 01:42:00 +0800
Subject: [PATCH] spi: amlogic-spisg: initialize completion before
 requesting IRQ
MIME-Version: 1.0
Message-Id: <20260428-amlogic-spisg-v1-1-8eecc3b446d6@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOef72kC/x3MQQqAIBBA0avIrBPMLKyrRAuryQZKw4EIpLsnL
 d/i/wyMiZBhEBkS3sQUQ0FdCVh2FzxKWotBK90po6105xE9LZIvYi+xbXuDrsHZWCjNlXCj5/+
 N0/t+3maipl8AAAA=
X-Change-ID: 20260428-amlogic-spisg-e5594ea3eb48
To: Sunny Luo <sunny.luo@amlogic.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Mark Brown <broonie@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777311722; l=1265;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=XeSwgOZMpfYnktBLdo2F/0kVCQFFtK/6gXhRKpyoyf8=;
 b=OFIGxJd0HqHGcsDa69LDE+5exY7+qUnmI0oSnRQ2d+dvnySkgXxPzVkBoHZYuoB3sTJOnzLs3
 d6XGyssMtjIAQj+SEwMTKdL3bmfjaiVsFkiO/jv3yAvePG5yodt/Lbg
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_104204_857250_09B7F185 
X-CRM114-Status: UNSURE (   8.34  )
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

Move init_completion(&spisg->completion) to before devm_request_irq()
to avoid a potential race condition where an interrupt could fire
before the completion structure is initialized.

Fixes: cef9991e04ae ("spi: Add Amlogic SPISG driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/spi/spi-amlogic-spisg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/spi/spi-amlogic-spisg.c b/drivers/spi/spi-amlogic-spisg.c
index 19c5eba412ef..f9de2d2c9213 100644
--- a/drivers/spi/spi-amlogic-spisg.c
+++ b/drivers/spi/spi-amlogic-spisg.c
@@ -794,6 +794,7 @@ static int aml_spisg_probe(struct platform_device *pdev)
 
 	dma_set_max_seg_size(&pdev->dev, SPISG_BLOCK_MAX);
 
+	init_completion(&spisg->completion);
 	ret = devm_request_irq(&pdev->dev, irq, aml_spisg_irq, 0, NULL, spisg);
 	if (ret) {
 		dev_err(&pdev->dev, "irq request failed\n");
@@ -806,8 +807,6 @@ static int aml_spisg_probe(struct platform_device *pdev)
 		goto out_clk;
 	}
 
-	init_completion(&spisg->completion);
-
 	pm_runtime_put(&spisg->pdev->dev);
 
 	return 0;

---
base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
change-id: 20260428-amlogic-spisg-e5594ea3eb48

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
