Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 922C9C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Jul 2022 16:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KTUJd3q8YUgJjRnApWt5TMWxJ+LLLAN0Qoqvlx0M/CA=; b=Kred7UlhRzq7gT
	IIZNmYZOFgFkmaIwi0BeT4nvyGGXN3Y+eRWxWueBlyZGfKjF3s7l7GKB+Y9HYctq/CCsP6jF9oH8k
	AQStijoRmNGhyGC5w28d/rchyrtSTjebzHOtKVYlrknruu3dN3kSOmLoP0oatWodq11TDKlewFU0t
	L/r2NxUKjEQ2OEthOGYAOElvYxnPMJt3kfSiHpbc44G1hY9bIwpqVjU3ZYtbvyHqRDNuf0BXDiToA
	oI69Dnb5+wvyL3rZZa/PJn0tEfS87teG2aWohQBZxfUyee/A6BfkeC0wapZnPl4ApaTvs7ec5iUTu
	PanvEYp1gtJoaubvqoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG0zE-00FfQY-Lw; Mon, 25 Jul 2022 16:31:16 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oG0zB-00FfPN-VK
	for linux-amlogic@lists.infradead.org; Mon, 25 Jul 2022 16:31:15 +0000
Received: by mail-lf1-x131.google.com with SMTP id z25so18948467lfr.2
        for <linux-amlogic@lists.infradead.org>; Mon, 25 Jul 2022 09:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=4Njask7Y7NcDaGQmjQ0MHzpAHWiB3LrAGSEayvbjElM=;
        b=dlWIzQSxMabu5KosPx5jW4XNbWn99t4uk1uInDNruuL4aWMZlnsGAdwmkuESz9kni6
         EjVtsRxXB89YYEWRkNtZq0LdT0b94qQudSi6Gp7AtD5X64t+GvjKi6/s1hBMv9v5l3O1
         B4Yir05ezUIL6CO95+wKCdnoO3lZ+wK983HCNnaD5FOG28hAysfhxPRqcSFh+CiXc9Fw
         XIR7Z2ifAmR7KqHZ7Iy2Scf6VcPVDFhK9Dt+ytNUvw0OB7D9HBx39UDjGgKzeVW2jwf6
         sxXpSHCkDCnrLRFnnSI5a1itXbaftgXbJf/9jEZ4a/E86huInVm8Py6660ZDxsOr8w1I
         2Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4Njask7Y7NcDaGQmjQ0MHzpAHWiB3LrAGSEayvbjElM=;
        b=OPFS07z79hRXeoVUB9SoxkGM3ZonzdsAkXHUMgTDczCDqXf2YLdr+hsK4gPLWQjxek
         RZu0ri8/aRKLA7/4o/3v021VI684PcjXJ0wVn9d6ryt6yAkwESNIxvgpRyF6gaWwWnfA
         WVN59pEOw3T/NsI8QB9HYQ0axqhV0ONIR3DAyvl9SHS3F/k8LmWYUdWmv0w79g4ciXU/
         CPZO6fY1Pd5aEqTt3io9CxB9LEv8evOEbj0ZGv6AKvm3Y0VLhiRHWNiU6pAt7zKA2GcO
         dq9p75iN/ACDkk7XEttob/UehTkJjPqD+N0htKMRzI9neknVjq1f7JJ9O0fVswtv1idN
         owGg==
X-Gm-Message-State: AJIora8oJ1IRy+UV6uMnT8BjyuvBgkeu4/Slm2MS1lpbimFeq/CjQZAQ
	ljpj4n3RWUbWR7qaC6nlEyKSuA==
X-Google-Smtp-Source: AGRyM1uZV+8Fizi+VmedQAV84B90DJEWpiCH26Mk33Otp0KJLxGM3PrgDc4XawhKFmqciR5YDfgoLw==
X-Received: by 2002:a05:6512:4020:b0:48a:8d1b:c8c3 with SMTP id br32-20020a056512402000b0048a8d1bc8c3mr2315086lfb.131.1658766670590;
        Mon, 25 Jul 2022 09:31:10 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id c6-20020a056512324600b0048759bc6c1asm163179lfr.203.2022.07.25.09.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jul 2022 09:31:10 -0700 (PDT)
Message-ID: <efb62771-4a4c-c166-7a31-0e44df2c0908@linaro.org>
Date: Mon, 25 Jul 2022 18:31:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [v5 3/4] dt-bindings: arm: add Magicbox M16S bindings
Content-Language: en-US
To: Zhang Ning <zhangn1985@qq.com>, martin.blumenstingl@googlemail.com,
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, sean@mess.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20220724231704.132472-1-zhangn1985@qq.com>
 <tencent_529DC7E641BA7022B2C1C7C0E7427C2CB805@qq.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_529DC7E641BA7022B2C1C7C0E7427C2CB805@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_093114_036075_AA196C77 
X-CRM114-Status: UNSURE (   6.75  )
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

On 25/07/2022 01:17, Zhang Ning wrote:
> Add the board binding for Magicbox M16S Tv Box
> 
> Signed-off-by: Zhang Ning <zhangn1985@qq.com>

Don't forget proper mail titles (PATCH and prefix). git format-patch
solves the first, git log --oneline gives you hint about second. So this
should be:

[PATCH v5 3/4] dt-bindings: arm: amlogic: add Magicbox M16S bindings

> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +


Best regards,
Krzysztof

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
