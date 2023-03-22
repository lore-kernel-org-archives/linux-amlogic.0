Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 405BBC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed, 22 Mar 2023 17:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EWprsHT4YRbKZrVu8oTE+GHTjc6TUUK8eMxyYmp1q7w=; b=3mIQx1CqVOTl+7
	IJ4UzxJrjPOXN4V2NwER5wRtzXxXUJgHMZPIYgZ2HTAkTpRHWT/6OA34KR/Tx/3KWEWSsp4UIyPHQ
	+YA9L5Ao0XxU7aCA+LWE1ugEYQmzh7GxOqOagg6KdGvbDdxh5m2+5eY6NnYdeRWvvMnfIOYAilB9q
	BDL3fUBs8gtR6E/Wk93R+f33KDVtlPv8keM0dOPW2hsJiyDESLKjTjqV7hyb/tJzn+JI8t22udXAk
	USbqG7+LciXe5/+pednTmvkvdY2s49mwRcC5QIrFbykLIZaA8wwQSJi2Big8dPF9KimqXL5wtN2Is
	PBQmuJ7992ysUl3P6AaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Ro-00GsxT-15;
	Wed, 22 Mar 2023 17:40:28 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pf2Rj-00Gsuz-1t;
	Wed, 22 Mar 2023 17:40:24 +0000
Received: by mail-pg1-x530.google.com with SMTP id bn14so3600992pgb.11;
        Wed, 22 Mar 2023 10:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679506821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/g1h+qqzGP0ximTM8vLifW2flklbu34LUXD3lH6yA9E=;
        b=BAsQNSnbUVjbeyI7cQSPAqV/ee8QmZK/d/w1GXqaKDEv58eWDxDc2pEoQr1zfkHBum
         4kMFFkxM1hFdV4qG/0Q75+GiUqFd0vw3tNN91hjfJP/d1B5ZZ9CfbFYr3xmfptwibG9p
         ssT0bt1KQo6IZIA9ine3Uz8zuFt9+Zsb4Ku0zdSL4mFD66HxGqJMwAI7DDaPg+3EX8Gw
         qa/ZxuTUAG+qeUKCgz73ueAFnXFoZeAEey4glrjatkWIDCThJ99nMMxUKhNF0k8zHh0O
         o9wYy0BjT8dzikZKtgGR10UsaO0QfrYqTo83+dcKv3NiE8aI7xl37AD3mqHsU7KbdE2Z
         At2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679506821;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/g1h+qqzGP0ximTM8vLifW2flklbu34LUXD3lH6yA9E=;
        b=dgha6cTwO57eDtei9ehgFvZteG4bphzrZHKR4Mp1+SRm29tguG7S+iDbn75ZTmrqyD
         5cDaSMheHRbcjiU2bdcCz85oV2aiauDBVHGzc97gq7Xvqo5ZU/sO760aPhIi3UTDniVp
         1t2H2dP2vUxsRMLZRlOZJbde3bsSn5CmHhlzFXiI5TUqXfSV6MVam3978s2LEJHkOUvQ
         bouSdLkvqGb5xcX29isfXIFAi8WjlVn4fCG+EUEVbgIMYTMhW+LEANF2CPcaksbY9ihV
         fARbIQ5sM1DpBiB2JU4QV8+041z9e5SFmivp3EJYdJpUcMTQGv6ukOLYzw9YL/3Xoi+1
         nW8w==
X-Gm-Message-State: AO0yUKXgvtCJ1F2VozhPivWd2hWXADJtq9VcBloBa6S04b/KUYfvI96B
	zkIJdJEZyisc9OQ/K8cBM24=
X-Google-Smtp-Source: AK7set+kNSqLUYN+luuoe+CONYSfbZhP0I9LswkqRYf0oELysG/zkCAFYpjlXjs8Gs6TsQBPHgh00A==
X-Received: by 2002:a62:7b05:0:b0:625:c7ca:d82f with SMTP id w5-20020a627b05000000b00625c7cad82fmr3785420pfc.18.1679506820823;
        Wed, 22 Mar 2023 10:40:20 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id b1-20020a6567c1000000b005023496e339sm10118407pgs.63.2023.03.22.10.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:40:20 -0700 (PDT)
Message-ID: <586ef13d-4ec8-c5e3-25a9-8c5eb350faa7@gmail.com>
Date: Wed, 22 Mar 2023 10:40:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] dt-bindings: reset: Drop unneeded quotes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Qin Jian <qinjian@cqplus1.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230322173508.3971182-1-robh@kernel.org>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230322173508.3971182-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230322_104023_662296_13B850A2 
X-CRM114-Status: UNSURE (   9.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 3/22/23 10:35, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   .../bindings/reset/amlogic,meson-axg-audio-arb.yaml         | 4 ++--
>   .../devicetree/bindings/reset/amlogic,meson-reset.yaml      | 4 ++--
>   .../devicetree/bindings/reset/bitmain,bm1880-reset.yaml     | 4 ++--
>   .../devicetree/bindings/reset/brcm,bcm6345-reset.yaml       | 4 ++--
>   .../devicetree/bindings/reset/brcm,brcmstb-reset.yaml       | 4 ++--

Acked-by: Florian Fainelli <f.fainelli@gmail.com> # Broadcom
-- 
Florian


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
