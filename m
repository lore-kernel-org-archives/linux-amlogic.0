Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DABDECA0FEF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Aug 2025 15:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BnuOryNWHLEnhih34CJbbATn0OUx6vuS+x8wdRg038=; b=1iUg2FJ9RoXLBO
	K9HD8TAJYrq17IIxDBdDtm+HGOSQqGt9Ye1FW2pTaZ/qSMybY7p+h3ZoajEHEN0mpIJpqE4YQABKh
	jb9xymSozGq92++wRtF135bJ26aqolGj5KmpgX+gresok8qXW6STtPswFyGxsEUhfTh0VYLiJsAYg
	u/fSHAzdXntlkSY049LhC1pRQ2x8cw3PvLWp4p6U3vPO1Tayv1rVrIBVmo2lsn6POzTM+y1fCSU4S
	Cu13G4BqY7vyLbStm+Pc8oRtKiLpQOwn6BKVS7SPz4w49oi8cGPcy268MKCHtyOgSIdKsMYuom8lk
	LrXcZja0H9aX2F2NVfpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ9O-00000008WCQ-3aKm;
	Mon, 25 Aug 2025 15:30:26 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYAB-00000008Fi2-439B
	for linux-amlogic@lists.infradead.org;
	Mon, 25 Aug 2025 14:27:13 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3c380aa1ad0so2194285f8f.3
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Aug 2025 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132030; x=1756736830; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRqhnX04LSAiYdBNDlTGLugmcAxHcjqdN/6E4HSJk+A=;
        b=VW5sxFnkOsf6yd9lcD/3WpUiFR2cvbEGkXV1UYyix7yPv4UFrMHHC6TVuuzOTLFF9d
         IdWV9AYffKtozBJKcoDtkJuzODiNHfc8v0VleluM7BKCIXGwyrXytlPAF4W6rX2PSx+A
         fF71LFDOy89wlEzAg/Epm8OktEa3mp6g22DiDEl3teTJOoVrhBehT6uvOBrIang5tETB
         3tV1V8+75xEO005FxbhGjqQo3bzoecVeSTQawAzf0ZFMoqw0Hkwro6nZ03UJTjtLCIcz
         A1vnhlg1Xe78/QATBXBGd6ydZkRzjvi+r3zhLYgDK9Y4+0jrwwTG+JwNeey5Cym8m27w
         hV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132030; x=1756736830;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRqhnX04LSAiYdBNDlTGLugmcAxHcjqdN/6E4HSJk+A=;
        b=oi7RWIdt9h93HiWjWB5xtOSFGPo6ZnJrHKjujtaiplteOY74DLV3CvWjm+bgGK32yT
         piE6h0S6xbMEqtri+Weo++w0+IWAPkVajkxFOwjplI0l1t7/zXu4fRpqW7/dfcaYIn3i
         gxR++GeRq0lDeI9FJXI1fVyBneuyCiOzbqrFAvkLRY5SVY2MsvFMZB6/V4k2oxANLTX3
         1jw/VIWNNfQf5+FIDmRmhh6Nmhhzbyc1wYjc1LSCF/0Z3FSAadidr0ZHRDTh8ei/dn5o
         ayoA6n6k54oALcAKSt3Xn4NVjtju97QBzzhQrNIlqveERdTFXQlQrUjBPO3PV+86rdse
         ocNQ==
X-Gm-Message-State: AOJu0Yw9bqU76DAY5ybTHg5qX8pI5/M2CPE3KAj+N9aZel78HcDc5hAn
	75okhlQSW7Ks8arD8pNFMsK7SxplfJTLEPGbWjiv7xXhG+sVw0LxkfRrH8e1qJnMPmQ=
X-Gm-Gg: ASbGncuxXvFQhQsmf4UvuLs9WkRbFuJpTBeJ5M6FKFT2mxVIsZNcjqs6dsOtIQwqyn1
	dkbPO9XWQDySjj5ioD+Pyl02vMrxNYVliEZx8xIHG62L4nX9b8UYE6mxPFAla/2U2bw79qbwcNW
	Ze3t4RNHXrlh1WjKwVH5xUmp04Il8HKwD0p8pftA8ZblPFF3+gzWoFJKM/XlhHkOjE2XP8Z2ZyW
	1r1b4+Bd5jLvCotZArUklfxUXdepqGgtvsj2Th61kxlKpLyS3iZa+oCOawSO0U2IyBDMx7A7fpJ
	EYnQ5pmgeXFziNQAVCQBae7E/6EUDWVndyoBnk4YCldsrbZ9ClCB4JZnhCSj49wZm4qKyYhjN2v
	gm4SQ8JuoRPYxDyoLcsGtD5D9lyuRGoCpxv3Ipn8mZHQWGyY=
