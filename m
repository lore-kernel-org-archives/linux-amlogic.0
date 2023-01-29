Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C3FC636D0
	for <linux-amlogic@archiver.kernel.org>; Sun, 29 Jan 2023 23:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Subject:References:Cc:To:
	From:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lvtT9hCesOIh++xtMUTg6QejjtiZbHGLbMIopNaDg6w=; b=WR8SerIQZowoTr
	a9xMT+77ZGwjibsPA+czpva/wleqY61SzvkwRqLtz3TVvP9YoVyAClzuOmEwcWvQxdF8/B2Au67eE
	7r6RHkxVQMVjKZWGpQipcGx/LghQZbP+k+7cHnzj35iVa9vYpSDW1hgmMyG0LLBwJo/7wSKTwnirm
	u4MEdDwqG2mC4WwQR8hE41aho2DL7FpQJRpoh6OGsjr070LayYQp8IhoRX8ZujkMUtvNYpuubYVis
	fKDWwJgE/oYjNgEtpLs3tam2fJ8YFaaiTHD7qYi7mV9uPRHp2tvaQVnk9IQA64kGeYvHJX+NsJxdH
	b3jfHa5etWGljYFrELgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMGpH-0020RS-Lf; Sun, 29 Jan 2023 23:11:07 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMGp7-0020MA-22; Sun, 29 Jan 2023 23:10:58 +0000
Received: by mail-ej1-x635.google.com with SMTP id hx15so7694775ejc.11;
        Sun, 29 Jan 2023 15:10:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nc/LaO0TaIYFb0bbamxZIEYNdnsiW48p7UWNVXC+zYY=;
        b=H6lC9QtAtM6NuyszabX9xTiNmX1mOx2cfyBo11WaQncIQSIILTgLC6BLixqqpoTd9w
         eZoZSxCVjRABpUkoRBHEwDzop2G7BgtfeJqDWZIBzvHjwkYppOT0qXoMuFJfAJPH1l+2
         zZhxKKxQvDNDR+ULqsL2HM6WpJ+pwFjoKE+OcE8LOBq29RCsa/FDNlaWGxXRqI07kCHZ
         jOAoEJ+I4V00d5JsC1mDQJLv7KgQsYUf0QhEfdJ6J9CLh0z0vR79poNMSbJrHWKyhUMV
         +w0mLAFHLykICnM8RC/AB+qnkxmzY2n8K6+dUcGmehRlrNPK3aHr1QIVyxH9afzJSX/a
         KgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:references:cc:to:from
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nc/LaO0TaIYFb0bbamxZIEYNdnsiW48p7UWNVXC+zYY=;
        b=B4XfL66lVwZVmA334+MsRIqNCZ3rTdfScpqyMWQh3Xz2uikBasEFZSFn55WGe8jp5Y
         dYG92aYQPy1K7o18/Ay6EChZYOpqmJLOVqi6auAV6OPy2DSQPpA3sG7A2DhTFQiL+WMw
         sJUXVYYJw+FAzwccYUYpD+Vdw9gtf1MYMVQMq/ppJbsaZR/fTts2y4uRGGgTbp75/rUG
         r64+xJElijuwRaInWgjUPN6Nx7cgYRnM4UGTmSYwm7Ocyfp2v+gZmXUUUjfNNV8s9yHU
         lfZuUKRC7+Vp9mJBk4lXDCv18DOIQr0D5v/DcQ5WtB+1mOq5slJ0Kc5WQfzhx0oX+SGQ
         Hz5Q==
X-Gm-Message-State: AO0yUKW218Xwwrdr9s6Qru6leZPoMKp4d2f5lIwmc40xKfwijeBxdQE6
	bybwmxjb5bBlA9qy1ddc+p8=
X-Google-Smtp-Source: AK7set/dD8yIV885soDzwkEGuHnNYc6wpe4EDujJMlUDDgHZCDw7ENrImpWS1ZpTbqOJm1eMQhlsdw==
X-Received: by 2002:a17:907:9054:b0:878:6519:c740 with SMTP id az20-20020a170907905400b008786519c740mr6282212ejc.44.1675033854602;
        Sun, 29 Jan 2023 15:10:54 -0800 (PST)
Received: from ?IPV6:2a01:c23:c5b5:3100:78bb:34b6:bd6e:6fb4? (dynamic-2a01-0c23-c5b5-3100-78bb-34b6-bd6e-6fb4.c23.pool.telefonica.de. [2a01:c23:c5b5:3100:78bb:34b6:bd6e:6fb4])
        by smtp.googlemail.com with ESMTPSA id c19-20020a50d653000000b004a0b0cd2e45sm5941749edj.75.2023.01.29.15.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jan 2023 15:10:54 -0800 (PST)
Message-ID: <9e08411b-20cb-874f-8915-6f8dc32e9fcf@gmail.com>
Date: Mon, 30 Jan 2023 00:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com>
Subject: [PATCH 2/2] mmc: meson-gx: support platform interrupt as card detect
 interrupt
In-Reply-To: <dfb90ca4-1f62-e3ed-2ce4-a7b5f661e36d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_151057_126365_1D4D988D 
X-CRM114-Status: UNSURE (   8.98  )
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

Use a new mmc core feature and support specifying the card detect
gpio interrupt in device tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/mmc/host/meson-gx-mmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
index be1a972c2..c87bc31d0 100644
--- a/drivers/mmc/host/meson-gx-mmc.c
+++ b/drivers/mmc/host/meson-gx-mmc.c
@@ -1236,6 +1236,9 @@ static int meson_mmc_probe(struct platform_device *pdev)
 		goto free_host;
 	}
 
+	/* gpio card detect interrupt */
+	mmc->cd_irq = platform_get_irq_optional(pdev, 1);
+
 	host->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (IS_ERR(host->pinctrl)) {
 		ret = PTR_ERR(host->pinctrl);
-- 
2.39.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
