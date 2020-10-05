Return-Path: <SRS0=hoO3=DM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B496C4363A
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 12:31:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD5C32078D
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Oct 2020 12:31:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rPmWE1f+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="jeCAFGdV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD5C32078D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uwiFxUGC9xVFrpoqDL0/d7bEormhiXoVmPcPOgca7N0=; b=rPmWE1f+VGWUTQUWRJcdpAFx1
	pospVGc1DZ7znenpRaA6vyMOBQcTMQ+sZBGSlkG/v+LspmemYdz+RXOukLO+hbMZcgeei0jS0+qDe
	l08ybFW1J3+7hb2uBy92V2vaVNGXKe/ZtpkxklrwNRBiagC82eRGptytHouvtui8gc+wTrMv65G/P
	2OiqefV+oRM/DxqqOc0UtaAK4LVisHM3DKiwTDOaxw0G0ru42K6AUL+gM0tpY2/ePvUrfKeybnodb
	YdacLtCKo60MZqAU6MuV4SPgDwWUre9DURV/v+eg4xYqV8bXCP3MWPn1yG49h+VnbsNZDrTXqjgXu
	lGONQEf3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kPPe6-0002QE-HA; Mon, 05 Oct 2020 12:31:14 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kPPe3-0002PE-Ll
 for linux-amlogic@lists.infradead.org; Mon, 05 Oct 2020 12:31:13 +0000
Received: by mail-ej1-x642.google.com with SMTP id qp15so11647347ejb.3
 for <linux-amlogic@lists.infradead.org>; Mon, 05 Oct 2020 05:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=fiCrvDEC+N91sV5tSYfiRUfHF9WZ4cEQDOciG9CIIEo=;
 b=jeCAFGdVVyZTTJVSAYgmCTbMhs2z/jLPfL6bbH5ezEq64dztUXuA3/Nq27U3WKMgFG
 Lemw0JeuJdSf2TIvfuTw4vbryHp7U8pI38jM8Po5eehY/qRSRsqpc19Ku6NhF+OM10yN
 TCzAII1A1p4ibrR/zRIWRgrMSDTX2P+9vmLeh+RRNjGxwaxJj/vu/smwC7lHIcE8F2Ao
 eoQxO7MHjUY4RO644XNJcFYAOgMEQMt+UBJlJGUJKdCUOPgXlSEQNN0FFImFlQb2Udi6
 ZJS5GICnohvXBu0nqUY13Nnz0jYxaLe7FNc5h8MMm6QKbFIDewptfKzRElGQ119pgj8Q
 1VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=fiCrvDEC+N91sV5tSYfiRUfHF9WZ4cEQDOciG9CIIEo=;
 b=o5IET5HiMZxJWr3oTcTyjyx8TfeKX3T0l6ggugThLPY2YyORt1FWgxsu135dZ98MuJ
 158D/p9/ZrY02s0RpjRsTZoY75mqxrlVL35YJ66XuXqv5vMzf3/Qvf5EwzVVUeNFuFOZ
 ImSBMl/SooLQYuj1rMIu4K22LuxJELGu3RrgbwA/u+rA+jzOe1eWLl2i9aV9y0CWU43g
 oljzkFKhZj7hwWXeyQMCKVfrD/Oac/yXYiW9882dqmEhHpC9Qz/2vhax88QsABR9pqr2
 mA8MTseJf1PhVLo9Gf/nJxkeBoxzPJKtCS5vnxtLsng1OyTrwPQYftzc6iM9qLgt7pqC
 3rFw==
X-Gm-Message-State: AOAM53262ut+guXAt+6c6eT3W00UHcx15tvdlTZqzP73+a5xQed5FYxg
 rwFycMadDFACExqCkDROE/B5iQ==
X-Google-Smtp-Source: ABdhPJy02NnD+4aHKxW6Hc8US3lVSSNA3BxcKCnClvJhFQf261x5iusEFWzdEVvbeZjYWA02noZaqA==
X-Received: by 2002:a17:906:2dd:: with SMTP id
 29mr15898934ejk.31.1601901068443; 
 Mon, 05 Oct 2020 05:31:08 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id i14sm8004849ejp.2.2020.10.05.05.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2020 05:31:07 -0700 (PDT)
References: <20201002164915.938217-1-jbrunet@baylibre.com>
 <CAPDyKFo6T_P+TQQZSzFgHwLeE08f146KxKBpAutv209MXq0mjA@mail.gmail.com>
 <87wo052grp.fsf@nanos.tec.linutronix.de>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: meson-gx: remove IRQF_ONESHOT
In-reply-to: <87wo052grp.fsf@nanos.tec.linutronix.de>
Date: Mon, 05 Oct 2020 14:31:06 +0200
Message-ID: <1jlfgkrh11.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201005_083111_723874_01AB97C1 
X-CRM114-Status: GOOD (  15.66  )
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
Cc: Kevin Hilman <khilman@baylibre.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Brad Harper <bjharper@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 05 Oct 2020 at 10:55, Thomas Gleixner <tglx@linutronix.de> wrote:

> On Mon, Oct 05 2020 at 10:22, Ulf Hansson wrote:
>> On Fri, 2 Oct 2020 at 18:49, Jerome Brunet <jbrunet@baylibre.com> wrote:
>>>
>>> IRQF_ONESHOT was added to this driver to make sure the irq was not enabled
>>> again until the thread part of the irq had finished doing its job.
>>>
>>> Doing so upsets RT because, under RT, the hardirq part of the irq handler
>>> is not migrated to a thread if the irq is claimed with IRQF_ONESHOT.
>>> In this case, it has been reported to eventually trigger a deadlock with
>>> the led subsystem.
>>>
>>> Preventing RT from doing this migration was certainly not the intent, the
>>> description of IRQF_ONESHOT does not really reflect this constraint:
>>>
>>>  > IRQF_ONESHOT - Interrupt is not reenabled after the hardirq handler finished.
>>>  >              Used by threaded interrupts which need to keep the
>>>  >              irq line disabled until the threaded handler has been run.
>>>
>>> This is exactly what this driver was trying to acheive so I'm still a bit
>>> confused whether this is a driver or an RT issue.
>>>
>>> Anyway, this can be solved driver side by manually disabling the IRQs
>>> instead of the relying on the IRQF_ONESHOT. IRQF_ONESHOT may then be removed
>>> while still making sure the irq won't trigger until the threaded part of
>>> the handler is done.
>>
>> Thomas, may I have your opinion on this one.
>>
>> I have no problem to apply $subject patch, but as Jerome also
>> highlights above - this kind of makes me wonder if this is an RT
>> issue, that perhaps deserves to be solved in a generic way.
>>
>> What do you think?
>
> Let me stare at the core code. Something smells fishy.

FYI: initial discussion can be found here
https://lore.kernel.org/linux-amlogic/24a844c3-c2e0-c735-ccb7-83736218b548@gmail.com/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
