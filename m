Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1F9C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 08:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WnxtE9Z8tv7aa7PbrVrOwF2u5bWQh+PAl2AoyItnfMs=; b=QGgy6c3bbn3gKX
	mcYW9HxJK9mQBjWmZgIEUcbF2oxgmEetJqGDSAIeN7uFDD/d83y5219An0eRiiuO0Lf5mAWgImIrU
	2geSo4St+oWpbMvGeOQJP5+J6Nh9ui5kPEYw/2cjatI+EQPzqtZ8Ndmk7nQAySRtQc1a+PDazaoq+
	tQZsahOkeW8XOsDbhghb2mkLMT0Ucj391KK0qLPbolPw6lQ5YM1VkquFSk0yyceDpXQ9SsY67NkBW
	W6+R1gkmABafkYDC+o/z45+SkQFiqrAaY1s2SjpkGC6TxOd7yuLEOmy6+PmYWidOIIG8CHnDQ4CZh
	StLtxly7AG1TMjbDhnyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSSu-00CUs5-FP; Thu, 21 Apr 2022 08:47:04 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSSi-00CUo3-HM
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 08:46:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id i20so5614355wrb.13
 for <linux-amlogic@lists.infradead.org>; Thu, 21 Apr 2022 01:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z1R8XAgRO1RY9ptbheHK+UH29R2eRMz8Ro595MvYVes=;
 b=aOom/33qqLb3Lfu2zcsAjrk7UdXHJJVRy0kJNKJDjgPslzoTYHMMljkC085jJpJYR4
 EegA7KKwIkF+/1WfHa3PQDt8NPu1ipsKPgiV9Avgu/YlXoYfX3R3pVRdtMLK0PAE95+G
 UHsar2YSfO7sL93bYGnai0RpaCTbEzQAbufLW2NgH5woKN7/5vWtjkeIg6qBaVFU9VPh
 Er2VeFX0ErcmUSIvBehlMeYXwv74Smim+58XkpaLUxJJBJDykvoLxNjR1g9kU7+ERwWU
 wOq/Kfa6Rk9IbqfWUUDvnYA5BPRNIkFSag2Qr75UmCf3pYTGplwMsiLgofgIOxNEtMbH
 LLww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=Z1R8XAgRO1RY9ptbheHK+UH29R2eRMz8Ro595MvYVes=;
 b=lyeljPA8J6VQRxsSFzPsTmE2z+fk8bQyc6pppYh+o4BMuOZMOA7hHvXhFIj4XQVX6t
 +HB++E4TDTTs3WrQczPuDAtSFm9C4ZNyWmNxTX+dsGGauXTrbRkzNi/mzz3V/yqV5eKA
 kvLHguWVJVWSi90ncmplLAw85w83SK/QBvXw5K4BxkGcn9mi6ZJObITNG/cixgf4MWbR
 FAS7b5Tn7788bYGwU7GCP5aYxb6nV7fs3X8SGrFpJERGNiYd1usgYcOyOGauwtRvpjqD
 xygBgloAyyBmU4No/s6YxiznKIQcXqPJeAEV8bl4IdOvPgMfQmTXZfDWQ0dlVo/WN0O2
 wmaQ==
X-Gm-Message-State: AOAM531CN4PEU5/QXL6HvSCjvgFFGiKfjcSkkaW+fVkj/pV2TmJdA2Hs
 rcsnIySXcp3yjvRloG5wnle/gA==
X-Google-Smtp-Source: ABdhPJzkRWJgbzkZ114xvkXhqIqlkVxz401XfIJZslOH3Cuuu/rWZ1ncxnciYetQhmsi7vVlYYPT2w==
X-Received: by 2002:a05:6000:c4:b0:20a:bfeb:68dc with SMTP id
 q4-20020a05600000c400b0020abfeb68dcmr1261741wrx.488.1650530810597; 
 Thu, 21 Apr 2022 01:46:50 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:35ba:2677:956:980d?
 ([2001:861:44c0:66c0:35ba:2677:956:980d])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a7bc24e000000b003899c8053e1sm1675671wmj.41.2022.04.21.01.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 01:46:50 -0700 (PDT)
Message-ID: <ea86eee0-409c-2d19-3669-35a8eaded53e@baylibre.com>
Date: Thu, 21 Apr 2022 10:46:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 1/2] tty: serial: meson: Add a 12MHz internal clock
 rate to calculate baud rate in order to meet the baud rate requirements of
 special BT modules
Content-Language: en-US
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Yu Tu <yu.tu@amlogic.com>
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-2-yu.tu@amlogic.com>
 <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_014652_628407_73FFC2E8 
X-CRM114-Status: GOOD (  14.63  )
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

On 18/04/2022 14:09, Andy Shevchenko wrote:
> On Mon, Apr 18, 2022 at 8:50 AM Yu Tu <yu.tu@amlogic.com> wrote:
>>
>> A /2 divider over XTAL was introduced since G12A, and is preferred
>> to be used over the still present /3 divider since it provides much
>> closer frequencies vs the request baudrate.Especially the BT module
> 
> 'e. E' (mind the space)
> 
>> uses 3Mhz baud rate. 8Mhz calculations can lead to baud rate bias,
>> causing some problems.
> 
> ...
> 
>> +struct meson_uart_data {
>> +       bool has_xtal_div2;
> 
> I would prefer to see this as an unsigned int and with a less
> particular name, e.g. xtal_div would suffice.
> 
>> +};
> 
> ...
> 
>> +               unsigned int xtal_div = 3;
> 
>> +               if (private_data && private_data->has_xtal_div2) {
>> +                       xtal_div = 2;
> 
> Better to define privata data always

While I'm in favor of defining private data, here 3 and 2 are actually the values
2 and 3 used to divide.

The code is easy to read and we quickly understand this value is the clock divider.

> 
> 
>> +                       val |= AML_UART_BAUD_XTAL_DIV2;
>> +               }
>> +               val |= DIV_ROUND_CLOSEST(port->uartclk / xtal_div, baud) - 1;
> 
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
