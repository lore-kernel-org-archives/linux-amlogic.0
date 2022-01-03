Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B50C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Jan 2022 14:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dyYAvVN/H3pgrYq2TRRHeXN3R5SLYTOUYLUfNZot1us=; b=Z2e7WmzScPT1V1Hom92sOOZ4yJ
	6bi1lKO2H8MslgUQZNngmM6AWnrlnDNQSkHAJkF1D268KgS+QjSR8tsckcQ0X1cW0WsQkenxNp9ji
	QNZOIbs4lNS+beIqkutEiQlT1xhuTQCHMUlRUuU2RCEfWuXkMN0gyXWS7cIGhy87jlq7VdRvy3OGA
	gx+NvgEIgjDSmYHwqI5Bp3/DWBiQwalSgUnZuYDPVe6lstQOMDWhdPVQ2HejQ/gwuKVlIhU0Q6au+
	gN5a7zNP3x2ghJWb6COuZwX/CdD2TsSXEFx38ovujKRpCsdkJDVR8vGxc/ZMg7EjhUXIwjSd3LwI1
	MrslWDBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4OYv-009E0U-5w; Mon, 03 Jan 2022 14:43:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4OYr-009DyG-Nt
 for linux-amlogic@lists.infradead.org; Mon, 03 Jan 2022 14:43:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id d9so70406947wrb.0
 for <linux-amlogic@lists.infradead.org>; Mon, 03 Jan 2022 06:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qqTYoEG0fCSSuHO7RjGcCyZafDlFczC6QQaAo/YOTIQ=;
 b=eDq8+T3KD08eY4K75ef7W2e9wgz0NCwTOhUmRIZaTfZslsSQ0oaarsrfDnmQLg3LxD
 jiZxYt0sz6h3M6taVElZUCFrMgL3jgrEacd9mQg1/yhve4PmYX/s4NlU5V1SniS/iIgN
 lOge45jCILCsCnzv8g5WjcuYuJhc3/glCuB1CpFxa2+4ehcGBGA+ArNqAic1jz8ZklEI
 q2tAKGfJ/67TZ7HV0zobu0OC8eXtabpSFO38Gc0LOK6VlhxAFIg5pHK55zmt7KmjlGdH
 m3A1bv3B4kuUBrErKULmsQScbQVa5AELEYOccxz2Aq6ow5n4l0BSmIzzRqYniW2eg0MJ
 ZuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=qqTYoEG0fCSSuHO7RjGcCyZafDlFczC6QQaAo/YOTIQ=;
 b=MqMTp+iOFkSpx6sIGhrhOpkVj6s52t2R47J+pU273jtAyvTr8c8+UgE0rGlkGkAu03
 ivlvnQZkQs7LsBA0WHd5QjrReXvRF/23q3dlVqQTfQkriGDixacUNcPsgbt9BqfP5nOS
 ODWBVjG8rNVKZwpNZ+cm2skqBBH6eaZEiUCCOdnJUl7c3AsXZim+WN5+LPy9LrhgCsR0
 beGXyop7+MGvwYJCIrgVzgeBi0+B/ukuBoJKIx87/vj/ptgPLu2j1U7zzKurHCV4CTGh
 gpifHFQZhqJpMxk82pISz54aELtiEZydexf38P7SODhTQK7EDge+FC/FeCEC3P2jw2pF
 qMxg==
X-Gm-Message-State: AOAM531fqyPaWzO29XFwDey13cUpHAWdgSFt1agPkRb9U6dVCUOPPcDQ
 /N9P5y0dvK4JYpeJaXCqJJfuFQfdyjBCLw==
X-Google-Smtp-Source: ABdhPJyH4/D8nNoHqFkVlu/pqPOj9rQ6tyY2S2g5s+3XjsvmJ/FAKLoC8vYVTHBCYM5DDlPLzWJgvA==
X-Received: by 2002:adf:a489:: with SMTP id g9mr37708807wrb.235.1641221019202; 
 Mon, 03 Jan 2022 06:43:39 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220?
 ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
 by smtp.gmail.com with ESMTPSA id b1sm39204103wrd.92.2022.01.03.06.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 06:43:38 -0800 (PST)
Subject: Re: [PATCH 0/3] ARM: dts: meson: fix UART device-tree schema
 validation
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20211227180026.4068352-1-martin.blumenstingl@googlemail.com>
 <CAFBinCC7iSKjZ=U5PN5FKF9js77tvaQBdWdHMPp_y+u+asaeoA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <2c5311fd-187a-d129-4e15-e83e49c14c09@baylibre.com>
Date: Mon, 3 Jan 2022 15:43:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCC7iSKjZ=U5PN5FKF9js77tvaQBdWdHMPp_y+u+asaeoA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220103_064345_826412_8A1FFF05 
X-CRM114-Status: GOOD (  18.48  )
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

Hi,

On 31/12/2021 16:38, Martin Blumenstingl wrote:
> Hi Neil,
> 
> On Mon, Dec 27, 2021 at 7:00 PM Martin Blumenstingl
> <martin.blumenstingl@googlemail.com> wrote:
>>
>> Hello,
>>
>> here are three UART device-tree schema related fixes for the 32-bit
>> ARM SoCs.
>> These patches don't fix any functionality which is why linux-stable
>> is not Cc'ed on them.
> The statement above still stands.
> I would like you to apply this series to a 5.17-fixes branch because
> of a change from the tty.git tree which will be going into 5.17 to
> drop the "amlogic,meson-uart" earlycon handling: [0]
> 
> To make it clear: Backporting this series to kernels older than 5.17
> won't break or fix anything.
> Only 5.17 and newer will need this due to a change [0] in the tty.git
> tree. Without the patches from this series the 32-bit SoCs won't have
> earlycon support in 5.17.

OK, I'll submit it as fixes for for 5.17

Neil

> 
> 
> Thank you!
> Martin
> 
> 
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=ad234e2bac274a43c9fa540bde8cd9f0c627b71f
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
