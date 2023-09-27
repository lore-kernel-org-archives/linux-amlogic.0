Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A44E80A93
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Sep 2023 06:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUYRirRVCWqxXTuAEFCB3eLhtyyZf+XdLwbWVKVX2qo=; b=S3QtL8eZuSAF3l
	aLl0JP06pePWedes59fphEfZE5OIOdpLx9fxCH81MXVTAZ5Sp5d+mgOZkB+hYITczr7vrX9adiXIa
	2vhxhcx6sigVxsKmG/1n+6rD1rtfLorj6mcqPee9HRn/2C4bUQi/VwSrZTz9a/2m6PE+pyTuw0tC4
	4cLIOpPsaxrfYh+U6/QitvV35FgkYHR9ctnnGQh41/foF1Fc0JBjZr7CHLA6pmzAmTcqirY+swumE
	k/p8vMQLcFZPjuBfsBluCcWwLieo8nuoxcp5KnbIV3QNabWmDDo1jhKdGbcHYIxS9UF8ZvagvOPb1
	WPL+XGaCi2lQioAgGqgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNgL-0003ya-1s;
	Wed, 27 Sep 2023 06:05:57 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlNgH-0003xh-24;
	Wed, 27 Sep 2023 06:05:55 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4053cf48670so92102765e9.0;
        Tue, 26 Sep 2023 23:05:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695794751; x=1696399551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tzf3auFOPADoZEEKnwvAvKOmFmpAc1qrk78Z/GaSFMU=;
        b=pBfgAGChuopW5L2pjMb3HXhxc2t2wqavHhPgzEn+Qymf77wP2eIDGkYg82Sj7c+1kX
         zXpN/RJ+WMP+UsmY+lqW6kA8amUWfRC570WjICHy/kbNdhJ7bO+MU0lk+wGRupMuiPev
         /VVBNNll/jIpkplgfqTUFo9d/dZTwdsPUbu2BYBY9cHLbozrUeLDz8DSaU5jhx/+sgGD
         PWBArwfn7BbWcx++mFUWDv+7kFXjvnvTCb3mwZ3gkEIoPlmEagxtM77KCxw233CONxIG
         RRWcmYJyfV3Z6F4wovU5/ia1xzC5I8HxqJkUCcZihIngb5fvRr+J0b72GTshwY4rXuYQ
         pxOQ==
X-Gm-Message-State: AOJu0YzIVbUgeRinBAk33v/RlQxV65tiInmVwqAUs6SzFc5OapXXrXJb
	qNNpLobWqK86GpL9nBrFpqA=
X-Google-Smtp-Source: AGHT+IGKJGFGn4GVwZfT4SGNCkuVFhljd71lZh3+GhQ08MjmPhwykQ7MgIPHOLR2ikiXWikY/ceP4A==
X-Received: by 2002:a7b:c4cb:0:b0:405:a30:151e with SMTP id g11-20020a7bc4cb000000b004050a30151emr1008916wmk.12.1695794750977;
        Tue, 26 Sep 2023 23:05:50 -0700 (PDT)
Received: from [192.168.86.246] (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net. [82.11.51.62])
        by smtp.gmail.com with ESMTPSA id s9-20020a05600c45c900b0040550c20cbcsm12015055wmo.24.2023.09.26.23.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 23:05:50 -0700 (PDT)
Message-ID: <916aea7d-50ba-45d8-9b3c-0f507c922601@linux.com>
Date: Wed, 27 Sep 2023 07:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH V3 RESEND 0/6] Power: T7: add power domain driver
To: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
References: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
 <169444496123.3944766.3763051739383485051.b4-ty@linaro.org>
Content-Language: en-US
From: Lucas Tanure <tanure@linux.com>
In-Reply-To: <169444496123.3944766.3763051739383485051.b4-ty@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_230553_676581_780C8EB3 
X-CRM114-Status: GOOD (  18.46  )
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

On 11-09-2023 16:09, Neil Armstrong wrote:
> Hi,
> 
> On Mon, 11 Sep 2023 10:52:17 +0800, Xianwei Zhao wrote:
>> First patch is that remove C3 some power domain ALWAYS_ON property.
>> Second patch is that add driver to support power parent node.
>> Third patch is that turn on power if initial power domain with
>> "AWAY_ON" property state is off.
>>
>> Other patchs adds power controller driver support for Amlogic T7 SoC.
>>
>> [...]
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.7/arm64-dt)
> 
> [6/6] arm64: dts: amlogic: t7: add power domain controller node
>        https://git.kernel.org/amlogic/c/5355699dabac3c97492a30e6e01820fcaae11218
> 
> These changes has been applied on the intermediate git tree [1].
> 
> The v6.7/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to Linus during
> the next merge window, or sooner if it's a set of fixes.
> 
> In the cases of fixes, those will be merged in the current release candidate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
> 
> The intermediate git branches are merged daily in the linux-next tree [3],
> people are encouraged testing these pre-release kernels and report issues on the
> relevant mailing-lists.
> 
> If problems are discovered on those changes, please submit a signed-off-by revert
> patch followed by a corrective changeset.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 
I re-tested this today with Vim4 and works fine.
By works I mean, vim4 is able to boot without panics but drops to 
emergency shell as expected.

I was not able to find patches 1-3 and 5 at amlogic/for-next.
Is there a reason why amlogic/for-next only have DTs changes?

Tested-by: Lucas Tanure <tanure@linux.com>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
