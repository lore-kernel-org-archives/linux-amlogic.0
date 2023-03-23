Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4551FC6FD1C
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Mar 2023 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUoi6LvoSj6LDmAnF6S8+kLPJeZMj3+aYz3d2iYAXs4=; b=goEvB7OdhntMaLC1J2KA/loEDn
	qUZeSW7CPWT6piG+qLXLcgqjmSQlzI705Z7JupWH6XIHQ4klrVWuLS/cuAZP/7JF10zgosE8HUfoK
	23icWFokN7vfKlpV/lYrVpwxHcz5EB0pjoTmbcCRUnWmMPQN5DDF7VEGBtwlLGpQdvKdkH83S598j
	CsR/L1PE6FHcfS6ftOTPbhvUQv/bG8d2SgmAGbUxUvPPen5PstFWCSt5L7iUMJpYlDEc3/OsOEWlv
	jd+pIc9j8Ag2Fs9z956qyixTqBn1wiPI7VJDnvMkzt7j2RMTgzpLbMjF7EyltLSC03UC9qcfiqW2a
	rGp61i2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGcP-001JzI-35;
	Thu, 23 Mar 2023 08:48:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfGcO-001Jym-03
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Mar 2023 08:48:21 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o32so6571569wms.1
        for <linux-amlogic@lists.infradead.org>; Thu, 23 Mar 2023 01:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679561297;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GurEupKGuxcCAmolW+mWL7L/rx0OvQUf+1Zcf2lb9gA=;
        b=cAAHK7+la370gDR1wly25ZP/ODtunZsfjwgxXZ8YkJ9bVj0CFwn1mYxb72gKth6mF5
         DuY2f4nsAmHJvJC1NSgILSb9Awm6XucB3eXlfU47Q9OcMzJVLxws1PkSDgvewNTtmUzz
         2oN4tmwu0aysKGmw74uTHwsc0bdDaZn9gSj4byNwJ7/U+JqqkXT+rvYBtRPkGeLWvEgm
         mK3AHxcBw/sBygNdXhXkg2Ck5a3P3UeOlIuM9NLHsFaBqJN4c2L5Ru77DxfKzayVyQ6I
         USRMPtF9JR4FMO0Ssh/9NkB6vgMiU9WKFqSeVYny/J+35w/xKXhTs2X7ZDkUHqY4CTdS
         K39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679561297;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GurEupKGuxcCAmolW+mWL7L/rx0OvQUf+1Zcf2lb9gA=;
        b=0Z2OKhSuUevZrzg/5GoVebrvceYmQ1CiPgc3xLfKWmlpiw8g14VHvS4lgV0XKY9eGu
         bp89N96ZlPa/nOIjsyv1rWjMdDhoZ9zIGw/OmL+rgRq+M0s0QisshhFXKHAuNwdWXCiN
         78dFVPi9H12kCQimgUHnTnyuJb6aS6wypG7hVuS3Yr/ctZGyhZDv8pGmUIJ7Sw+kMqX9
         YBp3DUWU1bR1zLS7wNVr/nrgsIN0gY+g5HPOW45PqSwnAPIqrIq1H4+X9AKmK8NXu4de
         rZjB5Bq5hyDou5PgtLOOKDsI75c7xPGoD/nBNyFdx4PkCNsP6DY6AKTlSg2b3YIeNHSP
         vw1A==
X-Gm-Message-State: AO0yUKWHARs3glojwe9ktmqOsuod9Ck8Ls3b/4/RVM2szC75TB0WK3LP
	qrv3e1Nrmx+ujX+JluqqR5h/SA==
X-Google-Smtp-Source: AK7set+miH4i9hVKNVenbCTBskt8sRSGI2nee3Y+4K/pRd4KYHEYv6RiCtum0BpWT+e1UHRcbNSziw==
X-Received: by 2002:a05:600c:2214:b0:3ed:2b49:1571 with SMTP id z20-20020a05600c221400b003ed2b491571mr1553533wml.20.1679561297599;
        Thu, 23 Mar 2023 01:48:17 -0700 (PDT)
Received: from [192.168.7.188] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id iv13-20020a05600c548d00b003ee1acdaf95sm1207717wmb.36.2023.03.23.01.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Mar 2023 01:48:17 -0700 (PDT)
Message-ID: <ff2177db-db80-4f85-ef00-1335c3d60316@linaro.org>
Date: Thu, 23 Mar 2023 09:48:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 01/13] docs: boards: amlogic: add bananapi-m5 to u200
 maintainer file
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230323065458.776029-1-christianshewitt@gmail.com>
 <20230323065458.776029-2-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230323065458.776029-2-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_014820_063498_265E140F 
X-CRM114-Status: GOOD (  11.24  )
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

On 23/03/2023 07:54, Christian Hewitt wrote:
> The bananapi-m5 docs are missing from the file, so add them.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   board/amlogic/u200/MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/board/amlogic/u200/MAINTAINERS b/board/amlogic/u200/MAINTAINERS
> index 47cec234a1..919e349922 100644
> --- a/board/amlogic/u200/MAINTAINERS
> +++ b/board/amlogic/u200/MAINTAINERS
> @@ -7,4 +7,5 @@ F:	configs/u200_defconfig
>   F:	configs/bananapi-m5_defconfig
>   F:	configs/radxa-zero_defconfig
>   F:	doc/board/amlogic/u200.rst
> +F:	doc/board/amlogic/bananapi-m5.rst
>   F:	doc/board/amlogic/radxa-zero.rst

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
