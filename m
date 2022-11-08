Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60C36C433FE
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Nov 2022 08:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1k1KUtuSiIhBjoU6FwPajme9AzdplK/oMjcVCQC3oMY=; b=tGHhToR2DF+Pr5ju+USzFdUMr2
	wZze1XUXHaFUZXR7BrIHOeoso5Qp2ycS73JQ3ilI2nMaElbm9+Q0uF5599Gkb+clSqO+HFjhCQzH8
	vZEmDIaEqhS3Q8J4uXDdAwMWIdc/C9duoN/Ud4Gdic9caMim0PxzOORp7sYQByFnhE5THBKKgXCtF
	7842LemxN4yT9pRRuI7n4Jqqcwoag4MFM3QQkZYKADpQOHneFZmeo8iFABypF3ki6SpfiZoywxH3d
	InDbll3G6354VwWdd34hBy3CLOLQscjdZpeYubQtHUIv3fofD5EBHie9Cp+94DqVELwrBzNCqUp20
	iOekrjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJWv-003WPJ-U3; Tue, 08 Nov 2022 08:00:21 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osJWj-003WI8-1A
	for linux-amlogic@lists.infradead.org; Tue, 08 Nov 2022 08:00:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id k8so19671978wrh.1
        for <linux-amlogic@lists.infradead.org>; Tue, 08 Nov 2022 00:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fGYN+OrKT+Wc9wa2H+f4cBj9a1gnXGucm2/MFJDAUEc=;
        b=KPJ+SqQRh8tNjrsB5SkSC9KV2x2xGFHIyLgZfEOJpdw3Yxoo9TtC6O+xjN83h5XPO4
         ngNCAv2q7dq8xTKelxpfeeNVqwjNIyWc0LYFMi0RQV4BodG1UpieV07QKuLr9D+7u9MS
         TxZ4xxEWfwqoJRwkmNAeUW1QA98LsovE4aSGMV4iHKZqikZQsl2LcmZ36SToHcRwvr8Z
         epetrH3no1C2nkkZwdLIeICANve+uAXLdxAUf3cH1PgULUdLPH458ESTqagA7AFGuTq3
         6Y6ZJIVSlDzHAhjKg8IXR90sYx6ou7iGXiRj286uSJr0MbDlVMHmAv+KKx6RV5PyoN82
         ob+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fGYN+OrKT+Wc9wa2H+f4cBj9a1gnXGucm2/MFJDAUEc=;
        b=K76EvbVQkCRZ02hSg1k6nHZ2mpuMWQl1Z7+nFS7p4Ptr3rFCwLSMcfP7+L8C9EJhc5
         3FSgAf3u+kBm9r3aKpyqHDh4A3W5gZJadf5pVR++3XsUAZ5nYlSVglyzAUCEZcui5+uG
         BgL5cu+hHrOLDqTV2ctrdVEbcNHvwyesdO78TL7LOD0Bxy/GEJXav9049M8do0RsjHq3
         RgvqMdh8AKIYw8JIopsZ2M7JMh1j+NR+dhnTtEs+dDGDMfl4mFZwGRRKOSe8Evln6YqM
         H+vivfrcRsopW50xY0300puV9geJYlgmHbnKglL06zEoYSfCQLcpCHoLmr0aiu5S951L
         bVqg==
X-Gm-Message-State: ACrzQf18Fqt02diiBqx7dyAQIhd3q6LiWmth2r2U5f6mK8O5rIkzaBsD
	pyafvXh53k963pjwQ/LgQX2kxQ==
X-Google-Smtp-Source: AMsMyM5rSN3xNF9uAe4ahnLY/NH+GZ4LiIgAn2zN32iu4O9cN0kCn8Gk1Tuj7s5Nxk6WIY9DJOxHNg==
X-Received: by 2002:a5d:4ac8:0:b0:236:781a:8d2d with SMTP id y8-20020a5d4ac8000000b00236781a8d2dmr35171464wrs.715.1667894405980;
        Tue, 08 Nov 2022 00:00:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:69c1:baa5:e978:60e9? ([2a01:e0a:982:cbb0:69c1:baa5:e978:60e9])
        by smtp.gmail.com with ESMTPSA id h7-20020a05600c314700b003a1980d55c4sm14468146wmo.47.2022.11.08.00.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 00:00:05 -0800 (PST)
Message-ID: <64cbcad7-0b71-3bbc-a6d2-08f1cefdfa5e@linaro.org>
Date: Tue, 8 Nov 2022 09:00:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] staging: media: meson: vdec: use min() for comparison and
 assignment
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <Y2lYWWKkDa73gcqm@qemulion>
Organization: Linaro Developer Services
In-Reply-To: <Y2lYWWKkDa73gcqm@qemulion>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_000009_147796_9C624D6A 
X-CRM114-Status: UNSURE (   9.54  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 07/11/2022 20:11, Deepak R Varma wrote:
> Use of standard min() helper macro is preferred over using ternary
> operator for logical evaluation and value assignment. This issue is
> identified by coccicheck using the minmax.cocci file.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>   drivers/staging/media/meson/vdec/codec_vp9.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)

<snip>

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
