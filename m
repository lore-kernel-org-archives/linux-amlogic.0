Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB2D7C004D4
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Jan 2023 18:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc1p+LVPbs3FXsHj+BAW17jvi7ZFBsDC5ipKKDbJJ/M=; b=OIsPz2BphceJbf
	zdWcEagGOKulYp4G8XSzLwCvbJb+HOSFg4vWm8hEycyUwsmvNOlEsCmvR05FQDe5e/wmeYAitBmFq
	abEe0R16prj1cjQUPeT7m+MTMY+DsnLAbj+b9Ui8dhMvVPhSQ89f/cff7gKp01pIjqirgSHVNKv2N
	5JzgdUfzLTsuQ7lFm2Kyum/Qy8rPHBVl6e1mhPzMfxF9/OXGlSRH15UH4ryzIUcfb+pFTTVJHDqRa
	RSmkClG37a13yPpkKS5su+39a/AbOCYzjc9lXVqhQsdmgY/F2jg/iEn/hd1bZQXADOGKWdiLHRLNW
	QeNListSTNikylkzlgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJIy4-00EIoM-89; Sat, 21 Jan 2023 18:51:56 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJIy1-00EInx-Cd
	for linux-amlogic@lists.infradead.org; Sat, 21 Jan 2023 18:51:54 +0000
Received: by mail-wr1-x433.google.com with SMTP id z5so7482721wrt.6
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Jan 2023 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhGQcLHDiDn/MigF1AOckbdyrSZTiOwmqbX0nNR9KLs=;
        b=IIQGkHkCLrpFxR4Rjunqfs9IqSlrgPaoj1vT8MvKQZx2yd8kPlmzTAkIHyQl0GpCyH
         Gm3oTpurtmuZw752nkUgHgkADJIlqJzxRn4yon8vk5yVN4ZMpFqrw3SngAbDOKOjsZ0M
         gTmV4sqFUZcZpoP7iTL/1dyAb4i6T8Z++fUyaEWhwiCx9R4t0bgNwdx4r3X4MJjpwQGS
         AjYbotND2uSX4Ga1ar3lBwkwrIxN6JQPH58GY+MXO6KEVFSlGNIcU7Ll0/zXHzNSgm3i
         EetDKVK7vS+kwtOBIJDy+eaMocS0Ny2u4gc3igIc0Y3BGWs8LTDsd1tkQg9ScL3Wmp4e
         THtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhGQcLHDiDn/MigF1AOckbdyrSZTiOwmqbX0nNR9KLs=;
        b=f6Nd1rvv8qd+MlA8CLdTgKY7jtkPWGHG8rh+84dEC7KFhHypof36qzAeeUcbrnsvj2
         71KCwT7RoQaG1wBCQn/JfWjYLQShDhXqPHF01TkZSpSjDhejZebaJqvF9euF5RMZSn98
         CyKsWJlami+LXKIGTRAzH/jVeHFjWU/vXgn/zXS5go6/FvPxFiKDleFfofS1a+SxWogV
         VFq42vuoEFZTilnQ8O1GNTE6wWn7TVMtGbQD2XEq8SX6GpyxHrD4ffOM4Q1xuwW2+4fR
         +SJlT++VqLIyl8T4i8iLXQYTW8StX2yCNxnD6yAQkrJhJbiHpU9+UW/QhRTA10uOpLlH
         eTJQ==
X-Gm-Message-State: AFqh2kqT2HqKd34zPNJMJsCGnY+bPBtKsNvfn0Yqb7kYgDIMvAc5BNsU
	TFye86PcLSBsNbYRcWcAPtE81g==
X-Google-Smtp-Source: AMrXdXu6DhBISJpEkeQsz5ci0pbMH/nhWcf8KpYLYGgadMkEglLBMsThCa40/rVRc8ROyeTXFR6iyg==
X-Received: by 2002:a5d:5b0d:0:b0:2bb:62bf:f5d1 with SMTP id bx13-20020a5d5b0d000000b002bb62bff5d1mr16802949wrb.29.1674327111852;
        Sat, 21 Jan 2023 10:51:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bt14-20020a056000080e00b0027cb20605e3sm15055656wrb.105.2023.01.21.10.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 10:51:51 -0800 (PST)
Message-ID: <d0bdc8f9-5ea8-5c77-3193-a2932c87156a@linaro.org>
Date: Sat, 21 Jan 2023 19:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 5/9] vendor-prefixes: Add VIA Labs, Inc.
Content-Language: en-US
To: Anand Moon <linux.amoon@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-amlogic@lists.infradead.org, Matthias Kaehlcke <mka@chromium.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230121175639.12818-1-linux.amoon@gmail.com>
 <20230121175639.12818-6-linux.amoon@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230121175639.12818-6-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230121_105153_494329_6BEA52EF 
X-CRM114-Status: UNSURE (   7.19  )
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

On 21/01/2023 18:56, Anand Moon wrote:
> Add the vendor prefix for VIA Labs, Inc. (VLI) is a supplier
> of USB and USB Power Delivery controllers for multi-functional devices
> and platforms.
> 
> Website: https://www.via-labs.com/
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3: - None
> V2: - drop Drop marketing, so without "leading".

Wasn't this merged? Didn't you get email?

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
