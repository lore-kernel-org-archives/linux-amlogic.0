Return-Path: <SRS0=khaH=J3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4971CC433B4
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:31:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A261661165
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Apr 2021 08:31:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A261661165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q0hSLjlsLRw0U0ZGqUmZIQbUiU5z/uLENu6SM5CtadI=; b=FyWQk9/WQiSHxn+OcCesmVrfn
	HsY4xnX8x4F9hkaX1MveKfgFwhREScSiEID0IPeBcXQbC0OVF63Hix4xNLSZ2qGYS0k5qk5WsoeV/
	SvFL7Cd/zvQ387H2nqrysOWqYXbvtAmm1HnZj0LEAOxzBDx9brfyDXdQfmqPdwj8ojpwryFdsygez
	p2n1Wb32M4x96K4RkaigS5y/MYxptCKLDtlvFzouXJpVRX6B3TzNG0vbT7hnZ0CVwzijICN+JKFE8
	c4e6kpehDYSYWoWvTmv8OYt7jQ1RIaTitXBZ9rSueMpNYgHC18C+E7QIb1s/RzXXkHlumYFm27W7c
	Cwu9UVDaA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcOYT-007VPi-Vr; Fri, 30 Apr 2021 08:31:22 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOYQ-007VPK-UH
 for linux-amlogic@desiato.infradead.org; Fri, 30 Apr 2021 08:31:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=I0ktwXj/LufSDPcWIwR3A5LuKeogVGJ5D0aKzv45ni0=; b=G9fxok38+wrrXrClTwYJT4Vatp
 HC8xohO4BUbwqzdJnmTIC5AiZTTEIWU1lSjUiLSWEvmMSybBHGLI6n9OOZE4SuYIUbOltrJnlvFOp
 /jLGrAWAyR7bhveLpcrsTJfjW4enYcrNm3SFjrZkHZ1r5dEdvfRwiiS1Xo7oeL8n2hLFdjRPei0HN
 ttHCE1RP8m86aNQRUY+dNrGZ31/yRArsxxYqP9kIWRYylLzaWebtNoC1gndYcd2SgxGHFBADGGHUv
 d37JooD90AgeRqry+rhq29W5xs9QUUxfSW6NBKRLDMOGUgnPjS/Crh4iOekLNCSuB6eGxwlV9PpMS
 /E4yVMTQ==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcOYO-001FBB-89
 for linux-amlogic@lists.infradead.org; Fri, 30 Apr 2021 08:31:17 +0000
Received: by mail-wr1-x434.google.com with SMTP id d4so1166422wru.7
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Apr 2021 01:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I0ktwXj/LufSDPcWIwR3A5LuKeogVGJ5D0aKzv45ni0=;
 b=K3FRPCTIOIcVfiM0ikTVUZ3B7q7yS5+SWHMujMW3/BgCEhHutSOBoeb0898FV39FxT
 mqSxqwkOo1C5lJTz+zcuBI0f50DMWz20m/Ok9rQGuJdnWfZG4JgQz0qUIzaO2ablgg5W
 NkczboABhPeV3qoIDLElyeSpYNN7br7gA0QsoLWTMG/N0JoYz77cVWjHYb3izoDXLcMB
 RieL5ogADKcxmPQcouMikRV2Ga+BmTJgEggatDH1KAOFdkKHw5cu2F6DMfVIlBHhlW12
 d1nfBps3hwhCt5X4XAoNACsrIgUj/kNkeK4aNqtHxu3aYBt0AE2k3oMxd/xL3bZFYSmz
 lvYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=I0ktwXj/LufSDPcWIwR3A5LuKeogVGJ5D0aKzv45ni0=;
 b=aZLwQtEB4Ky6QrjkmcwDnGUEehyiyxou8r80toSPQq7R0VG51LcQk/vIsmRjf1wEZZ
 +2KIMvqgqelKZLebDuGAqTtnvkW5jXIhJrPKBqhNgg2Nj3teBOM7H6RNMFm1m9iE2PW1
 DkKWCb0ryBR/588PU6R45Fr1e1U6VscPShACPeieMd7r868LcLWq9l3g+6ESrhzr5rz5
 3bWubQ0wkq4oVI93XHgc9nINLqs6LtUmQn/D0wNiOSQKyc0uMVN3CLMfSo9EsK+bhXoP
 1HD12dYcdTRySrExOMC45M3re87uwhOdneKC8Nq6ah3h/kzRz37QaHy1U0IefszA/7jc
 laVQ==
