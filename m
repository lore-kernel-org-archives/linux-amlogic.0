Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB3EC83F0A
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Jul 2025 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BnuOryNWHLEnhih34CJbbATn0OUx6vuS+x8wdRg038=; b=1ch+5qCdXdISQu
	XEScafxnKjrHRA8qO0I6QNkJmUBWvgjHaAcuLHt8pLaIGnadclQ9oJ/qdPDLqn8Vjn3qoHVXBzoL4
	kaOdFhhHkLHamVJfFLR0CGBmZw7nyMPRFOh9ndSPyXJOCIXa4nQCQNqmEV4Ui6ni/Mpw2BAQ4E+Ch
	r/Jaqdl3U3KmlE0gTSpFU8NdFr6XN81KIXWXkAeIAgp9ToyrDBkxBMNArPsh99FRCOLq5vTvDIWiI
	cXdNjNVs0BYYzhLLJ2PIaEaBNy9/W/mX+NAwk9zvfzoJvrkAUk+tbkSYiIaLyvMdvWDkhU/XQJAXK
	Qk1WJ+mfjFegAJl+jWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0VF-00000008zO7-2qQL;
	Wed, 02 Jul 2025 16:40:09 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzN0-00000008mxl-3kBF
	for linux-amlogic@lists.infradead.org;
	Wed, 02 Jul 2025 15:27:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3a51481a598so2673423f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Jul 2025 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751470053; x=1752074853; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRqhnX04LSAiYdBNDlTGLugmcAxHcjqdN/6E4HSJk+A=;
        b=rSEUcvNbGOgze8rmkIGC/cANLbHDSaAHbNHpjmkpj433bm+Aq1Zl4G/QrJA9rI3yt7
         ayZIdn47YjYYz6AzOLeZqYt8oHrD2sQAGecfVoBXtyjwsPMDLZlBCxXiIiExiwpXuMgW
         wO3bzI+uqeTxI0mbFZ8phvssWnDwNw4UdH60oNm5OdzFyJcbT8h34UTOghQWQAT1kW7t
         3WPaO1JFZv9vo62Yspa4WtpeJQ+pEobscQCXBrdrHPVfgPPD+nIlIOUdDE3BBVck2K+l
         RSz3SaB9kiFICILpn36AMhMNhKV8JEXQ0rqih1ajRvvggJqIIc3xlQVwDUmkiPGXdHw8
         EqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751470053; x=1752074853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRqhnX04LSAiYdBNDlTGLugmcAxHcjqdN/6E4HSJk+A=;
        b=UHbzMzJ11WJrRph0FjkmoVCjglaIQr+L7vwZhv/JbLphiBz5vpdg7yuenPf5/Ie2hB
         nopEOfFmJ15vV1Fk+8R3XugACMeFlR6G4LuJYqtCbxLkbGxbNfNcSKd+oesLGNa2ZKC2
         eyW+vfLwvG8SSwmy6EOWWh713iOXw2MrZSl3Gq1+3xFbBGgk0vFvZTkKGTjD/wbEIerp
         xwet7o/7LLzZ53B2DrjJhUwbBoJU82+p1DILUyCiTd6HDdkoTg/JVFcdCqLIRT2wivZu
         gNO0s+N3KkQXGlNkwaimrz9NfNmoqBPMFyQQEYSJxmX3eepdFV5x4Nf6u83X9BbiUoZN
         IzHg==
X-Gm-Message-State: AOJu0YxjcQGcsiJOmA6F1p7Cb2a19neunEaPh3IW3CpT7aeFesg0Oxuj
	BDJ54zocbdBKcGax9SRi0ZsR+x+IXhoVNbJn4jKtlberKjG923jrNzG1AlXa8fiEHTw=
