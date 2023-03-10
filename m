Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 845B2C6FA99
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Mar 2023 23:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N8sP41w/2AdTzZQf+B8v6jVxUJGugHB0VnEQsSJi3NU=; b=WvC5s58aK9kMM0
	1YbwIieivFw4vXQtrJtPqaj1jSmVvZJUWr1d/HGSsitvblFZVc8q7foEOIt/lGNrJEPtF9jfIdxgn
	vaFvrL7ZK+zCkr7jY5E+6SxNO/vONiK3VodJfAtyfdsVS1R22J1GXSSXbKzcvVMENqL9UgOPwaY+4
	IJm8BU9usqhE7drKpwu9FgL6hf8waTA7votdD+KTWcFXqdnMRjLLnkvYDW35RD+I4pSXnQk+1y/qn
	SpHoXbjRzYr9E1E+Ffa1zgsluPudJWwX59Edeu+Z3jWCZ44vIK568hIz1O4OprAzv08AaWnERRh2L
	YSmAjrx92SG436AK8V6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pamGf-00GfGj-AT; Fri, 10 Mar 2023 23:35:21 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1palEl-00GNgj-QP
	for linux-amlogic@lists.infradead.org; Fri, 10 Mar 2023 22:29:21 +0000
Received: by mail-ed1-x52a.google.com with SMTP id s11so26458889edy.8
        for <linux-amlogic@lists.infradead.org>; Fri, 10 Mar 2023 14:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678487359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3O5N03pwwa5CISBXEL2uh41ANV84DtyZX9Qqc/gvOE=;
        b=k/86A8NzfMfImxqB7+KDGVg/tynJ0FVCkA4dmZsWIIwO7Ykre8VGNhhLmaoZxK5KT6
         H3l6ZZCxmyioRniLqshH544hiliBpuPql4rrcaGN9SPUaoBgt/mYjvy3lFkcooWp+CQj
         /cZd6t1wB+DD9btEFmW4rhD/UxwGgSLeoP8+6PQdjvt2yfEZsUiYi1auwiNr2YRkL0Ae
         eGYX/hpVFD0YR9ZjOD9aXNAFS55flsLUNlQ/EodMAcU9+jDwOEUYGcDlVb/I+8XQi7AC
         +dBZ6c8c6uYJIAAEPOJ4odu80gqrKfSiQSXkSlCWkyr1U2hFPRdYKsgGWKGkJMfxst9s
         c+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678487359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3O5N03pwwa5CISBXEL2uh41ANV84DtyZX9Qqc/gvOE=;
        b=sZGNMyKck4FCv2QiMfafxYfjvKxrcpQw0kHzExrgwJrZ5yxZVOVB5eduES5z/QEPVI
         f0H9TObSov3GodapIwnybK47ndyX2JQ3F9+eRTMPBvJ8Z92ex95lXVDjTPN/T5SEY/o2
         zEqrsKc5SYzerfz/Lu9fRthvsnA4KJq07YycM/Uhef/KeYmT6lgRP3Rkcoac9YpMxUaM
         FQmx62I5rZ4U/SNVEAMmTs2QUIkQ899fSJh0EN8w/LErZ3CRJOheoOnnQMcKrt+JDoME
         RxejXn6+viEHC+LYu8lZ4kowxdohuUF/vAtk7UtI/uTYG0IDC/Atx7nNSoSUuIU2pSnb
         jJrQ==
X-Gm-Message-State: AO0yUKVv9/iC/F8u9N6E7FCsqOYl4d8LtAyieDps9Gqy0Yf3ZYYvhp5R
	8oiVl8FsyMFI3sq3Y1Jis6GXWQ==
X-Google-Smtp-Source: AK7set9Rvn4y0BGnLTV87CbBg91zcO1xpeU2J1xLOi9EFaaPOkq+Z2ChtSGd5/YJsuzGlHU4/phxIA==
X-Received: by 2002:a05:6402:3d9:b0:4af:69e2:529f with SMTP id t25-20020a05640203d900b004af69e2529fmr26991968edw.27.1678487359382;
        Fri, 10 Mar 2023 14:29:19 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:34:52e3:a77e:cac5])
        by smtp.gmail.com with ESMTPSA id x101-20020a50baee000000b004aeeb476c5bsm525467ede.24.2023.03.10.14.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 14:29:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Mark Brown <broonie@kernel.org>,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andi Shyti <andi@etezian.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 15/16] spi: sc18is602: Mark OF related data as maybe unused
Date: Fri, 10 Mar 2023 23:28:56 +0100
Message-Id: <20230310222857.315629-15-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_142919_886656_2B0B1EDD 
X-CRM114-Status: GOOD (  12.95  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

VGhlIGRyaXZlciBjYW4gYmUgY29tcGlsZSB0ZXN0ZWQgd2l0aCAhQ09ORklHX09GIG1ha2luZyBj
ZXJ0YWluIGRhdGEKdW51c2VkOgoKICBkcml2ZXJzL3NwaS9zcGktc2MxOGlzNjAyLmM6MzE4OjM0
OiBlcnJvcjog4oCYc2MxOGlzNjAyX29mX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFst
V2Vycm9yPXVudXNlZC1jb25zdC12YXJpYWJsZT1dCgpTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9z
cGkvc3BpLXNjMThpczYwMi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXNjMThpczYwMi5j
IGIvZHJpdmVycy9zcGkvc3BpLXNjMThpczYwMi5jCmluZGV4IDk4M2IzNjIxYmMyYS4uNWMyYzI1
NWY3MGU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktc2MxOGlzNjAyLmMKKysrIGIvZHJp
dmVycy9zcGkvc3BpLXNjMThpczYwMi5jCkBAIC0zMTUsNyArMzE1LDcgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBpMmNfZGV2aWNlX2lkIHNjMThpczYwMl9pZFtdID0gewogfTsKIE1PRFVMRV9ERVZJ
Q0VfVEFCTEUoaTJjLCBzYzE4aXM2MDJfaWQpOwogCi1zdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBzYzE4aXM2MDJfb2ZfbWF0Y2hbXSA9IHsKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIHNjMThpczYwMl9vZl9tYXRjaFtdIF9fbWF5YmVfdW51c2VkID0gewogCXsKIAkJ
LmNvbXBhdGlibGUgPSAibnhwLHNjMThpczYwMiIsCiAJCS5kYXRhID0gKHZvaWQgKilzYzE4aXM2
MDIKLS0gCjIuMzQuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LWFtbG9naWMK
