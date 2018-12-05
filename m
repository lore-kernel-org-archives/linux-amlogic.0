Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E32C04EB9
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 10:16:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7504620659
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Dec 2018 10:16:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ipv4NmHF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kXUqrqaF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7504620659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X61KUg6hpk6llQGeSL5mhxKVbUyJtHAO7P6Z453CbaE=; b=ipv4NmHFsPataP
	2JdmUTyLxdTRpLpNtO1PP0WA1cwwwBx/KYrdo2rMduwUYjTHA2OoiDepcFJiG94197FjzCVkqqi83
	s3TDtXEVLUFzM7ZAtj4HppFfnkMbq9Oyq+KE9wnZhmRM/ZDKc2uEABxp6sHyY5OEAXPcMeLoX2zvr
	CQfp4ybVs/KauOKAOS8SZuWoFnMg2MYygc7PO40398YRYO3Hcht3bWfjR1qtZYyHt79VyIT30zKcy
	tHU2yNTY6u1R0OUGCSRG4RuDF8QqZWvrVjVV7Xlfa+Xr1gy5NMFOtW6DiIiMhKxVHYYEYiMPRkdqb
	bKx0QKCkWG1F5L38MeBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUUEP-0002FB-Lv; Wed, 05 Dec 2018 10:16:37 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUUEN-0002EM-8q
 for linux-amlogic@lists.infradead.org; Wed, 05 Dec 2018 10:16:36 +0000
Received: by mail-wr1-x442.google.com with SMTP id l9so19023971wrt.13
 for <linux-amlogic@lists.infradead.org>; Wed, 05 Dec 2018 02:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=57eaKVrJbAST+zjqvbxYBPsqC3bXOx38CPtaP3zRr+g=;
 b=kXUqrqaF6tgvM7tDXH9HLiqW1Tl6HFA8j2f/gpkFU0tBJuK0aRmVx6gFLOuHzHi3Ed
 9CsjKbM79h+P/NoE1+tKXuN4L3zPuo86WvgO+fxGWDRZOH3LnBNx7cuvXfYliRVaa2Q2
 5e08Tx8Mx1rxVT5D6R/qaXZfEdDRFtkMTMTWQVsyitujGSyPwAsxkdXpUYReP+TEQlrr
 NHMiPyoDC9G9a98y8trEPUMvv8DHEOK7ViFDDuKFFdJEMSItTP3t2JUsbS2tIpPLJIni
 MAM8H+iRtZpOy0dYexCI8vykJ86O98g3uHLdIFW+ye/iz/N6zPuotRbl4ywdefhA+bHE
 tsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=57eaKVrJbAST+zjqvbxYBPsqC3bXOx38CPtaP3zRr+g=;
 b=Gz9xKCS8w+JVTB4cJ4xCx6qqsK+wN7zo1bw4MW5Nf2XqYv4mKEsOgXoeWncTj/73CY
 YIiQvoEnsaEAFc+KiMxGVBy7B+EpuNFlmLh9HhoPaoQbA7bYWT9okDqPaS7wfiIGnkri
 hW/m2rFUXPvARZMzzT/azqphPNrG/PafbhY6nZI9xNFZxkRX2h/nXVAJoLudeE0/QrEb
 Whl7UV15LePzSQiBpB8mQkV5sY8KAHSfs3akkvvu0+Lol5Sf1ElpIWlIYomIdHZB5OS4
 p3Zso8kLq4q9OQgWGoVuCryhyVMw/+LgLGySooyjXSj93mrgrrTDQXIgn4kDDSyOJlXE
 gVZA==
X-Gm-Message-State: AA+aEWaGkZOg13RNer4gGgKiphuZXbdmJfZo6V6QBH7EJOpHPDjtr1xH
 70GtccAQ/b6jD91XKsUJ06OZ2A==
X-Google-Smtp-Source: AFSGD/WfsWqmd2BEV+5i8FbN8V8ID2e2fj3AN3J3DmByLADqxI5d7Q8dIVJm3kFom3Cv7baZS/A9Sg==
X-Received: by 2002:adf:a4d9:: with SMTP id h25mr19840891wrb.167.1544004983158; 
 Wed, 05 Dec 2018 02:16:23 -0800 (PST)
Received: from ?IPv6:2a01:cb1d:4ce:ea00:819f:4d34:9af9:e67?
 ([2a01:cb1d:4ce:ea00:819f:4d34:9af9:e67])
 by smtp.gmail.com with ESMTPSA id t5sm11297413wmg.43.2018.12.05.02.16.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Dec 2018 02:16:22 -0800 (PST)
Subject: Re: [PATCH 0/2] clk: meson: add clk-input helper
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>
References: <20181204165819.21541-1-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
Organization: Baylibre
Message-ID: <88cc4a9c-d51d-ee34-3e38-36645e53bb13@baylibre.com>
Date: Wed, 5 Dec 2018 11:16:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181204165819.21541-1-jbrunet@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181205_021635_308472_086BA578 
X-CRM114-Status: GOOD (  12.08  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 04/12/2018 17:58, Jerome Brunet wrote:
> When the related bindings get merged, we will add more input clocks
> to the different amlogic clock controllers. Instead of copying this
> code around, lets create an helper function and use it.
> 
> Jerome Brunet (2):
>   clk: meson: add clk-input helper function
>   clk: meson: axg-audio: use the clk input helper function
> 
>  drivers/clk/meson/Makefile    |  2 +-
>  drivers/clk/meson/axg-audio.c | 83 ++++++++++-------------------------
>  drivers/clk/meson/clk-input.c | 44 +++++++++++++++++++
>  drivers/clk/meson/clkc.h      |  5 +++
>  4 files changed, 74 insertions(+), 60 deletions(-)
>  create mode 100644 drivers/clk/meson/clk-input.c
> 

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Will be useful for the next cycle to take in account the controller input clocks
defined in the DT.

Applied on next/drivers

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
