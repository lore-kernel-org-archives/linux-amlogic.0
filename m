Return-Path: <SRS0=Nbbq=RK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74872C10F03
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 12:23:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45CAF20643
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Mar 2019 12:23:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i2bM9mLo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Z+Vnx0PE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45CAF20643
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HMn1HVvAIwobIv4aJr8T1E9NcKlzpYJosNiuh2OZSAw=; b=i2bM9mLoRS1wqS
	J7rdIIVpMlM9sZj1bMAv8O5rf5gRI5FWvVKqqGIh1DzVckvO7rhcs8Odz+WfbhjgDJwvgyALAhQvi
	atSbqnsHs8JouTBmGLjPOQXgjKAoEiCphH6FT4YRxIgzKxpC/e+J9zByP11+qdqJ5eF0U9UwYpwIV
	WFngtovdIuhPSrW5wL1ud7oEsZ7kgQHijryWgHH3jF3D4KEQyGZkE/3QdxXwNQYyC2hIPVT3ZBPdX
	nvueVk7OcyYKQjPQT4Ek16KL58K6Kc8/C0Z1OE1DGwN7HIftjp1RQzPJ4q+NM+7v4xAHrP8yy6H3W
	V3tvzxO+TT0X/0pKIIJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1s3n-0004p2-Hr; Thu, 07 Mar 2019 12:23:39 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1s3j-0004ns-HG
 for linux-amlogic@lists.infradead.org; Thu, 07 Mar 2019 12:23:37 +0000
Received: by mail-wm1-x344.google.com with SMTP id e74so9065903wmg.3
 for <linux-amlogic@lists.infradead.org>; Thu, 07 Mar 2019 04:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xZnHHML60T+n/bO0kwehOUww2lBs+KggvKBcMxiuomg=;
 b=Z+Vnx0PE+z3e9tfgZaZ4NcXDtHFnE0SxY4rofnutOUFcOGA7UmcrMzm4ssP+c7nj4i
 ZrYFf3bHb8XTqQMShJvOZr0qGUU7LllP6eGxTD2jk5O7E/pAthV4n0BfrQh2YeU3WZWL
 lrF+1vDe+W9PMv3s3MzlnsgBt7T/Yyk+IZa/oDZ/zQX4NQGTj+YtWqmqQ7ceoFTAxeFK
 OutTfW6XKPh80L3AOeNI+O/Vj97N6JiIk7xyj80webE1lRWlBJm1s+T1tcypM8CPZSNM
 cckZU2JnjRj/rHeGicjVPyMPMxEf2KVIel4nsTNYgtNwKbf7wejKNiqRujNkVvOACcAl
 f5YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xZnHHML60T+n/bO0kwehOUww2lBs+KggvKBcMxiuomg=;
 b=BIkF6kSmJ9UoRXCOTydMone6J5gMhVYY2Lc6NCwPVCu+0DNQIY32EG88RK0XBTkSq9
 NzWu94XFxUSlPCVBIvbLvWHMTDOWgWpJDTvoRwoCEPyXPSIBfKR+HEkbM7/eWKrAYCYF
 rDD7F3oQXmfts7QCmIyxr8UVW36M0AjOjqlj4wMsFySqE3JyVuDM2KvWggyPEu3EHEyk
 hMGM9e5ebQB0gKYujJ9cXEp01xGhX0tK3USOfTOkAzcUfoiBwP1g6K/BWQQr9MHK6I58
 T+T5kh1Ay3Qz7D1Sck2bwE0sjHEKvCkD/hUps8az0kRhQD1lGJNx9RcD4Fu+jjDekJr2
 4D6w==
X-Gm-Message-State: APjAAAXgnaAszXv/JXVYstcK9MJvo6ne6BR0mwaXurmajiZVLhvT/1vE
 uTtmuE6KDFP5lB5J2lnZW9gyKQ==
X-Google-Smtp-Source: APXvYqzAeISSp87eiAyy6VPJ52W9/nR00tpQJ+1XDSz5kNCYeltXyBHoXb+7QLSD52a+58jcgE9kSQ==
X-Received: by 2002:a1c:6045:: with SMTP id u66mr5018976wmb.133.1551961413593; 
 Thu, 07 Mar 2019 04:23:33 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id o30sm5691489wro.57.2019.03.07.04.23.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 07 Mar 2019 04:23:33 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: reset: meson-g12a: Add missing USB2 PHY
 resets
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20190304104916.3937-1-narmstrong@baylibre.com>
 <CAFBinCAkMSeMuXj++cWBYP4WFwAMEwm-EFHtLA5X85oe6kekTw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <b09ab1a0-9c6a-3d4c-b658-6ac1dd9ec0f5@baylibre.com>
Date: Thu, 7 Mar 2019 13:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCAkMSeMuXj++cWBYP4WFwAMEwm-EFHtLA5X85oe6kekTw@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190307_042335_619116_991ECAD7 
X-CRM114-Status: GOOD (  16.56  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 05/03/2019 23:02, Martin Blumenstingl wrote:
> On Mon, Mar 4, 2019 at 11:49 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The G12A Documentation lacked these 2 reset lines, but they are present and
>> used for each USB 2 PHYs.
>>
>> Add them to the dt-bindings for the upcoming USB support.
>>
>> Fixes: dbfc54534dfc ("dt-bindings: reset: meson: add g12a bindings")
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
>> ---
>>  include/dt-bindings/reset/amlogic,meson-g12a-reset.h | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> index 8063e8314eef..6d487c5eba2c 100644
>> --- a/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> +++ b/include/dt-bindings/reset/amlogic,meson-g12a-reset.h
>> @@ -51,7 +51,10 @@
>>  #define RESET_SD_EMMC_A                        44
>>  #define RESET_SD_EMMC_B                        45
>>  #define RESET_SD_EMMC_C                        46
>> -/*                                     47-60 */
>> +/*                                     47      */
>> +#define RESET_USB_PHY20                        48
>> +#define RESET_USB_PHY21                        49
> because it's always hard to look up, here's the reference to that
> information Amlogic's buildroot kernel
> (buildroot_openlinux_kernel_4.9_fbdev_20180706):
> kernel/aml-4.9/drivers/amlogic/usb/phy/phy-aml-new-usb2-v2.c uses:
> writel((val | (0x3 << 16)), (void __iomem *) ((unsigned
> long)phy->reset_regs + (0x21 * 4 - 0x8)));
> 
> this translates to:
> - (0x21 * 4 - 0x8) = RESET1 register / reset line ID 32 and above
> (reset line 0 is at "0x20 * 4 - 0x08")
> - bits 16 and 17 = add 32 to that gives us reset IDs 48 and 49

Exactly, thanks for pointing this !

Neil

> 
> 
> Regards
> Martin
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
