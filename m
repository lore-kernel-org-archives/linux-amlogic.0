Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D63EC04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 10:22:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 201BD20851
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 10:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S+emGlCV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SS5qxOXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 201BD20851
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eubOVeJCSX3lWWJoA9/cjlxjaMd7fhZNDyo3Scwl3uI=; b=S+emGlCVh8dn1scpHBquxFxA3q
	bacrvZGfUVBQsu50LN+kC4qT+vmW6u6xCpnsZOwKnhK5JsdkH3si/xJhDy5mWburgDPQ1SfVPpkzg
	AjoG99NT7J0Rvs4QmL/ilL/3BgKncOR1nvdv6pznMVzkmJBtxHs9Nb8IBdndEZENnzmiKAT1YC3aV
	XJuNyo5HU479TLlavaYXlm5PSUA+K+FApixsjmEcMYb66hlvz5zJgR/L7lPpVORmceD2Kf0/fVt/d
	LKotqBzOsZMbSQraq2JFGy6Pmd1iTi1yMKV1J9U7TmIPd4pj2yaqG1XSJdDwDILTVXWxn3Hk2sokZ
	bQqttNSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTlMV-00045M-MJ; Mon, 03 Dec 2018 10:21:59 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTlMR-00040Q-N8
 for linux-amlogic@lists.infradead.org; Mon, 03 Dec 2018 10:21:57 +0000
Received: by mail-wr1-x441.google.com with SMTP id v13so11505304wrw.5
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Dec 2018 02:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dAllDGtUaWoHz6r8oyOzW6MC1RWTTQtcsyuCN1DIlbw=;
 b=SS5qxOXnObMPMFZWEk0JR5yNC5KVE/IrHVMvM5UJgqGa5KXZhf2NxJVvscW8l8Hqp8
 pEZXM0ZaGOkjomEt+CwOsZMqoPJF6kkSkuYRr85ZpAclO90TbEoCVp7zetwBaMU8PJYj
 N/fV+4qlyWVF3DYe8RspEdllGrX9SL+sO7xtjwNPk+XnuaxY6HH6sX8np4HWbTLojGcd
 SYz38mErBwnZulymojmO+796C54JgKwS2hkrU5KQ12JDxIQKvIyQERqR+9oEu3ksyyfV
 AYPUeOnLykuMopCQUx7HZycfErcwJUQZTzR+zp+26TuawjpIWacosBZvq62vGWwrC9b+
 8m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dAllDGtUaWoHz6r8oyOzW6MC1RWTTQtcsyuCN1DIlbw=;
 b=U6K6pJzYF4vFl9pzivwXqsPfrDEPv8eC096l2IzjRh5tbGchKQ196UTY1usd8k3VHs
 V5yhbl0mkYsNX+PY4aVzLgU9u8daLINBMI/WvcHgzlRNzZDGbDCN3KuUkwKQTF+tllAe
 sNgLbHs4DQ7BtA3jub/UA1akz87UyrrRz3i2mi4AMDVg0iLlBgpB19Te0WjpIXc2B8JD
 55ahOxrEnG425XiQx7A32NgaE6/6qzoODa5RiCIJ7lsvmUrh5XXDaI5APtiQvKL8OKW5
 +0ZJQ5HPzqcKYVW8FuyB+VdX2u+jsvLb3tGfcfNifbigxcUUmroQyYz3VmeUIGfkdiK/
 KwTw==
X-Gm-Message-State: AA+aEWaCp6aI7vs8aNMSCL8uy6wNLEO5ax5VkPnl3uMsBW7bLwOIlRMq
 pYxHtJwm4BAeOrjpdzCiCjv4VA==
X-Google-Smtp-Source: AFSGD/WA1JQWohBfUetRs4cHrJz8HMolzeu6Awef4Sc07UTBjGnF/eY8OdRuPr2zihMcmTzwGXvO+A==
X-Received: by 2002:adf:f8d2:: with SMTP id f18mr9144845wrq.265.1543832504047; 
 Mon, 03 Dec 2018 02:21:44 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c7sm19537562wre.64.2018.12.03.02.21.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 03 Dec 2018 02:21:43 -0800 (PST)
Subject: Re: [PATCH] MAINTAINERS: Remove myself from the list
To: Carlo Caione <ccaione@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
References: <20181201151749.10932-1-ccaione@baylibre.com>
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
Message-ID: <928e27de-cb7b-cf40-b8b6-2aa43a69ee39@baylibre.com>
Date: Mon, 3 Dec 2018 11:21:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181201151749.10932-1-ccaione@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_022155_764882_CE7046F9 
X-CRM114-Status: GOOD (  13.65  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/12/2018 16:17, Carlo Caione wrote:
> Kevin is basically doing all the work. Remove my name as co-maintainer.

Sure, but couldn't we move you as reviewer and add Martin as reviewer aswell since he is dedicated to the Meson8X support ?

Or maybe add a separate entry with Kevin as maintainer and Martin as reviewer for Meson8X ?

Neil

> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 01645edc2388..63a2ad093524 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1297,7 +1297,6 @@ F:	include/dt-bindings/clock/gxbb*
>  F:	Documentation/devicetree/bindings/clock/amlogic*
>  
>  ARM/Amlogic Meson SoC support
> -M:	Carlo Caione <carlo@caione.org>
>  M:	Kevin Hilman <khilman@baylibre.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:	linux-amlogic@lists.infradead.org
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
