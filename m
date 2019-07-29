Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99717C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 07:42:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B9FC20657
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 07:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gKgdxicS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="02iwdyH2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B9FC20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4Sw2m465gwTexH80MNlNxco23pTNL1Cr87DAzJJJKo=; b=gKgdxicSxoIbhA
	fx+RI/+9G9We9ZIjcwHakfle4sfipFCRLiCwRv4o2i40zkmmdgC+3ETe1/YN69skACSRCqyYxSnBg
	1YIn2f4EUbblE0+5QSm4wlCiNsxN0EclmFDk1WO/qZFtPyFnITr6uVB3nGtKQu9l3h6Mv53pyjqk0
	G6lFDnp5Mj+rP6CRIQ1uU0qeoI31Q2VRnVNqYdbsHTrEWk7dcEe3QLvRjJFrD5/vFcJbOThnxrW8w
	t1cPUPIbKuMX5FC6xO+tjhlKNc2RjFXxu9CvnvxnxfcqcTov5vDii8zubrSV3aAZgOlB47i3iebFU
	qmZK3QVI6pjLWAZe1fWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs0Iv-0007qD-F4; Mon, 29 Jul 2019 07:42:45 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs0Ir-0007oh-NJ
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 07:42:43 +0000
Received: by mail-wr1-x444.google.com with SMTP id c2so57432700wrm.8
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 00:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qcDHQ1YIyua0Lz0XKlvtzGchQOF/q8YhLFhQTQqfSnA=;
 b=02iwdyH22+odFMvWr/fUSOWV/YsZSHqKDJDdL3e/jHLksFamrMNdydoLixPsostjig
 yYzQEFDjoaLkJAPyPt/dX5djgi4pTpVW7k5O+EuK9vRV4b+kvVD3KdHyP+fHdAXOLJZw
 fs4K6etimfyGJgHmMkzEWYXpz0YXtnA5d3Ujv3pcGXoUovVU2fuxrFw2Zx9N+4HQJ2Xh
 6ZfZtL98PhcYOUCA0uf9O/gU8Ho3Ar5Xd5LTTZyfiGybMwcM7ykT0tlFaILBVDsfNIyn
 qOJAT7FJydgp4as6OIcwX3bPsXYJAYc4F7EkgbuacqIjLhJho48k5LzbAupoJo3tSI69
 B2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qcDHQ1YIyua0Lz0XKlvtzGchQOF/q8YhLFhQTQqfSnA=;
 b=duFp/5rCnNSkenMT99EnZEUPYYT+/5fDYTOgsI7PnhQT5DPlcubU2BRoe4m+fO87Q8
 yOCTrJhAMOTw4aOo31hzGsZRrsNIIHfMvJgIs3fFQGsp/rX2FkAKrIDzJG5r1zi8vEnn
 4NoIqSRajL1G6BmdIG2a9VOxYfPI//vvRjqhkBHsMcBj1CkvBOZayXemiHfZOvc5zyVk
 pxvXVOaarpYHJQAc1xq0rJkNtWgJPJ/ESPT635cAUvlaqowwUzRZLKsUgyyr9s6f6Zvm
 NXbM/M1DKsSx+hdnYdNUBlUTiFvbdtk85QkHYQBwO4dqBllBSAhphie10g3PWjCqhfkA
 B4eg==
X-Gm-Message-State: APjAAAWDb530MPT0Hh0o67Hk8Dw63BGhpTOyIOfKZv2Rj63ziWReAeBn
 +bj004Tbm+aKixRCA9cx8pJdaw==
X-Google-Smtp-Source: APXvYqyu0KuT71WZYrYu+y1RASylJuxEoqAUq39HAC9JSxF3uZuROG3LU/D595xuazk7xstMkJnTUA==
X-Received: by 2002:adf:cd04:: with SMTP id w4mr69069194wrm.230.1564386159762; 
 Mon, 29 Jul 2019 00:42:39 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id m24sm37058830wmi.39.2019.07.29.00.42.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 00:42:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com
