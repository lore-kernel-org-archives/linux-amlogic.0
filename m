Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AEA6C25B79
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 May 2024 13:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGqA0kTQjvo3GPrMZcvweV2p56wRCrQsaVpsJMVSDkQ=; b=dRafAEVOeR8sxR
	+4nPMzjr2hpMIMcTB0AVtdgsjpViwi4BbxhiD7/+oufuyGeguP1E7faKWyuOdjMAxtya3Mz2YvTLZ
	I9rDOMA1nZ74nf2FmsbGLIbE89DRWBY60YE3dZqpy+vPe3VOmUcH81ThZUd0vx1ZWMZFbjb/hMQxF
	0l+kDlDUCNlKwoMuv0950CPJrMQjQz+2Gvk40b+P0Vu0m1jnPJ786J7SIpCd3f4D40o48AmrLJs+p
	X/TBeX1ikvESYKeUc55FwuVp6gq12b5x8u6tzc85PSgSCNPI/76IJt0JlI3lNlkFpn90OJyQ6/oau
	uoc/LNSlkAIizfLLK+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ES3-00000001bW7-3jda;
	Wed, 15 May 2024 13:13:47 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ERy-00000001bTD-0WRq
	for linux-amlogic@lists.infradead.org;
	Wed, 15 May 2024 13:13:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-420180b5838so22102815e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 15 May 2024 06:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715778820; x=1716383620; darn=lists.infradead.org;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=M91H+nHHqkLBLg1QqXRG3fezduhANXnoUy1GZJinJLM=;
        b=Y/YlbP+eM74lVz4pysA75OdYCEOkCvWImDc7S47cHpr6qDMCrh+cBVh3Hd43OFiPlL
         H1/sRVnMZeQJE6p1QoP0bY3DJlDzdHHqVN7SzhyAVp6sSJrl1IfqxGNrUOFXU044+Iq2
         WOHLanXHDFpVP7nG9567CepZqwUEsfTMlCyiCFigyqM3z2zvlvRTzyvmZxO/HWmnTIHK
         fo8yDRSqXDvUZxZHdbwnPk1ni+n8kcK3K15LovGkT35ZdDavjLa98ruonMGMhJ5eovWv
         IlJsDxwkhPJFW6kIo+J3ZKTrD6ycpg3Jj61DTAIsnaU6a54isvpN7ZwGq4ZltTjmx87j
         yWIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715778820; x=1716383620;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M91H+nHHqkLBLg1QqXRG3fezduhANXnoUy1GZJinJLM=;
        b=s+XJKspIdll0ATRCqdGD7lJpu14MCI7Esy1m2u6XpBJ3GWB8eMHHpuXGaHm9TU3NIo
         s7sH9+lQsMF9+XH20FPbOR8YUASTeJqRAWgPVHHlUVyoXb/COKZKvQUTYv85hrVnNSZI
         jpyHvfii7DpgAVpwJG6tdwzR+w1zvjFQReuSdRmHWQHMdjAnVsG1cGy+i6TXNDydGaXc
         pjWfCAFj1rwLvNdKPoAoNUuAd+LP6uP0T1Q3Q0T+FWBjaq8MsLrb+fHHsOtKnU6CsrMV
         XL6iwp4ljZeXgvXEbzETogfM4FAXK8nOY1FJ2Mojl38o73ShK30TNT/6XGoxppRk/of2
         KcyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQoNtMh7m0IeCgdOIYK+PRDFERy/tDgjyJADLY+hVN48qfFw74tsgn8MtyvjK7ko9498llYZ9EkWbwuxkjJ+IIWctjTgtsm3niXwasIBA2/r4=
X-Gm-Message-State: AOJu0YzfYtMLYOSuOYTuYwVYXBEh6q/o5JN0GxLMESR3KH6n2dhjkaTV
	/YasEFurlwCQlAsijEFskD2VfMUynEw1k8Na0WGsviQeNApIvYz3ab5SNK3o/O0=
X-Google-Smtp-Source: AGHT+IFGKx5BSWfW3mhzW8qqzYmSwVybzwb9nvOAxYK14fvZAmTCWSio0KnxCN2xyBvzkP9/4QqX4Q==
X-Received: by 2002:a05:600c:1c9f:b0:41f:aef0:9349 with SMTP id 5b1f17b1804b1-41feac556f1mr169219155e9.25.1715778818567;
        Wed, 15 May 2024 06:13:38 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:2893:1a8f:5988:776a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f88110fedsm270535765e9.31.2024.05.15.06.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 06:13:38 -0700 (PDT)
References: <20240510090933.19464-1-ddrokosov@salutedevices.com>
 <20240510090933.19464-2-ddrokosov@salutedevices.com>
 <1jfrulzxms.fsf@starbuckisacylon.baylibre.com>
 <20240513214728.g4isbfisifxalqxy@CAB-WSD-L081021>
User-agent: mu4e 1.10.8; emacs 29.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com, jian.hu@amlogic.com,
 kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/7] clk: meson: introduce 'INIT_ONCE' flag to
 eliminate init for enabled PLL
Date: Wed, 15 May 2024 15:12:02 +0200
In-reply-to: <20240513214728.g4isbfisifxalqxy@CAB-WSD-L081021>
Message-ID: <1jle4bxloe.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_061342_173406_3AF2D61E 
X-CRM114-Status: UNSURE (   8.55  )
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


On Tue 14 May 2024 at 00:47, Dmitry Rokosov <ddrokosov@salutedevices.com> wrote:

>> 
>> I agree that currently that carefully reading the code clears that up
>> but it is misleading
>> 
>> CLK_MESON_PLL_EN_NOINIT ?
>>                         
>
> I have been considering this name and its derivatives, such as:
>
>     CLK_MESON_PLL_SKIP_ENABLED

>     CLK_MESON_PLL_NOINIT_ENABLED

That one accurately describes what you do.
Use this one please

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
