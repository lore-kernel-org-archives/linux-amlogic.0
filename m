Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92748ECAAD3
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 18:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O3TXVXi1IQ+rRE/dbOQSwNxsHAcHVutfSbE4WrhA/iY=; b=C/BUuNM72zyEI5
	MoY9iSPf4WM/kZPO2Kge4My2pxxWtPpaxTpFt3d6+Wrj1Kody/j47V8izfUbcWijmzFQHusNAlzzl
	fzgETsC+bW4bZb/H6Kykdl4V5n9MIgOyH6yg6j7mmu65xwRkNFA/Tj5ODv+V10l9SPtbvcYpIcqwj
	VdP0RnqkEHtzIbrm8CLawr/VCmwskCYzVX3bveENmFwRrV1Dsffz8n5FsoTYmAqoEp22oy49xOGcZ
	JaKO9GAc7PSZS4t7ebKCRqagMTCnVkwxoPNJLm4unjCPoZNH+doF2P1z/IeQsmrQJd5EOBYSxjACg
	78NaWT+n7QN2mA8XZBRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSjQf-00CDhR-6A; Mon, 29 Aug 2022 18:24:09 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSjQT-00CDeW-AN; Mon, 29 Aug 2022 18:23:58 +0000
Received: by mail-ej1-x632.google.com with SMTP id w19so17397036ejc.7;
        Mon, 29 Aug 2022 11:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=lzr5Lsq+f9ZSX9ifjDA4NRi7ohUATgbbTVphu4Vb8uc=;
        b=WcoLwdRNxh7KerKwMk/KQrIMAxDhwWUjVlF4wMbYe03fZ3sVMAN/iKd+N/rr0LxXet
         8qwb2LMPIXfl9s9M7a+dp4yOPPpjqXOg9r03Nf2VUMTG66199nOyVw/nl0Iv3jriWF4Q
         1kj661VHudfDM1Cn1cCPoHXd1wmlU+R3pumO9xTVDmXcnKDe6k+MaoCJWeywJVR0Ggvy
         1TWzhpzcZbJZK/gs5GJEvNzPbBTHb7R9J+7pavyVD1AglZxS3sTK+HWUa4X6JUBKHpQ8
         LTfY48w2feoStsQT2eRJc6BSNiGn3zTmGybjcwdMTFSYwVKPCQgTkCsO/SRpnCAG5DND
         rKQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=lzr5Lsq+f9ZSX9ifjDA4NRi7ohUATgbbTVphu4Vb8uc=;
        b=PZFzjoneTv5g3PrpM8lgi3YOpbnBIptRrke/I+5TGt//o4CXFeOxBfLHAsV+IyLXHX
         Dlp2moq/YWhqbKuJUfRddwKm/hyI2QiXNztWrFc3i5fts45/8/JKDrQmv4GUwm6PqsOx
         PmC0CkU+V6GRFjdqnFobl4T385M+hdx7nP0SEZUdOf62Vp4PQaDA9j3qKVyggzGNlfVa
         4UllLLEbSh5z6Z2x0+X+cCDe/SN/YjQplx2BzBwy64vs9YAa9vy3k79AwdFeNY9jyZ9L
         vqVL+uBw9LSlKf9wFza23ZzVZ3tGE5ZLTR048kq9gFeII17zX/7OkoUF9UCL+/8p/+AI
         fzow==
X-Gm-Message-State: ACgBeo3eLN2/RQb6c3k/9t/v/JY+ovZTnb8Ns0bbmRi+CicvQlVm4AN6
	pB5rg2jU0JwYNSvlQ7jqY6SBS9BQTXU=
X-Google-Smtp-Source: AA6agR5mhyciLiiZ8wkHuD4vne3nKeE9fhYRT5e0PAtgWAb8iB5OuaMxznYbF/3+9OrPwp3ZmyNUxA==
X-Received: by 2002:a17:906:845c:b0:73d:831e:b73d with SMTP id e28-20020a170906845c00b0073d831eb73dmr13927091ejy.687.1661797432990;
        Mon, 29 Aug 2022 11:23:52 -0700 (PDT)
