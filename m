Return-Path: <SRS0=FFcv=4T=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAF3C3F2D1
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 12:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E587217F4
	for <linux-amlogic@archiver.kernel.org>; Mon,  2 Mar 2020 12:55:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PW6RQLvS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAB4d29/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E587217F4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/+wxjUA5KsbzbaT3kTgp7XNlAcy4HDh/wTAnHbTV+Q=; b=PW6RQLvSzFYQxL
	XF2j5pBtkJMjsiAblqFDg/nenjy90/dYUxYW5a/Rhtrkv9Zm/MtM9wmE6q1N7u6HgrNCHKV4U5Ohr
	RXeeYkPhrHXhQmEqZEKgceER17P4rbZ3nYnxJEVbPWvy7GZasrvK5lXfV4jPtx0K2pUoWUveUGtL7
	FjfPhFF06rhUOf0n1RkM+Nj71qUO69aDzvaeBo5Y2kRYs4RktGcUrqYOWYYxfW64ihFRmcePt4tu3
	vgM4Cx9Ccf74G4v3J/UD+wkcBTK53sTtW3OfUDBWZhumjB1zVecQXvD1Ecnwk4lRnnipW0dL+ffN1
	QPHUA4qq77nF97r9jK8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j8kbM-0002hM-N2; Mon, 02 Mar 2020 12:55:16 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8kai-0000qy-Di; Mon, 02 Mar 2020 12:54:37 +0000
Received: by mail-pf1-x443.google.com with SMTP id i19so5547106pfa.2;
 Mon, 02 Mar 2020 04:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HEh7CqSCXgWfailCBb8Rs+qB5N+bl/4veud+2lfhJ3c=;
 b=kAB4d29/ko/klMw//ZuCCDjxlWJmKBj6aYjBLaaWpXUGa2HrPYNP995nR9WGuqSzEH
 fluQ71pG7wsJkuGZvSsfu9JFGjGYfuE2cE151OiwrNC8PZl9x7XioTn+VbgU4RWQ6Ufw
 GgU3QbFS+76CeEIMQMe0lV0COD1vE8CdUdiRrVXjRz3FrXNwnmW8+QUQN8L4Lafo/5fJ
 BWFDW81BAltxPyU7ZV8VjT9u6VvUnvAjS5i2hgMj2ydh4iKsv9v1Vlqq5jEN1vpvIg0Y
 QdIRXqAXYtyUBZ0QuRW7az7jsrlAdBclNrfA1UDgOlJbuZRMexRIy58eiuYpgu1KVA7m
 xv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HEh7CqSCXgWfailCBb8Rs+qB5N+bl/4veud+2lfhJ3c=;
 b=WAeg7aMn38jCr9fi9eMBcvwpsfaZnHS67P4kaehhcpT3bGMQOuQiEpAlGfGQVz4KOx
 f1dgl3Jy5D3Irb+w3IKtKjxYTC+riXQtfDuEZE1KmVRtSdfOuMrxyQhDjbRnFg+ij5js
 j3y9YpKUppvAXEmNRViPaWfFrR7dROt17381X6UTSvwLo44G6B1wT8MuyvcZyBa8ZwzQ
 wj/5NmWAAzW07spTV8rVpin77az4vYG+q+Zq3khLPLYX40xF5vuKmWPPaF9UvCWXpZjc
 yfCipG7NbRG/BncbGF7rVTNKwPpL0Mg2ZM2MlnlkbHfD12xzkfvfb39hRKAyWMI0OB0E
 lMbA==
X-Gm-Message-State: APjAAAVj+WnIJNlJftKFBy0sJ9n5fLzfKTOJeZ3TtAFAKX2DSye1lWx+
 mBUyF+U/oTxWv+Zz04SohxU=
X-Google-Smtp-Source: APXvYqzvXVSEfr6bpf3GIPRYKUv7jKl6r8NlwZCenHEBeS4uW+3WkXAE27vkYrNhhLNvUn6R77Ka4w==
X-Received: by 2002:aa7:8299:: with SMTP id s25mr17299604pfm.261.1583153675622; 
 Mon, 02 Mar 2020 04:54:35 -0800 (PST)
Received: from localhost.localdomain ([103.51.74.208])
 by smtp.gmail.com with ESMTPSA id p2sm2138238pfb.41.2020.03.02.04.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 04:54:35 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Subject: [PATCHv2 2/2] clk: meson: g12a: set cpub_clk flags to CLK_IS_CRITICAL
Date: Mon,  2 Mar 2020 12:53:09 +0000
Message-Id: <20200302125310.742-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200302125310.742-1-linux.amoon@gmail.com>
References: <20200302125310.742-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200302_045436_479610_AC956FC7 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Odroid n2, cpub_clk is not geting enable, which lead the stalling
at booting of the device, updating flags to CLK_IS_CRITICAL which help
enable all the parent for cpub_clk.

Fixes: ffae8475b90c (clk: meson: g12a: add notifiers to handle cpu clock change);
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Suggested-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
Previous changes
	fix the commit $subject and $message as previously I was
        wrong on the my findings.
        Added the Fixed tags to the commit.

Following Neil's suggestion, I have prepared this patch.
https://patchwork.kernel.org/patch/11177441/#22964889
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d2760a021301..7237d08b4112 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -681,7 +681,7 @@ static struct clk_regmap g12b_cpub_clk = {
 			&g12a_sys_pll.hw
 		},
 		.num_parents = 2,
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
 	},
 };
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
