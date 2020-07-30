Return-Path: <SRS0=1HBj=BJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863A3C433DF
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 16:06:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 546A220829
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 Jul 2020 16:06:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YMCqLPDW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 546A220829
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VQd4fM4fYjjYFwwSuBfDiFND2IqdyOQCXhH7KKqeusc=; b=YMCqLPDWRnY9F27VSzIdFitJn
	7WHwq76R0qZ14qwqZzX+4y0SyfFdhiidBOXJI4pOVDTNJA+Amnj4eCee8wCkSBGmZS6fqzzao2ktz
	0pRojc4WA3Dgq87b8UGysGxt5RuCGr7g6HFctabeNfr9GRZCwxxASvIjX4dx6FqK67ihjVuqx763h
	IbfKwv22QenJQsHWICOXpfaG8fhTh2ppVMHvpnmx9mcH/Azg3q9d7GWBSNM56lXRO1+/zSqvH/wDx
	FUSdvgTOD/WTkUUCYjxC0sNmT/MChs4q0wGE4GU02OT//QBOAURPGjSJ9F76HjZ4I+XCzhG/QpZvQ
	pUF4I2jTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k1B4j-0001Hj-NW; Thu, 30 Jul 2020 16:06:33 +0000
Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k1B4g-0001Gy-JX
 for linux-amlogic@lists.infradead.org; Thu, 30 Jul 2020 16:06:31 +0000
IronPort-SDR: HdN2coSg9rcsyCpB7mExIJ77NzTjsyS4BxQl8uUS0POAp4bLgnfEn4cYWqyqint058C3JpH1Cd
 gxO9xNJfiE2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="149460809"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="149460809"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:06:27 -0700
IronPort-SDR: ejShz7BMEPqgf95S0ALom3X9wqT/C/PZYI1PT1rAVp8F+2RgVitq7bjfhUSjl7ou61cA1T0jin
 8WcinSlwiMvQ==
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="465308149"
Received: from jrwang2-mobl.amr.corp.intel.com (HELO [10.212.82.25])
 ([10.212.82.25])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:06:25 -0700
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
Date: Thu, 30 Jul 2020 11:06:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_120630_816152_E229759F 
X-CRM114-Status: GOOD (  21.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



On 7/30/20 4:04 AM, Jerome Brunet wrote:
> 
> On Wed 29 Jul 2020 at 17:56, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
> 
>> On 7/29/20 10:46 AM, Jerome Brunet wrote:
>>> commit b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
>>> changed dpcm_playback and dpcm_capture semantic by throwing an error if
>>> these flags are not aligned with DAIs capabilities on the link.
>>>
>>> The former semantic did not force the flags and DAI caps to be aligned.
>>> The flag previously allowed card drivers to disable a stream direction on
>>> a link (whether or not such feature is deemed useful).
>>>
>>> With change ('ASoC: core: use less strict tests for dailink capabilities')
>>> an error is thrown if the flags and and the DAI caps are not aligned. Those
>>> parameters were not meant to aligned initially. No technical reason was
>>> given about why cards should now be considered "broken" in such condition
>>> is not met, or why it should be considered to be an improvement to enforce
>>> that.
>>>
>>> Forcing the flags to be aligned with DAI caps just make the information
>>> the flag carry redundant with DAI caps, breaking a few cards along the way.
>>>
>>> This change drops the added error conditions and restore the initial flag
>>> semantics.
>>
>> or rather lack thereof.
> 
> Again, why ? All there is so far is your personal preference. no facts.

What would be the meaning/purpose of a dailink with .dpcm_capture set, 
with only dais that support playback only?

What would be the meaning/purpose of a dailink with .capture_only set, 
but with a dai that supports playback?

What happens if none of these flags are set?

What happens when all these flags are set?

No one seems to know, so my suggestion is to align first on consistent 
configurations, then see what can be removed.

>   * What we had gave capabilities to the link, independent of the DAI
>     components. ASoC just computes the intersection of all that to
>     determine which direction needs to be enabled. Seems rather simple
>     and straight forward.

that's what my last patch did, and when there is no intersection it 
complains. Please clarify what you expect when there is no overlap 
between dai and dailink capabilities. Keep in mind that we have a mix of 
hard-codec configuration and DT-created ones, your case is not the 
general one.

>   * It worked for every user of DPCM so a far.

Not completely true, when Morimoto-san added snd_soc_dai_stream_valid() 
it exposed tons of cases where the information on direction was not 
provided in a reliable at the DAI level. I will assert that we are still 
finding out cases with broken DAI configurations, and as a result we 
will also find broken dailink configurations. Your picture of DPCM as a 
perfectly functional system that I broke is a distortion of reality.

The reality is that we have to work in steps, first make sure all DAIs 
are properly described, then work on the dailinks and optimize at a 
later point. we will need warnings to find out what the problem cases 
are, and move slowly.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
