Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04296C88E4D
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 13:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vndv/QXbG0qtjdL0n01P+bVDdqBrBmfTLZxKVNkaiME=; b=JhFNR6WA/5SzTo
	NP7oBCjvgdM7/bswpJ1z7XunOMVmSogGRNKN8mGKgjdVAWDVkyP6bKNDNHYjIjCB3fjFKMTrjhYlC
	AyVOpA9G/T3crtPquCV9bKR8orR732WSsGaJLVcC46aaDKi01s5Xj6SkDFBNAkmEnUgwosvhKuPdj
	kQZwHFh7pV/tlkmAJZOMJasKhhwKjnGuUyhQVFOFgUvr0FxEAp0jgtkehz4svHeBMfLvdsDyWZSyk
	X10YbZl/b7kyRnSdodDSctmbUxqd81Zsx7RQbGjxygaMYEOjkQ76idVowd3SoE8l0kKejOyj4mXLE
	vlfeNBGF4iOlhNKeYDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50z4-0000000GiKt-43pg;
	Fri, 11 Sep 2026 13:08:02 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x50z0-0000000GiKN-2QEs
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 13:08:00 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c2790ccso526228f8f.1
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2026 06:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789132076; x=1789736876; darn=lists.infradead.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FjoAmWwMqjNrukHJpUAIw9xx0LKAxeIKQlZUt5PjQgU=;
        b=C9j84nyq7RuSAvgFfbKoRTttbuglV5yNMIYEf7ATvEHnHXF15MiEJ4asrIAUnFMwi6
         VpcA53hgpgw0ybZKJHnrQ7KYpwziVuIp7hXxa5M+WUJK5ZD0QnOKoG266lFonwHt1fAN
         KbtHBZ+3No0ebJIcYOh8CnqJczj0HrhbNW/eRvjWZfNqBrS44/Sc+F2C0GeOErHuVUAk
         0Mk7hqUf5OGPCa+qSDNuGpreNyjCHYCGdrvfUSbmadIG0bAiOUhRQKBAo1WpEDgiu5CZ
         ZZgFA4sTr5DxjirO0EZxKW8TLJIhYZso64TrO9Qovc1wIdyzMKqsg5tFXFzlrn8Vt4+a
         SDnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789132076; x=1789736876;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FjoAmWwMqjNrukHJpUAIw9xx0LKAxeIKQlZUt5PjQgU=;
        b=Ir3Oo3JvmVe7TeG2L1NP1qXs24aJ0qRV0Z0wWxf/kIe87LGWOYeL3t4C+r0m/9e0F9
         +qNmoKtfa+tudSTPA4iHB4UY3vCrjZ3GNBVnR652miR52ixdhoqPu0RO+WwRUcIVXRVa
         2hHeQvG8LW8N8qABR2szieG1rXx7PuXTMS6ifkIzc1RNybN+1loVtppdg+KXoZIoJIMs
         iZfU2gsQZVEG204BhJaWH3p8xZ6Np3LGYvqBPmq50LH9UuHy3J6YvBO9PSpW6zXDGSkz
         lGGWzrYNDL0p7y7/ApE/+5F40wWV1Ix9eSpNOerDsLoVt2zJtAET17ZFg7Chf4CBcGeQ
         RuTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzizWtruR0jOjuLmZDmFjeeyVsnjpQjxFsuK1BqwAKBALgvBnzl/rtSeDdJRpv85LUKYUXwApB9gsbhZ/XR@lists.infradead.org
X-Gm-Message-State: AFuF++lPM7YC1ZUQXxFLVDlSr0vvq7Hnt7T8Evx6pwA9HpftXvZt3JZP
	jzyR4nfXZTaeAX6ARNY65Gj9P1kvek1q3GKF1HHEqRLXpG86mD7v1Xx4/eDz+t28zkMOeDWjqRo
	tP4P/DTg=
X-Gm-Gg: AYBFou39WE24VgYYX8JogAZkWRqeuTfiB9rtH8ll3YqYzAmv+iK70Ed04qu8g+ZuLYz
	9sQSm4S40eQBzvN8HsocD2qihIFI5kMxqJQMJk68gEERnq8h6yuBc/0Dvll6feoSXvBP0sH0cHp
	swXYD+P6+A7aAFlnPjFznFZHYyOWooEPKmOhPe5lbKOxZBXS5UlvyCVPBN+4k9NI2sHgfo6ChPE
	3ofui9Ae4qH6VRHej0FjmimOPhDCiOO3Ir7lYh9iLVUtES81146pgIIP9R9LGHi63UifHC933ll
	wWRW4yOPOCS9Fh8Xk/xkJFCqEzin3tIyl4zytL/WqYTm+UQYU+Z78CcjbmTjMqTnErpbd4/1STP
	Ipw9/FutalfpOl6JmdrIJF/wsuBWXiYUKKCHMELxsRbXv4s8TAARwSQuIU17BlIDr+j1XEUvSO/
	LfIX1ytBU/xv8JZs1xoGS7QpysLxEqicLFaTTK5LMhGF57V3YLHDAAf9lqr6YnuS6Mx47MGSsuN
	6NE8JW0KnnJTSZDJzKicvZipi3h
X-Received: by 2002:a05:6000:454f:b0:485:acfd:4fa2 with SMTP id ffacd0b85a97d-486eb35833cmr6218006f8f.28.1789132076602;
        Fri, 11 Sep 2026 06:07:56 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb350686sm6121441f8f.27.2026.09.11.06.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 06:07:55 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Cc: Sasha Levin <sashal@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 6.12.y] clk: meson: align gxbb_32k_clk_sel number of
 parents with actual count
In-Reply-To: <daily-reply-0030-re-clk-meson-gxbb-6-12@kernel.org>
References: <20260910072139.313775-1-jbrunet@baylibre.com>
 <daily-reply-0030-re-clk-meson-gxbb-6-12@kernel.org>
Date: Fri, 11 Sep 2026 15:07:54 +0200
Message-ID: <1jik4c6imt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_060758_626349_7E9E659E 
X-CRM114-Status: UNSURE (   8.21  )
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

On ven. 11 sept. 2026 at 07:20, Sasha Levin <sashal@kernel.org> wrote:

>> The following out-of-bounds read has been observed by Christian on a
>> GXBB WeTek Hub:
>
> Queued for 6.12, thanks.

Hello Sasha,

In those instance where exact same backport applies to multiple versions
how do you prefer to handle things ?

* Just replying 5 times as I did ?
* Just reply once with a note explaining that it applies to other version ?

Thanks
Cheers

>
> -- 
> Thanks,
> Sasha
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