Subject: Re: [RFC/RFT v3 04/14] clk: meson: eeclk: add setup callback
In-Reply-To: <55ce9b5e-de2f-9da3-8eec-13b5ead23e6c@baylibre.com>
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-5-narmstrong@baylibre.com>
 <1jh8836w49.fsf@starbuckisacylon.baylibre.com>
 <55ce9b5e-de2f-9da3-8eec-13b5ead23e6c@baylibre.com>
Date: Mon, 29 Jul 2019 09:42:37 +0200
Message-ID: <1j1ry9s2vm.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_004241_761516_69F70ABC 
X-CRM114-Status: GOOD (  15.57  )
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
Cc: martin.blumenstingl@googlemail.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri 26 Jul 2019 at 16:50, Neil Armstrong <narmstrong@baylibre.com> wrote:

> On 03/07/2019 16:17, Jerome Brunet wrote:
>> On Mon 01 Jul 2019 at 11:12, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> 
>>> Add a setup() callback in the eeclk structure, to call an optional
>>> call() function at end of eeclk probe to setup clocks.
>>>
>>> It's used for the G12A clock controller to setup the CPU clock
>>> notifiers.
>> 
>> I'd prefer if you implement the probe function in the related controller
>> have this probe function call meson_eeclkc_probe() for the common part
>> 
>> In your case, I suppose it means implementing the g12a controller probe
>> to deal with the notifiers
>
> Sure, but with this eeclk setup callback I can provide a different setup() callback
> for g12a and g12b (and later sm1), without this means adding a top data struct
> containing a setup() callback pointer and the soc meson_eeclkc_data struct to be able
> to call a setup() for each family like done actually, but this will broke eeclk since
> the match_data data won't be a meson_eeclkc_data() struct anymore.

meson_eeclkc_probe is an helper we added to factorize common code out of the
clock controllers we had. I don't like the idea to now add callback in it
deal with the specifics of each SoCs. It feels like we are going in circles.

I think SoC/controller specific stuff should be dealt with in
related probe function of each clock controller which would then call
the 'common helper' if necessary.

If the common part interface needs to be reworked, maybe changing
the parameters, I'm ok with it.

>
> If you still prefer this, I can rework it like that.
>
> I'm rebasing all the stuff on v5.3-rc1 and plan to repost an updated version
> shortly, solving this would be easier.
>
> Neil
>
>> 
>>>
>>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>  drivers/clk/meson/meson-eeclk.c | 6 ++++++
>>>  drivers/clk/meson/meson-eeclk.h | 1 +
>>>  2 files changed, 7 insertions(+)
>>>
>>> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
>>> index 6ba2094be257..81fd2abcd173 100644
>>> --- a/drivers/clk/meson/meson-eeclk.c
>>> +++ b/drivers/clk/meson/meson-eeclk.c
>>> @@ -61,6 +61,12 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>>>  		}
>>>  	}
>>>  
>>> +	if (data->setup) {
>>> +		ret = data->setup(pdev);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>>>  					   data->hw_onecell_data);
>>>  }
>>> diff --git a/drivers/clk/meson/meson-eeclk.h b/drivers/clk/meson/meson-eeclk.h
>>> index 9ab5d6fa7ccb..7fdf424f71a6 100644
>>> --- a/drivers/clk/meson/meson-eeclk.h
>>> +++ b/drivers/clk/meson/meson-eeclk.h
>>> @@ -20,6 +20,7 @@ struct meson_eeclkc_data {
>>>  	const struct reg_sequence	*init_regs;
>>>  	unsigned int			init_count;
>>>  	struct clk_hw_onecell_data	*hw_onecell_data;
>>> +	int				(*setup)(struct platform_device *pdev);
>>>  };
>>>  
>>>  int meson_eeclkc_probe(struct platform_device *pdev);
>>> -- 
>>> 2.21.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
