Return-Path: <SRS0=5/HF=WK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2700C32753
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:13:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86BC2206C1
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Aug 2019 14:13:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QpyKShhv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="E8OGIwk1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86BC2206C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UIYNFAinBnkkQ45ySEY+ePWFJZG6SgRzSLbfFDQ2UCc=; b=QpyKShhvLwasmE
	5S3wQMvEXSOUPeEBPzxNlTTL/aqH6U1UUC0a2GnFbB1SR1IUyqNK2+Ahe7xXuSs9s0yGvBYGbHUzE
	dXD3qwT0AyrbP6U7UeZfk8UI/AhMJsoG/h3k13y2EmdlkskCIVx958d29ZuEWBO/cBv/bg3yBFNJK
	Zgz9jPCDMX9R0/wbXb3bEV48UQxHc657G+GdbuiSO0jyc2k6zd7T0yBG+1l4ENFL0lFMTpbIzA9Rc
	228PpxvU9Ow3HhJiXSoisEnd7oz7Fe5PW3ZwYpdhicxd0lli8DRR0S8hPzjIGxi3u9/o944Q54qzO
	8aewMiI1mOfCCLfvSaAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxu1P-0004bS-PG; Wed, 14 Aug 2019 14:13:03 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxu1M-0004b5-26
 for linux-amlogic@lists.infradead.org; Wed, 14 Aug 2019 14:13:02 +0000
Received: by mail-pg1-x543.google.com with SMTP id o13so53137517pgp.12
 for <linux-amlogic@lists.infradead.org>; Wed, 14 Aug 2019 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=no2SLqVDU4Z/korDCM4hHhtS5IsRjpGOyGd6tpclhGc=;
 b=E8OGIwk1JRUinAO6+GSamXzPOttN5fxSkR/znJAStodKlhCd+BPGROQtemWNUlRLET
 zKO15mHsRLefwoOrq6NlNF4yDYwFQaZXQhBYxAKgS8wyIIk1om+k3TqrTBQmoSncbro9
 K7Eo4NR72B8elTMeg0irYosvxCu05jOec6cnx+zDybsySqb2I9/aRD9vyyjcBcn2QTv0
 hvuwPdJT03B+56vgeeRcIfIP6Muc8DfSHQJfmqgoHhnSuJNMiGYg1cTVmz487IzM59mB
 zvpn2c5pJCJ7puu8fANOK+ZmdNsPZOgZeUkE9Pw/J3i4MJ1ifpeJWpDxVYgnD2LdJvLI
 X9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=no2SLqVDU4Z/korDCM4hHhtS5IsRjpGOyGd6tpclhGc=;
 b=itVwCW28U+psERxsZXewB7BL+HqbEy49Ybecx5MSaxoleoCA8GgM/R8lBw/0oJEYWa
 32BVWU8zxSgNyfWWiDJRelttfCpP4ENomjoCu8x9AVtF5ZQVsQ2Tv8bPDnJtuKOLA4nI
 5egxJUgyu3hqy1zcCOOXIvu2fepbGW1a7roS2bOR95+2kuIkDb+TRrCYKcKF/78OMT9h
 LwJXgXFpfB2Qa5DDVUxz0/IaehQ2Dv2cumM6Wf1v2k4MRxszGwJxbprLROgly/aIgvc4
 nBaJxbnVJHyaDML63gAOK7A5vlrcI2tvQAboQzZuK7qgwApHd8WBeNHRPJP1PHR+/IOs
 Kjkw==
X-Gm-Message-State: APjAAAVfFPkiZJ1W+P/2gWg0q1iO442IRMmC/Qk+b7tImiWlG8kIe84V
 FPP1VdQDL7lFzANIK7Ml9o/bEw==
