Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA79BC10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:22:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96DA420880
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 08:22:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KioXJshh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eCwb0ccx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96DA420880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:To:From:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nUw9ccd8DSYH3KcYSJK9Z+UecWXjo3eGTgLQ3XZ029s=; b=KioXJshhNUepxZ
	e3AlB3X7gT1N3fIAksytVzsnrNsU5dbM9bXMSBwEG9+AVdPyCC+1E4Dw+tXsegSiCJL7D5Ih8AsWI
	2uqqnlp6vgrfYs5DMvsnMiKVa3JlliPsL8Y8HJt4fEmFigqPUIm/UHiTMnQQDHukZXUjLiNTj0+kv
	pWB/yuS+d047S+4BltGccdCLA1HU6KBe4MjaVAP7bi8LLYXNilmPzg0+bJGfK2fsShK9noQAmtDWW
	cEw8ElrYZuwVnq9Gd9A2nOAxhNm3WxvwN5N+9X4oF1kqroNJtuDOmC0UthdAfR3wSGLQiTRCrVYvQ
	K40VD0k7tkaoFrb4CH8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDm1Y-0005Je-Ew; Tue, 09 Apr 2019 08:22:32 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDm1S-0005BU-4S
 for linux-amlogic@lists.infradead.org; Tue, 09 Apr 2019 08:22:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id t17so19599561wrw.13
 for <linux-amlogic@lists.infradead.org>; Tue, 09 Apr 2019 01:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:cc:references:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IwnDpl0hO7uvapsaMda9hx23vqU8WkPInC2R/3W6nCM=;
 b=eCwb0ccx8Bq63y6zHsgTiiGtMgNJ2KGdo5P2hPdBp29vIl35P/uuGhsT3VYRzER69Y
 YsQkRhAzKEHKIoSfvzzgz7NgXvcElBdDz2NaOwO+pDqbIcydPOSsc8ychcP5mt2wYyUH
 NSBgU9Q+4VgJ/+av+3i2NN0/Td+9nPbwTI5bh8mRxjzsG81n3V/CcOGnK6PPBxEot+sB
 plezH64H3bxaVt67OhF1lveSOFQjf0u1l8w80rXISqMmmlmlgQVbG3MQpjM+2AW2ZXXz
 UX10Ies77J+k0ZkHqcEoEY7NBnDXBRjvWs5clkzU3psEXPZZlFkO3mxBiKv79jU+BOuB
 5Ydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=IwnDpl0hO7uvapsaMda9hx23vqU8WkPInC2R/3W6nCM=;
 b=RvSzDDQSCBGfqQO0rfA+CelHhKS3dFwEMkbm/SZPgIkegpWwi4htzxVVgpiowKwTNo
 RNwR3owbGyW+jZkwfOVTTlK0NtldAEsdrbcdry4ecSOjsZHkMOaHySir6/YpbxyHaBYz
 2yQ4UsTYGdqVYPXZDlLjjALf6fS4dbJTasPt04ZGv3rDkzFiYN6efH0oJ3TxyiCVIFqn
 rq8asWECUYLRsg71QlPVjgoZO084RThPMmzDTdkp8ur+Wo+J4r1Gc8mysFwZmcsixvDY
 1UhgXMqqRkl2UH93bq7ub9fEiXsunHmfEhB2r0TWcLRPcF5EnKdwyYQ9Z8Hal2ivvIHE
 qutQ==
X-Gm-Message-State: APjAAAUjbIz7vdkve18Gb0rsPy73GqWdNviu3rl/C05U47VTjIZuMC49
 mAkRXuFY07owuJIn+a8Jd+mWURAJQ2U+fw==
X-Google-Smtp-Source: APXvYqzfo71jo+mDzQCJkpuvG0dGusNEEGSo6+UHrVNzDL9poApc91D24OaL7Y628AKG7wPxgCKVNw==
X-Received: by 2002:a5d:424b:: with SMTP id s11mr14278136wrr.158.1554798142342; 
 Tue, 09 Apr 2019 01:22:22 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id d6sm42330253wrx.62.2019.04.09.01.22.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 01:22:21 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] arm64: dts: g12a: Add peripherals
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
References: <20190325100339.749-1-narmstrong@baylibre.com>
 <6b97b67a-3b00-81d5-1031-3a7c423f62ff@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <891b8b51-256f-0c31-6b16-1b70bddc73c2@baylibre.com>
Date: Tue, 9 Apr 2019 10:22:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6b97b67a-3b00-81d5-1031-3a7c423f62ff@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_012226_173400_C40B7E9E 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 01/04/2019 13:51, Neil Armstrong wrote:
> On 25/03/2019 11:03, Neil Armstrong wrote:
>> Add following peripherals :
>> - SAR-ADC
>> - USB
>> - Mali GPU
>>
>> Dependencies :
>> - ADC
>>
>> Depends on CLKID_AO_SAR_ADC_SEL, stable clk headers tags will be
>> available after v5.1-rc4
>>
>> Bindings has been merged for 5.2-rc1
>>
>> - USB
>>
>> USB depends on the CLKID_PCIE_PLL, stable clk headers tags will be
>> available after v5.1-rc4
>>
>> USB2 PHY depends on missing Reset bindings, have been applied to
>> reset/fixes, waiting to be merge into master or immutable branch/tag
>>
>> Bindings has been Reviewed, waiting to be applied
>>
>> - Mali
>>
>> No Clk or Reset dependencies
>>
>> Mali GPU bindings are still in review.
>>
>> Changes since v2 :
>> - dropped applied patches
>> - collected review tags
>>
>> Changes since v1 :
>> - dropped already applied "Add AO Secure node"
>> - dropped meson-g12a-u200.dts uart_AO change
>> - fixed includes overall to fix build for each patches
>> - removed disabled status in dwc2 node
>> - removed uart_ao_a_c pinctrl
>> - fixed uart pinctrl node name
>>
>> Neil Armstrong (3):
>>   arm64: dts: meson: g12a: Add SAR ADC node
>>   arm64: dts: meson: g12a: Add G12A USB nodes
>>   arm64: dts: meson: g12a: Add mali-g31 gpu node
>>
>>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 117 ++++++++++++++++++++
>>  1 file changed, 117 insertions(+)
>>
> 
> Hi Kevin,
> 
> Clock headers bindings stable tag has been sent to the list,
> USB PHY Bindings has been applied, USB Glue patches are
> still pending.
> The Mali Bifrost GPU bindings are still in review.
> 
> Neil
> 

The Mali bindings has been applied to drm-misc-next.

The only remaining dependencies are the USB Glue & DWC2 bindings that has been
reviewed, but not yet applied.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
