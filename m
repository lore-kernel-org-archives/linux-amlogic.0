Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADD4EB64DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQNOppN1BFWYhKSDgW7xwvtUnjR7opJ6ErQWx4FuQcg=; b=mLjFbQZXUDIBHs
	HribFNttLkQdzVtpHo3NaFH675fet+2vPhJEh1EgB7tIPDSqg4G9KXElNix9gkIMcYQ8Zq3FRssgd
	o5U19drdSsXaHY4DgNMqd+WQLZN1dP7pM6eCqWdUHaHITZf2JhAoTvJsqk2bcsBzpzEQ+nYjglVto
	orLxKn8axKxHcdZRZKKGuTthNV6d4S8tu1t6ukF8KsOmW5x6bv8/1VqIA8ZZ9axFJp/3uTy4PaQm9
	tCX0ais543orK1rK/a2ZNUdCFBX+4q8KVZT0uAZ8iynSksGWpqhhIuOrza/ZIK0z0eY+lfpcSErLE
	4A3JwvXlYU8O5LoUKdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrZH-00DSAA-2Z;
	Wed, 21 Jun 2023 06:43:51 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBrZF-00DS82-1l
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jun 2023 06:43:50 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98802908fedso536526066b.1
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jun 2023 23:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687329827; x=1689921827;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F0A4OfbxXz0NGj/tr2eOFVX7aKZ0BmIyiRE/0eK0Tsc=;
        b=A1A3VqqATsj9m91b8e6nszvWgrgzHYl5Dtbu9Bmigq/HCZV3BEKgWFbJ4LjLgiiiTO
         0bcN8ZlOv25gLfLK9c6IZ1jMf51Gq1n8Wqej0pwdjSTxQmspiz8jzidC/xD8kKm4Cc3U
         9PxnltFcq9eHMs0ziN35adhftX77fndHtKQWONC/ZSZ2C09cDahX0wikojZ6yS8T2tzC
         VodO25bJKgchu0vy1JNQygqXgwZm0o9WTUcA1Tcfko3Fx96aNfPLILfCr7NBOKH20CbD
         pxGXhWYe5bNmrJ+xOCBbjkGT5yqhHfKepdxKk/hXFP2Df5wP9wHZD4LN3NJDw5aRWXuf
         R4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687329827; x=1689921827;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F0A4OfbxXz0NGj/tr2eOFVX7aKZ0BmIyiRE/0eK0Tsc=;
        b=IF808TabSys1HYmTajrOKAPs3CO20fuT9mWf4Uq/qq7dONlcKnx17ZeqWSFstvVP8s
         +8icRzKippbZYxolrEyZctVnu8RgaZItPIEhniH9WRMxOStbMXAnS+XrJ3X4rEZ6m7LQ
         DpsWPMMttsJ9MadALVuiyPZqWse7G/0Xc1ke9kQdpxk/1IkJPK+Ga++4eOkXED9SeMku
         tB90pVSKB/8vUATcSZqHCX/a7o0h/VIwrAp7YMeH127nkfzlKJhp8QxjF63S63BNpOkl
         WigPcxuHrwtyGx42DyUdgrz+moqW2dmJaLbaS/0RAfM17hMtY8bh6HO6zYPFL58WdLs3
         qAPQ==
X-Gm-Message-State: AC+VfDziU2uLthCWPPMEFCVeOD0dYunR77DyYSEyZyJi8ynUwgdUmHS4
	biilaIaVH58zVhbc6ELcUbnB7w==
X-Google-Smtp-Source: ACHHUZ5NLJ7rt7MgGuAm518oncvlxewAqw47rJlEY3QWjb+vmV9EdHXHOO4uemy2tyvG7B+vutb7ag==
X-Received: by 2002:a17:907:1c07:b0:94f:956:b3f7 with SMTP id nc7-20020a1709071c0700b0094f0956b3f7mr15282239ejc.2.1687329826802;
        Tue, 20 Jun 2023 23:43:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id w17-20020a1709060a1100b0096f6a131b9fsm2536918ejf.23.2023.06.20.23.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 23:43:46 -0700 (PDT)
Message-ID: <f2546eb4-5b4f-3e77-a08c-941a323e7f73@linaro.org>
Date: Wed, 21 Jun 2023 08:43:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] dt-bindings: crypto: intel,ixp4xx: drop unneeded
 quotes
Content-Language: en-US
To: Corentin Labbe <clabbe@baylibre.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230621064242.9038-1-krzysztof.kozlowski@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230621064242.9038-1-krzysztof.kozlowski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_234349_592078_C18D6472 
X-CRM114-Status: UNSURE (   9.93  )
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

On 21/06/2023 08:42, Krzysztof Kozlowski wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Drop more quotes (also amlogic)

I need to update subject, so v3.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
