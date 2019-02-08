Return-Path: <SRS0=3vaB=QP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65189C282C2
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 00:32:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 319AE2080D
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Feb 2019 00:32:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4TNXtLN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wxLlntPq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 319AE2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/bQWkOTYfUd6DUwgPsKb9lTgOzigo4eu7BEeo3MiaU=; b=s4TNXtLN82rAVC
	XwdnEONPoLKLborsrh/h6Mb/TRG5sy3+tGe5PkRYfQkNbdrwuITMtqAjzzum3/qMFXieAHfkzpDXv
	63PtkPs3ytOrYPor+Xt6KY+skyu6ZXM+dpFyx/iTDS9v7U57/32DpsB/o6xFP2bmyPbPFbPZzZOEq
	ItGjff1Mf+VBSs4qPzF+44lTL/VNVsizLa7e3VcWIfD0YpB8ryIc+pGq2i29J65HWz3OsVVQv5JH9
	mQq3z9YCkBgRYyLKb5mQIP3X2+BCykXKNAVkNxdAlRJrEN9U3QbYd8WvFBAzPZ+lsrqixllUvZdAJ
	hPHlofkZvRzRESnoz99w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gru5J-0002P7-BI; Fri, 08 Feb 2019 00:32:01 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gru3u-00017H-H8
 for linux-amlogic@lists.infradead.org; Fri, 08 Feb 2019 00:30:58 +0000
Received: by mail-pg1-x543.google.com with SMTP id v28so754513pgk.10
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Feb 2019 16:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=7S52tSANvStNoXW0WQ36+UsE+KrxcVitS5RILjsG2Rs=;
 b=wxLlntPqF3hw5HcVUT4Uo8fC0zp8kVBeWdsXIK8VgDh0wHsBNx1SL+W2ZcrFugtQwj
 34dEwKPa5aGl7JeQz4Zr3e1KeeQoKS4PsdyRxPa5F1b6fFW3hez99X9GftDbqDO44udW
 EeN13mmEb6/rplIGjSCTMzdFOS7McaHduPfgKOW0r4zY1Oc+RVaFHgCVUnhJCl9XjErQ
 UAZw2LoS9xN1z7U/RcQKb4DJDWo/BITDoELtwXbnvwOBfqKDA7rJ46FL8OG6IZ8BOPlh
 g8iV1j2Bmqhn6FznMKS1Xe4unyYrVF+6gAnvT7GRTsbkV0nOUAB2dphhEjAp0+7w3fPu
 T8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=7S52tSANvStNoXW0WQ36+UsE+KrxcVitS5RILjsG2Rs=;
 b=avteWb4P4aPi2iLCfkYo8TULd8teH/5OqHvkiC7lmfpJmyOwJH5vFrRjCWgrbnetew
 X+6UPfwaKzsGCDDfPsKbr5BN+dU7eoY4idZ7Xvay4A9DmcFN1urtGCFSfA5v2cv587cS
 1tTYU/wan4UUaz7pVMCjkb2qYRASWgGvZHyfrJaZsN5LuSPjfLRjdbYXZl+Evd4Z+4u6
 2siaT1M7YEJM7JhR6JlaXIm87RjkCtjLbsy7odmfgQo67phQoNfZ+fiTnSOcgA3wdrSG
 JpyCc9c68yaw5WTvgQN3S2bzRh+7Ujq+anp6fpf5MJtk1esIRCRojY2hoOdDcE36tGIf
 GAnw==
X-Gm-Message-State: AHQUAubA8wmOGcyMjQ3edgJlpgfHc1+vO/JozTNWnzUTU3ShiANT5821
 Um97IZSK7zqVgE3O9oRFaG4BQwIWqsw=
X-Google-Smtp-Source: AHgI3Iacn7cfZS8n6FK+FM9vJoGuj1NVYzdEqSF1aCfM0VmNR1kr4OSXJqQlxLJjIhjbrVoVWXeNUg==
X-Received: by 2002:a63:2c8c:: with SMTP id
 s134mr16359331pgs.269.1549585833487; 
 Thu, 07 Feb 2019 16:30:33 -0800 (PST)
Received: from localhost ([2601:602:9200:a1a5:1818:ce94:f47:7c12])
 by smtp.googlemail.com with ESMTPSA id a13sm321291pgq.65.2019.02.07.16.30.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 07 Feb 2019 16:30:32 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Maxime Jourdan <mjourdan@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] soc: amlogic: canvas: Fix meson_canvas_get when probe
 failed
In-Reply-To: <CAMO6nawKrH3d2X=TikdJy8yjiPyuJJRnpaBjyfPYuRx3d=7vVA@mail.gmail.com>
References: <20190204094937.22763-1-narmstrong@baylibre.com>
 <CAMO6nawKrH3d2X=TikdJy8yjiPyuJJRnpaBjyfPYuRx3d=7vVA@mail.gmail.com>
Date: Thu, 07 Feb 2019 16:30:31 -0800
Message-ID: <7h4l9fglzs.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_163035_007561_AA44C768 
X-CRM114-Status: GOOD (  13.27  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Maxime Jourdan <mjourdan@baylibre.com> writes:

> On Mon, Feb 4, 2019 at 10:49 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> When probe fails, a platforn_device is still associated to the node,
>> but dev_get_drvdata() returns NULL.
>>
>> Handle this case by returning a consistent error.
>>
>> Fixes: d4983983d987 ("soc: amlogic: add meson-canvas driver")
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/soc/amlogic/meson-canvas.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> This fix depends on "soc: amlogic: add missing of_node_put()" at [1]
>>
>> [1] https://patchwork.kernel.org/patch/10794545/
>>
>> diff --git a/drivers/soc/amlogic/meson-canvas.c b/drivers/soc/amlogic/meson-canvas.c
>> index 87a6c6e23591..151aa84bc593 100644
>> --- a/drivers/soc/amlogic/meson-canvas.c
>> +++ b/drivers/soc/amlogic/meson-canvas.c
>> @@ -51,6 +51,7 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
>>  {
>>         struct device_node *canvas_node;
>>         struct platform_device *canvas_pdev;
>> +       struct meson_canvas *canvas;
>>
>>         canvas_node = of_parse_phandle(dev->of_node, "amlogic,canvas", 0);
>>         if (!canvas_node)
>> @@ -63,7 +64,17 @@ struct meson_canvas *meson_canvas_get(struct device *dev)
>>         }
>>
>>         of_node_put(canvas_node);
>> -       return dev_get_drvdata(&canvas_pdev->dev);
>> +
>> +       /*
>> +        * If priv is NULL, it's probably because the canvas hasn't
>> +        * properly initialized. Bait out with -EINVAL because, in the
>
> Bait -> Bail ?

Fixed this up locally.

[...]

> Thanks for the patch, I missed the fact that a driver could have a
> pdev yet with a failed probe.
>
> Reviewed-by: Maxime Jourdan <mjourdan@baylibre.com>

Queud for v5.1 with Maxime's tag. (branch: v5.1/drivers)

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
