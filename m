Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61ACC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun,  6 Mar 2022 12:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:
	From:In-Reply-To:References:MIME-Version:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rgoRGN/6NS4/6yZ+zXLwTY5tfbwDtmJgQPPdHib7N20=; b=QQ40yCbPuhvEMn
	J+9d4YRkARczWZor/RBY+H6vJEODrirt3S0XimaGQtzFzL7MiSv1qb7HcIt05mhCUjZO4//f88aNz
	DpTJeRNE5CmdV32c/bygmOzO6oFrY7JeR6syAe7U8YX0VenfW6actCQm8TkMuC0bUff1FMdFWwHR+
	11Bef+p8gPPyCbn5pG8YK0HFmISYv4SPrjqUUWMDQVhLIcFyrjf2pHLpXpfVJ1zGM2uxyXIL3Ny1A
	EENgfM0zq3YigIiX6CgS0+beW2NCn38pkZH3uYuAG0Sk9m5NZlI8TujDPOJV2ZsD505JpbGHUhiiw
	gMQhjJJNn3K3OgvhFODA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQpZv-00EeMm-Bg; Sun, 06 Mar 2022 12:01:35 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQo3W-00EQpS-C1
 for linux-amlogic@lists.infradead.org; Sun, 06 Mar 2022 10:24:03 +0000
Received: by mail-vk1-f178.google.com with SMTP id f7so6288278vkm.12
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Mar 2022 02:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to;
 bh=Q/mluVuH//YmWdgjgeN5p5RdUUgw6P5MMKlpRM4/Kj8=;
 b=wMuelov5rbDQ26OQGO9kUNrs5jB9ZQveAgNu4+/mFr5I7kOCjqZYlfxPi2UP7a2eBR
 WPCtuQoH4BiBmmpJCWKuVxrV2slLEZQYIp3ggM1DSFF7MKSO8oT66BIX3KjEBfUQRsqg
 l+XmxaxBU18KnR/5rl4L0Fu1ncaETLAg6/8w2VfC7rwFwsbwEvBDZQGDomWgEcsWIB8T
 XUnWHQWbLYMLuRMOaMFJ9yLIKZgIaow7Kn+207xBXzrpZNegRnbg/Ya+V1l5x8GhdeKF
 7UJBQCt2qXqCzz8TlbNVkz1sdeUSJEMCbHcV77rjpAqmP3o1rqltqsNHCXBtNt0wneun
 Yaxg==
X-Gm-Message-State: AOAM532BW8PjsRKlnBbloORS48IcfzA983qgouoebg6A7y4ybZFXUtSZ
 aPuXAB9SpRf00y7Te6JColtBB4Ly2ckLxg==
X-Google-Smtp-Source: ABdhPJzoAkV0aizsbO21S1wfz+m7bFj0CFOK16p5ePbuR/hpZMa24gMP6rpyQ6bVuUKNK605GvgaDA==
X-Received: by 2002:ac5:cd88:0:b0:32c:5497:6995 with SMTP id
 i8-20020ac5cd88000000b0032c54976995mr2090954vka.33.1646562240865; 
 Sun, 06 Mar 2022 02:24:00 -0800 (PST)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com.
 [209.85.222.47]) by smtp.gmail.com with ESMTPSA id
 o22-20020a056122179600b0032f7563a15esm1437525vkf.13.2022.03.06.02.24.00
 for <linux-amlogic@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 02:24:00 -0800 (PST)
Received: by mail-ua1-f47.google.com with SMTP id a28so5363250uaf.7
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Mar 2022 02:24:00 -0800 (PST)
X-Received: by 2002:ab0:655a:0:b0:34b:a76f:3852 with SMTP id
 x26-20020ab0655a000000b0034ba76f3852mr629727uap.90.1646562240465; Sun, 06 Mar
 2022 02:24:00 -0800 (PST)
MIME-Version: 1.0
References: <CAJX_Q+2zibb_ABAjT=k=hbW_Xa9knOy5hcN5Ma2B6Z+h-3=FsQ@mail.gmail.com>
In-Reply-To: <CAJX_Q+2zibb_ABAjT=k=hbW_Xa9knOy5hcN5Ma2B6Z+h-3=FsQ@mail.gmail.com>
From: Lucas Tanure <tanure@linux.com>
Date: Sun, 6 Mar 2022 10:23:49 +0000
X-Gmail-Original-Message-ID: <CAJX_Q+0Gvf88EW6s6-pLoA_mwhwKCf==qyxmNnFt=S24TPN0xw@mail.gmail.com>
Message-ID: <CAJX_Q+0Gvf88EW6s6-pLoA_mwhwKCf==qyxmNnFt=S24TPN0xw@mail.gmail.com>
Subject: VIM3 - A311D - I2C AO Clock Questions
To: linux-amlogic@lists.infradead.org
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220306_022402_430207_CB04E1F0 
X-CRM114-Status: UNSURE (   9.79  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Sun, 06 Mar 2022 04:01:34 -0800
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

Hi,

I am trying to integrate an I2C device into VIM3 using the I2C_AO bus.
My device uses a 100000Hz clock, but after changing
meson-g12b-a311d-khadas-vim3.dts to add my I2C node the driver could
not properly read its registers.

It reads 0x9100, but the correct data should be 0xcb58.
The first thing I saw on the bus was that the frequency I requested by
the device tree was being set after the probe of my driver already
failed.
For that, I sent "i2c: meson: Fix wrong speed use from probe" which
fixes that issue.

But I still get the wrong data, so my next guess is that the clock
duty cycle is 30%, and I think should be 50%.
Here is an image of the signals of the bus:
https://pasteboard.co/TEoxQucsXUUD.png

I have tested other frequencies and all of them uses a 30% duty cycle,
where SCL is up 30% and low for 70% of the period.

Is possible to configure the clock to be 100000Hz, but with a 50% duty
cycle for this I2C bus on A3111D?

Thanks
Lucas Tanure

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
