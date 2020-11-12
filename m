Return-Path: <SRS0=7ebA=ES=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45464C388F7
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2020 13:15:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BE4B221E9
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Nov 2020 13:15:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E5oM/v+k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1zVzCwCx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BE4B221E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Dx7EMcouIlJzjfrqxE/HNbpJX3WKV/hKiePimhCLwq0=; b=E5oM/v+kKseY5JQNteojGA2vL
	NUpeWSfFU84Hycx3lA2Fnr1so6G9FP86jQB2i9DdyU0BYi511sG7CUEup6LUwXt75SlJeLOPBe7K2
	Oyv+S1miAcFpw6MXjBo4e3/fGNHnf3cKimzszM9qiv+pKf6Ctisj6JLWuYsZfF9x1dvN2WbxIpFhR
	izFsepb+/xvMosGlx340mOHoEG0XuuJQWgS1aXh11GU7U6lNU8CB1l6i2bhCg3sIiMO4QaxDIG/UN
	3k4smkKC+cu9tFScbsd1gkpVDrJrpM/TRDS3xteUqan8vHSJ+aqpIRKuIkWL5igkyNwifMbb5CiMi
	WOm7PESbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdCRC-0001Zw-Ix; Thu, 12 Nov 2020 13:14:54 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdCR9-0001Z8-Gt
 for linux-amlogic@lists.infradead.org; Thu, 12 Nov 2020 13:14:52 +0000
Received: by mail-wm1-x343.google.com with SMTP id h62so5479258wme.3
 for <linux-amlogic@lists.infradead.org>; Thu, 12 Nov 2020 05:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=khPl32PaFPajgxudIFCV/7sE6sgZ8s6VEPeuzuAOnEE=;
 b=1zVzCwCxFFXqYgDMR+7zq6ldvSgivUZwoIVw+3QpkMWattNCrYHkxfqRrbis9t75W+
 +jx3575UFW2mfONslpRiJ0DnVMBMdcCd7OhTlxOsd6hg8CirCgDcLbCcKzRwm1KLifJ8
 t689RF+x1EGSMpBUKV46lZ5CJSyiTPlPKTxhmhUeMtsgNCGJCE8KSWTsQQnKkuNIiJk1
 wbwtO4YPH8Lb2DhLXgIh+yhm6AN6CZRUZbaRLaPGFaszc6WLYhq8FXW/aqwYGQtBwCfi
 dxZCb/HwcMckBcP4yr7nCYBUk7XBHQjg/4RuNQsPMA1O6OxpbFhkvaTKcO2EOWcIpqiX
 g0wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=khPl32PaFPajgxudIFCV/7sE6sgZ8s6VEPeuzuAOnEE=;
 b=hq+WmZ+w8nJ/21Gf8nS1AJndAftzBqvp35kqrgb94eG7iMqDph42mkgbZtsr+T87gF
 mfYo3IfwsA/sZLjLzW4R/xkwQyfpB7fWnt/mNVppXEijInBKxy04AAJYTrFFTyybF5wu
 7vPWE5Nq2GqKYhwCVEFZ0gwkb8iveNH3UMyB6+q3m1uzNKoIs7bzXMslA+DD6xk3WVF8
 RM9HhSHGEl0CIhzv9eQAiuvHjFfV+fhVf7+bFD2H50vRk62VhoDFEP+HW7aD1xEXXaeh
 lxXj0IDEQo/hYih5/hLZuNicKse+R8IGksw3/NIrgnIhhMwMMFGEgbwCG5Pewe2t9w6i
 iztw==
X-Gm-Message-State: AOAM531g9YwQqpVBud6R3MPS7JB2Yn7dqUzBQ6e8fYK0X5oAJ7WGTd9q
 8MtvSDx+KfSmqTVWmiT4FBnymA==
X-Google-Smtp-Source: ABdhPJwlyquafBA/bq5q5PHiBAXBvMonzm+44o0cAS17O1FWvKLTP5sVXAIPengBqmJGJ5w3SP6lmg==
X-Received: by 2002:a1c:240a:: with SMTP id k10mr9330800wmk.173.1605186888876; 
 Thu, 12 Nov 2020 05:14:48 -0800 (PST)
Received: from ?IPv6:2001:861:3a84:7260:5d3c:83d5:8524:33ca?
 ([2001:861:3a84:7260:5d3c:83d5:8524:33ca])
 by smtp.gmail.com with ESMTPSA id o10sm6769550wma.47.2020.11.12.05.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 05:14:48 -0800 (PST)
Subject: Re: [PATCH] reset: Add reset controller API
To: Kevin Hilman <khilman@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20201001132758.12280-1-aouledameur@baylibre.com>
 <7hh7rckzcr.fsf@baylibre.com>
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Message-ID: <d12962a5-edba-869e-9383-5717dbffae0b@baylibre.com>
Date: Thu, 12 Nov 2020 14:14:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7hh7rckzcr.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201112_081451_672651_3E2FC191 
X-CRM114-Status: GOOD (  18.02  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03/10/2020 01:00, Kevin Hilman wrote:
> Amjad Ouled-Ameur <aouledameur@baylibre.com> writes:
>
>> The current reset framework API does not allow to release what is done by
>> reset_control_reset(), IOW decrement triggered_count. Add the new
>> reset_control_resettable() call to do so.
>>
>> When reset_control_reset() has been called once, the counter
>> triggered_count, in the reset framework, is incremented i.e the resource
>> under the reset is in-use and the reset should not be done again.
>> reset_control_resettable() would be the way to state that the resource is
>> no longer used and, that from the caller's perspective, the reset can be
>> fired again if necessary.
>>
>> This patch will fix a usb suspend warning seen on the libretech-cc
>> related to the shared reset line. This warning was addressed by the
>> previously reverted commit 7a410953d1fb ("usb: dwc3: meson-g12a: fix shared
>> reset control use")
> Could you also send a patch that shows how your new feature can be used
> to fix the problem that was originally fixed by that patch (and still
> exists, now that it was reverted.)
>
> Thanks,
>
> Kevin

Hello Kevin,


Will do soon !


Sincerely,

Amjad


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
