Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C30C61DA4
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 09:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJ/PDDIUkFkoFGL8v/02DdvkrwyB8cRF10zbv24aC/E=; b=LJgzKuDacnUKsbKUCfgHrZlIf1
	AxNYmhT+3FWKTpLEhV4ekZyXi1gVXyuWTrBWldBemk9SchC9tKFbCpQU5w3DGpAkM9suUbbJJtQNh
	vFDBTirBbxuxiNnlZ61pB84fOJwHGz5bZvS7nb8axazAelJPDQ6eTBodYIFNy7WTa2G1YZjWtNTw1
	ApqSMsRf3l35Js5odNurWo2iDQdvqMr8Pzo6qot2pWid3fBfrlms4Cf89kdNESRa/GsHwfu8h6680
	jswyDIrhM8PdIqRXnNl/N+y3eWRSXkDlZfXwnHzCJKmjD5bTXZo6IW15hvx6vpe2xSOdw97B2275k
	MSpQf6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6yI-00C3Tc-F4; Mon, 06 Mar 2023 09:17:30 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6yF-00C3SR-Ah
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 09:17:28 +0000
Received: by mail-wr1-x430.google.com with SMTP id bx12so7994113wrb.11
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 01:17:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678094243;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fpTAGmKjYnXHgPn/6xv3IbFtnqRgDalc7dH55K8iLHQ=;
        b=zeWUmLbLKttdjBAG5tsk+a/h8WCkuQQLbmMPuLAo+Xi+V4u1S+vdAMDUthDr8oZnwO
         gpZ7C2DTQ/aigtkdk2RYFzUGpiKyiIrlZ+9iTFYhrv/WmQowjD+QueqY2yrVP5RJQ8hD
         hT4MY4D0vsU9Qur7e0NL1TnO5llzwVkOrl/JcnNeo2fu5wMbpM6RI+t80MiaEaIlxo6z
         JWRx2jF6lndIL4Uxh6UOXXp3E5dC2H7QjNLNsVWIX3dzI6myiLfFQPi+s0ffsk04Z2VS
         TLy2yFSDr9Dws1jlbOTPpOOozNANM/OFTw+KkW9cp63WsR6OPtLEZwY7YT+zGyve4ji9
         kr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678094243;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpTAGmKjYnXHgPn/6xv3IbFtnqRgDalc7dH55K8iLHQ=;
        b=A4vMG4vhVjzROxlmPk96K8stniv9SqKrd4gYIH2idNt8GMCLxsXn2XCxmLYpIHcors
         +kkS0N2DZXuj+820ABhzm2BdDmsLVT50Qdb4XW9O8jyBbX0e2f6QzqA09Qt7F6xK+MQ5
         fhTYSGb2+ChuQZpA2wIYNlhCFNOurxcOicNgN/yyaI/GwLgYLDNnBVIeBKEoma225tkt
         N7uSL7I7nWVMh1PWTt1FoCDEfc7HMziHbfd50TxqAVqUrgsB5ssrPqOC7MkPzTdQ+rla
         gk3U5DSCBeGVYXjN4q9FBgjLmyBdj6w4B78fnMCtTVhJFK7CpqxBosyt8Gw4ExP/NZkg
         +nag==
X-Gm-Message-State: AO0yUKWjtS/doKHHXVcZbrY73FlWAQADIIN03omcaX4oqaZU9ybF3h2y
	tL64CZ6M6KDP0WujLZECAtdqkA==
X-Google-Smtp-Source: AK7set9uoqNTzYvFyRGiT60AnI53z1pW5Hm7qll3aqsyCgi3MeRz1fHkDbXj/iDBVU5klVUCbV4RIA==
X-Received: by 2002:a5d:4404:0:b0:2c7:107c:e172 with SMTP id z4-20020a5d4404000000b002c7107ce172mr5642251wrq.41.1678094243500;
        Mon, 06 Mar 2023 01:17:23 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id q9-20020a5d61c9000000b002c54911f50bsm9294134wrv.84.2023.03.06.01.17.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 01:17:23 -0800 (PST)
Message-ID: <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
Date: Mon, 6 Mar 2023 10:17:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: Unsupported WiFi adapter on S905X2 board
Content-Language: en-US
To: Marc Gonzalez <marc.w.gonzalez@free.fr>,
 Arend van Spriel <aspriel@gmail.com>, Franky Lin <franky.lin@broadcom.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Wright Feng
 <wright.feng@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Angus Ainslie <angus@akkea.ca>
Cc: linux-wireless@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-amlogic@lists.infradead.org
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr>
Organization: Linaro Developer Services
In-Reply-To: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_011727_420055_2762BAE2 
X-CRM114-Status: UNSURE (   9.78  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Mark,

On 03/03/2023 19:19, Marc Gonzalez wrote:
> Hello,
> 
> I think there's an unsupported device in this system:
> 
> # cat /sys/bus/sdio/devices/mmc2:0001:1/uevent
> OF_NAME=wifi
> OF_FULLNAME=/soc/sd@ffe03000/wifi@1
> OF_COMPATIBLE_0=brcm,bcm4329-fmac
> OF_COMPATIBLE_N=1
> SDIO_CLASS=00
> SDIO_ID=02D0:AAE7
> SDIO_REVISION=0.0
> MODALIAS=sdio:c00v02D0dAAE7
> 
> 0xaae7 = 43751
> 
> Isn't there some overlap between
> include/linux/mmc/sdio_ids.h
> and
> drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
> ?
> 
> (Relevant commit: d2587c57ffd8dc)
> 
> Looking at all the occurrences of 43752 to insert a 43751,
> could someone comment whether this looks reasonable?
> 

<snip>


I think you should send this as a patch as RFC to trigger a review.

Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
