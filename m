Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADB2C64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 21:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ls0b0tQ4P4tBQIC9rPM485BWwooOu7BN4cm9lvNJ/QU=; b=wb1RuOv7Fq0hzl
	Jud7zHRbb7agM/inoPBrX/Zifxoi51nb1AK/F/7VHW+qD7etj1YBGrxL8EUnbhFpLUiwYrdPtXrgt
	bRKogVcDvQaexteYhKiN5BAsaNfzrWZWy/vH9pNtEqwigPy5BOCv07v8+op0kSMmzsdOeJADcYxv8
	Z0rRV4KyC2KXCD2DoCJ+p9azThs9zXVF/KCP+y38U7v9QBS3h5Sn3eCrjfHzXus8fiXG9TWCduTa3
	E15NIqynjMxVpIvf6uTG30cbKyEjshzwwXQNLF1i4KID3cj/XDLjvocN/721FN2LdpMVVLG6hxphv
	ykVf1qbzmNNJPBggP0Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paOBr-00C533-CY; Thu, 09 Mar 2023 21:52:47 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paOBo-00C528-F4
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 21:52:46 +0000
Received: by mail-pg1-x533.google.com with SMTP id bn17so1936597pgb.10
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 13:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678398763;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7nNOXbc+WHd5NABSbnw3+9ZkEtpuzcZoSp/LFLBByFA=;
        b=kfiM9MxY8vR15n0P+Q9WMzoNqzsyX/K61E9+p64hTU3fdlTpBiuHXT+QL4MCiMCwsZ
         /E0QrLsMb4Nut3KwGFTkPx82xRKD0Q6tg521BAsaxSjjgi0jp10LyKT4VcO3Ym5Nfp8j
         K99lBPkT863bgMXn81mWM52Y3HAXsnbgQXC/cQhkIUADsx8eC8BCkaezk1jyf3KnMbxe
         5cey5kg6qiEDTnH7o5tkCNFGPtIcoIWnQj/s/71D62MPVHbi+/Yi6G5hwJTKjNnOycuD
         8thUDBETxoMKd3r5r6WznnZXgw5w/5YPtXbhqUPh2vkm0LV7k6n6vMb+6MRMEVomuEWI
         oINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678398763;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nNOXbc+WHd5NABSbnw3+9ZkEtpuzcZoSp/LFLBByFA=;
        b=JZlvZx0wYkSjjwl7Z1lNy2slewLtx/S4rcY2yB0xlzwgIRTFcw4vFZgCT68jPvd9QT
         yF7tfc8iOgFzftAwZ3+rR0YCammMReNZoRbmOwfrBkyy6hUfeseoAOAMyTJYS7lt3X/A
         rD2FNrrQOc6e5oGuky1SS57Y0dj0QivKabwHNHHZ4wt8U0NjRrriWSqgWhxlug1Qyi0m
         wBAMs0kuHq1yUBv1S/RvphePFNe3q6VzDSne+CTSikw5bEphQsmqVPPWgBLUQxwMKUUE
         CWGKSQCLPLum75cOwcgQ/Ujygaoedkv35+Cnp49rhveZQp4AT6iabNkCNy4mLOYH7J3n
         3Egg==
X-Gm-Message-State: AO0yUKX+2l7pXeqv+kuqQUdabcXn7FELywatIFIetMsoSriqfbjRN+NY
	CicxJcfMohjlrP7S5lJbpj3Zaw==
X-Google-Smtp-Source: AK7set8Rgzrxi+ZGmbJxKNg4wUXFIFO8nTaU1MxHwhO6m2S5MjEM74yH44rUOwLH5ZFNysgyUIXqOg==
X-Received: by 2002:aa7:980c:0:b0:5dc:2064:f7c4 with SMTP id e12-20020aa7980c000000b005dc2064f7c4mr22346879pfl.10.1678398762740;
        Thu, 09 Mar 2023 13:52:42 -0800 (PST)
Received: from localhost (63-228-113-140.tukw.qwest.net. [63.228.113.140])
        by smtp.gmail.com with ESMTPSA id 2-20020aa79142000000b00592543d7363sm69953pfi.1.2023.03.09.13.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 13:52:42 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, Arnd Bergmann <arnd@arndb.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Alexey Romanov
 <avromanov@sberdevices.ru>, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, Linus Walleij
 <linus.walleij@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
In-Reply-To: <20230228084952.mgx3d3nw65yo5ebu@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <f3e42012-609c-4085-b4f4-bd32bfc34aff@app.fastmail.com>
 <20230227155100.hhl4yvkyfqfyoa6h@CAB-WSD-L081021>
 <a5fa8b23-4ec8-475f-be5e-538b53d6f82d@app.fastmail.com>
 <33b58877-5167-c453-e686-1d10cdca66c0@linaro.org>
 <20230227165049.4y7jx5nnnlibe6kg@CAB-WSD-L081021>
 <7d29f3fd-b8c8-4687-b6a0-b8956dd39f0b@app.fastmail.com>
 <20230228084952.mgx3d3nw65yo5ebu@CAB-WSD-L081021>
Date: Thu, 09 Mar 2023 13:52:41 -0800
Message-ID: <7hedpxwq1i.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_135244_528581_F5169042 
X-CRM114-Status: GOOD (  23.52  )
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

Dmitry Rokosov <ddrokosov@sberdevices.ru> writes:

> On Mon, Feb 27, 2023 at 07:19:38PM +0100, Arnd Bergmann wrote:
>> On Mon, Feb 27, 2023, at 17:50, Dmitry Rokosov wrote:
>> > On Mon, Feb 27, 2023 at 05:38:49PM +0100, Neil Armstrong wrote:
>> >> On 27/02/2023 17:15, Arnd Bergmann wrote:
>> >> > On Mon, Feb 27, 2023, at 16:51, Dmitry Rokosov wrote:
>> >> > 
>> >> > Most of these don't apply in userspace, so the incentive to
>> >> > run smaller 32-bit userland on systems with less than 1GB of
>> >> > RAM usually outweighs the benefits of 64-bit userspace.
>> >> 
>> >> Thanks for the details!
>> >
>> > Looks like Thomas has already prepared a basic patch series for buildroot,
>> > but maintainers declined it.
>> >
>> > https://lore.kernel.org/all/20220730194331.GA2515056@scaer/
>> 
>> I see. I know very little about buildroot, but it sounds like
>> there are other ways of doing the same thing here. In general,
>> this is pretty much an Arm specific problem. While you clearly
>> want compat mode for small userland on any architecture but don't
>> want 32-bit kernels, arm is the only one that has a different
>> kernel "ARCH=" value and needs a separate gcc toolchain.
>> 
>> If the problem is only the toolchain, an easy way out may
>> be to use clang instead of gcc as your compiler, as a single
>> clang binary can target both 32-bit userland and 64-bit kernel
>> on all supported architectures.
>
> Agreed with you. We will try different local approaches to support
> compat build configurations. For now, prebuilt toolchain (buildroot make
> sdk goal) is best way from my point of view. Anyway, we will try to
> solve this problem in the our sandbox and stay on the 64-bit kernel.
> Thank you for all the helpful details you shared, appreciate it!

Just to clarify one thing...

More specifically, this is a buildroot *build system* problem.  If you
build the kernel separately from the rootfs, it works fine. 

I use 32-bit buildroot (and debian) rootfs images all the time on
Amlogic SoCs with 64-bit kernels and it works fine.  

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