X-Google-Smtp-Source: AGHT+IFiPKoRqUt+ns9QGMzAHG5ADHsWD9oCSqbjBX7AALemd/YQHEFsuSaB7N7pDSlpI8XFCAMjJA==
X-Received: by 2002:a05:6000:288a:b0:3c3:f134:28ba with SMTP id ffacd0b85a97d-3c5db2dcc73mr10078522f8f.28.1756132030376;
        Mon, 25 Aug 2025 07:27:10 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:10 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:31 +0200
Subject: [PATCH v2 06/12] clk: amlogic: drop CLK_SET_RATE_PARENT from
 peripheral clocks
MIME-Version: 1.0
Message-Id: <20250825-meson-clk-cleanup-24-v2-6-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=72WOcl72YOlZwt+/CKTosZbQzCnfjCTjpwRm9zwOmLc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKzmtWoqm6bakWO4aKPSmFt40T0qw2eFXNA3
 VSI6WqYcXuJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxyswAKCRDm/A8cN/La
 hdhKD/kBP+rn+onWFFONaftlxYdK3A/70krVdI9E8Ed4u2qVKwNTK8gYdu+FC++MQR3SyZUdB61
 jq56+0ekWz28V2fZ8FVwaH74fz4eoXQ3Zgme4vQUXSMw25zClzqCEdekFweiMZAkJjXhsrfC0so
 5SrtlSz7jU/EIIW9TTll7tly7/cVkiWdoPF0tBj6y2Y3GOy9+sYhx/CWCQUYvcNvbqIMKQ+oUn0
 NajUZsntJ4TkzY0REthSO/alUHbltx9JzK9mC7O/H9d4fdMm7RDm6YKq+qywCwU5N0uDwmUUmz9
 /dERanMgbXxJF+H/DFcgYrxYpl6oXoXVmb+mbHbXswsikTfoFRjpbj3InOl356uuRYqhhm4nDUo
 I9yJfXxWJkKpUNlYi72srABYcdjCC7RCouxjKNBDnZkDeEABMrx+n8V18+qAgStQlbGEc5HNVxf
 7EjAm+DfazEypaXlfLNuTFr5bXJOBgBDcRxFMXNn3CY709MnOhv+sQF2YECpppMZ5s8rBDu7oQC
 uN499gfY9WIKPtzkgmoIYCjaEVgizqzKNXpAgY4bFv9Plyo1rx8yS01hbj8tO7V6VpCF0SOKZWA
 uGG661IS0XryE9SfHYJJo2nwiOOP8qoNRti+7sL9KCjjkpfqr8GD57B7fvW4nQJAhcy1p9ZMT4F
 nmTT04JV8y9D3dw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072712_007479_50412CBA 
X-CRM114-Status: GOOD (  12.49  )
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

On Amlogic SoCs, the rate of a peripheral clock should not be changed,
let alone the rate of the parent PLL.

These clocks are meant to be used as provided by the parent PLL. Changing
the rate would be dangerous and would likely break a lot of devices running
from the same PLL.

Don't propagate any rate change request that may come from these clocks and
drop the corresponding flag.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson-clkc-utils.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/meson-clkc-utils.h b/drivers/clk/meson/meson-clkc-utils.h
index 0c228a6723bb2bddc0b9a4f92515f05850a5613a..3e1fb7efe6da1f5d8e55993541d12d40464a47f5 100644
--- a/drivers/clk/meson/meson-clkc-utils.h
+++ b/drivers/clk/meson/meson-clkc-utils.h
@@ -38,7 +38,7 @@ struct clk_regmap _name = {						\
 		.ops = _ops,						\
 		.parent_hws = (const struct clk_hw *[]) { _pname },	\
 		.num_parents = 1,					\
-		.flags = (CLK_SET_RATE_PARENT | CLK_IGNORE_UNUSED),	\
+		.flags = CLK_IGNORE_UNUSED,				\
 	},								\
 }
 

-- 
2.47.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
