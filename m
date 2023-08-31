Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB47AC83F29
	for <linux-amlogic@archiver.kernel.org>; Thu, 31 Aug 2023 07:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rh/PXTtv1haUpywlGDelGz/bGuR59CyjaA2DdWmzONs=; b=lPoYaXrxxUxkmzaZeVHLXycEY0
	7OSPp3sNTGYPUi5HTQb+ftfD0SualhTthWpUuY+bEn0NS2/JiuteaWnVRffdsRcP9J2FzTUflw8LJ
	trtQxdS3adYvo0QeUjzLTwPjxSdSFBhyRmUu20KWluZXGwZzybVrNmF6yEw1VjYAGVy8IGfHb9dFR
	JnN0tKDSV8JH4UrkQJZ4bd5DqcEEO/9a9mrM9kMWicgumZ33NcEn1hDMzuhJvQdMrdfretegzTWzb
	FOji09knlZB125f2uJirGgfc/9o8qbka5Xx4ObcpmwX8Z9iSln/vB2gwIEl0UKCnFJYHObf/iu666
	CNhPzJFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbcVQ-00EqAr-0B;
	Thu, 31 Aug 2023 07:54:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbcVM-00EqAM-1c
	for linux-amlogic@lists.infradead.org;
	Thu, 31 Aug 2023 07:54:18 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-401b393df02so5288185e9.1
        for <linux-amlogic@lists.infradead.org>; Thu, 31 Aug 2023 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693468453; x=1694073253; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9o4jIzgTDzCS8keb/VJxcr5uR2GxGl78aPztqyoXlc=;
        b=f8VYlyNX905q90EKBN1FrTVYh4ncnzWWLBvU/u8Dmv9v/1PUneX1OFwZAE2CbyRWvG
         BrYdHgU+123adOBqQwePe/7XjQlshbIL9YgC8COHGwJyu7OoePAgNa4c9aQ0D5OMQP08
         8z1A/n55oEoB5PwpMO4S0O2yecvm2Vl1T0zbSbcOT8BKkT2mURwsd1E5zmV8OJzmwKzf
         q2EGlLTgwOjF2wk2ZM/RVWJ5tPlAMLp/7PYiuPBZcrO4rK/2aXo+0Zq0Rpe+tUVybkLZ
         RSSjtl6EiG0O8Zz5Pz9/9QKRpkct9pb1GBplPPKLg4Am+ZKaZ5a0uQwGhhqZnAMu+gN0
         ZmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693468453; x=1694073253;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J9o4jIzgTDzCS8keb/VJxcr5uR2GxGl78aPztqyoXlc=;
        b=I4sz0/DbmRSHZ94aF4ntuKfMANkXWkFwH4BWhYO57tvpN1krv/evBhLkIqDynnYCzW
         UKGgdZlYoMzWlRxTz8DNNXxWMQ1CS/rJX4crFNWO4s14BxC+y5Bdgy4NWjai3RbWhmra
         DfHg3TgmFEBaStLxwoRjJgWXvwlDFQC0KJntkiJeQq+osLJtCiENTWIrlsWXqnZY5c72
         K4znRIJswcfgQVEm2lkLB3XcD4ABus6UROMZtOh+wdoxVmfQFBWVV51jG4J4b+UUg0cH
         nGBLqsN5gfXaU4LFfP4XwL6CKCWnCOXDy7QJeVoYf+DWx5uslewRxUfM8RoctR5xU5i/
         RRCQ==
X-Gm-Message-State: AOJu0YzeoPXrrz0ztBMzEC7BSx61t3qGuTd+KBtDmdMsqw2Mgm+RLr0V
	Czaz4kRwijbslyK/MChEL2Togg==
X-Google-Smtp-Source: AGHT+IHWsrPm2UBXsGxKKIMiYf/l9u4U35sZyeGuJmoQGcwdG464dSpZW2Dd/j4SS5peAPhlRcchyQ==
X-Received: by 2002:a05:6000:45:b0:318:fa5:d84e with SMTP id k5-20020a056000004500b003180fa5d84emr3060959wrx.70.1693468452627;
        Thu, 31 Aug 2023 00:54:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a33e:476b:58d7:9689? ([2a01:e0a:982:cbb0:a33e:476b:58d7:9689])
        by smtp.gmail.com with ESMTPSA id y15-20020adff6cf000000b0031934b035d2sm1299935wrp.52.2023.08.31.00.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Aug 2023 00:54:11 -0700 (PDT)