X-Gm-Gg: ASbGncvn93Y/HMCt93+QVt08LHBBlXNzhLREPCxVfJo+QTHHYRY3ZhS17naA6NzbHU1
	HWUntFx40bO7ej0IWGrrSN8I9+airTEmONQeAf61KbzttjJcv5OuzASwC7ClxQRXy7C7sZRKobl
	JI1iS6xI9l5BtkaToMQEnsks6/pN+2FyQCvXVcI/9mJ8f8EJ7DHcsrnDNLVkiE3//L8LMWT92rH
	zYK7HbT3i901QZCBw6GF29F7bORsdIpoiUXy+rlHL2t0eOpW7ILUqM4zpxXYxDze/yhlCa1x6kx
	IQ6mJejNrFlRh5h85WlsRNj2OCLS9Notsaec0y/qlubL0MIuq/yQ7XOEWWFVftde/6PlrYGSESP
	a
X-Google-Smtp-Source: AGHT+IEkrWJkT0jsE1v5Sbwsc1H2qjJUcmDvZLYQeK6P1AEgJPv+8a/qmcAydC68v1anXCkcKA0llQ==
X-Received: by 2002:a05:6000:2892:b0:3a4:dc93:1e87 with SMTP id ffacd0b85a97d-3b1fe5bf209mr2942390f8f.1.1751470053311;
        Wed, 02 Jul 2025 08:27:33 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:5542:4bad:e07b:9489])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454a9bcf35csm869205e9.20.2025.07.02.08.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 08:27:32 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 02 Jul 2025 17:26:18 +0200
Subject: [PATCH 20/26] clk: amlogic: drop CLK_SET_RATE_PARENT from
 peripheral clocks
MIME-Version: 1.0
Message-Id: <20250702-meson-clk-cleanup-24-v1-20-e163c9a1fc21@baylibre.com>
References: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
In-Reply-To: <20250702-meson-clk-cleanup-24-v1-0-e163c9a1fc21@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=72WOcl72YOlZwt+/CKTosZbQzCnfjCTjpwRm9zwOmLc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoZU/IeRDPmxst5O+ATDGbnAky0+Ta4bbSx6FjZ
 33IFnNXNSOJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaGVPyAAKCRDm/A8cN/La
 hTqUD/402wWVc1/QpJrESo1iekdMPyOcCOngi36a+3w2IOCWeiaSJ5OmxFZTEqneuVl/ktn6/YB
 LQ8Q0HtYKDoo5oNEuUk26FVS/zHZw4MTQA4ZvuXszW5tN2MbBbmIouy5GJctPismKE/VJYanSXI
 kYTnEJWUcNNHj5N7vjLwm4gj1RkK3Fzijp14/Om/dLyXfa0yMKpWm1GA0CRa0ucSigkYruOjPPj
 xyD1eUXSFxkovtt1yyN+bCLneu7b0r//0JC0aT8pleORi/pW8tNqeNzX/E1+jClOlbe6AgjTlDI
 aBAkmX2ETqjuLstTtEvoL8Ky9DGblp1/5+f8AyIwTzBI2EOcJml604N/uJ2C6+4jznQ1rcrOFLW
 ISBBLyh6njHps/wpWkR48MQiYi4BLASafnqDPIQXUfda5/WdOHmLiEWA+cWLNPXMpbdasDCJy/M
 fH4Vl0UatF6Xl/MvwX2BK4rOJ+Cb0shVVOXlcQKrdQIi8nhZ5Ky+k3QTm0BA7oU0J24ourJz4m/
 GB6wnTo+3EOMUREoOAkAD3sccNGpJmj2zng3y++ceG1gA0Hf1zRC+MFunedrzJU2SRIma17R+HE
 xTcLYY2rqfOJYt9DF41rIeMQeaKk709jaBF1kZhfftq1eD63j/Q6YQtrSgiH1EQ2tZ73q/uORvG
 hSaSgQt8SpTbh9w==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082734_935015_F22653E0 
X-CRM114-Status: GOOD (  12.31  )
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
