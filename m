Return-Path: <SRS0=pHk5=LL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAA2C2B9F4
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:47:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1464260FDB
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jun 2021 19:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1464260FDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wjp51JrcJTkBSLhK6PTedgQgfwI3KuxAVQYmSHZY7bQ=; b=Ct8fM16QeS+3hV
	DT50qEyYLhxRF+NdY/qkRT38oE6PRRjE2E9vUZWMeSf7YXr6pYbncTis61z9TRSan46YHg50N8/h+
	Lq5NCkWn509uCS88Qv6FGHAJolER55V7ZTyipxAJMfavyToQmaVClG5ZIRYZiFiB9nY3rP8LKtjX7
	vV6D6iTDb1PxOks8LFzWMw99/qDRpuA8dbgIcOLs9tyYSxIEmllnp8EhRP7x6uz3HAQJf26HJGCKh
	oTGJerhgRtyv85fmogcRzFcLc26LIDMbP+yLC9td4C7l9A3Jq3e63UdecvosaKkTg5cdM5tyuRiP6
	D555gdg6ByRi1ToozAPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltxyZ-00BcCk-JV; Thu, 17 Jun 2021 19:46:55 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltxwa-00Bb67-3j; Thu, 17 Jun 2021 19:44:53 +0000
Received: by mail-pg1-x536.google.com with SMTP id q15so5772239pgg.12;
 Thu, 17 Jun 2021 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+55Ue4W/St8WzVyqe/i5ldF+F9lfhpaazjUIhpwFCbU=;
 b=EZjAcRaCFNPFLV/Dwc3dBcc+5bgU85W2R/dX96oapPujxwKglk9SnSCNmryv1xNeP1
 RFx/XZ2b0Og6wCxyOpVNhSQuV6TNrmgG7BmhFaFap0FX6QvkZlJEVValx6vLby/pgYA4
 85+xlVnVYjiqilbp65xRAT4JSKby3RgC98Na+BqImwSyxLq9NU8Wj9EG2TkySkqNlfPV
 8HCjZB5xH7B57jtI+Tl+58xGhvVo1ihY6beJ1zUeoLj4dw4ezfeQUhyXYkEqyIkiQIpM
 6YeDJAm1Tr1efY5g+wFylrdwaHGWFzbG0r/w/9Nc6T6KX6IeNq16LjpjwT+VtXjGDtqt
 H4hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+55Ue4W/St8WzVyqe/i5ldF+F9lfhpaazjUIhpwFCbU=;
 b=H9B32vsAJXFflybrFiXJXnVwJ8rZCBJKlrwOgXX3ap/MrlzRhvPyiDA0CYNQQTpdMp
 Y8A366dXKx82Oz4uD9j6ZFuACiJ3Nvt2+j0HY+HwNm43fnFMyYoK6XccKL3VUMqIzCir
 wPQDWaSLG9XZb3XJVBQbPzrpdTwyQfDNLuX0NoJunRoNPYZsHmLB0kSULDN/wB3t4s5/
 XCOrv8QVwM7b4k0NkohAzX6gxiJR9v39LUj8ioiSIMgRBmva3YfzXHxsKveS7/714xs8
 ++KqchFHxYhmEGCuCqR71RayRp1pZOxWyOVi5TfNSRySdgq8jLAsZ9dss4sXBYY3Q1Dv
 1o+w==
X-Gm-Message-State: AOAM5330CbOGdWCWKaeaarwCYGL3F8JGmfrWrxarNg206PFmxj7jLzLK
 tvvgaq+Fux3XxeOdhgEqdDAVQmCNwLo=
X-Google-Smtp-Source: ABdhPJz1NtVS+KHlgLx1xT9I5TBnQfvCgNalkW+pJw42jrPFghbseNcxDTgiOxfCDLd6UXJeprIi5g==
X-Received: by 2002:a62:7e05:0:b029:2ea:57f:ec86 with SMTP id
 z5-20020a627e050000b02902ea057fec86mr1515090pfc.37.1623959090404; 
 Thu, 17 Jun 2021 12:44:50 -0700 (PDT)
Received: from archl-c2lm.. ([103.51.75.27])
 by smtp.gmail.com with ESMTPSA id z9sm5987187pfa.2.2021.06.17.12.44.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 12:44:49 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: --to=linux-phy@lists.infradead.org,
 --to=linux-arm-kernel@lists.infradead.org,
 --to=linux-amlogic@lists.infradead.org, --to=linux-kernel@vger.kernel.org
Cc: Anand Moon <linux.amoon@gmail.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFCv1 8/8] phy: amlogic: meson8b-usb2: don't log an error on
 -EPROBE_DEFER
Date: Thu, 17 Jun 2021 19:41:43 +0000
Message-Id: <20210617194154.2397-9-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617194154.2397-1-linux.amoon@gmail.com>
References: <20210617194154.2397-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_124452_232253_509E83CC 
X-CRM114-Status: GOOD (  12.81  )
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

devm_phy_create can return -EPROBE_DEFER if the phy-supply is not ready
yet. Silence this warning as the driver framework will re-attempt
registering the PHY. Use dev_err_probe() for phy resources to indicate
the deferral reason when waiting for the resource to come up.

Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/phy/amlogic/phy-meson8b-usb2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/amlogic/phy-meson8b-usb2.c b/drivers/phy/amlogic/phy-meson8b-usb2.c
index d5edd31686bb..bd624781d914 100644
--- a/drivers/phy/amlogic/phy-meson8b-usb2.c
+++ b/drivers/phy/amlogic/phy-meson8b-usb2.c
@@ -332,8 +332,8 @@ static int phy_meson8b_usb2_probe(struct platform_device *pdev)
 
 	phy = devm_phy_create(&pdev->dev, NULL, &phy_meson8b_usb2_ops);
 	if (IS_ERR(phy)) {
-		dev_err(&pdev->dev, "failed to create PHY\n");
-		return PTR_ERR(phy);
+		ret = PTR_ERR(phy);
+		return dev_err_probe(&pdev->dev, ret, "failed to create PHY\n");
 	}
 
 	phy_set_drvdata(phy, priv);
-- 
2.31.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
