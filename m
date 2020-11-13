Return-Path: <SRS0=eCnW=ET=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693F0C61DD8
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 15:28:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0891022275
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Nov 2020 15:28:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MAnCp5Bi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="fosSqcUS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0891022275
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YbPS8bInnA0s6wdv72710ePc4rKL+omfgItovAvUFh4=; b=MAnCp5BiafOOY++rhV25vh3iC
	KW2RpCtA7nlC9cz+YdNandDSQoyUY4eTx1+a2Wj8jg8z+YP/JzrJl0cNUCdmQxxi0cqstVh56d+aN
	aCgLhR51Ek1s0GwniEJkpgkvtAqJ0Yj2v8vriTppulOqduya53SjE5exHz4P40+lkLWfWMQc3BLim
	rQ470m/HZsCs74iTJsFRDnGwNCJJpYOAzcSpglWh078dwzNrQjQTqGkXLaawevRaZ8tHT4afkEz2t
	OOmeP59XE5DQC0W9nVsU9jDggSbVTMJeQJ1bfxZN+iPZc44Wq1rxmslRZ8eZkV7/QXMwGJSZGUfgd
	fI5Rarn3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdazo-0003lP-QY; Fri, 13 Nov 2020 15:28:16 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdazm-0003k9-Eo
 for linux-amlogic@lists.infradead.org; Fri, 13 Nov 2020 15:28:15 +0000
Received: by mail-wm1-x342.google.com with SMTP id c9so8457109wml.5
 for <linux-amlogic@lists.infradead.org>; Fri, 13 Nov 2020 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=KLkUtI/SVQeUp7VwceuSHv8X/fMKWIt+TsBfNKporJc=;
 b=fosSqcUSzdsOp2joMf8sEToZTn4UmIkStglUd9ikWBDpIg5QUhei8a/eYaEYiFdEVV
 MAU4SqW2iUjEtVpbD3QiPxnWs+IrHWB4Ll7TlHCUJNZNU/l1VO7PrBCwRsGxusqJoGLT
 16S7eUJZuB3/OIYH1LoY6kpWME3HxxVeBl/KC2iLh2TDrqmB1VcJNnRQbUUQVQfZcWpe
 WZDke0mQLIaSTHc085ZsZ/KHIj5+KE4ywGZqNtaQGVikH8ujYOYh3R4q3QHEv5dEesFe
 ZLyJpYAr+TxVjW2qrd3cqipFjCCEMSwyWDpDADlH/T1SCTjzQhjy/Fp8g3Or87lOMvBz
 /92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KLkUtI/SVQeUp7VwceuSHv8X/fMKWIt+TsBfNKporJc=;
 b=mRh+HUkyKW7bYlC4OWK/PibLa6PE7slQ00/ZJIRUw2iXusAk97PEymEzlj/r6yeY6R
 zZrrfuggmo2Wk+qP4aCBAbbHxrmIrMEvjqg6TjEnx/zb/5k9cuhQlA27mOA2Oj/9bsp9
 H2n0UqgQUs9ezgmXQ43MY5e7N9zFLweIXuPA9OgTeePU2Sio7GJnxh2gpVyhbVNtowyN
 9rS1sHawY7B4cnOBOcxjIkdJZ/jZ/v73oTJA5UYPCr3Ck2wlKFPR0eZPB6unygrTXKBW
 iFj3fUfuYrqbDh5BOHwV59hs+4Pn775E3LbHJhYbEgEnnrIQTdFP6y8atMGlKnReRLD3
 73UQ==
X-Gm-Message-State: AOAM532VF688p8uFn0/EGMrektOnGGtUPfBx1UH3BWrLquYwgEQO1fEv
 eGsYxs10AUOy9xRKNBz2Z4JCLA==
X-Google-Smtp-Source: ABdhPJz0NHXxKJ21M7mNWtBHglyXWW1yTkIPTpBbQc7ttvRnOC32dCp4adBlI41JNQkQYvGVmnKlrw==
X-Received: by 2002:a1c:790b:: with SMTP id l11mr3186906wme.53.1605281287062; 
 Fri, 13 Nov 2020 07:28:07 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:b0c9:356b:b197:e786?
 ([2001:861:3a84:7260:b0c9:356b:b197:e786])
 by smtp.gmail.com with ESMTPSA id s13sm11913471wrv.43.2020.11.13.07.28.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 07:28:06 -0800 (PST)
Subject: Re: [PATCH v2] reset: make shared pulsed reset controls re-triggerable
To: Philipp Zabel <p.zabel@pengutronix.de>
References: <20201112230043.28987-1-aouledameur@baylibre.com>
 <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <95a40dd0-8762-5f80-f692-a2c1f22cad52@baylibre.com>
Date: Fri, 13 Nov 2020 16:28:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0f679c62aa48603ea43a8fa4819d688baa802d73.camel@pengutronix.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_102814_539564_5098A73E 
X-CRM114-Status: GOOD (  18.09  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jim Quinlan <james.quinlan@broadcom.com>,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 13/11/2020 16:04, Philipp Zabel wrote:

> On Fri, 2020-11-13 at 00:00 +0100, Amjad Ouled-Ameur wrote:
>> The current reset framework API does not allow to release what is done by
>> reset_control_reset(), IOW decrement triggered_count. Add the new
>> reset_control_rearm() call to do so.
>>
>> When reset_control_reset() has been called once, the counter
>> triggered_count, in the reset framework, is incremented i.e the resource
>> under the reset is in-use and the reset should not be done again.
>> reset_control_rearm() would be the way to state that the resource is
>> no longer used and, that from the caller's perspective, the reset can be
>> fired again if necessary.
>>
>> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
>> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> Change since v1: [0]
>> * Renamed the new call from reset_control_(array_)resettable to
>> reset_control_(array_)rearm
>> * Open-coded reset_control_array_rearm to check for errors before
>> decrementing triggered_count because we cannot roll back in case an
>> error occurs while decrementing one of the rstc.
>> * Reworded the new call's description.
> Thank you, applied to reset/next.
>
> regards
> Philipp

Thank you for reviewing and approving my patch !

Furthermore, I think your idea of open coding reset_control_array_rearm
was accurate, and should be also applied to reset_control_array_reset()
and reset_control_array_(de)assert()

What do you think ?

In case you agree it is necessary to do so, I can work out an upcoming
patchset to fix this matter.

Best,
Amjad


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
