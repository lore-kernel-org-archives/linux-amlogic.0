Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FCDC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 27 Apr 2022 09:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PQj4VONI11AJA9IychBdxH01ZOXRQfokFLGdz2L0R4A=; b=2xsH1HFor86hep
	VVTWC9T/Ae2tJTG5ToLDVnqGjxYxwRuEJTkrqohcpniX9Aw7EveTrHTYJwafMhduAcc4hZJ0YOA5c
	MuL+/HZH+Pp4l0/XdBNcJJtAXxkmjVpKdzZFDCBXEIuHhx9BN6KfsIzQ7o6PS9MX2XkKUVIHxpiTS
	MSC0bgo1bfx+tL6nRLNvVVptZXWyPwre8T5FvSh3Tjs7yPzk0odhkyKQGbgat/TBIGSC8pLso3D7g
	qcI5AoWi7hBG3UxUXVpHnuNc8NBfPevBtPIFn1gR5hyPMrW2Y++cfLY/n+w0MwUB4T76rrfc3HxXf
	Oy0NDIIzOVxmF8fvEQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nje76-000mM6-PD; Wed, 27 Apr 2022 09:37:36 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nje73-000mHq-An
 for linux-amlogic@lists.infradead.org; Wed, 27 Apr 2022 09:37:35 +0000
Received: by mail-ej1-x62d.google.com with SMTP id l18so2217055ejc.7
 for <linux-amlogic@lists.infradead.org>; Wed, 27 Apr 2022 02:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dFDIusijO9n5QCDJSFl1CYKz5YJK7pzw/4cw23J1A6o=;
 b=ST+is0zx4YSe27FRNP0XmVMibxo9UayqbpJD+WX/CzTQ5wF/w9rhhs2nOJacNmFIO5
 gNP+taI3WmPSkr2z3QqvWX7rvgUNB8y74Lp30/c5+5pwhShjPE0KOBVlQjyRJr0X7rYw
 ZRDUYVMXkum2HkFQ12UvCaqtdOdH3qPWay9xhOirHFu10MXdfQ4Zp0Dyke9WMO/4L5Wg
 bQuPdHkYpnKIZo/9fJs9nrKOOVj5fbhUW60oXVk0gXqPq3K7cjc5dfWqrxeIbmeRvkMH
 fbMfd73C3J5hQb6+Wo6AupmcsSBc2+xkB0aRDyBL1QMcL0w/DecNG+9wc6R/Z/gV/1dv
 U3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dFDIusijO9n5QCDJSFl1CYKz5YJK7pzw/4cw23J1A6o=;
 b=sLDXfpIFjNoyDGvQ62LJgwUuCy7GInlw7uHg0ytw+irPDuSgRb6AYHVkLzexXNdy3R
 iFDPQd1J5qZ1eXWLDSTbGLdIDR7a9VpDJm3Ak4koVOASXSItXLs1W1tcueQ45MOWQAoQ
 tZwrKSwmBpNtpX6Pweiqd6fC7RgEFUzvQDou0hMXKI6AwcLXY16WBenPoLLlfwy09K3r
 zwYzgXbgwFMuK9xMnS1V9qoq0VI57uGoSRoO9cQn6Cpfsq+h/4K4RqXlvbvlUkt4P7mb
 eQlEMUVhJJy0h6n/KeapPinmE13sFrs5opwtTe3hMJZqjDfqlbuTXyFZBGF9GN65n9dd
 WsXg==
X-Gm-Message-State: AOAM531eNJU4OAy/oVUfjTkeMoMPSVYzaQyl5l9CaoAdXSyN2YYg9J/D
 Yl4GgwyjWlBRkEw/5Q3eUWtxnEMns/k=
X-Google-Smtp-Source: ABdhPJxMBw0OHkQ26GYtW+11asppYws4rX3aWdxSFCGMD3H6okoC/jSPgvIKEQnSRWq+3GTc2gKL9Q==
X-Received: by 2002:a17:906:dc8b:b0:6ef:86e8:777 with SMTP id
 cs11-20020a170906dc8b00b006ef86e80777mr26446343ejc.326.1651052247501; 
 Wed, 27 Apr 2022 02:37:27 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c0f8:2900:a9e5:b0ef:a21b:5633?
 (dynamic-2a01-0c23-c0f8-2900-a9e5-b0ef-a21b-5633.c23.pool.telefonica.de.
 [2a01:c23:c0f8:2900:a9e5:b0ef:a21b:5633])
 by smtp.googlemail.com with ESMTPSA id
 ci21-20020a170906c35500b006f394323ccesm3968713ejb.34.2022.04.27.02.37.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Apr 2022 02:37:27 -0700 (PDT)
Message-ID: <04527367-b26f-d843-7711-d75c543b5787@gmail.com>
Date: Wed, 27 Apr 2022 11:37:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: Solid green screen with experimental panfrost/hdmi sc2 support
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <210d9cab-9704-1ece-a046-9ae1f61e09f6@gmail.com>
 <a8b8d5e8-758a-3cf5-6798-6769021ec4b4@baylibre.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <a8b8d5e8-758a-3cf5-6798-6769021ec4b4@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_023733_438729_EEBF32C0 
X-CRM114-Status: GOOD (  20.12  )
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

On 26.04.2022 09:28, Neil Armstrong wrote:
> Hi,
> 
> On 25/04/2022 22:21, Heiner Kallweit wrote:
>> Based on a HK1 RBOX X4 (S905X4) I'm "playing" with mainline support for SC2.
>> This Android TV box is based on the ah212 reference board according to uboot prompt.
>> Most relevant things are working meanwhile (eMMC, SD, SDIO/WiFi, USB2/3, ethernet)
>> and I can use the system headless.
>> However I'm struggling with panfrost/hdmi. With SC2 a lot of vpu registers have been
>> relocated (e.g. all hhi regs), even though the functionality seems to be more or less
>> compatible to G12A. I had to extend the timeout for HDMI PLL locking.
>> After having sorted out such things:
>> - dmesg for panfrost and hdmi looks normal
>> - monitor detects signal and OSD shows correct resolution (1920x1080@60 in my case).
>> I'd interpret this in a way that the clock/divider/mux registers are programmed correctly.
>> However I just get a solid green screen. From what I've read this can be caused
>> by a failing hdmi handshake. Not being an expert in DRM/HDMI any hint on where to start
>> debugging would be appreciated.
> 
> A solid green means the pipeline has been correctly set up in regard to the clocking,
> and some (invalid) pixels flows to the HDMI transceiver.
> 
> This means you can consider the HDMI & clock portion OK, and propably the ENCP aswell.
> 
> The OSD video pipeline is the following:
> 
> [ DDR -> VIU (RGB2YUV) -> VPP (Blending of planes, Scaling) -> ENCP (Pixel generation) -> HDMI-TX -> TMDS]
> 
> Green means value 0 in YUV, this means 0 is in the YUV pipeline, so it must be an issue with the VIU
> part reading from DDR and doing the color conversion.
> 
> Check in the downstrean source code how the SC2 VPU is initialized, and looks at the differences since SM1.
> Look at the VIU & VPP stuff init.
> 
I found that in case of the solid green screen the number of crtc interrupts (handled by meson_crtc_irq())
is constantly increasing, with a rate of a few hundred interrupts per minute.
On a S905W-based system where HDMI output works normally I see about 100 such interrupts after boot
and the number doesn't change.
Maybe this can provide a hint on what's going wrong?

> Neil
> 
Heiner
>>
>>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
