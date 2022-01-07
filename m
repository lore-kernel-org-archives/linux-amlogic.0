Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A1CC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 07:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WerChJYq4/44235B4o3sm5o8Btc0l5DNJ7Dv8MLQDyo=; b=2cJiv/+xyjj2Nn
	U2nRJmwoNejfRMVVlGdlMRExnlvV6qAziBl1gvHWP3VNWrRTh4/0xkf79zWZxJlkwohdg9ycKxr7t
	KLadj71ggjUOJSCJ8jLVgyMcWRV8/MENTZAKTgNOThPoN+hLccTGcRqRfGYb0wr2HNth1AJap3ux2
	hv21tix0XQMq+3weEjhYF7EkEaTwLrfKz+scuS+4QRcczI3m7rU63Fu3zO8m75VptREsQ5ptbuTkt
	9YgJWYVnBJ5xSh8n80ZvFRRVOAbM1YLN0BSjuNvTTrUFy9EOKrSDaByj+RXUmaWKtkN+P2N7CjYNz
	S7iK6BWCA2QRPSlW3GKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5k5D-002nqu-TH; Fri, 07 Jan 2022 07:54:43 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5k51-002nmM-2f; Fri, 07 Jan 2022 07:54:32 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 c9-20020a17090a1d0900b001b2b54bd6c5so11202806pjd.1; 
 Thu, 06 Jan 2022 23:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Kz6NSaBgfjb815/CYCxrJUTQyu9TXdUqaXEdKyqxTDU=;
 b=bQzOvSJ3E/5y9bVC3vU05/Sf0U10u3GZWknMesoriq1bS2kKEJ0VZ1vTPk94yPW5D3
 YW8c5PkhrnGDYfIkP4Y8UD+V7x97OSZxnC9cNaesfMSRyWCMJ/+F+63cJQXyPH0eHr1x
 5qVt18lxG9+AWakYrX8SNkA49rBiIFZs6KgOaNSYWpWYs1+WTkyG4jvp10Orw+rrzKV9
 4rzD3z2moD8JzGxJIromkf31Y4ctQCk1ZgrXITWBN2slsBDiY3dxAqGiLZ5+0JQYiAjc
 tVPXwM5MH9zSWj+4XKqHiCh0oucBJNUftedRJHJpaiMnKj5anZy0bQKLlN9vKWpEuwvm
 +VFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Kz6NSaBgfjb815/CYCxrJUTQyu9TXdUqaXEdKyqxTDU=;
 b=6HzQlUW3ey8Mys2Puhb8/9j5Dx8UglpfGUC+eomeeoH/EvHhkGxF4fgpZh5ZE8SjQl
 ER/ZTTGQboWbBytmm6TemiBo7K0quIQX3wkg3BXIbruDdAlDnbfm5cHrrjNcmb9O8Z+T
 OXkXJ4CZtsbGwUySX081ZolzI1ycBUUsvFRt/h8CtAhNpvLiGkX59yHXukSqjlgWuXJz
 fz9lZQIf8p0dM2xMEGwKPIV3g8QXWX2wGmeIInPOLwSVPRaoiJPzACCByiD5WYtlwOBd
 4Qp/uR0x3ZnltU+h8Ye58vS2tuXA2LrtNbcv+LwPJ3g9Ibyg40x7YH6JV3smNWxZyI79
 UkSA==
X-Gm-Message-State: AOAM5311iLFag4bQ0YaYla3rHbWeAk6Ace8aHndqYMIjQFHQsLhvFAp6
 FW+uoGOm0n1x1p/sx1llBZ8=
X-Google-Smtp-Source: ABdhPJwqY8SnGJn0tDg8v3BvwMkY1ZGWeh7yo2X8fc1stSlxsQsqftvSk9c8pZc1HnKKnztmzpprkQ==
X-Received: by 2002:a17:903:120a:b0:149:8b16:ee19 with SMTP id
 l10-20020a170903120a00b001498b16ee19mr46741995plh.11.1641542070356; 
 Thu, 06 Jan 2022 23:54:30 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id 193sm4601347pfz.43.2022.01.06.23.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 23:54:30 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Cc: linmq006@gmail.com, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Beniamino Galvani <b.galvani@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] spi: spi-meson-spifc: Add missing pm_runtime_disable() in
 meson_spifc_probe
Date: Fri,  7 Jan 2022 07:54:24 +0000
Message-Id: <20220107075424.7774-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_235431_139999_C2F5E363 
X-CRM114-Status: UNSURE (   9.35  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

If the probe fails, we should use pm_runtime_disable() to balance
pm_runtime_enable().
Add missing pm_runtime_disable() for meson_spifc_probe.

Fixes: c3e4bc5434d2 ("spi: meson: Add support for Amlogic Meson SPIFC")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/spi/spi-meson-spifc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-meson-spifc.c b/drivers/spi/spi-meson-spifc.c
index 8eca6f24cb79..c8ed7815c4ba 100644
--- a/drivers/spi/spi-meson-spifc.c
+++ b/drivers/spi/spi-meson-spifc.c
@@ -349,6 +349,7 @@ static int meson_spifc_probe(struct platform_device *pdev)
 	return 0;
 out_clk:
 	clk_disable_unprepare(spifc->clk);
+	pm_runtime_disable(spifc->dev);
 out_err:
 	spi_master_put(master);
 	return ret;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
