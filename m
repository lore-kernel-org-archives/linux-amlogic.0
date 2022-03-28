Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED935C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Mar 2022 22:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fI5zYfLNAEVXMj/hJVlgW8+zvDYO8UmCE9aKgYkRX9E=; b=R2c70WpJl4/R9f
	1UnZ+L7ul+HZHGiRaBjOvdPTijwa95CGOItnQtF36Wwzo6nWviUiQY/OR7ZSSXaBsdKrr5c+G51sr
	QCOyTiPLFZySltT6K64cJTznr28K0RJwgwTSYs6+gT9Fwrlzg1jy4k1+m4dN0ua/m3l3QpcZEJbw2
	y85OI19EnclUIjfZJDHGDrxGfsZcJWOwbKunb02FUNLPfBssDNPgXuRE5d7UO/hxTzLt5+NWIHfSU
	y6B6LZXH9zwiRwQVwQdae0BBHP43t6TZvLcrqelDOn9vzXBt80DZkvYDcn+HOHlQy+g2+3hoZXIo2
	sOAVKiLuB6blK3R/43kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYxte-00ALxK-6r; Mon, 28 Mar 2022 22:31:34 +0000
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYxtS-00ALw1-G1; Mon, 28 Mar 2022 22:31:23 +0000
Received: by mail-ua1-f44.google.com with SMTP id j20so572265uan.1;
 Mon, 28 Mar 2022 15:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=CmZ698zi6YOmaGXJq+4D519v38GWNIw39PDssju4nkQ=;
 b=kP6GdMRCH6wBLqyv5ds5rbBwusFRudKQUkTZVXXK7HpeoOlU4okimyA0F7RQaaan0C
 U5CX7W4dQVYjs+tduk5LKd0BA1LAISGyL1QGvHPybgOR4qJiTj05WodPWVqymWPvpJMv
 X44iDHx2lxAqdRCBwwekaCUivVu8eGLhEXIZYkTgA816nMXIgWEksZeA4O5AUlhYpVVC
 o5jJZxfaA3tBjV+ZHH1AC2TWh9D+TWhnWhDEE6sn3oaeOE8DANchxdzOUsaXx7H9Xkrq
 273l2sjK8Bs84fvv1Jz6BplpzdCIwxEnHG3A1egSCrxFGkVgFDpCNq+4cHGTE6dvSVUL
 BDbQ==
X-Gm-Message-State: AOAM531ZfG1P8ULlt+wVU3r+EoTKpeo6vhWchn/US0UxXcKLUmtJC1N8
 uVgueJEc/K9j+GI8YvYR52EHQwfXp7drEA==
X-Google-Smtp-Source: ABdhPJwwtYun+fHubrgsLeXgtAvvkrOd+HjVvXMShaCqbPXTixOecEGJ7ifietwc9h29dxZqpOFg4Q==
X-Received: by 2002:ab0:6e93:0:b0:359:a488:689a with SMTP id
 b19-20020ab06e93000000b00359a488689amr12564373uav.90.1648506680825; 
 Mon, 28 Mar 2022 15:31:20 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175]) by smtp.gmail.com with ESMTPSA id
 g81-20020a1fb654000000b003321cc19144sm1723452vkf.1.2022.03.28.15.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Mar 2022 15:31:20 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id c4so8800368vkq.9;
 Mon, 28 Mar 2022 15:31:20 -0700 (PDT)
X-Received: by 2002:a05:6122:1310:b0:343:2ca9:2e11 with SMTP id
 e16-20020a056122131000b003432ca92e11mr6469975vkp.5.1648506679815; Mon, 28 Mar
 2022 15:31:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220326102229.421718-1-tanure@linux.com>
 <7hee2lu82n.fsf@baylibre.com>
In-Reply-To: <7hee2lu82n.fsf@baylibre.com>
From: Lucas Tanure <tanure@linux.com>
Date: Mon, 28 Mar 2022 18:31:24 -0400
X-Gmail-Original-Message-ID: <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
Message-ID: <CAJX_Q+1tz7BYL+CvXnc=zAamPiZDEFAASv9a7YoWGmzqYL+cUg@mail.gmail.com>
Subject: Re: [PATCH 0/3] Ensure Low period of SCL is correct
To: Kevin Hilman <khilman@baylibre.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_153122_561648_549DD5F2 
X-CRM114-Status: GOOD (  12.89  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 28 Mar 2022, 21:37 Kevin Hilman, <khilman@baylibre.com> wrote:
>
> Hi Lucas,
>
> Lucas Tanure <tanure@linux.com> writes:
>
> > The default duty cycle of 33% is less than the required
> > by the I2C specs for the LOW period of the SCL clock.
> >
> > So, for 100Khz or less, use 50%H/50%L duty cycle, and
> > for the clock above 100Khz, use 40%H/60%L duty cycle.
> > That ensures the low period of SCL is always more than
> > the minimum required by the specs at any given frequency.
>
> Thanks for the fixes!
>
> This is going to affect all SoCs, so ould you please summarize how your
> changes were tested, and on which SoCs & boards?
>
> Thanks,
>
> Kevin

Hi,

I only tested against the vim3 board, measured the bus with a Saleae
logic pro 16.
The measurements were with 100k, 400k, and a few in-between frequencies.

Is that enough?

Thanks
Lucas

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
