Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DF6C5AC67
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Aug 2026 05:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fmw7DCPq7PsT96xLJo/qPNDU8KQQQNlkt7vbnidAVz8=; b=EPI7eLHgXI4LL/
	beTWwMZ+gUey6D5Gp+ScIcV1+kROS3mBmGIIPGYIjYazSxe8DywGJPCnZY3AFeTaJK4RPBRv+ObvH
	4mB/atBzI1IFAS7MdoA6cIAlkhs5JYlhVk8VOmiwXegcC88t7BMpJm6ypIjABvWuiWiyVa/CT1qm7
	OE5pu1LzqyoHgvIU6TzaMtsoayn3ematrJA9Ui7jBdT7TjVpwogWJRlIU0RWEjINm5yztb038xItY
	lANbhwAKfOSqTl8H225C10G33d1gAVAf/SktBZOyYKUyj58JgFP5S3/cwAUTZ2gmzFFvkqi9Ksmrm
	TDsXoYvpD+RxY6XfIr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5E-0000000HQPs-3BdV;
	Thu, 13 Aug 2026 05:34:28 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuO5B-0000000HQNk-3kEY
	for linux-amlogic@lists.infradead.org;
	Thu, 13 Aug 2026 05:34:26 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so2353189a91.0
        for <linux-amlogic@lists.infradead.org>; Wed, 12 Aug 2026 22:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786599265; x=1787204065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sg48OebW8O5DYM3I5rKP0/NygxmXw5dDjKnd0RIjz50=;
        b=IW1RbcGK9ZYClVg1gWPxihkEmNszo2fsm9AVyrQrA1pfaGMWMMCR7fiw+COq301c4Q
         WjwSSPslxiayOW61NZc7YpYwYGGROXaRacntJ42inZv3D6ItmVrRzA1034qxyHoLGMpE
         pqlCFo078U5cbtKYmgoVp226JNPE6TY7H0gNl8n6fmEK5Ou0dj12omHVNB7zLAMfpaVM
         3SO/B/b2eFw1mRKfIJP1NkS4Rid0192ccV729vOKd0KVdDjDIV2pNLk+bdIiK03LJPXj
         QaRGtMP0GNTavXeuTnACe6Rgumd3aTeF83sNoLEBRgWMHWecFWUkH8x6E+O0wtOARUSJ
         AO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786599265; x=1787204065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sg48OebW8O5DYM3I5rKP0/NygxmXw5dDjKnd0RIjz50=;
        b=lobAP3fE7JaasSpvDrfpSPxJAATIucRU8DaPpu5W1q1gJpU+b5wo5HCRi6BZptDhgl
         uCBAVJxi/nrZecOAvOkxbuAxt6iK5darxjZKdN4ezQw4In0D6NYibwF7dfe/zf7FfU7w
         EWWsgR3437cI9Ct2yYxfeSbb7Y8JVeFbrzbOi+A1iySPlN/wngjzPJTHAscpaqFWz6lz
         ly44XQsUv0dNDqkbLDylO2hcdqTHizLIav0em8kFe42WnsDJYt32GeDg63KNdH8zTnkq
         WgTiDbTUIU8uYjO2t3IyvOPco69Zo9tALqUrGuWSaSLPDvvlbjX0+EVH/FKRyEUD1Uu1
         OuMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrrVEOwtpVk5kzYUkRQkajzCLDsfKna/20kRqjzrXqhwqeifp0CYmlA/3h3/yZ1V+TUxLyecFvJPB3Bcksz@lists.infradead.org
X-Gm-Message-State: AOJu0YxbSzhcKUeOiV/uzWiMrTCi96Y2L2S45e3kvAfcgP/1/1SzW/at
	Vw8JMXqLM0TKIrSc2F64odJVieWnqLXaihb//U9BgGAl/UF/ZStDHnY8
X-Gm-Gg: AR+sD13zJ2xfyyGAgsBhYNWHwFFZTAhDSaaFYDp8cqyLLYhtpvt9gacxH8+O3clVKac
	qertWXozAvAZm36CLlCMy2CkQOe/TfphVgymne5wg3RUfWUtwHStosgo2z0s8uSjUiE1GCG02ix
	TzWP0m7BRBVPVv6DpV7uPFW3fmRzNpdYK4P65Ajav9fKBr7JPKb8SvlvcDmSR+mGdrMBcNMDjK0
	vXPn2S5/OVUa+ytnBZEhK/bUV0AUZmNx3MVYexwgDxhdi+54kGwkFtjzfF+LOZu3eb7i4lQpcoH
	gC0D3lyEZLjFKNE6zNYpca/wv1v2SN7ax68xaFhcaIkqNl9kk4hLTcS/ivTlUgGovYNBSG9MUFE
	2ymWrYszxkJgzDhfhnXzrfcOwA89TrngDAE0/UwnC5Lk/bHK443Th6J4OZngt0yx8d3tAsxn63J
	W8dCjjjMdIhS/DQKwCwx0PTknvi/oeRz0dgdBvY7qTRaxMPraDNHOTza8+A9dRJXyqctgL00Dlm
	zvv03IiAv19sJy9+l5YFZD6awng+WXu/NZX0bfU26x16jRJSePwBUBPFhK1M9HkDUdb+yzjlBnm
	+Y1YInsx3Q==
X-Received: by 2002:a17:90a:d40b:b0:393:19a3:4f1 with SMTP id 98e67ed59e1d1-3931e058763mr3777372a91.6.1786599264874;
        Wed, 12 Aug 2026 22:34:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931d872ec5sm594734a91.0.2026.08.12.22.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 22:34:24 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Stepan Ionichev <sozdayvek@gmail.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Pedro Demarchi Gomes <pedrodemargomes@gmail.com>,
	Osama Abdelkader <osama.abdelkader@gmail.com>,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 1/3] mmc: meson-gx: Handle errors from optional IRQ lookup
Date: Thu, 13 Aug 2026 12:34:02 +0700
Message-ID: <20260813053404.21553-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813053404.21553-1-phucduc.bui@gmail.com>
References: <20260813053404.21553-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_223425_922474_BADAF5BF 
X-CRM114-Status: GOOD (  14.68  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no optional IRQ is available. Other errors, such as -EPROBE_DEFER
and -EINVAL, should be propagated so that the caller can handle them
appropriately.

However, the driver currently stores the return value directly in
cd_irq and continues probing.

Propagate negative errors other than -ENXIO, and only assign the IRQ to
cd_irq when a valid IRQ number is returned.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Initialize cd_irq to -ENXIO.

 drivers/mmc/host/meson-gx-mmc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index 694bb443d5f3..d2903e3dfd6f 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1141,7 +1141,8 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	struct meson_host *host;
 	struct mmc_host *mmc;
 	struct clk *core_clk;
-	int cd_irq, ret;
+	int cd_irq = -ENXIO;
+	int ret;
 
 	mmc = devm_mmc_alloc_host(&pdev->dev, sizeof(struct meson_host));
 	if (!mmc)
@@ -1185,7 +1186,11 @@ static int meson_mmc_probe(struct platform_device *pdev)
 	if (host->irq < 0)
 		return host->irq;
 
-	cd_irq = platform_get_irq_optional(pdev, 1);
+	ret = platform_get_irq_optional(pdev, 1);
+	if (ret < 0 && ret != -ENXIO)
+		return ret;
+	if (ret > 0)
+		cd_irq = ret;
 	mmc_gpio_set_cd_irq(mmc, cd_irq);
 
 	host->pinctrl = devm_pinctrl_get(&pdev->dev);
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
