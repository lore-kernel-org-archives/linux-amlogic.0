Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0640C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=g/RjnOBlmoNVZ5qeW4Lvf23MVd1C0tHEQjrEvi6AVyk=; b=wi2O0zUAgX9GZW9eO876qx8mLv
	g/VZ3+/ffTG7WsNg03l1/1BhV2NVwDT4kyfx//Xv19ATihDiRDfy3xn630yKQI76UttN8sbrNVAsk
	Uq4XsOzbj7bQwWfGx/540xzZPG6lPqaza3cWLiNofs2/xhuhMvfTT6Lu63ZFmorErtwOaSRg1keDu
	YzspOWXt5R+YMkoWk/OGYBXGXYtnUAKJZnuVr4Wt9nlagWWeDd6iDF81mLT8eSUEtTu5j8pSAHaxu
	SXZJjCL1Vvznv9LlJFHVb7VSMG4rnfdBRFAtHhfAZpaRAyUNX6Aihcm/i16REInYeqjrYsL3Q2XTx
	JnNvsy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4QIe-009TM6-Ql; Mon, 03 Jan 2022 16:35:08 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4QIb-009TKt-CH
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 16:35:07 +0000
Received: by mail-wr1-x432.google.com with SMTP id s1so71024576wrg.1
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 08:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=T3i9zgwcayeVl7cWKMRosEJ4OOhKmrBVCf1DuyQd0ZQ=;
 b=RCUaoyJ8tstUuLAgGQdCMqjsBhS4AyDd1/vb1OGi7sZXmNZg0AVF09KzJY55SMrOC8
 BmAsBLhu+de4Kk0F4X/aSuyK16euq/BSzIHaZC69KVLlv7to4DJc5XFMyp0SBgNkmM8S
 tOAGUGP1WeSR+HiF4cZSYlzjCtE5W1UQBHzIxKU+KgWco/ik9v25waLqEiJ+SixDe0Zh
 HUwAqUEhJltFYvSk35b7WFJFpWMAO3fTBFg9n7emkb/ZLmYDBm5AC/MqAB6J5vGtmYUL
 Pyus9RPN1hHm3SVRlRpqlLUovM+UdhLUPq7NYvk9gN9xp/Gsakn5CDDNu9prgw1hqE9c
 OObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=T3i9zgwcayeVl7cWKMRosEJ4OOhKmrBVCf1DuyQd0ZQ=;
 b=pv7TzjOGK5rf5b+hidCxYBiB1Wes2QvfClUkjRILnD34OntMFRBDMitKFh0bQEwpbw
 hrKWf8Ud4FEXtsVSG7UQaJpitpYuH3DHkeuC8EDnz9qMNSkrXf/yNaFM9KvgK6qFX/Nh
 MYt/J09EEcdqHy5LsZs5LhjEZDiFsAMmC2v7H3g1vDkREgMXpoJ1cDAEbgcs9z4jJUU3
 /56YJHCvorft2e17lDdX+YdiHYs+Q8jqHhZk+FrPWmweI5VI17WCLXZcSwloX3CUFkfu
 ogY4ZWfpTaJMPf8DUPIzJxJ85o1b4BiRCfKch2O6xqztQ5PBH8SFJI2ml1dKmlU266YK
 T7Xw==
X-Gm-Message-State: AOAM532rk5E0PKKmh+vKo0P+DCENJqzGyndvaMfdEQmE8vJLTf3OMSpG
 Nwj3+0lRvMLxCDFy1LEGlyxNcJ6lHiZtCw==
X-Google-Smtp-Source: ABdhPJw8ZtseazM51WUqhtiDVXvitp+YDlIfXCPd0LTC+fJ/cPh2CMZqRThBa00IrdH/HQDGzeNZOw==
X-Received: by 2002:a5d:58dc:: with SMTP id o28mr38899290wrf.217.1641227702500; 
 Mon, 03 Jan 2022 08:35:02 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id l10sm20389876wmq.7.2022.01.03.08.35.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 08:35:02 -0800 (PST)
Subject: Re: [PATCH V3 1/6] tty: serial: meson: Drop the legacy compatible
 strings and clock code
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>, Vyacheslav <adeep@lexina.in>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Yu Tu <yu.tu@amlogic.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-2-yu.tu@amlogic.com>
 <CAFBinCCwjS36ss_4sU+o9m8gEprFsVZbqcxgpQxczTNohZqFdA@mail.gmail.com>
 <a296e666-368b-4cd5-427e-30fc66a15b49@amlogic.com>
 <CAFBinCA2V=sx95Q=+4nLDXFK1Os11XVWtK8KauxixVwYXLUz1Q@mail.gmail.com>
 <3865f01c-83f7-a69d-6835-c26f662629b7@baylibre.com>
 <YdMUEzStFf99EeQ5@kroah.com>
 <df9e472e-ac17-26ed-d820-e80d5b7b0e80@baylibre.com>
 <YdMkc2YQcYjgR7Qk@kroah.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <257d153c-960a-59fc-dfa9-5e160e42b68d@baylibre.com>
Date: Mon, 3 Jan 2022 17:35:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdMkc2YQcYjgR7Qk@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_083505_515677_D1E06040 
X-CRM114-Status: GOOD (  23.57  )
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

On 03/01/2022 17:29, Greg Kroah-Hartman wrote:
> On Mon, Jan 03, 2022 at 04:29:56PM +0100, Neil Armstrong wrote:
>>>> Would it be possible we also receive the notification when those patches are applied ?
>>>> Maybe a MAINTAINERS entry is missing so we can receive them ?
>>>
>>> That would be good, so that people can review the patches.  Otherwise I
>>> have to just guess :)
>>
>> exact, I naively thought it would be matched in the:
>> N:      meson
>> entry but it seems an proper entry for drivers/tty/serial/meson_uart.c is needed.
> 
> Try it, does that work when running get_maintainer.pl on this patch?

Yes it does work, so no problem here

> 
>>>> It would help me track those TTY and USB patches more easily.
>>>
>>> I recommend MAINTAINERS entries for drivers that are not listed and that
>>> you care about seeing the changes for.
>>
>> This is why we have a regex to match these.
> 
> Great, the submitter should have used that.
> 
>> I can submit a patch to have a proper entry if the regex is not enough/appropriate.
> 
> Whatever makes the tools work is fine with me.
> 
>> BTW can you point us how are selected the recipients of the notification messages you send ?
> 
> For when I apply a patch, everyone on the ack/signed-off-by/reviewed-by
> list gets a response.  I do not hit mailing lists with the notification
> as that's just too much noise.
> 
> Been doing it this way for well over a decade now, nothing new here :)

Ok right, no problem, other maintainers (e.g: net, sound) and default b4 behavior is to
send notification to same recipient as original patch.

It it fits everyone for a decade, no need to change ! We have very low patches for tty & usb anyway

Neil

> 
> thanks,
> 
> greg k-h
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
