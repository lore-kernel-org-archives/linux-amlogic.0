Return-Path: <SRS0=qkt4=BK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EACBC433DF
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:06:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BA1820829
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2020 08:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dVp6MthQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="paELUECn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BA1820829
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Jf7FjRG5YbR9BrVtvqCwOrlSOAsG3Q7TWssCTFXKiwk=; b=dVp6MthQA/EoQktHfuyfa7lNU
	U46xrGDOAhoBha4SqqX4itE7Mc4p7sOnDn5K9+XStaH16inhMezqmxKMUra92ef00Qb/Act55d4Q1
	y17RIS+1jzwTWai9yxnRlf3OUISucWa6icCcRrqg0cLe/87eDo+an1EJOhM4zmHaHAUJtpOkHd5Du
	JPj0HcQF19N3yruxpg32oRkIvFvo25NwSD2GNxOIj9DRawV0/9lP2+J9oX39UwlpLLIeFPLgRiiav
	F4sgIodD8E7BIL91qEQRV+LR57d7fphmTRrr4ilPVPmHu5tVsm253jQg+HS5N4LkPbIXyfckWwlTA
	A9GANaGUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1Q3N-0008Fv-MZ; Fri, 31 Jul 2020 08:06:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1Q3L-0008FN-DF
 for linux-amlogic@lists.infradead.org; Fri, 31 Jul 2020 08:06:08 +0000
Received: by mail-wr1-x441.google.com with SMTP id l2so16581672wrc.7
 for <linux-amlogic@lists.infradead.org>; Fri, 31 Jul 2020 01:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=fucMGEr5CXFfOMcRe7EoTEOJr1Kr4QCI6uUDYVzs0gU=;
 b=paELUECntKBbuSCyCcBVLOaExS6IKoAliKkoF5FO2Vx4ae1xzSit3j2MPx+WVR+MVK
 zaZ97aVOzr+rKYKirG+gD6cR0v04FzDc6B5ygXWb1JXdKTzDsq1s8YL+kMqlPzHx+uYq
 bDPB70KKa6GlMjDvyz/4JdTWKHxlYVXB9+w7f4k3yTX722eL5WLL+5uMHaCXA9zx6Ujk
 E543xx2Kq/QfbljQhO9bln/Proogp8rAe1XWwfjZ3x9S3wHfY0u+gXUN8JSoUfrC1ORK
 wdXqXbDwIpZ6MS3sThUTAa6zbDEMedNXGowA0RrhSgs4Sd1aQcEIGXCkT3k7ztrH1PH8
 7B7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=fucMGEr5CXFfOMcRe7EoTEOJr1Kr4QCI6uUDYVzs0gU=;
 b=h4qSq7mQ3Bill/FEk0GX3Zz3wD1Lx8iqHPPh+lb5DRdi+J80zN3H15qoVFuJzyTzsL
 j0yWIIu0ZA2llQZZhu5Y7y8N3qk0X9G6rrQeReLqS7awN02Bkf1WEjIOsOpnwAjEtvW6
 4Ln8jw3I/86y79SgeGC2Hq8sR+3owt2Il14LMxBsybxCr83H79pmpIckl22hFVD4oGF6
 JMmm4c8tNiBrdncSXdyKyhlnTkHd44QYplLDTiL5z4TWw4FXZHQ9lcl7ushgt+EvhIn5
 4oRFiWNivCuBpKhDVo74yaCFgsBbwMCWPNf9UpT/KLIRk7MnCdbjUXJF9WB1xecib0BU
 rCDQ==
X-Gm-Message-State: AOAM531daeKL3qLwaCLeguKb3Q2Ti3sWCs+Lzo0Dx1y5M0ehxUESjTBj
 UjYGOKQGMA14oI77xErcIfUpsQ==
X-Google-Smtp-Source: ABdhPJzz8HoujDESE97UeMx7i6gLDYDp1lPxuV8yNkRjvFTZsrr0L0KA7Q2WsV9AlEgH/0FFtZL4Pw==
X-Received: by 2002:adf:9e90:: with SMTP id a16mr2541831wrf.40.1596182764941; 
 Fri, 31 Jul 2020 01:06:04 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id z63sm13311387wmb.2.2020.07.31.01.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2020 01:06:04 -0700 (PDT)
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
 <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
In-reply-to: <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
Date: Fri, 31 Jul 2020 10:06:03 +0200
Message-ID: <1ja6zg85xw.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200731_040607_556909_7EEBC7FA 
X-CRM114-Status: GOOD (  23.68  )
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
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 30 Jul 2020 at 18:06, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:

> On 7/30/20 4:04 AM, Jerome Brunet wrote:
>>
>> On Wed 29 Jul 2020 at 17:56, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
>>
>>> On 7/29/20 10:46 AM, Jerome Brunet wrote:
>>>> commit b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
>>>> changed dpcm_playback and dpcm_capture semantic by throwing an error if
>>>> these flags are not aligned with DAIs capabilities on the link.
>>>>
>>>> The former semantic did not force the flags and DAI caps to be aligned.
>>>> The flag previously allowed card drivers to disable a stream direction on
>>>> a link (whether or not such feature is deemed useful).
>>>>
>>>> With change ('ASoC: core: use less strict tests for dailink capabilities')
>>>> an error is thrown if the flags and and the DAI caps are not aligned. Those
>>>> parameters were not meant to aligned initially. No technical reason was
>>>> given about why cards should now be considered "broken" in such condition
>>>> is not met, or why it should be considered to be an improvement to enforce
>>>> that.
>>>>
>>>> Forcing the flags to be aligned with DAI caps just make the information
>>>> the flag carry redundant with DAI caps, breaking a few cards along the way.
>>>>
>>>> This change drops the added error conditions and restore the initial flag
>>>> semantics.
>>>
>>> or rather lack thereof.
>>
>> Again, why ? All there is so far is your personal preference. no facts.
>
> What would be the meaning/purpose of a dailink with .dpcm_capture set, with
> only dais that support playback only?
>
> What would be the meaning/purpose of a dailink with .capture_only set, but
> with a dai that supports playback?

You get to throw an error in those case

>
> What happens if none of these flags are set?

I think I already suggested to throw an error in the initial review of
your patch

>
> What happens when all these flags are set?

I don't see the problem here

>
> No one seems to know, so my suggestion is to align first on consistent
> configurations, then see what can be removed.
>
>>   * What we had gave capabilities to the link, independent of the DAI
>>     components. ASoC just computes the intersection of all that to
>>     determine which direction needs to be enabled. Seems rather simple
>>     and straight forward.
>
> that's what my last patch did, and when there is no intersection it
> complains. Please clarify what you expect when there is no overlap between
> dai and dailink capabilities. Keep in mind that we have a mix of hard-codec
> configuration and DT-created ones, your case is not the general one.
>
>>   * It worked for every user of DPCM so a far.
>
> Not completely true, when Morimoto-san added snd_soc_dai_stream_valid() it
> exposed tons of cases where the information on direction was not provided
> in a reliable at the DAI level. I will assert that we are still finding out
> cases with broken DAI configurations, and as a result we will also find
> broken dailink configurations. Your picture of DPCM as a perfectly
> functional system that I broke is a distortion of reality.

If it was not working, it was certainly not clear in the changelog.
What's clear is the regression it caused

>
> The reality is that we have to work in steps, first make sure all DAIs are
> properly described, then work on the dailinks and optimize at a later
> point. we will need warnings to find out what the problem cases are, and
> move slowly.

Sure, have it your way

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
