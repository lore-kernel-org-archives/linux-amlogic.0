Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D458C04FDF
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Aug 2023 17:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=78uXhPUQTaLk6QRlA63rsPefJEkWMkjYc66R4IcFOC0=; b=45ct6h6m/nIpRO
	NA2HNB53Jzc6+pDSHL2tSPwmSkN+nc1JvKdTFrXQGbi7vUt/DaPbfu4UPZ5goFIH7dVmqEn7/8yeY
	w/U4LRxdctvBz7t/Fj7Dk9w0L0t9BvMBHyRdXK19dl1AMbQ362h3wyeRdisYnxqvIIIyMihX/vsLX
	TftfsmWoISTZgo2JQaf/6F7Q658FYIldkPM8KSn96dddgMbHndie+xeTPa3OJ3odd8IP2X58sBwB/
	TcDOiRlAU3D/+iFJDBgQ84ojNwlulRnTyL3cRfSv+AZAbTD1RqsgtIYyZdUTSBXnXspnNoZMxvKC3
	uAjkap/L0uOK+0PG1mwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU9GO-008GyX-2Z;
	Thu, 10 Aug 2023 17:15:56 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU9GK-008Gwo-3B
	for linux-amlogic@lists.infradead.org;
	Thu, 10 Aug 2023 17:15:55 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-564b326185bso738144a12.2
        for <linux-amlogic@lists.infradead.org>; Thu, 10 Aug 2023 10:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691687750; x=1692292550;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=32ZUxujmpJSome/A65uTZcodyyRgs2VAo6x5w7mgBVs=;
        b=i334aR4IxHtdDVJyaohlWVQc/j6a9UBCpsdp505Mp+Nqc/w88jbtG3lDOm0QccRaTn
         EE9VVpR61NeTtvq3wmXIugtlKvdqmaLkcl4wUCmoQNOi31juPf+aIPdRfi3OHZStFukc
         CRTnjtaFum1b6ji7lqhIGumq4W5EqdTneSE/D80/DAivYL3PrJJMnTGZ+qXKkyxznMTu
         etUFc8KkZyPLCBQMzqII/B8SPLFpbIXFmT+kM9vYnSWXkXltJjlFOrYIPirc6V13s5iT
         SWTV2U4xmAGIOP/Gwf4dw1U0wYCdHL33GYx0f4g/k9zNt1QjQJZqmC+oshvuuO8FKhSh
         V1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691687750; x=1692292550;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=32ZUxujmpJSome/A65uTZcodyyRgs2VAo6x5w7mgBVs=;
        b=bYWpVurlFhatjiau/10Jy1EM7txmlg6RHnS/068PrG857Zb8rQgYCqlpkEQ19jPNeY
         FLGSq9ors87/bq4QVtAHFaLm6F0TqtnSNhCYdBpb6ZzdqbHoIvFmcpoC5rkYjQwagMAL
         i6qY11PiTXQ0ZAYGhMPsH884uctftjetfGAObzqsLvcuocrdYCQY7+Z8tGUaeatDNO8K
         HIsFU9IMq051WRiu1Wor8nNbZAW7GY5RFlG7dGm5AMvN90NmiMVrbqJif4MDfeUCUqwK
         DEwegFRSiecIza+DgDmSAW+mHJP9n4FpTVNHLB0rYLRY/PCHOCsor/er5aXPgJ2gH7+5
         Pi2Q==
X-Gm-Message-State: AOJu0Yx/p5g+W386PVCzSliXhTHxcMtxM/uV5SQHVHnwVObOMnScq8Bh
	bFoUSUh/QIUyx1LANT1KNWp1zg==
X-Google-Smtp-Source: AGHT+IG5ZhcCCuUTJM3PLmOanfaqm5LUUpx95RMWdP/92q4df+YcFYOeFmSDTKb9jFQ4nAcOPOpkRA==
X-Received: by 2002:a05:6a20:8e12:b0:138:836c:5370 with SMTP id y18-20020a056a208e1200b00138836c5370mr3272854pzj.42.1691687750478;
        Thu, 10 Aug 2023 10:15:50 -0700 (PDT)
Received: from localhost ([75.172.135.98])
        by smtp.gmail.com with ESMTPSA id o12-20020a1709026b0c00b001bbc9e36d55sm2017444plk.268.2023.08.10.10.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 10:15:49 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: meson-g12: Fix clock order for
 amlogic,axg-tdm-iface devices
In-Reply-To: <20230808161755.31594-1-alexander.stein@mailbox.org>
References: <20230808161755.31594-1-alexander.stein@mailbox.org>
Date: Thu, 10 Aug 2023 10:15:48 -0700
Message-ID: <7ha5uyes3f.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_101553_227328_520A612D 
X-CRM114-Status: UNSURE (   9.40  )
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

DT maintainers,

Alexander Stein <alexander.stein@mailbox.org> writes:

> Binding specify order of clocks as:
> 1. "sclk"
> 2. "lrclk"
> 3. "mclk"
> Adjust clocks accordingly. Fixes warnings:

I understand this patch is to fix DT warnings (and thank you Alexander
for fixing warnings!) ... *but* the underlying requirement being
enforced by the schema here seems completely wrong to me, and a step
backwards.

Sorry if this is a FAQ someplace, but I couldn't find an explanation for
this.  One of the main goals of introducing names in the first place was
to get rid of ordering requirements.  Now the DT schema is enforcing
ordering requirements, but the drivers don't need ordering, so what is
the point of enforcing ordering requirements?

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
