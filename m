Return-Path: <SRS0=t7Bi=WE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D346C0650F
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 14:10:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25330214C6
	for <linux-amlogic@archiver.kernel.org>; Thu,  8 Aug 2019 14:10:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dZcQ+qPU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SK8nH480"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25330214C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TcjW+HP55qQV68D2RsAqANcM8OEEguKihp5F07BiksM=; b=dZcQ+qPUdENxuH
	iwFbkTH4UlKUjy3Herf2gtKgKfNwS1VhFsjuh/Kd730KH/mMKy3S84icc/OZUYm14U0QfRP3uMJsk
	4zjP7W9lbWFGWsi7AXEiNqhWvXQi4M3SFCpD2WO0QXgNZoZi1DwsSE+MKvJQD+C+c1V11RWLqLWWZ
	bvJSGBhliwHPcs3GngG0NT6PGDpRbXsI/D7gQ8wehY4d/LaCxWio5gElYjpZjccQBGE+ZfKT+m9pI
	gTniqlqRjI23AOYmxEA74QCK8A9aZhMskqdYKtJjSgW0r/8jKcurlgMeCnpK7CKAG0LqefZgp5V8T
	N5a9NXr6zSnSp3VQU5Eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hvj76-0006Vc-Ek; Thu, 08 Aug 2019 14:09:56 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hvj73-0006Ur-P0
 for linux-amlogic@lists.infradead.org; Thu, 08 Aug 2019 14:09:55 +0000
Received: by mail-wm1-x344.google.com with SMTP id s15so2581107wmj.3
 for <linux-amlogic@lists.infradead.org>; Thu, 08 Aug 2019 07:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fRzbxgOaOYK4ZYdEjfC4xN07dECOTGDAf826r4TpQPs=;
 b=SK8nH480nj/WrMqBsTFWCK4vvMh/mf+pzwiHCuJUPW1D3OlXb6m4XzFfa1GRe6PyBk
 cBnAYD8SeNv+3FWa8PqPhlhFFjrLS1AYWWgfbHaBvLiMqsQA6/V15d/mlTJ6z2tVzD64
 lgDgrFj78F4Mtfl6bhED/tDEutncBiVkHVyJ/3apd8UVMR2M1BmfWXmZxiabCN4cSXSP
 jUKpLhDRZfug6uCWm5quSKC7tFp3coH5EllSk5zpYU06H57PdFiJThyQllfe/FDnVDV7
 j5hUk4sFStNwapGnaAyL2Rp/MkrDzB9shyDQCm7h175qDusg6q2qnVUD8s/858NRmcmt
 B+0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=fRzbxgOaOYK4ZYdEjfC4xN07dECOTGDAf826r4TpQPs=;
 b=HtDvW+xJzmwMRnoYpZADOOIFTPL2lb6w7QzlYyo1xMZ618h2PfjpQ3Zt9QRe8Mx6+L
 OCnjs9GBK90rQvdokDITTQTW1kL0IuMBOuAu4iQ6e22uXYT+nj/yXKNYgoXe9hXbsTTz
 W7SHJa7vhV3xaoaZf2kpozLxE1cXx3hVkc8WDYwX17gmhrsTy3iT1mvtJI4zqEM+fD5y
 elljqACJn5mCd5zSg5EfT4vo3d+SyQeVPplGG4bPiaTEm8wPQBjLm8shznljn3HlPcZc
 FaWfB95YPaX4E9iSHMA236G/mkcKrwtUX9Ur0fhVaxwuBGvTnqqA4KxJfGgOS1uY0bFu
 pQLQ==
X-Gm-Message-State: APjAAAXu/5HsNMnIWXr4+Ak7JeS5tVgBY39x7rPTWa4yp+Nm8pYLvpx4
 T2q7Nus513LxzqNDnZA3uWvccw==
X-Google-Smtp-Source: APXvYqxp3PdDQPmSdAbC9WxolTZk3R/nQhJ96oYQMs3RR7dotLRNv9glMTIw4h4PFtic0dHZGEgDmw==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr4713556wms.8.1565273391975;
 Thu, 08 Aug 2019 07:09:51 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t14sm2906174wrv.12.2019.08.08.07.09.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 07:09:51 -0700 (PDT)
Subject: Re: [PATCH 4/9] drm: meson: vpp: use proper macros instead of magic
 constants
To: Kevin Hilman <khilman@baylibre.com>, 86zhm782g5.fsf@baylibre.com
References: <86zhm782g5.fsf@baylibre.com> <86tvcf82eu.fsf@baylibre.com>
 <7h36jyy3qn.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <d4bb07f6-4b42-573b-abe2-5d54a8b99a92@baylibre.com>
Date: Thu, 8 Aug 2019 16:09:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7h36jyy3qn.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190808_070953_879994_F008CD3A 
X-CRM114-Status: GOOD (  12.95  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Julien Masson <jmasson@baylibre.com>, linux-amlogic@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 25/06/2019 01:15, Kevin Hilman wrote:
> Julien Masson <jmasson@baylibre.com> writes:
> 
>> This patch add new macros which are used to set the following
>> registers:
>> - VPP_OSD_SCALE_COEF_IDX
>> - VPP_DOLBY_CTRL
>> - VPP_OFIFO_SIZE
>> - VPP_HOLD_LINES
>> - VPP_SC_MISC
>> - VPP_VADJ_CTRL
>>
>> Signed-off-by: Julien Masson <jmasson@baylibre.com>
> 
> [...]
> 
>> @@ -97,20 +97,22 @@ void meson_vpp_init(struct meson_drm *priv)
>>  	else if (meson_vpu_is_compatible(priv, "amlogic,meson-gxm-vpu")) {
>>  		writel_bits_relaxed(0xff << 16, 0xff << 16,
>>  				    priv->io_base + _REG(VIU_MISC_CTRL1));
>> -		writel_relaxed(0x20000, priv->io_base + _REG(VPP_DOLBY_CTRL));
>> -		writel_relaxed(0x1020080,
>> +		writel_relaxed(VPP_PPS_DUMMY_DATA_MODE,
>> +			       priv->io_base + _REG(VPP_DOLBY_CTRL));
>> +		writel_relaxed(0x108080,
> 
> nit: still a magic constant here, and it's not obvious why it's
> different from the current one.

This is a magic constant, it's a color, but indeed it should not change.

0x1020080 is the 10bit variant of 0x108080, on purpose.

Neil

> 
> Kevin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