X-Google-Smtp-Source: APXvYqxOUl643jmkWLoxLSpCSn2DeQFgT8HRfjViaoKf6Wn67MDlSqztMj/noceF2bFwpOw36mlmGw==
X-Received: by 2002:a63:b20f:: with SMTP id x15mr40334809pge.453.1565791978868; 
 Wed, 14 Aug 2019 07:12:58 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:35:cf9b:bad:702c])
 by smtp.gmail.com with ESMTPSA id g19sm17371162pfk.0.2019.08.14.07.12.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 14 Aug 2019 07:12:58 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH/RFT] soc: amlogic: meson-gx-pwrc-vpu: switch to clk_bulk
In-Reply-To: <3daa6b78-e634-3a82-e3a3-7fae312d406d@baylibre.com>
References: <20190809230904.28747-1-khilman@baylibre.com>
 <7hlfvwy97e.fsf@baylibre.com>
 <3daa6b78-e634-3a82-e3a3-7fae312d406d@baylibre.com>
Date: Wed, 14 Aug 2019 07:12:57 -0700
Message-ID: <7hh86jygwm.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190814_071300_163425_FCC36026 
X-CRM114-Status: GOOD (  14.83  )
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
Cc: linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Neil Armstrong <narmstrong@baylibre.com> writes:

> Hi,
>
> On 14/08/2019 00:47, Kevin Hilman wrote:
>> Hi Neil,
>> 
>> Kevin Hilman <khilman@baylibre.com> writes:
>> 
>>> Instead of expecting a specific number of clocks with specific clock
>>> names, switch to using the bulk clock API.
>>>
>>> This is a first step towards generalizing this driver to work with
>>> other domains.
>>>
>>> Cc: Neil Armstrong <narmstrong@baylibre.com>
>>> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
>>> ---
>>> Boot tested on meson-g12a-sei510 and verified that framebuffer console
>>> comes up and still works.
>>>
>>>  drivers/soc/amlogic/meson-gx-pwrc-vpu.c | 41 ++++++-------------------
>>>  1 file changed, 10 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
>>> index 511b6856225d..5f6519f43a31 100644
>>> --- a/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
>>> +++ b/drivers/soc/amlogic/meson-gx-pwrc-vpu.c
>>> @@ -34,8 +34,8 @@ struct meson_gx_pwrc_vpu {
>>>  	struct regmap *regmap_ao;
>>>  	struct regmap *regmap_hhi;
>>>  	struct reset_control *rstc;
>>> -	struct clk *vpu_clk;
>>> -	struct clk *vapb_clk;
>>> +	struct clk_bulk_data *clks;
>>> +	int num_clks;
>>>  };
>>>  
>>>  static inline
>>> @@ -76,8 +76,7 @@ static int meson_gx_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
>>>  
>>>  	msleep(20);
>>>  
>>> -	clk_disable_unprepare(pd->vpu_clk);
>>> -	clk_disable_unprepare(pd->vapb_clk);
>>> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>> 
>> Note the original turn-off order here is VPU then VAPB...
>> 
>>>  	return 0;
>>>  }
>>> @@ -119,25 +118,14 @@ static int meson_g12a_pwrc_vpu_power_off(struct generic_pm_domain *genpd)
>>>  
>>>  	msleep(20);
>>>  
>>> -	clk_disable_unprepare(pd->vpu_clk);
>>> -	clk_disable_unprepare(pd->vapb_clk);
>>> +	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>> 
>> ... and the origianl turn-on ordr is also VPU then VAPB.
>> 
>> Using the clock bulk API, the new turn-on order will be the order they
>> clocks appear in DT.  The turn-off order will be the reverse of that.
>> 
>> That seems right to me, but it is a change in behavior from the current
>> code.
>> 
>> Did you set the enable and disable ordering the same for any specific
>> reason?  Any reason to thing reversing the disable order is going to
>> cause any issues?
>
> No the order is not an issue here, the 2 clocks feeds 2 different parts of the VPU,
> one is the APB register bridge (vapb) and the other feeds the vpu video pipeline,
> so the order is not an issue.

OK, thanks for confirming.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
