Return-Path: <SRS0=QqPF=Y7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA4A3FA372C
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Nov 2019 02:22:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86F132187F
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Nov 2019 02:22:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SXc6P5+O";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dUnfjWKT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86F132187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+CvNoMQ+Q7iSBuXJ4KobWinynnIs1zrw6c1D25sacg=; b=SXc6P5+Oo5ekGR
	VT6LpDvPMxrefAmfUd9BhM/tUteEZQjLdrvatg+18hG9iZhkaV/7OutAZLIvK2XDkmEvckOUPSMAY
	DvX6Ef8vFPNkrdHdBoHmnBuL6BSpxkjnJJNWYc0CNzsyhgA6RbyL/hGbgbvrx3jCJeDran1Plm8kc
	nohWy9iBMlXbxQehfUvIjIWRdynB0xJbjzWbf4XPMBMRGkm7aghD70IQ7qgXpsqWwYmZ4bpSQNDG7
	3wpS6t5xyxUyrZV6E4cqjgF7qWYGSRfhRV3gDrU6hZ+p39B+CVsEJpvDWIeV6mFMQmfDgUeR1MS/7
	JC7LkVQs4o24SAJDfe/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSXRH-00029F-Sf; Thu, 07 Nov 2019 02:22:23 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSXRF-00028n-13
 for linux-amlogic@lists.infradead.org; Thu, 07 Nov 2019 02:22:22 +0000
Received: by mail-pf1-x443.google.com with SMTP id c13so1144843pfp.5
 for <linux-amlogic@lists.infradead.org>; Wed, 06 Nov 2019 18:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0Dwg4nKN26FTiz3kUQPPImpGsNBhOzcTkcdPORnJLCU=;
 b=dUnfjWKT55TBryM45O4ZQx3XbW/rctfANSlGJkwmKfWyFpMd6/ERRFv1RqpxsjC9sN
 iKqoJMRqSRKsWOcZ5lDMh594AgBhFYSoDO/ROBA+8peEFIJJNUAWz6ZjTNcTCPiQVun6
 IvyxnKJyZCQLggi+j/1UGxoPpmYPxzdJmyOKOpeMElynMpJndl2vvRzcIoFZKboHPVaz
 liWSc+Gq8LdhDEyHMdjULMp3bPF9g/qz8Nu8tct8ME6rUjzDHbM844Q7T3NCHG+5NCIQ
 qJp8mX1abIhCqhvY2IBV7epdx+ZdUxnokVEkcyAZWvQ7UReSZTzb1Ana+Ni0sI6heBqe
 iITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=0Dwg4nKN26FTiz3kUQPPImpGsNBhOzcTkcdPORnJLCU=;
 b=r3LSqM0NHx1wKYPMhZY1+QDXfsIxWIkISXUCfNdl6WZvRde0EvyiLVZTAJwqhA5qjs
 yZRuyhkluDU5hUrboLYioR/RxUYA5clY9Km4s05Bmzle8AkQvYvGlbNqhM55GqZYSGfx
 KmXr2e1CC20M3KB0zzJYpBoXgZkQ0hxe2i8a2Q2a6iNCvGf4Cs5U+w7UFawqgotWTaRk
 ewY1R9R9gRIm4UTRP9wSfAKx86EY/x3u6stLm+gpN5/jsTZq3uT18Z//ce6CVNW5+Z9S
 aT+PqgffJJdlAncSZq50WfiCMPWVCjjfOTjXre9ekw1N0a/by3lV1eMgZFV1haPh+DN0
 nQGg==
X-Gm-Message-State: APjAAAXXdmZrvWNiqcz9uTX7BGORpoYp2ImWSA4UC4izpoZK5YtcEgkm
 pJ9ZuvnsrhEU2LbTrKWo4kfD2g==
X-Google-Smtp-Source: APXvYqx6sPgPssAsJK6MK3EweF+OP9VsrDLjnKNnBoMpc6WKMKwCRX0ayTFftLjmp1KSHStUzMzYUA==
X-Received: by 2002:a17:90a:cb8b:: with SMTP id
 a11mr1570656pju.79.1573093340492; 
 Wed, 06 Nov 2019 18:22:20 -0800 (PST)
Received: from localhost ([122.171.110.253])
 by smtp.gmail.com with ESMTPSA id f8sm400297pgd.64.2019.11.06.18.22.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 06 Nov 2019 18:22:19 -0800 (PST)
Date: Thu, 7 Nov 2019 07:52:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH 10/11] thermal: amlogic: Appease the kernel-doc deity
Message-ID: <20191107022216.prhwyxvxpabpbuej@vireshk-i7>
References: <cover.1573046440.git.amit.kucheria@linaro.org>
 <2fbace543c7a45799f29f87d9aee82f2ed1a7dbe.1573046440.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2fbace543c7a45799f29f87d9aee82f2ed1a7dbe.1573046440.git.amit.kucheria@linaro.org>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_182221_072693_41F05879 
X-CRM114-Status: GOOD (  14.26  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org,
 Amit Kucheria <amit.kucheria@verdurent.com>, Heiko Stuebner <heiko@sntech.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Amit Daniel Kachhap <amit.kachhap@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 edubezval@gmail.com, Kukjin Kim <kgene@kernel.org>,
 Guillaume La Roque <glaroque@baylibre.com>, linux-pm@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jun Nie <jun.nie@linaro.org>,
 Javi Merino <javi.merino@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 06-11-19, 18:58, Amit Kucheria wrote:
> Fix up the following warning when compiled with make W=1:
> 
> linux.git/drivers/thermal/amlogic_thermal.c:78: warning: Function parameter or member 'A' not described in 'amlogic_thermal_soc_calib_data'
> linux.git/drivers/thermal/amlogic_thermal.c:78: warning: Function parameter or member 'B' not described in 'amlogic_thermal_soc_calib_data'
> linux.git/drivers/thermal/amlogic_thermal.c:78: warning: Function parameter or member 'm' not described in 'amlogic_thermal_soc_calib_data'
> linux.git/drivers/thermal/amlogic_thermal.c:78: warning: Function parameter or member 'n' not described in 'amlogic_thermal_soc_calib_data'
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
>  drivers/thermal/amlogic_thermal.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/thermal/amlogic_thermal.c b/drivers/thermal/amlogic_thermal.c
> index 8a9e9bc421c68..ccb1fe18e9931 100644
> --- a/drivers/thermal/amlogic_thermal.c
> +++ b/drivers/thermal/amlogic_thermal.c
> @@ -67,7 +67,11 @@
>  
>  /**
>   * struct amlogic_thermal_soc_calib_data
> - * @A, B, m, n: calibration parameters
> + * @A: calibration parameters
> + * @B: calibration parameters
> + * @m: calibration parameters
> + * @n: calibration parameters
> + *
>   * This structure is required for configuration of amlogic thermal driver.
>   */
>  struct amlogic_thermal_soc_calib_data {

Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
