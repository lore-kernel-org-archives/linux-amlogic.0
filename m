Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D570C433FE
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Nov 2022 17:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h5O4vzCguyILdJQQO6lo7PJsJdVw+D/3zLQ08aAEz/g=; b=LxkcG8NsmPyxRWpw+mqfCGb2uf
	h8/vIEN26iBJGFu/TKt03OWv463hz0k1i2geBnPvJim5DHHOurIfE085T6uu2Muit6gIP87gWuWBg
	db6O1+wGHstCkp8xgqaLWyK9IP1D5adX7z2Vhn5r6OyfITuZHWgWcDM1YtLQer6e6xUWnGeNStPHx
	+6HPhwrsjw7ZjMjGcuesABZfGZNyqx9lPDzP3IqyWdwbih3SgjHVNEl+qxuFx5VkPfq184ZRx4XZ7
	7skWNxU7pLLxfrw7+JL+zxQUhn1FZSXH55GDLIZliA0pyuTv9j0jyL6VQ3HZ5EaRJoVHNdIdXOfb6
	S9qjMvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5wk-00GhSE-8e; Mon, 07 Nov 2022 17:30:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os5wE-00Gh6d-Fr
	for linux-amlogic@lists.infradead.org; Mon, 07 Nov 2022 17:29:36 +0000
Received: by mail-wm1-x32f.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso7609678wmo.1
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Nov 2022 09:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xkR0EU5MF5krvYFbRD8gmAbuCphspKLMpA2k8o/icr4=;
        b=jSV89Nd7BOcmUAVxEDddbuNTIYUCBXZutjnld8k4uAuTk1pp9sn+3pw3Joc1NASBoj
         4nVR3LJtXBrpaPW+Cs/OU3xoHH8Qj3HfJ+VRHRBInFLo5QAj2kiOtKR/VXoJTvqYsMd+
         99yUhXBdVs6C5VpVwJLzl2NUdmE5pWId+MP6y0qxgEOPgH3dmLt/40OUyBxPU3JZ/atz
         Sd+2aE/nprLxPxFw1H4Qy0mycrAKfFYpaXbpdFdSzUJXm9KnFcOQosDiMHDpoZ54NdRe
         FbQ5eRq0hhQfqljmkvR4icco1gzyvCgz4mSug1vcSwW4uYOlBI+qhNS1Wo68EB6Kac/d
         1o5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xkR0EU5MF5krvYFbRD8gmAbuCphspKLMpA2k8o/icr4=;
        b=D768cH7M+bQH+OvKU4baxWP6kMdHROKderyh0eo7I/edJz6uBFR34XkPWHSC63v7Fh
         Bnhi80L4Bii5Gq8bbKurYzv0gRb02qaUsyvRLohVFo7cw767ft1a7M87zAxOv4nK2pUG
         nc19BdM0RnLlb7J+pHYmI/rnl+ZSFwb+re5D5QFRF7R43WbHo/cZrW5Q1m2sNaD7JcuS
         JFGeFuBxuQwsr5Nae5pP/dhfx0hmz/jSj2g0e64UvkVqet0Je7naMP22vPnD/chCtb1+
         UlISw/H0o3Km40kDUbAdy/LgfdLimqjqYuupNfydQ31uuZ1Qu/JTMiDCtXoP2AX09IfC
         +4HA==
X-Gm-Message-State: ACrzQf0t5H2pZUzo+DROwv85AOC9NFU+TC3jfMKYD7szLZ6pXKmHd59m
	OHuNg4c0OVsoMvY0RqjwmQwLYw==
X-Google-Smtp-Source: AMsMyM59E4kUPCWhlqtaCDaCwUhPCvbjXQd61lqCiTFlXO9OHbwPcQvIUzUroZ3V1idre5W77pTe4Q==
X-Received: by 2002:a05:600c:31a2:b0:3cf:8a86:cf1c with SMTP id s34-20020a05600c31a200b003cf8a86cf1cmr17606048wmp.113.1667842172024;
        Mon, 07 Nov 2022 09:29:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:64c8:555c:905:adc6? ([2a01:e0a:982:cbb0:64c8:555c:905:adc6])
        by smtp.gmail.com with ESMTPSA id n4-20020a5d6604000000b002366fb99cdasm7715664wru.50.2022.11.07.09.29.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Nov 2022 09:29:31 -0800 (PST)
Message-ID: <48f4bda9-b5e3-9649-aab9-b529889bf110@linaro.org>
Date: Mon, 7 Nov 2022 18:29:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: patches for staging:media drivers
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <Y2eSCZJNWn6DzCUu@qemulion>
Organization: Linaro Developer Services
In-Reply-To: <Y2eSCZJNWn6DzCUu@qemulion>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_092934_638340_183616A0 
X-CRM114-Status: GOOD (  14.29  )
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

On 06/11/2022 11:52, Deepak R Varma wrote:
> Greetings to all.
> My name is Deepak R Varma and I was part of the recent Outreachy internship
> round. I learned during this program that patches for the media drivers were
> prohibited to be included in the Outreachy effort due to lack of bandwidth for
> the maintainers to respond on those.
> 
> The Outreachy round is now over but I am continuing to work on code improvement
> and changes. I would like to know if it is okay for me to now identify
> opportunities in the media drivers and send patch proposal for your kind
> consideration. I intend to send couple of Coccinelle identified code
> improvements as patches.
> 
> Please let me know.

I won't say no but since the media maintainers will need to apply them,
the problem is the same.

Neil

> 
> Thank you,
> ./drv
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
