Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 895EBC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 30 Mar 2022 09:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Rn//BFjZTkSu7ElAthz9nipjrXLEuC5RZRd6f3TrlE=; b=M0RxObUuO9QdTh
	p8whhF+UJeILwrIY0keqrLo3J7F7Tvu0Og+dTlxEQlb7klWVm9VOOKZSzTKkf9hui0uFMx2FbQed8
	4yLz0842CUvaLmhpxHZBNi6xeCDlGUFNpilXL0J6T29wuAGOdTntwe930XPuZgFt7nL7xAb0aRruz
	ecAsh6dHNSgQyUt4FqcfNFAfG4LqfRW+DhBgMSR9xQUr5eREXnRTj2ymmrJvgXzSlt8dg31IZTP6K
	B88fghLpDMiUZCPTw/5IngN5r7qCzM6xYNVNcf4RaVOxbFJlDyh2KVO8kXE3A6ErPqJL+QZd6jfvI
	DCEnr8IB4pweHZa0y32w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZUKN-00Evac-2x; Wed, 30 Mar 2022 09:09:19 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZUKJ-00EvZc-6c
 for linux-amlogic@lists.infradead.org; Wed, 30 Mar 2022 09:09:17 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 l9-20020a05600c4f0900b0038ccd1b8642so488610wmq.0
 for <linux-amlogic@lists.infradead.org>; Wed, 30 Mar 2022 02:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pF/hvrI7qLDjIFK1PZiWN5svxVn5RrF/RKLGWeqqmq0=;
 b=YwlT6ooY5LZVCud47hjD3kjq5J2PtJRsbEtQHc6vflzUEeEpN8odscB+zjLMBN7stW
 hYn47ImQM/UY4YJ1Ru6twpC8LiFoOQ8LprNtUBavXaqVWHgOHFlbzCx756jylJNV3Yp9
 6/9t/A3XxA9qdzKF5+nCdP5aHR6tEF5+2GcZZVgmxJOEDmnwspBqLlcncg6zkL5ilwWr
 b8vlsb4NIVa9svDY8Wdm1gBQxnVAyl5MhAotSnIYqI7Rl+CvQLVQwExfQ3/PiXBnqQzn
 T//pXYch9DcznS2bDu+JjS2n2XbBY2N86LVJfZG6+M4SUbkHIk7q/1YDNmFmMZKmzNZj
 1oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=pF/hvrI7qLDjIFK1PZiWN5svxVn5RrF/RKLGWeqqmq0=;
 b=ScOxreufD3w347zeJ0tjCycpv0aIdSnl7rgL++HazdUl7BiQlQpR8g2mItaOA76TT5
 whZwigmrjSQtfskkXKe4QloK7C8IGLlUNoSIdt00cnK3jHaKu+KVP9ccH/A4y1jYuSuH
 k5UfuxtMahThuxfyvg0bKnjNlSZ20kNtswXMliaQa22FguWbnxLA8WLsmnkzePMh5ziM
 q2LV4ryRlEzG4+I/XDb0L4t5Yeb0PVOLmST0/bCQjIntLOCX8H+o+Iv16SG1saFCeR1n
 qu6Gv4Taiz6+HRHR0DNNB7u2fV9uvhfi1V6XnZcH0yYT0okDZAxcnlKe7BC023Ic/75p
 a1Gw==
X-Gm-Message-State: AOAM532RFAqnovx8eAXyHday4xNkJGvGmJVtRbr4Yt1KQVJ/RE6Xa/r6
 UldC9Ide9jMSR6i6bXTnnr3Pzw==
X-Google-Smtp-Source: ABdhPJziTOza5+DSVLs+SpPhhmrhW5VtbyiLFPjGbJGLbqWH/uguopC9MkTPv25t1gHAv/kwvQCSyg==
X-Received: by 2002:a7b:c778:0:b0:38c:9064:89fc with SMTP id
 x24-20020a7bc778000000b0038c906489fcmr3396059wmk.175.1648631353152; 
 Wed, 30 Mar 2022 02:09:13 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:e47f:3cdb:5811:cee8?
 ([2001:861:44c0:66c0:e47f:3cdb:5811:cee8])
 by smtp.gmail.com with ESMTPSA id
 n8-20020a5d5988000000b00203d5f1f3e4sm18249681wri.105.2022.03.30.02.09.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Mar 2022 02:09:12 -0700 (PDT)
Message-ID: <1b0bc704-a740-ea15-1e90-166905be27d0@baylibre.com>
Date: Wed, 30 Mar 2022 11:09:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 09/13] pinctrl: meson: Rename REG_* to MREG_*
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Qianggui Song <qianggui.song@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Fabien Dessenne <fabien.dessenne@foss.st.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 openbmc@lists.ozlabs.org, Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tomasz Figa <tomasz.figa@gmail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20220329152926.50958-1-andriy.shevchenko@linux.intel.com>
 <20220329152926.50958-10-andriy.shevchenko@linux.intel.com>
 <94e888fe-d8fc-5379-302f-66d64f2ae10b@baylibre.com>
 <YkM22GwhxV+YKl8l@smile.fi.intel.com>
 <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAMuHMdWVA834tkeag=WOnHFGuhwZ93PkrgO24OV69Fye1hruLw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_020915_339586_B86460ED 
X-CRM114-Status: GOOD (  24.29  )
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

On 30/03/2022 10:54, Geert Uytterhoeven wrote:
> Hi Andy,
> 
> On Tue, Mar 29, 2022 at 6:47 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
>> On Tue, Mar 29, 2022 at 06:13:19PM +0200, Neil Armstrong wrote:
>>> On 29/03/2022 17:29, Andy Shevchenko wrote:
>>>> Rename REG_* to * as a prerequisite for enabling COMPILE_TEST.
>>>
>>> What error do you hit ?
>>
>> arch/x86/include/asm/arch_hweight.h:9:17: error: expected identifier before string constant
>> 9 | #define REG_OUT "a"
>>    |                 ^~~
> 
> Perhaps REG_{OUT,IN} in arch/x86/include/asm/arch_hweight.h should be
> renamed instead, as this is a generic header file that can be included
> anywhere, while the REG_{OUT,IN} definitions are only used locally,
> in the header file?

Even better, those REG_OUT/REG_IN should be undefined at the end of the header since only
used in the headers inline functions:
==============><==================================
diff --git a/arch/x86/include/asm/arch_hweight.h b/arch/x86/include/asm/arch_hweight.h
index ba88edd0d58b..139a4b0a2a14 100644
--- a/arch/x86/include/asm/arch_hweight.h
+++ b/arch/x86/include/asm/arch_hweight.h
@@ -52,4 +52,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
  }
  #endif /* CONFIG_X86_32 */

+#undef REG_IN
+#undef REG_OUT
+
  #endif
==============><==================================

Neil

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                  -- Linus Torvalds


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
