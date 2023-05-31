Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BECC77B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 31 May 2023 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jtcfouaVXAoxRFlw6PO1fBMS6PZwY2PEl5epoKydHuI=; b=m53hqx4F47fGsoMlras8njCvdH
	KfNOUydRUFyLxpx55vzmTaMDDkMhejGAbUK2hgTZ9vUSFdHIuKpf7Eiv5gdTXvexztZn3Dc5NVG/g
	OuJjlJqjlx0sTifIHpFreAzo8Rs7G9ucu9b5GNNACrnie3KJWQOJE8vbIChdnmRRWZcg5QcF0uUUE
	9hkHxOwJ0HVT7O8zKUv33hyWNx3psgSIHK+3Q6myMaInLndvDE9K1NGqPqoiJDqileMH3zE+QJ0jn
	b0GGNrMFW5hB95QO00iNCddtlZMZB1hnlQGIB9gwPNTRE8zN4he0JbQMDlANMA2gfWn2Oy5Vs3K6v
	nOCvzhug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hft-00GnTX-35;
	Wed, 31 May 2023 08:59:21 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4Hfq-00GnSN-2p
	for linux-amlogic@lists.infradead.org;
	Wed, 31 May 2023 08:59:20 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f6094cb2d2so57435925e9.2
        for <linux-amlogic@lists.infradead.org>; Wed, 31 May 2023 01:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685523556; x=1688115556;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YBIQNd5CwMWOY24/Rr6Brie38sdaCVNySMcl3oJt0UY=;
        b=lb1p6EnVRX+DTjwmsGXajDKG097RX6a3FHYa0py4zf7vRIItzJlmEJJdNvfPewp1gX
         7+k3hzQmjLmlqSIBIWtywOM5/foA2so1Rkf24FhxAQ2SZPq2xkvjJBkvloKLrU76sV1s
         dmqDXil/sJFyz5W1VVg/YzivVAyc/kjb0em6GtvR+MJJqkLdAr0qT9Biw3UTQan2RzQp
         jhXAv9bq6EgjYcVoQCOHm+JSueQmuqUzf8qFZPEbjV1xLhMfVkHvDEgJVaGGQO4o0/D8
         Znfjd3hvUgLCwL8rGGAevU8PxNxJ54jevizz+6yexbSHPwCZWh7EzmlMKXbDt3ReENQG
         3/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685523556; x=1688115556;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBIQNd5CwMWOY24/Rr6Brie38sdaCVNySMcl3oJt0UY=;
        b=YFOfPpkxj7gTXTZXS5JKm/KleN0GSbQfyL78lrpfz7SvmIep36M7fO7jzcfaWW6M0p
         3iRfqqyZsr1KwRZR6eoHCrj+tDyY8CgoHn/U/GX5LvWDonp738etiLa15yexXzc8L4il
         mYXMgW36pFmHARaRk71uqycCqOHAnjiZQ18IMXsgOnH/XGuW8o3EGKnuABX531rNpnvn
         Cy0AESQDMu5Ynnp81Ym2iVMU3xsDM394JKUFvLC2F5SRDjgBJzjBWYCWXJkQrySJpJgw
         18fV3R7zxLoQQOWLhuJReQOZvE/c5+RJQiv+9xdhzXDHxoCkBtc2gtBzpxw4uWR8Y9At
         v2HA==
X-Gm-Message-State: AC+VfDwW1Ab+1q8ZN6t4gxzvZizsRvBypRUvYF+Jxb/ZRNL2ADVDuKXd
	YbbFVp1DjYPVslkQk5yJL+0iKQ==
X-Google-Smtp-Source: ACHHUZ4CNyYShz0ULzlda84VWuoupYNh91jdzgJrDhnk3SyJ0FhBR4Gm/AqQagB0heDaO1DIzvnK1Q==
X-Received: by 2002:a1c:f30e:0:b0:3f6:e42:8f85 with SMTP id q14-20020a1cf30e000000b003f60e428f85mr3669312wmq.37.1685523555830;
        Wed, 31 May 2023 01:59:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779? ([2a01:e0a:982:cbb0:5c28:3ad5:fcda:7779])
        by smtp.gmail.com with ESMTPSA id c21-20020a7bc855000000b003f1958eeadcsm23417092wml.17.2023.05.31.01.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 01:59:15 -0700 (PDT)
Message-ID: <9158d9ca-fe00-760c-4c95-f2ee045038ee@linaro.org>
Date: Wed, 31 May 2023 10:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] firmware: meson_sm: Fix memcpy vs iomem type warnings
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>
References: <20221012185234.never.936-kees@kernel.org>
 <166602031304.3572695.12870664862275915316.b4-ty@linaro.org>
 <202305171124.4EB0D65@keescook>
Organization: Linaro Developer Services
In-Reply-To: <202305171124.4EB0D65@keescook>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_015918_916959_F00F3A0A 
X-CRM114-Status: GOOD (  17.31  )
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

On 17/05/2023 20:25, Kees Cook wrote:
> *thread necromancy*
> 
> On Mon, Oct 17, 2022 at 05:25:13PM +0200, Neil Armstrong wrote:
>> Hi,
>>
>> On Wed, 12 Oct 2022 11:53:16 -0700, Kees Cook wrote:
>>> Use memcpy_{toio,fromio}() instead of memcpy(). Silences warnings from
>>> Sparse:
>>>
>>> drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 1 (different address spaces)
>>> drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
>>> drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
>>> drivers/firmware/meson/meson_sm.c:170:17: warning: incorrect type in argument 2 (different address spaces)
>>> drivers/firmware/meson/meson_sm.c:170:17:    expected void const *
>>> drivers/firmware/meson/meson_sm.c:170:17:    got void [noderef] __iomem *sm_shmem_out_base
>>> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
>>> drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
>>> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
>>> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
>>> drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
>>> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
>>> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
>>> drivers/firmware/meson/meson_sm.c:206:9:    expected void const *
>>> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
>>> drivers/firmware/meson/meson_sm.c:206:9: warning: incorrect type in argument 1 (different address spaces)
>>> drivers/firmware/meson/meson_sm.c:206:9:    expected void *
>>> drivers/firmware/meson/meson_sm.c:206:9:    got void [noderef] __iomem *sm_shmem_in_base
>>>
>>> [...]
>>
>> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.2/drivers)
>>
>> [1/1] firmware: meson_sm: Fix memcpy vs iomem type warnings
>>        https://git.kernel.org/amlogic/c/7dc69c7d073e6004a281db8f7f15cf6ebf702ea0
>>
>> These changes has been applied on the intermediate git tree [1].
>>
>> The v6.2/drivers branch will then be sent via a formal Pull Request to the Linux SoC maintainers
>> for inclusion in their intermediate git branches in order to be sent to Linus during
>> the next merge window, or sooner if it's a set of fixes.
>>
>> In the cases of fixes, those will be merged in the current release candidate
>> kernel and as soon they appear on the Linux master branch they will be
>> backported to the previous Stable and Long-Stable kernels [2].
>>
>> The intermediate git branches are merged daily in the linux-next tree [3],
>> people are encouraged testing these pre-release kernels and report issues on the
>> relevant mailing-lists.
>>
>> If problems are discovered on those changes, please submit a signed-off-by revert
>> patch followed by a corrective changeset.
>>
>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> 
> Hi! This change seems to have never been mainlined and seems to have
> disappeared from linux-next.
> 
Hi,

Indeed it was rejected by Arnd, but I failed to find time to investigate how to fix it

https://lore.kernel.org/all/4a6b34ef-f5d2-4e56-a7f6-6a7c9cdda416@app.fastmail.com/

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
