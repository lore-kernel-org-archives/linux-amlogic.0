Return-Path: <SRS0=KMNI=XP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9868C49ED7
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 08:07:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B15721A4A
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Sep 2019 08:07:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjf6PkCx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="axW3kPWq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B15721A4A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZJoXBx1v5bjYoete+qKdwmlZ9p0xsFrbJHvP8csnWSc=; b=jjf6PkCxYc+y9R
	WR9THq1kWWcLKlQ3Tn2AvlgDbkMbY5ctTE2wtdqpUPvK+IARvMPZicd3/nKWcoZNPpOvC7v1/5QoN
	bWFJqlDeKrf3/1ZOXvqMSF4lyeYpvT23ZKW/ve5MAVZ/NkgmdD3SUL/CNI5VhbRG97RMCtrCpulU5
	peq+clkWMnzxu+BkuDBQ8uaebIYYfwWPz6AtW6elj5Ujk6eaGIh8mwYP7d3k82/JGycGTpgBDcdXJ
	JxDpgp70eaUP3Q/LjnewLK/f9NKraOUTw7vWo8D1e+FrvpCfjOYE71RnkorW42apIHk3TmbeX8eku
	aW6xb8lOObovY/UObahg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iBDwY-0005mE-FZ; Fri, 20 Sep 2019 08:07:06 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iBDwU-0005l3-Tx
 for linux-amlogic@lists.infradead.org; Fri, 20 Sep 2019 08:07:05 +0000
Received: by mail-wm1-x341.google.com with SMTP id a6so1330734wma.5
 for <linux-amlogic@lists.infradead.org>; Fri, 20 Sep 2019 01:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=z23yLaZiKtfxRx1ZSwGd8kUpXEBNfVyT3n+vsEJzgiw=;
 b=axW3kPWqms66sqgAppayBP2L89Y1gHBeAKQTi3Iqo2z+jXhzTDrIaqI+9M56Bpd6bH
 JZz6WAFD52j0iEnIXO+EXQvWq9m/DTVh5hWzvxWumsf0iMQWxEDUDjsL+Ng9LbF8tyj5
 rbcopiAuiY+4q27qpMoeTc4lhDLpba0qbIVw0NRnL43NhP6Pk4qmWKxD1oJCp6JmHxN6
 +J2e9kPVCQJjBscFZQ3SIIgWIgUDlCf+QPUCwm91aQO2G0K69F9Js58MGgiiTtdM6crz
 sk3RI7Qs7XPC4njtENp/MEcvMc9r1kQKXPoVvvMwag9T5gOeJa9+DwpGRRIqHS0ckD5E
 wOyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=z23yLaZiKtfxRx1ZSwGd8kUpXEBNfVyT3n+vsEJzgiw=;
 b=mFw0z804ZxaWjnQEMfI6YucsP25+poH2QlsQOGI5digWmFmGehe5n7oks7UKN38p0+
 zoGew5b377SoqfWJgUJp7SL+q9ztbdzEbn90yCRuUN5dtr4q4sBvl8ErdI/zIKRguuFm
 msjo1rKUO1L/s3HZK+8+AwtmC6PzCQXsyUNoR2iycRl9uRSb8y2I1ktbwGOMf9kK/EXL
 MaXXAS0XpLy+1uanTEmQpDBZjdGqMD3XXKOvBpRsRl29QuCRILJsZxl5I0a3BbqME24+
 ggO0vxbF3GLr93CljIscTW2j9SphMeri0Nhgtkgo34nma17A0kIRUNzPwuc61VoUmnxp
 gvhA==
X-Gm-Message-State: APjAAAU0YcgTdcj39ZKjdTSFh2OI/8hWW0DT2GZ57TD1TiQ80KH31plD
 bHAoaYowwBvfjHdemCCXqYX2Fw==
