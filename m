Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D59F7C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:35:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A578820863
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:35:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFlgHyFP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="YAUBhxw0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A578820863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfWRrw9mfJDWU1Ae7i1mJK2c3OiYX3VGT5nvNGU1d0Q=; b=bFlgHyFPVo7UUB
	jUvbH2tY9hOI4OUL60nvk1jiDaFmLOxPb66L0YoKxsajaRSUbGiwupXmd0D9Ic/vndlPgmlZXnBvV
	Y3uPuH60Ft198Ef9a6BJ/nlu9ZRVx2A3UhFQaqoZvapdY/K/agc94+nvl6GimMlSjAM+uzp3S1o6n
	7qZFUyGKaCRW4y4GKj9mvQCZb6GoEehcZ7C3xVPeyClL7T6g3FvoGHV/XzBWsiXDrLPgPJwd2n49M
	4M/QtRDDhIrD0P4vmte8va8hsAj6WIZMEXidJJDTLdrKTwxu4NPEqoP3MIBmP/5NUW7dZJsKb5HJC
	XfnmmwEUQUS7tm6ss4jQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8M0u-00022d-I2; Mon, 25 Mar 2019 09:35:28 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8M0q-00020z-Q8
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 09:35:27 +0000
Received: by mail-wr1-x442.google.com with SMTP id t5so9199643wri.7
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 02:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=Rle8vsvUTQ0auhIf9QOOwZv4gCpStzfFAzM2K4rd5bI=;
 b=YAUBhxw07k758cPR309I54mxOBzO4+i34SGMAJRJF0dJ6SBAJIRbN3OuPKtbfURt7j
 6vtJ3zINHrUu+3z7r1Q8Q9svGY5oTHOp348UJC7MP4FOnGyF+hKkPl/GliTKjL3rl5/K
 iJtsW9fHYUQh9SbuE65iW6QsB8aHgr40tai5IGUHjG77LyYsvizvwy+5kWr9dcUQJQUm
 f4qDbuxVvDsxkWsHu/BVx+u1Z3Niob3BAIA2qx2gnRMygGsCeFK0N1f58/4uxTJlcWcD
 /9kpEjeWrZgfTjWHYx5Ksq7ciMl3ge6CP5Hz05dSLnbEwr1YRTOUftm45VMFJignrcfb
 ndFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=Rle8vsvUTQ0auhIf9QOOwZv4gCpStzfFAzM2K4rd5bI=;
 b=g+GGarwDGCjHZPDU3hIkO3U971xTEmWEOhx4qPvGiMmVGdwLxS4hCxWvEUH6Fv8uom
 dmz7h5YvEIOWIctC1ZM1pv3OVxpPe1qQJAf4yFLMB6cv55ZSgqPm6IF1b4loVi84BDTE
 cnQ3ab19TDw241GrcBAB4EP3nWf0ONLFTVrtpvJolvprmqLzsdql/J6ZGJuDCsEH6MFE
 zpZlIhToaETUC+lhpqSAwB2VITnUE0JfV8YPCeXnZ9f/t/yc6VhHI1athplGqkn5TN8b
 74PCcpqwpxxZStJh/knMpSVaUKsfYIeKRGmzmRPypSKy/LFz2hs0XhQrydHhFgxgauK6
 isDA==
X-Gm-Message-State: APjAAAXhc97wiuNAHXnAIN2045rDmHGJULN/SksqkvWLqdUStKiu3FoY
 LqQK3sMS/TyXtL+qwidn9f8PlA==
X-Google-Smtp-Source: APXvYqw07YGN7PdMNPwcdpQiIOjKaQolrQkpUtYAXCiqrVWvj9vrMc0Bo9HVgjF7iILK4VArYgeLoA==
X-Received: by 2002:adf:f286:: with SMTP id k6mr6509521wro.137.1553506515639; 
 Mon, 25 Mar 2019 02:35:15 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 3sm20408847wrk.68.2019.03.25.02.35.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 25 Mar 2019 02:35:14 -0700 (PDT)
Message-ID: <47e944da1c3b0a11cf46fc5ad5678ba961b9f9d3.camel@baylibre.com>
Subject: Re: [PATCH 0/1] pwm: meson: fix scheduling while atomic issue
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 thierry.reding@gmail.com, narmstrong@baylibre.com,
 linux-pwm@vger.kernel.org,  linux-amlogic@lists.infradead.org
Date: Mon, 25 Mar 2019 10:35:12 +0100
In-Reply-To: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
References: <20190324220217.15813-1-martin.blumenstingl@googlemail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_023524_845845_97316BD8 
X-CRM114-Status: GOOD (  18.09  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 2019-03-24 at 23:02 +0100, Martin Blumenstingl wrote:
> Back in January a "BUG: scheduling while atomic" error showed up during
> boot on my Meson8b Odroid-C1 (which uses a PWM regulator as CPU supply).
> The call trace comes down to:
>   __mutex_lock
>   clk_prepare_lock
>   clk_core_get_rate
>   meson_pwm_apply
>   ..
>   dev_pm_opp_set_rate
>   ..
> 
> Jerome has also seen the same problem but from pwm-leds (instead of a
> pwm-regulator). He posted a patch which replaces the spinlock with a
> mutex. That works. I believe we can optimize this by reducing the time
> where the lock is held - that also allows to keep the spin-lock.
> 
> Analyzing this issue helped me understand the pwm-meson driver better.
> My plan is to send some cleanups (with the goal of re-using more of the
> goodies from the PWM core in the pwm-meson driver) after this single fix
> is merged (they can be found here: [1]).

Thanks for fixing this Martin.

As for the future enhancement, I'd like to know what you have in mind.
As I have told you previously, I think the clock bindings of this driver are
not great.

The global name of the input clocks are hard coded in this driver and it
sucks. CCF is evolving to rely less on these global names.

In addition, the 'clock' binding should be used to refer to the clock
'consumed' by the device, not to define a setting (as done now). 'assigned-
clock' binding can be used for that.

This would be a significant change in the binding meaning of this driver,
which probably calls for a v2.

Last, instead of specifying the parent to be used, I think we should come up
with some code to let the driver pick the most appropriate parent for the period/duty requested.

> 
> Dependencies: none
> 
> Target version: please queue this for -fixes so it makes it's way into
> v5.1-rc (so we can get it backported from there, because this issue has
> existed since the pwm-meson driver was introduced).
> 
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2019-January/009690.html
> [1] https://github.com/xdarklight/linux/commits/meson-pwm-for-5.2-v0
> 
> 
> Martin Blumenstingl (1):
>   pwm: meson: use the spin-lock only to protect register modifications
> 
>  drivers/pwm/pwm-meson.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