Message-ID: <d94b0cae-99cc-4f8b-9d0d-52a5858f6e33@linaro.org>
Date: Thu, 31 Aug 2023 09:54:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 0/1] meson: Demonstration of using binman to produce
 the image
To: Simon Glass <sjg@chromium.org>,
 Ferass El Hafidi <vitali64pmemail@protonmail.com>
References: <CV61D7ULLVZ0.3OCFZ743L1KSE@flaptop>
 <CAPnjgZ2iff6F3CFjnjEMUVoX3bO=kv3za4Q45YOcVeZqc96=rw@mail.gmail.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <CAPnjgZ2iff6F3CFjnjEMUVoX3bO=kv3za4Q45YOcVeZqc96=rw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_005416_565676_3DDEE886 
X-CRM114-Status: GOOD (  23.77  )
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
Cc: u-boot-amlogic@groups.io, u-boot@lists.denx.de, alpernebiyasak@gmail.com, linux-amlogic@lists.infradead.org, mark.kettenis@xs4all.nl
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 31/08/2023 05:37, Simon Glass wrote:
> Hi Ferass,
> 
> On Wed, 30 Aug 2023 at 11:53, Ferass El Hafidi
> <vitali64pmemail@protonmail.com> wrote:
>>
>> Hi Simon,
>>
>>> So I wonder how best to move this forward so that we can build things
>>> using binman and everything works?
>>
>> It's still not ready yet, but I'm working on porting U-Boot SPL to some
>> Amlogic SoCs [1]. I'm currently working on Amlogic S905 boards, but
>> eventually I'll work on Amlogic S905X devices too. And speaking of
>> signing, Jonas Karlman wrote amlimage, and integrated it into mkimage,
>> and I applied his patch to my tree. There's a few things to be aware of
>> about Amlogic signing and binaries in general, however.
>>
>> amlimage was intended for use with U-Boot SPL, which obviously has
>> no support for Amlogic's FIP format and as such amlimage will only do as
>> little as possible to get the bootROM to load U-Boot SPL. Most of the
>> packaging format is handled by BL2. The fact that the signing process is
>> completly different across SoC generations makes it difficult to
>> implement them all into one single tool (and by which I mean all of it,
>> not just signing BL2 for the bootROM to run it, that's mostly the same
>> across SoCs). amlimage has been confirmed to work on GXBB (ODROID-C2 and
>> the KII Pro set-top box), GXL (librecomputer lepotato), and SM1 (ODROID-C4).
>>
>> My U-Boot SPL port is still rather incomplete. As of today, it still
>> can't boot anything from any storage device. The goal eventually is to
>> be able to load upstream TF-A BL31 and U-Boot+linux.
>>
>> While Amlogic distributes proprietary BL31 binaries upstream Trusted
>> Firmware-A has a port for some Amlogic SoCs [2], but as far as I know
>> SM1 (which is the SoC generation your ODROID-C4 is using) is still
>> unsupported. GXBB, GXL, AXG, and G12A are all supported however, but the
>> overall port still lacks some features the proprietary implementation
>> has.
>>
>> As for the SCP firmware (aka. BL30) I'm not aware of any
>> reverse-engineering efforts for that.
>>
> 
> Thanks for your efforts on this. I look forward to seeing where it ends up.
> 
>> Honestly, in my opinion, including proprietary and poorly-written
>> Amlogic utilities lacking a proper license, into U-Boot looks like a bad idea.
> 
> With Binman, we don't really include them in U-Boot; we allow them to
> be fetched easily so that a complete build can be produced.
> 
> I don't like it either, but for users it is better than doing the
> build manually.

I'll rather spend time and effort to have a fully-upstream TF-A boot chain
for Amlogic SoC (when possible) that maintaining support for bulky closed-source
x86-64 binary only tools. The tools aren't even officially distributed.

Neil

> 
>>
>> [1]: https://git.vitali64.duckdns.org/misc/u-boot-kii-pro.git/log/?h=wip/spl
>> [2]: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/tree/plat/amlogic
>>
>> Cheers.
>>
> 
> Regards,
> Simon


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
