Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D63C4361A
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 21:41:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CF8522D6D
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 21:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CF8522D6D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FFaIsoqsE4gGYoAZyV/Vpj/o3F2Wfqv8gNkDzxEE1GE=; b=2+7HKAaHNGQpfFgs2ORlRYc8k
	k5MGkNbM6FBvhNnn9pEiIy7P0sADq0CMPLHDfj9bHoS6dbQEh5SkNnxmIjb0P6+aa9s4RQlZIY/i+
	h/pEP4YqqEQuRsXHPHRZbILzq4F4G42XxA/DcB0mqSFskG9oDGueU87HNSuPKDuZAFPp6V3JY7iQg
	0p7ze8wbNO9eykhj9oG8UYYpN7aBAFq51ouNgHptYDHtLdy0ZzuWrrhP2pPVrIhqV0aCY1bepiXYU
	dqIvlRjA4SFdYeTkMuGjdBFOh1zTtvt0+TEK7e5zlsUujCeHpsIamty8qnnuiHtNh/kaZhC9HRvWS
	urTty4wYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klfIc-0006Er-2b; Sat, 05 Dec 2020 21:41:02 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klfIY-0006E7-VQ
 for linux-amlogic@lists.infradead.org; Sat, 05 Dec 2020 21:41:00 +0000
Received: by mail-ed1-x541.google.com with SMTP id k4so9662481edl.0
 for <linux-amlogic@lists.infradead.org>; Sat, 05 Dec 2020 13:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UTqcO35AxhvxIViibGh/0qnvfwCpCuI7G7hw7DZWNnw=;
 b=KXX3O1HHwWY11/RaM9Dzz5CFPEnVqO2861yhp3Zq4BJAOClLzmkJQU5EKrGUqCvAIr
 8/9e2kWmnbhnzIeV+79jDpKC/tvBaleKhpv4uByO9genTkmUpPF5QMarNrn+m8v8oM6u
 30Grfl4Zl4TvrjKwMAqtgfgOj+gwM4bv8G7vqh3+E00U+8wCFGo5fRJfzTLm8+uc+jR6
 aoZPSml45VJLtp4iZsHJsQFuYUuIEHT4QPdfocOKIfVuYYmQeXKp838tIlYla+ZnIdSo
 mce6OSIO17VuyA6L4jHAe8j/tr9LL6GbpkliVKUV36wFqTOg++8Wx1w4FZpDGit9qqgg
 5r+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UTqcO35AxhvxIViibGh/0qnvfwCpCuI7G7hw7DZWNnw=;
 b=fe1b6X1SZy/gi7O3Pep4qQ7aXvvKEuGag6GGwBqRmLIt0TAIE4xJ21Rq/C+jZ66D4u
 7Gws05r5YHp849vi+Vk+BfHqlMkeiPtAuxrDBJDPPHK84GvOGWeWz81poDJtl2N65+uu
 zkub/GcTEPbfv72SNWrObM0Kkwu3ISYFmF3A407uiG9ztURXvDn+PpJ7pIZQ1zVe9T7k
 G/RbUx69whucg0CNtw8SARDvwlelkp+aGOYdJlQIsabb60x4DusZSTGgk8busMiYXT8U
 u6utTv4pNvKtgYhL3Nkml39Ab9gdcI3ACBX2aXhkByMlTrvbEdWwskp9ZtsNDkcUBU6t
 4Uqg==
X-Gm-Message-State: AOAM5326lM9GCWo7hNZfFvVH1yuXvyG2o7/0FzEqtXy7+xHkLzeXp4Nk
 K7FM0OXRSl2x8UlhdWsQ2EugvAnWkZzDCF4h6AY=
X-Google-Smtp-Source: ABdhPJxe+385+jD4f2RXs8pWDhUP+JX/l0jq10BncAnwZ19s8shIO75ed+mOWOsL/O5LZJo8/tufqelytA96zlmZuHE=
X-Received: by 2002:aa7:de0f:: with SMTP id h15mr1839845edv.110.1607204457924; 
 Sat, 05 Dec 2020 13:40:57 -0800 (PST)
MIME-Version: 1.0
References: <20201201190100.17831-1-aouledameur@baylibre.com>
 <20201201190100.17831-4-aouledameur@baylibre.com>
In-Reply-To: <20201201190100.17831-4-aouledameur@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 22:40:47 +0100
Message-ID: <CAFBinCB-pSeN8rWrLz8doZKdeB=_sRL5osS7yF=UT6itcpXnnA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] phy: amlogic: meson8b-usb2: fix shared reset
 control use
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_164059_113505_A77D48DF 
X-CRM114-Status: GOOD (  10.61  )
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
Cc: Felipe Balbi <balbi@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-amlogic@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 1, 2020 at 8:02 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Use reset_control_rearm() call if an error occurs in case
> phy_meson8b_usb2_power_on() fails after reset() has been called, or in
> case phy_meson8b_usb2_power_off() is called i.e the resource is no longer
> used and the reset line may be triggered again by other devices.
>
> reset_control_rearm() keeps use of triggered_count sane in the reset
> framework, use of reset_control_reset() on shared reset line should
> be balanced with reset_control_rearm().
>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reported-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> #
on Odroid-C1+

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
