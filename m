Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A7A8C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Nov 2022 13:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TxUmzO0bKT0ZeAlD0hdQuj2nDTcN8ggeegRmf1oxVM=; b=0q4VgjMIgRggBJ
	xwVqGrOBkUQDjv/oSUfhQtp+kzAfF/EmoTy8JzLJtmHuQ7LN6naOAwe/zORzL9Ky0fwSO3Tx6fYGx
	Dn2qLuxMxdp5Q5Q5CpK8h0tWxArr7c+Uh8I/ATAmMMkl8l0u7BYNzoeP4jUYZqmL5+aZRAv7CfqZ2
	vEL//LFbiGcRs+4iDnFchYg0mSxgouTsaiaoIIrWMhlKSxJ/BQ1ECRv0iu8GgDvM+/LjD9k5bsFtI
	Mm/N+Rm/jxlzmUvWq5R6i2ZDR/zlGaqKphwFUXj56s1iK2DkqB52P+6Uf+YFs/65k+TmNR7WgMwzD
	0ZMDVU9BSO+rjUm2z9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIfv-0047cT-B2; Wed, 16 Nov 2022 13:41:59 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovIfs-0047Wr-VV; Wed, 16 Nov 2022 13:41:58 +0000
Received: by mail-pj1-x1030.google.com with SMTP id d13-20020a17090a3b0d00b00213519dfe4aso2406925pjc.2;
        Wed, 16 Nov 2022 05:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2oiJdwae1A1xSDrJX/8Ai0D9wMJGorNAzyo1cxFVuFg=;
        b=IFOWVUc9Q//uV04jXe5blsnXnYmAjlTPYUbIt3GuANBVZYoyn9L72i8qNB+FhH+q5K
         VDUc0Pj4/f1t7esAG/K3G4XAr1LbBQumraUNb6/7PQIHwT0Od1mQwuviBM8w1TQolzLI
         2OeW3Fn/79WhkC525L+NoL3RZctlrNA7AXKCSB62vFwFFSyN90T8mp1fQ+VO04RLTV5/
         wwR9Hi0EeO0juqed8omd+k1VRTIiVPZOV3UCkaZitKaXU0neFBFyWpHVEgzcWJuz1LyM
         WTH99mMHSMVKqhyA9C57Udm1JBRAjNAd4eB+Dacel3RbqN2hNn+eSr8cNQSJZrBwBCt8
         Y2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2oiJdwae1A1xSDrJX/8Ai0D9wMJGorNAzyo1cxFVuFg=;
        b=g9CEFTjXxEl6xz/+vkh3b26moPHWfqhAMSgzdyOxN+a0LMnhmcDMYx6tAdXjW8SzXk
         qvFTfMgncmZy5MNGbYjV9Iwxg/GxC6NTz7iMy8bbgnOGtAdsNobxVLxIW4SQ10ntEI6j
         0Za+h1G74DdCleLamaT0X+tgqiXv6Iz7ytl4x2i+7XmLpryvRqfLtSHVoJHZntFtSQt6
         tZ1Emi2qomVCDmCcvCBR/g5UpWLLa+InwifaF3WVvNoqiz0sDkddUoH+ZB/Rq1ininQx
         HoeV5vIO8HrW7Et/B6o00gQE1VTja2E8PZiMGXaSeOmSAkBeLEVoQMbuYgE5C3XWFJvi
         pqJw==
X-Gm-Message-State: ANoB5pnRRs4ty37dsNiZ18K4hnlK8iijSZqA3lM75n9K/bymzR4QaQaS
	T51OqTIY4mBeovpZ1JWbOIE=
X-Google-Smtp-Source: AA0mqf6GQ+JgpcAi4UahQkWMET9Ne7221Qrmg0nhjTJLGJiDdR5oOO7WyKzI/O9+FGYQ2kysUAeE3g==
X-Received: by 2002:a17:90a:aa11:b0:20a:cbb0:3c9b with SMTP id k17-20020a17090aaa1100b0020acbb03c9bmr3792530pjq.81.1668606115053;
        Wed, 16 Nov 2022 05:41:55 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-84.three.co.id. [180.214.232.84])
        by smtp.gmail.com with ESMTPSA id gi18-20020a17090b111200b00205db4ff6dfsm1560135pjb.46.2022.11.16.05.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 05:41:54 -0800 (PST)
Message-ID: <cb64a153-9196-e7c4-14e0-bf623ef79850@gmail.com>
Date: Wed, 16 Nov 2022 20:41:47 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v10 2/2] docs/perf: Add documentation for the Amlogic G12
 DDR PMU
To: Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shuai Xue <xueshuai@linux.alibaba.com>, John Garry <john.garry@huawei.com>,
 Wan Jiabing <wanjiabing@vivo.com>, Chris Healy <cphealy@gmail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>, Chris Healy <healych@amazon.com>
References: <20221116003133.1049346-1-jiucheng.xu@amlogic.com>
 <20221116003133.1049346-2-jiucheng.xu@amlogic.com>
 <Y3SwIPnDvEOlL+Mz@debian.me>
 <7bb5e9ee-358b-ce6f-2cb5-a6b6b558c0a9@amlogic.com>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <7bb5e9ee-358b-ce6f-2cb5-a6b6b558c0a9@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221116_054157_040624_B076A457 
X-CRM114-Status: UNSURE (   7.44  )
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

On 11/16/22 16:56, Jiucheng Xu wrote:
> Sorry for my poor English. Your writing looks very elegant. I will apply your modification in next version.
> 

Please don't top-post, reply inline with appropriate context
instead.

Also, wrap your message text within 72-80 characters.

Thanks.

-- 
An old man doll... just what I always wanted! - Clara


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
