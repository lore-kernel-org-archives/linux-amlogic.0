Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E965ECAAD5
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Sep 2022 18:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rV0DywZ4S+lw0U+ZvbMX2mBfO4UaPcS3hXXE3QpK5RY=; b=YBmM3MxhLBz+E8
	UP76QeLWnI6wM+mtcvHdKM0bKWzuhiDKLjGvup6F17b5GemzM1hubKh9BE2v82FuoX9JoTe9FH3eI
	o7ZPdjtNWLxM8R/pzTiU89cU+9EaAh5hOs8dMypaYXwTf83r680pTRb3W7d6DQG9dyJR7CKR3eQBy
	yWZrJPFbv0fq0CxE3KJR5BdZqnSWRt+mJOe54gOqtWnGDzsaEzqQTKBfByX8mmA3zYASX409NOTle
	QKNL//FImYr3g5Rc/NznuHQ12A76eL8ZlVjb21GTpLDs9bOYowo6glqT5LlOzHf76TCByXwhqCurh
	ScRESaCGMyXHpnZvcn/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVdKG-00GM5W-6r; Tue, 06 Sep 2022 18:29:32 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVdKD-00GM2A-Dp; Tue, 06 Sep 2022 18:29:30 +0000
Received: by mail-ej1-x62d.google.com with SMTP id fy31so25241767ejc.6;
        Tue, 06 Sep 2022 11:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xgo8Ax/Gst1OUgdLuCbxkHBNMkaa11aDgNF8ygPNA5E=;
        b=CN3yfXYgYlCImMTr8X5H/P1E1nFmBBCR1Vw2XGULKBttcwqlHgWmYzlhI2Cx2JvCj5
         z2zWKyJLRWqEgwZTYIihraNMVrCubWa3ndMM9F6/1U+T7LYSVe9iSDr6Re7fDv8QucF4
         OOpzPIObx4Iq+qizrsqRQeBPKEgjgr3oNjzK32tHWjEdjmQZinQ7OWW2z9DWrT5c0vtC
         LnyXzEcK96yGllfk1plG0+3Q5YIq955azgkMPMywlW3CV7oW1oecnuks+tuAk/upI8Jj
         6QZLbEalRxrm6MMc6YyQlItkr7znyHnFVOjo9NiFEJhOK4F9+YwES2cPRjkDcn8rJBrI
         smnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xgo8Ax/Gst1OUgdLuCbxkHBNMkaa11aDgNF8ygPNA5E=;
        b=Guzg9gMQOQzKDJbIo+oBu/Xre/2Px0POZAK68vBpBBIQNepaXuMNxguqNBMYdmCwyi
         ByIcrinnhdbTOBN6w0b+h1QbXSZARI4s9WzpNhp9n8tFrbLpjz4IN1Q2AxLrxJMV8JA7
         3uYSTAP57YaNrPnQ75pu9BuxHWarTJoUd1vcDloGm1vB9prTQYKhXSH9Fo+UODHmcXWw
         jCiwgtPrIu4/1w05w1VaN1gpFF8v9mmxXta8QWvCpkJBiKMVhEQFMcX2Yyp8zvFdJrUr
         DFZVtqnr3r40m6oeNkJULmVZ2+D7e/Ou3UAqR8hEpTXaIxSfy/Fe8yZ5Z2FUnR87fP5W
         TKkA==
X-Gm-Message-State: ACgBeo2YJXqmGpNioG4ZDOMhq1Xbxu0kToDSnWcTt/nTUN40NjgEWWH5
	RyyVR/SN10cRBm4thn1InHs=
X-Google-Smtp-Source: AA6agR4PSTClixOnEjaouB8rBWzPVCu/vO23XgPXd6Gd6rBC8XiA5rFjZGHCAxQP1huWtlRgUMwa+Q==
X-Received: by 2002:a17:907:6da6:b0:741:771f:1d0d with SMTP id sb38-20020a1709076da600b00741771f1d0dmr31060577ejc.125.1662488959875;
        Tue, 06 Sep 2022 11:29:19 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd23:a800:187f:c2cb:1804:1a? (dynamic-2a01-0c23-bd23-a800-187f-c2cb-1804-001a.c23.pool.telefonica.de. [2a01:c23:bd23:a800:187f:c2cb:1804:1a])
        by smtp.googlemail.com with ESMTPSA id gh16-20020a1709073c1000b00711edab7622sm6926593ejc.40.2022.09.06.11.29.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 11:29:19 -0700 (PDT)
Message-ID: <52b07db2-7edb-0373-c6d2-df67917f4af7@gmail.com>
Date: Tue, 6 Sep 2022 20:29:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH RESEND] clk: meson: pll: copy retry workaround from vendor
 driver
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Yu Tu <yu.tu@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-clk@vger.kernel.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
 <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
 <09befaaf-b34a-aeda-5dd6-6bfae4b01163@amlogic.com>
 <1jo7vswmjw.fsf@starbuckisacylon.baylibre.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <1jo7vswmjw.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_112929_591051_09F1B46E 
X-CRM114-Status: GOOD (  22.47  )
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

On 06.09.2022 17:21, Jerome Brunet wrote:
> 
> On Tue 30 Aug 2022 at 14:33, Yu Tu <yu.tu@amlogic.com> wrote:
> 
>> On 2022/8/29 17:54, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>> On Sun 14 Aug 2022 at 23:25, Heiner Kallweit <hkallweit1@gmail.com>
>>> wrote:
>>>
>>>> On a S905X4-based system this call fails randomly.
>>>> The vendor driver has a retry mechanism and on my system
>>>> the second attempt is successful always.
> 
> Heiner, ideally commit message should not be about 'your' system
> but describe what the system actually is. This would be more useful down
> the road.
> 
> Based on Yu Tu feedback I'd propose
> 
> '
> The PCIe PLL locking may be unreliable under some circumstance, such as
> high or low temperature. If the PLL fails to lock, reset it a try again.
> 
> This helps on the S905X4
> '
> 
> If this is OK with you, I can amend the message before applying the
> patch, or you may resubmit. As you wish.
> 

Yes, please amend the commit message as suggested.
Thanks for the review and follow-up.

>>>>
>>> This reason looks a bit weak to me.
>>> I'd like AML team to comment on this PLL problem as I suspect it might
>>> relate to other PLL we have been seeing
>>
>> First of all, we've had this problem before. But the probability is very
>> low, most of the PLL will not lock when the chip is tested at high and low
>> temperature.
>>
>> Our actual code has retry mechanism to solve the above problem.
>>
>>>
>>>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>>>> ---
>>>>   drivers/clk/meson/clk-pll.c | 12 ++++++++----
>>>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>>> index 9e55617bc..daa025b6d 100644
>>>> --- a/drivers/clk/meson/clk-pll.c
>>>> +++ b/drivers/clk/meson/clk-pll.c
>>>> @@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>>>>     static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>>>>   {
>>>> -	meson_clk_pll_init(hw);
>>>> +	int retries = 10;
>>>>   -	if (meson_clk_pll_wait_lock(hw))
>>>> -		return -EIO;
>>>> +	do {
>>>> +		meson_clk_pll_init(hw);
>>>> +		if (!meson_clk_pll_wait_lock(hw))
>>>> +			return 0;
>>>> +		pr_info("Retry enabling PCIe PLL clock\n");
>>>> +	} while (--retries);
>>>>   -	return 0;
>>>> +	return -EIO;
>>>>   }
>>>>     static int meson_clk_pll_enable(struct clk_hw *hw)
>>> .
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
