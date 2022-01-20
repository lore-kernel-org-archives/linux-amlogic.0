Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0552C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Jan 2022 21:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e15BCzXp+gzI+KRyr93mAL+0hywGxK1SgdrVabQVnQ0=; b=1HLmLquWPy0+Qq
	Zc2ftxf7VjQKZVeZRwXDyG89Vi7O30j7U/quntLIbelSgMeX3CSUFdW00qxPoZk6CgnXPAP3znSN+
	PyMJUJzOxLFZakNhhS/KnqTGkwclrRJRIZgzs9wPuef0p9St7ck7kQSK3WS7PeeFNqu/390mU9NTy
	0VrXQ45FCp/pg5pZMNzOZcBIiaK6/JJwNjxZ5LgGOYqAoY+TzXJ2Bc+ismI3CR/qmVHGrKjh3tPJa
	rumKeoFZQgUO+GDivQuH5ZsfSxmrj1TGpCbyqIQWSrslkfGpXNFJjASMT9Cz9wC6VOXzVr4SnS6Po
	HkFrnypwGHyJFeBmzwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAfIb-00DEfo-HN; Thu, 20 Jan 2022 21:48:53 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAfIQ-00DEcO-88
 for linux-amlogic@lists.infradead.org; Thu, 20 Jan 2022 21:48:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id
 az27-20020a05600c601b00b0034d2956eb04so17046421wmb.5
 for <linux-amlogic@lists.infradead.org>; Thu, 20 Jan 2022 13:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=JjVDuclbm/fwd2D1p+3vNEJf8jRpvYGorewRrFiM1Nk=;
 b=BhkPYbE7gJHwnPZPanlfo81NZiNYPU3pUlQRgPPsVwF2iIRRzRA5gL+RYJ2hDgIHb3
 aRU2eMEqs27g0lDG94wnqyLtTNN2ROeLl4IVsIRyl8hFyeYr6WQPEG2Qi9UXyVs3HHRz
 RubuD53ZgUcuVHBMhWAPnvqJvPzTPGJETf/mAkMykQaLCc8IRZU87pGIjCQw43fIeCHS
 WA87ZD/HIQ3sI5dVkDVDMt/g981l0umLfNThnpx1dG+ZSdtHuiPXkpjEF1/uQHd00Vgt
 TYLJffI9ZQblEFIescsXcuZVPO7gE9Y/f1FRv+oGSB95UJI7BxYMl/11mK5D2phSKWYf
 XQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=JjVDuclbm/fwd2D1p+3vNEJf8jRpvYGorewRrFiM1Nk=;
 b=Dzy4noY6yAdhO58hVV6hBB0PjPL8t760uEkobZMZi3tJXYA2nw00PKjSniQbMwowW8
 wSuNX1QPblGTTudZkEoSem2SIqQaT9YPtq74VBypnv0l9UCmnpoGp8VDs9NGg2yhCneU
 hiZVkOdgMGZbPXaRV57Z7oB0eLLgCWWCySEFTY9BlkOCGP3Gy/Sy1nuZJJBpPsYtDkHe
 cJ1fn+vLSk8MMlsIGzCNfNs8C7mdnbdWRUyQvgm/NdHOyk4OWgbgksW6OihvhJi3tZSY
 XNdmLNG0givE4hu9Z1mzfo2wzK8ErJ5CZrIu2WaNfpLl8F+gwSDC1bSUDmmNN3ku3sE/
 n0mA==
X-Gm-Message-State: AOAM530MtI9lywH7iW5irXYJlA0nJKEXEZHES5/czJ7blaM6wHVPuk4p
 uZt0Ih8YqVZGyR2GK+oqRsUGWg==
X-Google-Smtp-Source: ABdhPJyeAzG7rOyZiz2BqoVDEHOnTtESwblpIq6zOwSJ2PM3W38rOTS4SiCV4oVBL9N6rxvZoGT5Mg==
X-Received: by 2002:a1c:19c1:: with SMTP id 184mr10699464wmz.61.1642715320804; 
 Thu, 20 Jan 2022 13:48:40 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id o15sm4543402wri.86.2022.01.20.13.48.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 13:48:40 -0800 (PST)
References: <20220118030911.12815-1-yu.tu@amlogic.com>
 <20220118030911.12815-4-yu.tu@amlogic.com>
 <7a8016ba-730b-f599-2032-31cf03990a55@kernel.org>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jiri Slaby <jirislaby@kernel.org>, Yu Tu <yu.tu@amlogic.com>,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V6 3/5] tty: serial: meson: Describes the calculation of
 the UART baud rate clock using a clock frame
Date: Thu, 20 Jan 2022 22:48:05 +0100
In-reply-to: <7a8016ba-730b-f599-2032-31cf03990a55@kernel.org>
Message-ID: <1jbl062i4o.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_134842_325641_81F0869A 
X-CRM114-Status: GOOD (  16.26  )
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


On Tue 18 Jan 2022 at 10:39, Jiri Slaby <jirislaby@kernel.org> wrote:

> On 18. 01. 22, 4:09, Yu Tu wrote:
>> Using the common Clock code to describe the UART baud rate clock
>> makes it easier for the UART driver to be compatible with the
>> baud rate requirements of the UART IP on different meson chips.
> ...
>> --- a/drivers/tty/serial/meson_uart.c
>> +++ b/drivers/tty/serial/meson_uart.c
> ...
>> @@ -629,57 +640,105 @@ static struct uart_driver meson_uart_driver = {
>>   	.cons		= MESON_SERIAL_CONSOLE,
>>   };
>>   -static inline struct clk *meson_uart_probe_clock(struct device *dev,
>> -						 const char *id)
>> -{
>> -	struct clk *clk = NULL;
>> -	int ret;
>> -
>> -	clk = devm_clk_get(dev, id);
>> -	if (IS_ERR(clk))
>> -		return clk;
>> -
>> -	ret = clk_prepare_enable(clk);
>> -	if (ret) {
>> -		dev_err(dev, "couldn't enable clk\n");
>> -		return ERR_PTR(ret);
>> -	}
>> -
>> -	devm_add_action_or_reset(dev,
>> -			(void(*)(void *))clk_disable_unprepare,
>> -			clk);
>> -
>> -	return clk;
>> -}
>> +static struct clk_div_table xtal_div_table[] = {
>
> This can be const, right?
>
>> +	{0, 3},
>> +	{1, 1},
>> +	{2, 2},
>> +	{3, 2},
>
> Not sure if you didn't remove too much whitespace. I think it should be
> like: "{ 0, 3 },". But I actually don't care, it's a minor thing.

Seconds
It worth fixing in the next version

>
> I cannot comment on the rest (clk and OF part) as my knowledge is pretty
> limited there. Leaving up to others.
>
> thanks,


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
