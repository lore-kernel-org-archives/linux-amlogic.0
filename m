Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3B2C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Jan 2022 09:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8JMx2wQi7piBBGLyIIfgReyjH9US51Obf8NjqBhBy7U=; b=sNQbkzFGV9SelIdQWYqUcSbBTy
	6xBY1PLH8GfyC+yWKhZtDFiGLCPQNgQec/i6je/wR7u1UF9ADQGvGkLbYrKtpINq/xfgcsMDMXq2l
	M43heh6n2s9HfJjevzfxPAX9poUzqVMGeObBDHhmRupsVJxYrnsD2coH9NCiskEWLbKS+RlCrFVvE
	XTHfzua+Ij4Li2xLii6uMKfXwwR+V/nh9GI1DyszPY+BtTASdeWaAIKa1+p58kL2uBTR5o2DYEyeP
	zgg3s8Huvnir5NHfphfe/zmzpJHcGMrUxTZgOEx1olfrtFoF2gun1HzQr+AICRfnL4NbjSeFZGUQD
	vuY+gvlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6r6T-00ASNL-Kf; Mon, 10 Jan 2022 09:36:37 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6qu9-00AKsX-R7
 for linux-amlogic@lists.infradead.org; Mon, 10 Jan 2022 09:23:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id e5so8264593wmq.1
 for <linux-amlogic@lists.infradead.org>; Mon, 10 Jan 2022 01:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9jz9tNwdzLsw7w4Zl2qHQumH6RcFiB0/JZN/3mnViHE=;
 b=o74mvAvePykr8pBkRAIfGkCE+jZyOIQDE3u1T/KcLw9WFfYNPgiMXLQ6rjRdjAgEaL
 IRGLm9hsd99LkyblWxHEtDxolvDthX1Q86zYnzaGBJdHwSwDFIbKWJ4MtG+xESCxTBDs
 Yq6XDTyHyEUyJ0Aq6iNvtije8VaxppilvmVVUwlZdqzYCOdgqvy1WCjgPuCfJMof77LZ
 1CGcz4B9I4SN3MrciU4lCfHLRUcX7CX+vz9U/VxD0kmF89Kdf1JdPmpx65PNaLda1WBM
 vuGfqgMSCDsQVHINFmq8W7CB0h2q6IPX7HQCF8JZoalvhEE9pc/R/FN8CuWMF8X4XJSW
 ud6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=9jz9tNwdzLsw7w4Zl2qHQumH6RcFiB0/JZN/3mnViHE=;
 b=J/MkayRYMiJZ9zL13KL4n/p/1VBcTQ2/GHVScpmshR2u4ufxTkdMzcnkaSiEfeH3KK
 HKMki+ePHNJq5amJJEhQdmDUnkAVrt9RETjvzugMMYTS1+6eb+Yv79pUup22RF4lTajb
 OOpkfxf3+L4ObWTP0u/20rr3HInHBB3oMoHd8+L1BYpFnMVxpPe6pjY6WOZl1YL+kOON
 V4IN/xvDvADSM3LKkq9e553kaWuIH6Viu6yfK1TWruE+YDmNTLjJuUduoMMxMRuslBHT
 QYS3RVLBqXAFeYMOoxlA4w9lZvk9OadoiVzydH8HWP6BZ7fovsX7fpLjNHzgJvn0+shU
 46NA==
X-Gm-Message-State: AOAM530ILCXDndnRaoouP04cosnCwStUGHk5Pi0sm2GWR16tY8YTC9El
 FK5Jku2QnnymNvJEbVp906VRGQ==
X-Google-Smtp-Source: ABdhPJzbFEoNkxF7535gvm2QMeTxG1bbLAD3RCO4UI4i+sGuXs4K/lvjLWKnVlad475XlMkoyKcgSQ==
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr12087174wmg.150.1641806631154; 
 Mon, 10 Jan 2022 01:23:51 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1?
 ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
 by smtp.gmail.com with ESMTPSA id p62sm5921856wmp.10.2022.01.10.01.23.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Jan 2022 01:23:50 -0800 (PST)
Subject: Re: [GIT PULL] amlogic fixes for v5.17-rc
To: Olof Johansson <olof@lixom.net>
Cc: soc@kernel.org, arm@kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <7e40328b-6645-4343-3050-73dcfb2cefcb@baylibre.com>
 <YdoBffKeAvtOeRSe@lx2k>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <df36156e-eb2e-21e0-e5f2-28666409547a@baylibre.com>
Date: Mon, 10 Jan 2022 10:23:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdoBffKeAvtOeRSe@lx2k>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_012353_948664_92910301 
X-CRM114-Status: GOOD (  19.45  )
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

Hi,

On 08/01/2022 22:26, Olof Johansson wrote:
> On Mon, Jan 03, 2022 at 04:13:44PM +0100, Neil Armstrong wrote:
>> Hi,
>>
>> Here's a couple of DT fixes for v5.17-rc1, they fix the UART compatibles of
>> the ARMv7 Amlogic SoCs and by the way keep earlycon working after [1] has been
>> applied by greg in the tty branch for 5.17.
>>
>> I know it's early for 5.17-rc1, but at least it's in the pipe.
>>
>> I based the changes on your dt-5.17 tag pushed to linus for 5.17-rc1,
>> if necessary I can rebase on v5.16-rcX.
> 
> Hi Neil,
> 
> It looks like this branch is based on our arm/dt branch? Please don't base your
> topics on our branches, it'll be awkward if we ever need to rebuild them (it's
> happened a few times, but we try very hard to avoid it).


Sure, no worries, I tried but I was wrong

> 
> In this case, you should have based your contents on top of your latest dt
> branch (if it would have had conflicts), not ours.

Noted for next time

> 
> Mind rebuilding and send a new pull request?

Sure, rebasing right now on proper 5.17-rc DT tag

> 
> Thanks,
> 
> 
> -Olof
> 

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