X-Google-Smtp-Source: APXvYqxBtmD9PNGYbYfmqiL2x8BC8NQDAWs/Sa1ZlmfwY9cufeCZJJ/eOPXMdRVxH1SCqE1hD6S4jA==
X-Received: by 2002:a1c:7c15:: with SMTP id x21mr2500239wmc.154.1568966819485; 
 Fri, 20 Sep 2019 01:06:59 -0700 (PDT)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id w125sm1742167wmg.32.2019.09.20.01.06.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 20 Sep 2019 01:06:58 -0700 (PDT)
Subject: Re: [PATCH 3/3] clk: meson: clk-pll: always enable a critical PLL
 when setting the rate
To: Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
References: <20190919093627.21245-1-narmstrong@baylibre.com>
 <20190919093809.21364-1-narmstrong@baylibre.com>
 <1j1rwce8yf.fsf@starbuckisacylon.baylibre.com>
 <20190919170610.541D620644@mail.kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <2551a729-5379-e039-4d5a-a83fa877fb14@baylibre.com>
Date: Fri, 20 Sep 2019 10:06:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919170610.541D620644@mail.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190920_010703_031383_EC670798 
X-CRM114-Status: GOOD (  25.85  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stephen,

On 19/09/2019 19:06, Stephen Boyd wrote:
> Quoting Jerome Brunet (2019-09-19 06:01:28)
>> On Thu 19 Sep 2019 at 11:38, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>>> Make sure we always enable a PLL on a set_rate() when the PLL is
>>> flagged as critical.
>>>
>>> This fixes the case when the Amlogic G12A SYS_PLL gets disabled by the
>>> PSCI firmware when resuming from suspend-to-memory, in the case
>>> where the CPU was not clocked by the SYS_PLL, but by the fixed PLL
>>> fixed divisors.
>>> In this particular case, when changing the PLL rate, CCF doesn't handle
>>> the fact the PLL could have been disabled in the meantime and set_rate()
>>> only changes the rate and never enables it again.
>>>
>>> Fixes: d6e81845b7d9 ("clk: meson: clk-pll: check if the clock is already enabled')
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>  drivers/clk/meson/clk-pll.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>>> index ddb1e5634739..8c5adccb7959 100644
>>> --- a/drivers/clk/meson/clk-pll.c
>>> +++ b/drivers/clk/meson/clk-pll.c
>>> @@ -379,7 +379,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>>>       }
>>>  
>>>       /* If the pll is stopped, bail out now */
>>> -     if (!enabled)
>>> +     if (!(hw->init->flags & CLK_IS_CRITICAL) && !enabled)
>>
>> This is surely a work around to the issue at hand but:
>>
>> * Enabling the clock, critical or not, should not be done but the
>> set_rate() callback. This is not the purpose of this callback.
>>
>> * Enabling the clock in such way does not walk the tree. So, if there is
>> ever another PSCI Fw which disable we would get into the same issue
>> again. IOW, This is not specific to the PLL driver so it should not have
>> to deal with this.
> 
> Exactly.
> 
>>
>> Since this clock can change out of CCF maybe it should be marked with
>> CLK_GET_RATE_NOCACHE ?
> 
> Yes, or figure out a way to make the clk state match what PSCI leaves it
> in on resume from suspend.
> 
> 
>>
>> When CCF hits a clock with CLK_GET_RATE_NOCACHE while walking the tree,
>> in addition to to calling get_rate(), CCF could also call is_enabled()
>> if the clock has CLK_IS_CRITICAL and possibly .enable() ?
> 
> This logic should go under a new flag. The CLK_GET_RATE_NOCACHE flag
> specifically means get rate shouldn't be a cached operation. It doesn't
> relate to the enable state. I hope that you can implement some sort of
> resume hook that synchronizes the state though so that you don't need to
> rely on clk_set_rate() or clk_get_rate() to trigger a sync.
> 

It's exactly the goal of [1] where I resync a clock tree after a resume.

But I don't check the enable state, would you mean that:
if core->ops->enable && core->enable_count > 0 && !clk_core_is_enabled(core)
    core->ops->enable(core->hw)

along the parent/rate resync ?

Isn't that dangerous ?

[1] https://patchwork.kernel.org/patch/11152101/

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