X-Gm-Message-State: AOAM5338Q7jWpyxAZy/2wdIGszUWosozzYFS+MCGP63GVdr6pOsSqDny
 uCYXoRPAKrQv2x6LESnZq7F6lg==
X-Google-Smtp-Source: ABdhPJw9xLve5QbQXAL8IJ5O7GPw9kwlS+yguKzOeJ+oWdNivqpvwzKU4zA1UTZYbWOcU3Iijj4iTA==
X-Received: by 2002:adf:ff89:: with SMTP id j9mr5243182wrr.416.1619771474844; 
 Fri, 30 Apr 2021 01:31:14 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:4a89:8c32:4adc:fc67?
 ([2a01:e0a:90c:e290:4a89:8c32:4adc:fc67])
 by smtp.gmail.com with ESMTPSA id s10sm1433195wrt.23.2021.04.30.01.31.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 01:31:14 -0700 (PDT)
Subject: Re: [PATCH] ASoC: meson: g12a-toacodec: add support for SM1 TOACODEC
To: Jerome Brunet <jbrunet@baylibre.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210429170147.3615883-1-narmstrong@baylibre.com>
 <1jo8dx9ec5.fsf@starbuckisacylon.baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <d2e9fc82-1483-e4d0-db10-6c11d9fdbba9@baylibre.com>
Date: Fri, 30 Apr 2021 10:31:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1jo8dx9ec5.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_013116_323031_2BA7FE20 
X-CRM114-Status: GOOD (  18.33  )
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

On 29/04/2021 19:43, Jerome Brunet wrote:
> 
> On Thu 29 Apr 2021 at 19:01, Neil Armstrong <narmstrong@baylibre.com> wrote:
> 
> 
>>  
>> +static int sm1_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
>> +				     struct snd_ctl_elem_value *ucontrol)
>> +{
>> +	struct snd_soc_component *component =
>> +		snd_soc_dapm_kcontrol_component(kcontrol);
>> +	struct snd_soc_dapm_context *dapm =
>> +		snd_soc_dapm_kcontrol_dapm(kcontrol);
>> +	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>> +	unsigned int mux, changed;
>> +
>> +	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
>> +	changed = snd_soc_component_test_bits(component, e->reg,
>> +					      CTRL0_DAT_SEL_SM1,
>> +					      FIELD_PREP(CTRL0_DAT_SEL_SM1, mux));
>> +
>> +	if (!changed)
>> +		return 0;
>> +
>> +	/* Force disconnect of the mux while updating */
>> +	snd_soc_dapm_mux_update_power(dapm, kcontrol, 0, NULL, NULL);
>> +
>> +	snd_soc_component_update_bits(component, e->reg,
>> +				      CTRL0_DAT_SEL_SM1 |
>> +				      CTRL0_LRCLK_SEL_SM1 |
>> +				      CTRL0_BCLK_SEL_SM1,
>> +				      FIELD_PREP(CTRL0_DAT_SEL_SM1, mux) |
>> +				      FIELD_PREP(CTRL0_LRCLK_SEL_SM1, mux) |
>> +				      FIELD_PREP(CTRL0_BCLK_SEL_SM1, mux));
>> +
>> +	/*
>> +	 * FIXME:
>> +	 * On this soc, the glue gets the MCLK directly from the clock
>> +	 * controller instead of going the through the TDM interface.
>> +	 *
>> +	 * Here we assume interface A uses clock A, etc ... While it is
>> +	 * true for now, it could be different. Instead the glue should
>> +	 * find out the clock used by the interface and select the same
>> +	 * source. For that, we will need regmap backed clock mux which
>> +	 * is a work in progress
>> +	 */
>> +	snd_soc_component_update_bits(component, e->reg,
>> +				      CTRL0_MCLK_SEL,
>> +				      FIELD_PREP(CTRL0_MCLK_SEL, mux));
>> +
>> +	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
>> +
>> +	return 0;
>> +}
> 
> Instead of duplicating this function, I'd prefer if you could use regmap fields
> 
> 

Sure, will do

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
