Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32365C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 12:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sp8Lgqh+8oAX4lkvfjcBFDQSZprM+o84f/kBUZNfGgI=; b=ysIz53hztPATBIMdPf7uorUcDu
	DRVHt0Yc7ItjR5e1wZJgG0W0IxS3Ys1zQZsoLxM9qtNI1wOttMoShA+Dowc+GG6tB4w1tyLIYYie1
	F5/GEKZmlLOtLNaR2/fCtCiG05Zh7sOPQ5F8T4ccC8M6rQiu8hxzY2ckZBhJJEhlj/LUhQIvHUjGx
	xzvC3/tbt9r9GPEuEfa+rguvg/z1YfSbfzT9Hd9vGykcNdmJuIcTgvNzY8OewIvvD03Lk/5+CyqBV
	m0Th79p4aO1zZ9hpbi9RALVEHL5XF6tHnG4RBgkzojhWH1exffQUU/2ZEBaaEKApPXIqn87DDuVHL
	MaAUOlzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peENz-008waA-2z;
	Mon, 20 Mar 2023 12:13:11 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peENx-008wZP-1I
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Mar 2023 12:13:10 +0000
Received: by mail-wm1-x332.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so9023332wmb.2
        for <linux-amlogic@lists.infradead.org>; Mon, 20 Mar 2023 05:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679314386;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VZ0X6jmUNaOvsLyUYKl66gni2Y7ka45Kqotk1h52cKk=;
        b=lee8vGTczavFcLXcoF5bnYVyGEDe13+Xfd+0rADI4WkR093pf8EtBlJP1GXLPhKVnA
         M6hKN2nP4M4JKvHZ4kmbYgT3f/UQzkOH8GErpvHt54BsgBGUWjN2I3mS7Zaku6wA33rP
         p0uKKNcaNdNkyLSd2qrjll+bAmGYIyVy/X/cuSF4C8dcOWDLjcY16mGllPldtlqn37oH
         Iyw2bICDeINcfuWv6rMr2qMJiXu4Dia7ifCSaDyll+ZEhr5LHXIit5V+2lD7t4m6Zl4E
         SW9VL/Bi+2KnEiEm2uGfbyKYTshG+UKJPkQU0r/uRjcUmS2UwufQKrzhzjvjwl1rA0eJ
         G3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679314386;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VZ0X6jmUNaOvsLyUYKl66gni2Y7ka45Kqotk1h52cKk=;
        b=sSqByobWCKpKbkvotWP1Diy80gTlWFITAOT7+QkJPrQrpX13iMiR9jqW4KGjgyH3kY
         syZcT/Gp0LbpuCO03+KJ3FWtB3jZr5psMCoO2bydAx2uLn+X7ZcPU9UWmviFcInrogjy
         paKl0fovkSwt/9TM0ICc+nFNtQqI9rTm+LPKUv4P1D+rAN7l8hwpAcmTdoTDUpO2CErH
         sTnBdUZC7qphQ6XPyfNi7vn4zwMvv3CVr6bQIx5xsFY7uXSJbwwZioUtI8Px1JA4tOIw
         KUtVCnBTV0BsawT50QOX4BpLKUojtcdW+JBSvpR6ofQoXiyZMY67CaZQIa74Z8J58mcT
         3T+w==
X-Gm-Message-State: AO0yUKWmxKf438nMDJMrKtKf+jaTjkFoi+vvg44ZRxO1NfDrPGOuwELx
	aW1W8LfjbEvVRgxvSlu75y3CgIauwqbM/39b44QxNA==
X-Google-Smtp-Source: AK7set/wgd/XPEiglcxUuVD7GvekZo3NU1qnqsoqg/nCW5LoyifwdnIo/j1Tsk9b5DTN+nCEPEEnFA==
X-Received: by 2002:a05:600c:a46:b0:3ec:4621:680b with SMTP id c6-20020a05600c0a4600b003ec4621680bmr29542206wmq.14.1679314386143;
        Mon, 20 Mar 2023 05:13:06 -0700 (PDT)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id x6-20020a05600c21c600b003ede3e54ed7sm4014807wmj.6.2023.03.20.05.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Mar 2023 05:13:05 -0700 (PDT)
Message-ID: <5e29634d-0751-5b1b-5bfa-4a85f536f672@linaro.org>
Date: Mon, 20 Mar 2023 13:13:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 30/33] doc: boards: amlogic: add documentation for
 BananaPi CM4IO
Content-Language: en-US
To: u-boot-amlogic@groups.io, christianshewitt@gmail.com,
 u-boot@lists.denx.de, linux-amlogic@lists.infradead.org
References: <20230320114609.930145-1-christianshewitt@gmail.com>
 <20230320114609.930145-31-christianshewitt@gmail.com>
From: Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20230320114609.930145-31-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_051309_449607_02444A22 
X-CRM114-Status: GOOD (  10.62  )
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

On 20/03/2023 12:46, Christian Hewitt wrote:
> Add build instructions for the BananaPi BPI-CM4IO carrier board with
> BPI-CM4 module.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   board/amlogic/u200/MAINTAINERS       |   1 -
>   board/amlogic/w400/MAINTAINERS       |   2 +
>   doc/board/amlogic/bananapi-cm4io.rst | 152 +++++++++++++++++++++++++++
>   doc/board/amlogic/index.rst          |   1 +
>   4 files changed, 155 insertions(+), 1 deletion(-)
>   create mode 100644 doc/board/amlogic/bananapi-cm4io.rst
> 

<snip>

> +
> +U-Boot Signing with Pre-Built FIP repo
> +--------------------------------------
> +
> +.. code-block:: bash
> +    $ git clone https://github.com/LibreELEC/amlogic-boot-fip --depth=1
> +    $ cd amlogic-boot-fip
> +    $ mkdir my-output-dir
> +    $ ./build-fip.sh bananapi-cm4io /path/to/u-boot/u-boot.bin my-output-dir


This should be bananapi-m2s since the same is used, or we should duplicate it for cm4io/cm4.

Neil


<snip>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
