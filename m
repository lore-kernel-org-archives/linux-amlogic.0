Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62813FF8860
	for <linux-amlogic@archiver.kernel.org>; Sat, 25 Apr 2026 16:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j4RRCI/Xydbo0sIXRnNcWej+D581Js3KbT+eUxkmpkA=; b=LoUh9iAsRwhgmu
	JKUgcHjeXkfz0L1LAvMh+JgCbrRsR4E572Extdt2vy6TMdLeYp+eAXnkgxJF/n7oSAxAcUvV+XL69
	4OG3Wq1ne/XO1aj3LVffhIr9i1y6GOwieIbrudC91vjo/5GI7DVrGwNM9SsaCepy56i0hXJTAKOae
	CnZxuiuiUQb8zxEuxZ9vT1UMfWbbmDdNsET7ffmnHDOnlN7yen9XhL9OEPmSm39ytXGyJD18cXXO0
	uspF1vPIoXXXHrGFV3yB+lxQSZabmc6rpfYh96j5it4ozf38LVLt3x2AuX58Uo7pc8TS9zHJSYx1Y
	OBbRaTJCub5eY0N7wJEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfh7-0000000EZed-2Hha;
	Sat, 25 Apr 2026 16:17:25 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGfh4-0000000EZdh-0zvA
	for linux-amlogic@lists.infradead.org;
	Sat, 25 Apr 2026 16:17:24 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-409de4132b5so5705891fac.1
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Apr 2026 09:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777133840; x=1777738640; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f0RshBZIRutdI+obaiuuk2MoPoQSldBM8MBOZQb6H5Y=;
        b=sa+XEsZZGG3I1WQaauyfxAJ1d4JmIlE9S0fcEw76h6OOm5zGDHoygnkUHQSdB6Hew+
         NgRPbkdD9i6bjhu5Kyf7XCbUdse8xkOon0v2s6aC8MGqkDY0dHqdqsZ8vxXK+bzEiBiC
         pxWCbGjNPrX7SPSWBK0wog6ZKEfQZfSjTHRR3YCPfTZCfBijJijKE1woYhXm3oeo0dyl
         4t0mzCk8d/7fP1QWCzEBAUkMhzjj3nRlCV6+dusR07hah3Mn4fjFm0DUVVxoSNROQ0MC
         GZ+6A4da7XoTeOp0aB34J6a6Cp/klIhypZ1FysIGnQfALd0F+keZsf13MtALWMpTQ6CT
         CIFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777133840; x=1777738640;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f0RshBZIRutdI+obaiuuk2MoPoQSldBM8MBOZQb6H5Y=;
        b=cUwWL6j4bODfoXJJPm5ghAEYEL1fvUDbHgKSzayNpVYM7UW8YbvpKCBTyncZByAIpS
         YRfjDdN/LF7bW7beNMva7z+8lejd2CWXE0rSLAYTeunrlGCatNP9WLhIkqGV1S3G07JJ
         6+etFhBnmHJivlGV+tR9jqDa7FMbaZs8mG1OCJoc3x6eylMaJBWZWTbgH9UvSgUHlBe6
         87ozXFZsZXevYOdLn7Zkb0fCNcA59i/0+zOl9mPBfeQiK8enIwQYvnBbC5MkFV5YMuWd
         jHA7wcETpSJnmECQCHIlwAhTP5cVsgby5dBrDBq5Gja0ANExjjfl+JjbOv+MV+6+GXI+
         rpVA==
X-Forwarded-Encrypted: i=1; AFNElJ9i9ag0DczO9B6F5sYePXvTtUeV82nDulvKAGiJeFFl1qB0B6cKTxe+r9cjDIkBaxO+wy4Ajs1RDOSsWvh1@lists.infradead.org
X-Gm-Message-State: AOJu0Yzztnag6FcI9d8Y7TRsfbPfg3yKTeU5EuyWU6AXWLnxrJ6kFsuz
	jYtiGsUwRX5S3FIti3ThOPOIswaEQtCXSY9O9+OnjDwp9X1ywGBJO4tZvPKVR92RbxcvQbo+NMw
	RbREk
X-Gm-Gg: AeBDietAs1IVVj8Qe9v83YiYYahdX7TXhweGMYe5VzTCIVvRBQ//39OvT+oG1+2RoMl
	4IA2xnfrYQBq7Og3gCpBIfN7/pePrZOOVzfklerWH8CgIpvxUkll7R6huG3wEXCR9J0a88KqJkl
	CNuIifmhcGM7l3q2uxSxsw8wiodJzzsaZ3hPI4GS4IVBS2MuodasuPhUMjRJ5qdx5P/+/rQaPUa
	DOcRux7tz/uhhZswAexjmcV0ZVtABpZkdPOYHqH31tXBWAzITBTijPFAE3PA4wLSwRSgZ//e9bu
	scmTzJEZWxuqXctKF5YZ1/xESGvNb9rxtBqrtR2NE9JGGjRsahOMhJkNWO735nl4/zfw9hiDuc3
	ncElx3uZ//FDA/QMvBlVPIPcOjNlIXoN6rkdNwv5FKLZ0FglEescNipPxbcTry4bjnO9fvKlcmH
	FTdoAY1bBBZYgyuS4rqkKVljLQiBgO2y6VwojSsuN18AGVwR8j79HJDXK8Pdfng9JdVHNBg8v0+
	jgn0yfVYeUW
X-Received: by 2002:a05:6870:9f86:b0:42f:cfae:b54 with SMTP id 586e51a60fabf-42fcfae0ec5mr9611847fac.32.1777133840390;
        Sat, 25 Apr 2026 09:17:20 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:4237:7c82:cb4f:1d6a? ([2600:8803:e7e4:500:4237:7c82:cb4f:1d6a])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42b930bd9f2sm21717224fac.8.2026.04.25.09.17.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 09:17:19 -0700 (PDT)
Message-ID: <84cae83c-2d67-4927-aa40-6c416d4f862d@baylibre.com>
Date: Sat, 25 Apr 2026 11:17:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on
 error
To: Felix Gu <ustc.gu@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rosen Penev <rosenp@gmail.com>
Cc: linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_091722_557664_87B47C7B 
X-CRM114-Status: GOOD (  13.63  )
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

On 4/25/26 11:07 AM, Felix Gu wrote:
> meson_sar_adc_temp_sensor_init() allocates a buffer with
> nvmem_cell_read(), but the old code leaked it if
> syscon_regmap_lookup_by_phandle() failed.
> 
> Switch buf to __free(kfree) so all return paths release it.
> 
> Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/iio/adc/meson_saradc.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
> index 23991a3612bd..9708ddcc4919 100644
> --- a/drivers/iio/adc/meson_saradc.c
> +++ b/drivers/iio/adc/meson_saradc.c
> @@ -786,7 +786,7 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
>  static int meson_sar_adc_temp_sensor_init(struct iio_dev *indio_dev)
>  {

Nice to see one of these cleanup.h patches that is actually fixing a bug.

Should `#include <linux/cleanup.h>` though rather that relying on it being
included through another header.

With that fixed...

Reviewed-by: David Lechner <dlechner@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
