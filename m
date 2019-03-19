Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0FFC43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:03:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DCDC20857
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 10:03:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JSXpTfXW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YWsbwxL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DCDC20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeWOxJdxo5DGAaTVy5ngFd24NbhXRP0EBQfembjzHF4=; b=JSXpTfXWBPm+R0
	poS/I3yvToQ6vCu3OSwRC5Oy10Bhlo/NdBHWfmxS7CtToCHPJk9+FW3y3DSPoPB6oD0LAImpN544Z
	PZBcge/QMA9DvZgay4hilgLm/F3gxuhbbUA3dbnQwn0pTUNXqUBUBBwJ/ooxczlZ9dngbTrLWy34S
	uvYZrzTqayY6yb0Y8xUT8VA5A9kJa/6ETYYENaXbAbqbqEzuCJx7AdDiMWe8ouShO/5c6VnzixBMg
	lyrTZF0iMaVAkiW+pidO3u72x6vBtl0qhQGXp6iXdf4dQyt7w7GhnyJzucn++zTDkTiMyZgYjGOuI
	0nc3Kt1BYtNhRnGMDU7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6BaV-0004Bo-QP; Tue, 19 Mar 2019 10:03:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6BaJ-0003sJ-5v
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 10:03:11 +0000
Received: by mail-wr1-x443.google.com with SMTP id y15so20286028wro.4
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 03:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=E9BFs8WkH/ZGJB9LSb1nvBGbYjMHBI/Uj54YuFoNLC8=;
 b=YWsbwxL1xjRzrxX+nlNT7HrJJfAPwnHZ5G8QbtwUeV3vUQ84CL2o23if8K8p8w9yQY
 3ir2tlvkjAAEKkzxd3VmequdImIGWBrz5YCjTo0E/H+A/Lgl1PJji3uutyV1qwCFdhCn
 PRuAtW+g2U0JGiNnWZkbT+rMiy9Slb0CBSwTyTQw999SXj+CfRBumgZ92WYRPn1iMGL0
 GIOLYV1RZ9BS4MOaLrGAVIxQ36oBel29a879u6fVG4JL7/7Llzk5+noFU1gd2BBBlAL/
 Pi95ya+tklzngR8goD0JpEUUcqkMZbxBRCoL4VdqYjPHOpQp9U5HOvjX1IQGRXG+74tY
 uoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=E9BFs8WkH/ZGJB9LSb1nvBGbYjMHBI/Uj54YuFoNLC8=;
 b=V2YbONb0RkgzmueOPWFYPa0HEZx//Fwhe3bgU6eOHnqj4xbKnyCBWWkp1WJgRw/DlT
 eT5UzQIedRAEvHnYekg5uopSCrT8ehvgjb+ZjCNNeH8nkJD2+/ikd+2ZpFj8tllFQcW8
 0/wvkFrop15k8/HOuB9ODs2hBm1zUF5g+zXc3R1zwH7W10xW13fmBVoaphx+rwYS4kL4
 7vpJCZDuiy58eoHOxb+YT1JI8rskMT5ryFC23a70af3A1ghoqL10A2JP1kYTpqHhci9x
 xcI6KuO62KbYxidtzz3RPYmwzq+LP6v7fKPY0TRFlbUAPBQI53I8ljL5y8TUxq+Pn1cH
 V3FQ==
X-Gm-Message-State: APjAAAVcIsOL8QwTq6T4g5yyeIpgJl0uv7xngxksGvwwbLt0DqMaZjpW
 sLYcr4P/rgmD+ZCT97JJXl8ZxErYLtY=
X-Google-Smtp-Source: APXvYqxM1xIccWBhSIGn/XeESj1+Y6oOlzcW2U8kYHiIlGRHafNuFiXUMplGO6PaMfCeGCVm7u5nOw==
X-Received: by 2002:a5d:4750:: with SMTP id o16mr15841745wrs.238.1552989781415; 
 Tue, 19 Mar 2019 03:03:01 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 q17sm9257796wrx.38.2019.03.19.03.02.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 19 Mar 2019 03:03:00 -0700 (PDT)
Message-ID: <697115c457a70b458bf7514df72e802fc78e467e.camel@baylibre.com>
Subject: Re: [PATCH] clk: g12a-aoclk: re-export CLKID_AO_SAR_ADC_SEL clock id
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 19 Mar 2019 11:02:58 +0100
In-Reply-To: <20190304105358.4987-1-narmstrong@baylibre.com>
References: <20190304105358.4987-1-narmstrong@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_030303_902062_492CAEEF 
X-CRM114-Status: GOOD (  11.07  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-03-04 at 11:53 +0100, Neil Armstrong wrote:
> When submitted v2 of the G12A AO-CLK IDs, the SAR_ADC_SEL ID was moved
> to the internal non-exported bindings, but this clock is necessary and
> mandatory for the SAR ADC bindings.
> 
> Export it back to the public bindings.
> 
> Fixes: be3d960b0aeb ("dt-bindings: clk: add G12A AO Clock and Reset Bindings")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/clk/meson/g12a-aoclk.h          | 1 -
>  include/dt-bindings/clock/g12a-aoclkc.h | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)

Acked-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