Received: from ?IPV6:2a01:c23:bd96:2400:287c:a714:9c3c:aa54? (dynamic-2a01-0c23-bd96-2400-287c-a714-9c3c-aa54.c23.pool.telefonica.de. [2a01:c23:bd96:2400:287c:a714:9c3c:aa54])
        by smtp.googlemail.com with ESMTPSA id l9-20020aa7c309000000b0043cc2c9f5adsm6006512edq.40.2022.08.29.11.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 11:23:52 -0700 (PDT)
Message-ID: <7b66d876-aabe-7f07-7e54-0be28a25ed3f@gmail.com>
Date: Mon, 29 Aug 2022 20:23:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 0/2] mmc: meson-gx: add SDIO interrupt support
Content-Language: en-US
To: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <72459a46-fd20-60d8-a7e7-076d8f321816@gmail.com>
 <CAPDyKFokmJr7e8=gvsYbBbdxceG6kCa57vbYy1tUT_b+B=8P8Q@mail.gmail.com>
 <e970e07d-9bb8-707d-1dc6-09fae2abbfff@baylibre.com>
 <CAPDyKFqRm=RVn__3HJDk_0bBemudh_y7YEYPZe3W7iJCfP50fg@mail.gmail.com>
 <67f29dfe-a579-125e-cb84-f6b554932b42@baylibre.com>
 <CAPDyKFqqtHUtGshE=JYaLK09P28EeenYAsvnDkROvMHb7i2bDg@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CAPDyKFqqtHUtGshE=JYaLK09P28EeenYAsvnDkROvMHb7i2bDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_112357_390239_603014D9 
X-CRM114-Status: GOOD (  15.64  )
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

On 29.08.2022 16:21, Ulf Hansson wrote:
> On Mon, 29 Aug 2022 at 15:29, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> On 29/08/2022 14:07, Ulf Hansson wrote:
>>> On Mon, 29 Aug 2022 at 09:42, Neil Armstrong <narmstrong@baylibre.com> wrote:
>>>>
>>>> Hi Uffe, Heiner,
>>>>
>>>> On 26/08/2022 11:16, Ulf Hansson wrote:
>>>>> On Thu, 25 Aug 2022 at 21:52, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>>>>
>>>>>> Add SDIO interrupt support. Successfully tested on a S905X4-based
>>>>>> system (V3 register layout) with a BRCM4334 SDIO wifi module
>>>>>> (brcmfmac driver).
>>>>>>
>>>>>> v2:
>>>>>> - use new SDIO interrupt API
>>>>>> v3:
>>>>>> - don't duplicate checking mmc->sdio_irq_pending
>>>>>>
>>>>>> Heiner Kallweit (2):
>>>>>>     mmc: meson: adjust and re-use constant IRQ_EN_MASK
>>>>>>     mmc: meson-gx: add SDIO interrupt support
>>>>>>
>>>>>>    drivers/mmc/host/meson-gx-mmc.c | 84 +++++++++++++++++++++++++--------
>>>>>>    1 file changed, 65 insertions(+), 19 deletions(-)
>>>>>>
>>>>>
>>>>> Applied for next, thanks!
>>>>
>>>> Thanks for applying, but I was off (like many of reviewers) and I would have like
>>>> this patchset to be tested on earlier SoCs aswell, or only enabled on S4 for now.
>>>
>>> To actually make use of the new code, an update to the corresponding
>>> DTS files are needed to set the cap-sdio-irq property.
>>
>> I know but it changed the IRQ handling, let's hope we don't see any regressions.
> 
> Right. Let's encourage people to test this!
> 
> I noticed that $subject patch sets the CLK_IRQ_SDIO_SLEEP bit, no
> matter whether the SDIO IRQs has been enabled. Don't know if that is
> intentional and/or could be a problem? Heiner?
> 
This bit enables SDIO interrupts in sleep mode too. I experienced no difference
in behavior if SDIO interrupts aren't enabled.

> [...]
> 
> Kind regards
> Uffe


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
