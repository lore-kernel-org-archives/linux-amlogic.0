Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5105C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNoSjgnOjXRsgzi4lqq0I4/AdDXjGTp1ie40PCbphqw=; b=ZJi1YEtSceTqrg
	u5KI98HrqEki0CLUKBi4/gFssZv0OzIzDLRiK3F/E/NlckAvpd4m99vnhlVw4MoNnvKNSY3I8R0Wc
	9jM37t84oRkQWq0YLnejYerbh9eci3Bfix7v6NTpDK3spdT5xsx7YIUUBGecRQakofyZ0rq4YcTax
	R11weGirDIF+bn3xbml82f7h6R9rtDTtVvGqahhhPO7PtBiA4uvdy5yPHxd1FOpi6H6LMDqeZwAZ+
	bpFJbL26q83iLbyYk4m+KVFwKQNnQfmRmM6j4fDMz9qRYt6NuyIxS4layO8GCyu5Q7ZzT4xilNwe2
	5lgelPAveGyj88nFrkzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSQf-00CU2t-CI; Thu, 21 Apr 2022 08:44:45 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSQU-00CU0d-4g
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 08:44:35 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so5365293wmb.4
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Apr 2022 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7NcpkA7Pw9hAO8IT6wBMBlDV/T3SO7ggWZNFOJPPHDU=;
 b=MQECcGKVohiNS5vFHXZHfPei6sjTLX7AbRBc5gb+1cz+EJcMoDkCvHLLucoHdQZeE7
 Ax4gPbC9KBzX74VcvQfmswh3+AnC3rVzH04Ay1JuVVMj6I57yZbAT2HZJhCbl7i9Ul92
 QUpzdofWN0LsAMMiLXa1JfDaA7YRCPqyoMIsiCDf95O9FMlGMSAkWYoeOwwxHuHXYZya
 53i/uSGduoAvI8Y/JQ/IyAdSAgrm4/hOteE5AdtrMG+srHvdp6SD16TpTVL3xsTNpQuv
 qbojfgiloucpsxE5up5cj0ehLMZQlqMfgbLu8oPRYbPVV4mvOIVc2TvHCeY/B+hYB3LU
 rMzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=7NcpkA7Pw9hAO8IT6wBMBlDV/T3SO7ggWZNFOJPPHDU=;
 b=gBNRKtG3ljSEydLxdnckxMgZEH8JoVJ/HmVD4WcGxQl9nv1oxhBh49O8rJO0f4FObH
 AI9DCYFL6DNJILg3UQU03H6zrxFXwPUWWunAts3myNmZgIp12T7ZY5U4Chw77kJjJilx
 s+HJZlySLUJiFIsWyfcRVXv32nwgcKV29TzOLG4XAUCBacAsfF9YeoHSbXZ+dnvho4fp
 ulgMmaJ8iG56XJ332DFKnKHakqHInt18Iu9AWBNGL4U6l+/M9/o7b2WD1Wn5prFv6tsd
 lOxvCFUQh0HOalELvp/PdYDJyGzKoq/wOoh1igxoKOb/exOhvi1LpcP/o1ngHe6e82ue
 +mnA==
X-Gm-Message-State: AOAM531CkQwMQPBEeZcTVfZEpEN9NCcCfGvECmgq5AiogpPj7h57nPZY
 kUdvKASQVQzlmUKlhJlfTCXisg==
X-Google-Smtp-Source: ABdhPJxo2qSVLuSHhc7uKb9o+3uAOxw4dje5NJIJLKDy6nHZr8RDh9WuhE9wiKBRYMmykUWgl7k3XQ==
X-Received: by 2002:a1c:f219:0:b0:38c:782c:3bb with SMTP id
 s25-20020a1cf219000000b0038c782c03bbmr7353742wmc.94.1650530671247; 
 Thu, 21 Apr 2022 01:44:31 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:35ba:2677:956:980d?
 ([2001:861:44c0:66c0:35ba:2677:956:980d])
 by smtp.gmail.com with ESMTPSA id
 i74-20020adf90d0000000b0020373ba7beesm2150548wri.0.2022.04.21.01.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 01:44:30 -0700 (PDT)
Message-ID: <0d76ba66-9e2c-510d-780e-26fe9626c1a5@baylibre.com>
Date: Thu, 21 Apr 2022 10:44:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 1/2] tty: serial: meson: Add a 12MHz internal clock
 rate to calculate baud rate in order to meet the baud rate requirements of
 special BT modules
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Yu Tu <yu.tu@amlogic.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-2-yu.tu@amlogic.com>
 <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
 <d10e27ff-e674-87bd-2c98-63c7040baeb1@amlogic.com>
 <9af92c78-73a7-d524-182c-3ebffa69b08a@kernel.org>
 <CAHp75Vc87oTmJ6zVeY2mGbP8Jx_SSDtp39Uq4YhWerDUX9RdQQ@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAHp75Vc87oTmJ6zVeY2mGbP8Jx_SSDtp39Uq4YhWerDUX9RdQQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_014434_206446_9DBBAC68 
X-CRM114-Status: GOOD (  16.71  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Andy,

On 19/04/2022 10:21, Andy Shevchenko wrote:
> On Tue, Apr 19, 2022 at 10:38 AM Jiri Slaby <jirislaby@kernel.org> wrote:
>> On 19. 04. 22, 9:29, Yu Tu wrote:
>>> On 2022/4/18 20:09, Andy Shevchenko wrote:
>>>> On Mon, Apr 18, 2022 at 8:50 AM Yu Tu <yu.tu@amlogic.com> wrote:
> 
> ...
> 
>>>>> +struct meson_uart_data {
>>>>> +       bool has_xtal_div2;
>>>>
>>>> I would prefer to see this as an unsigned int and with a less
>>>> particular name, e.g. xtal_div would suffice.
>>> I don't have a problem with your suggestion.Let's see What Neil has to say.
>>
>> Actually why uint provided it's a boolean value? Or do you mean to store
>> the divisor directly in this member, Andy?
> 
> Yes I was thinking to provide the value and then always provide the
> private data. In such cases we don't need an additional condition.
> 

Actually, the original boolean "has_xtal_div2" is right because it encodes
if the HW has an internal /2 divider for the XTAL clock input path.

The HW historically has a /3 divider on the same path, and new HW now has both.

So the boolean indicates if the /2 divider is present so it can be used.

So I'm in favour of keeping the boolean type.
For the naming, it seems appropriate for me.

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
