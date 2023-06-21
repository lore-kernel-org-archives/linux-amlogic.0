Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8DDEB64DC
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9RNBRsMK3zgyOm5a7yLkFvfsp+kJAYDYFDsYw1Q4fN0=; b=Kj3e+ZnI8pi1ul
	i9cb1fpHRft5AzEKnFo1MiiKXgmvjTpCoG26flapRJuvQL6XaDcrqNgBzMXGVZ1o3ROSfCAxAnxQd
	7cZoAY6QNFClVkDpKHXVtZXI+k45e/oQfr5fjuqdO9Pbc/1ur5KW88QliYeaI8xGHadLg6csFcjpx
	oST2a/7bfuUh7CIylCkggS403twAgp0YYMpX9Bxpz3T4trWkGP3/CqO0dJArt2dOxrkGJ0cbQJIyJ
	N+i/UGMTlMSnbm55Gsl8e5CHNsVCCKtR3sP6d/7wJ6XbbEK5jQvSA+vz/mYNoBUxSWF/5zdFnlL8a
	mSuON7Pssgy4vGEv5ucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsrZ-00De7K-1p;
	Wed, 21 Jun 2023 08:06:49 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsrV-00De3y-2a
	for linux-amlogic@lists.infradead.org;
	Wed, 21 Jun 2023 08:06:48 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-988a2715b8cso583744366b.0
        for <linux-amlogic@lists.infradead.org>; Wed, 21 Jun 2023 01:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687334804; x=1689926804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUYpAe3/BhIXsJ7SCvf+lazECqtgTTqVOxYrUgT+rmk=;
        b=b/IM1bOYZdO1qLaO5wacoULq1wOdHfg05Y5vNjDLicFchEiHx08FgeYK5EEDEmxndu
         fZ9w96h1JvhUNM46NocWKsof2/MpAzdUda8pX5RcIA9CiZVl2tR3IC4H78jhXyFTLWar
         JLH50qmBZkuKkrkBHvAa4dZMnGL6myfPtcbGY/M8CXTDKofDKliMvlhr6bEojEHMqrGy
         e4U5VYziDBIW3hGHbXChReQGZzJwGXe+XWSV96VB9o2dXWLAfG71qtyHIsVAmZ/x4YHJ
         Ahga7/IRlbPBLl3Ze9byCXQbdWBKP5adaOJIXd/QRtQ+ZqMljGZ8iQ3St2Ro2+FI9FTs
         nyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687334804; x=1689926804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUYpAe3/BhIXsJ7SCvf+lazECqtgTTqVOxYrUgT+rmk=;
        b=jPONNCruag4wBPbThB0vreofq8OMkgJSyljvC8ThqvnQRQ29rzzgwd8SsgL+zLBl/5
         hKjCQ3N/nrb6wRyV0x4hS6+dsHZECNjpMxOc2yiLL36pIhSmneE/vUam8u8KAuWcnvCp
         DY6NYkZIxj1HtP9zVwW8EKYMg2KVEuqIIJcakc5XIIT+oJc03NmKk/QVZ6ijoed4nt1Y
         /0FOyb6IvxY1B4TOeh9kZiUWzEITUry8EDu7KVFAq24mnTaI/H5ST5dP6IROP3EyDDmb
         dE5rSOuRfiTHwXYxsxrK6svNTVHoPEc+nn2eyTQdkgMCineumsm5chnS2u2czRNPDu6Y
         jZlQ==
X-Gm-Message-State: AC+VfDyaUDL24U9EOWwbVEi1/nVCFfsbcYjBbb/ygrPGene9olHvcuav
	Rqe68elG3jwgzzxpNsFb34KNgA==
X-Google-Smtp-Source: ACHHUZ4Rj4hL3d22YdOCy+NwHSszJHxDwCU8BunhCwJffLs7i4MitWYEuGrtdTklZGeILsy/FuO7wQ==
X-Received: by 2002:a17:906:dc94:b0:982:87fd:7760 with SMTP id cs20-20020a170906dc9400b0098287fd7760mr14507233ejc.18.1687334803900;
        Wed, 21 Jun 2023 01:06:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id j6-20020a170906410600b0098877b10de7sm2680871ejk.193.2023.06.21.01.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 01:06:43 -0700 (PDT)
Message-ID: <7d229fb0-b8f6-e629-cbad-0a3501bd9bfe@linaro.org>
Date: Wed, 21 Jun 2023 10:06:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-t7-a311d2-khadas-vim4: add
 initial device-tree
To: tanure@linux.com
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Nick <nick@khadas.com>, Artem <art@khadas.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20230620134857.238941-1-tanure@linux.com>
 <20230620134857.238941-3-tanure@linux.com> <ZJIjtphyKdC48JrN@ofant>
 <76a7f819-f3d2-d39d-1bc9-f1e7f837fd22@linaro.org>
 <CAJX_Q+3im20qphOXzn-=58Kx4--ajbaF4P8BVvRcDcPXn1Qheg@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJX_Q+3im20qphOXzn-=58Kx4--ajbaF4P8BVvRcDcPXn1Qheg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_010645_858601_9ADB4586 
X-CRM114-Status: UNSURE (   7.79  )
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

On 21/06/2023 09:37, Lucas Tanure wrote:
>>
>> https://elixir.bootlin.com/linux/v6.1-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst#L42
>>
>> Best regards,
>> Krzysztof
>>
> Hi, I did not understand the recommendation here.
> Can I add "amlogic,meson-t7-uart" without Documentation changes?

No, you cannot and checkpatch will ensure that.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
