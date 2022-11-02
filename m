Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E5D3C433FE
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Nov 2022 08:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wn6A8Mu98R3hGeH0J09Mh1kSPNC80+ICt6It+TSx8I4=; b=g/3/8gjVSoZO+pSHKiJr/6G7pe
	R7JVMJsgUVGl0tPVzC30BC5MY9C23IUIP9gHiyKH/h7Z5x7O9Jn5Idf/YFl19PzATLl03ya8D7e0s
	DZZiE6FiFqcP7xzfMxGmctTOvMFlx1g5pTE4Fgc5G8qY1S5hH9elitLC+r4WKfD+nkw6qBtxXi8L7
	Iv65lY857gku6ny1TUyLkZ2yJd/HWM8jMZtm1i7kvi4SqKeLL/1udc4TTOdy7VYtav3HqvDoqACNJ
	aZIxvCrl2MPXiDiz6Vj0C2s4dgCvktwUmp4ZP2KX1z/upcQyzxolHH9+BmfQn8jlvRXu9mp7hhpta
	lLUPLJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9Pz-009Bs3-W9; Wed, 02 Nov 2022 08:48:16 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9Pq-009BgM-Ex
	for linux-amlogic@lists.infradead.org; Wed, 02 Nov 2022 08:48:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id cl5so11799140wrb.9
        for <linux-amlogic@lists.infradead.org>; Wed, 02 Nov 2022 01:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7Fsdl5KhjqGKQP2QnpOdJy/pvqM2iIVhcnFcFTUrO8A=;
        b=DtUC+ogPgNq55gImpxgwl/g1PNaHgnSJcUcH3ey02Bg+UHOPn61NGgUQUYKxBUOm0o
         6j55cZK0uUFkIxNtb+53CsWK1Qemz2HFYEVNxcPQv0r7mtLb2RXImhJTAH9IsAo+1z9q
         7G1N1lvRgIsbn5JRW5ZN520ZMYXPAl0pU7SP4BuUHUJXQ8pLqmOtdGSongttbwoxl4gD
         UCRERlPPo6ROhX89ISBcJigfQ/WWviTE5pg5Sy9EA81RzurzZR4FBrz+FkJ7VlMQlk/r
         Kf0hzD4noFjzvmELW/qh3UcYV9e2WT9ndb5muF24MVZXZC5g3GERl9eZ0sUFk5IVZOFg
         gSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Fsdl5KhjqGKQP2QnpOdJy/pvqM2iIVhcnFcFTUrO8A=;
        b=px8JhsuBMYUpjBmuGmB4luPWVtEe+8PgMToPXYQz+YJEv0CBJ1fb7XEpOURaXkcy1z
         HTQ0tMjOrP8ONJ3paveI/eiNk5rMSDA3o7IqkhJ1diNLvob5mhOEnwBngKLerp+vAcWX
         9ZAmbWb6fgNTrVI+N0F1y7KmoUCal2XDSSoLTlz4Wqfj4z5Jn18mG45TbupOixMYgDHR
         oKk8abZHQlSiP+joMupWW8SplbEMYegELq6oBp+VtB7+HrAC8JLP9PKwwPRsP37onN3p
         uuzw8qDcjISeOGqEJdhEUmVQKB+CkQ3IL/cmYDiozCO4CE6ncueEZF57y5lOQj+Un4mM
         wAeA==
X-Gm-Message-State: ACrzQf2oXasrOV07VvFDue9JJaBZmfiGkKKK9dJZrWQdSCbOBz0SNcyc
	CGYeHXNW7cP3ulihV2wHlWkWcA==
X-Google-Smtp-Source: AMsMyM5eXnSYYlsc2nkRMQQBb/aW4z9lnVUJTRZ031AFqmay+F47F4Osg205pLQkXyK71S4ukrEHUA==
X-Received: by 2002:a5d:4c52:0:b0:236:60e8:72e with SMTP id n18-20020a5d4c52000000b0023660e8072emr14434036wrt.573.1667378883428;
        Wed, 02 Nov 2022 01:48:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4? ([2a01:e0a:982:cbb0:6bae:ac40:a798:cbb4])
        by smtp.gmail.com with ESMTPSA id ck1-20020a5d5e81000000b002366553eca7sm12328632wrb.83.2022.11.02.01.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 01:48:03 -0700 (PDT)
Message-ID: <9499a56d-fb74-16cd-46c1-27b3fcfdcd7e@linaro.org>
Date: Wed, 2 Nov 2022 09:48:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/4] power: reset: add Odroid Go Ultra poweroff driver
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
References: <20221031-b4-odroid-go-ultra-initial-v1-0-42e3dbea86d5@linaro.org>
 <20221031-b4-odroid-go-ultra-initial-v1-2-42e3dbea86d5@linaro.org>
 <20221031222918.knzv3lotfn3sp7bl@mercury.elektranox.org>
Organization: Linaro Developer Services
In-Reply-To: <20221031222918.knzv3lotfn3sp7bl@mercury.elektranox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_014806_509699_2F4C28D7 
X-CRM114-Status: GOOD (  12.26  )
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

Hi,

On 31/10/2022 23:29, Sebastian Reichel wrote:
> Hi,
> 
> On Mon, Oct 31, 2022 at 05:47:26PM +0100, Neil Armstrong wrote:
>> The Hardkernel Odroid Go Ultra poweroff scheme requires requesting a poweroff
>> to its two PMICs in order, this represents the poweroff scheme needed to complete
>> a clean poweroff of the system.
>>
>> This implement this scheme, and overrides the PSCI pm_power_off.
> 
> Please use devm_register_power_off_handler() or
> devm_register_sys_off_handler() for new drivers.

Thx, will update.

Neil

> 
> Thanks,
> 
> -- Sebastian
> 
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> [...]


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
