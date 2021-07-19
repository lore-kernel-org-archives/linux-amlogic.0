Return-Path: <SRS0=+Him=ML=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EC7C07E9B
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jul 2021 10:41:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65EF960FF4
	for <linux-amlogic@archiver.kernel.org>; Mon, 19 Jul 2021 10:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65EF960FF4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xFeQCANuDWRU2TR4G3mhAk6wYgQvBeu0lBXldJvAFs0=; b=jCORDwGfdJUsskj3rLGkyekMc9
	e0mKd7jZRpo1rCGEgTQBvXTatRyl/Iqx+LmE/shmor6pfyCwbc3L/Fp2ttngEiUL18fnl+4RjKNVV
	gpADzuLXj9tKeYXkn9zszKId9skjrl5T6fQYyjrtWjd0bfNlAFrMQElq2lu/fpUknLUUU1N8lTxQu
	K2NhuHMz1t2GgsvDI37XvtAtgDyhtjzgxfD9Dnt38AvqmYMxTV0WMrg+SwHQOT1MPyHEXhV5BpvGf
	kjg3M0zgv0CuWSfHRPcI61DGe874Mm69wLQiLgFd4JnXPP6cviktodhCBCh7HTNmPnUGx/a6895s5
	zrKLWNGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5Qhq-009IV8-Cz; Mon, 19 Jul 2021 10:41:02 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5Qhn-009ISz-Bj; Mon, 19 Jul 2021 10:41:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8BBD16D;
 Mon, 19 Jul 2021 03:40:55 -0700 (PDT)
Received: from [10.57.36.146] (unknown [10.57.36.146])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B0AC3F73D;
 Mon, 19 Jul 2021 03:40:53 -0700 (PDT)
Subject: Re: [PATCH v6 1/2] media: rc: meson-ir-tx: document device tree
 bindings
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>
Cc: sean@mess.org, mchehab@kernel.org, robh+dt@kernel.org,
 khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 jbrunet@baylibre.com, linux-media <linux-media@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 rockosov@gmail.com
References: <20210716144508.6058-1-viktor.prutyanov@phystech.edu>
 <20210716144508.6058-2-viktor.prutyanov@phystech.edu>
 <CAFBinCBpxcHHDs2cr+V4gDVk48G3+T7V-Lde2CkY6xvVrqixmA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a60c3706-fb11-f66c-6c17-d0f960241e03@arm.com>
Date: Mon, 19 Jul 2021 11:40:47 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCBpxcHHDs2cr+V4gDVk48G3+T7V-Lde2CkY6xvVrqixmA@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_034059_527495_B9D6A539 
X-CRM114-Status: GOOD (  32.07  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Martin,

(just reading this patch out of passing curiosity...)

On 2021-07-17 20:57, Martin Blumenstingl wrote:
> Hi Viktor,
> 
> On Fri, Jul 16, 2021 at 4:45 PM Viktor Prutyanov
> <viktor.prutyanov@phystech.edu> wrote:
> [...]
>> +  amlogic,fifo-threshold:
>> +    description: TX FIFO threshold
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    minimum: 0
>> +    maximum: 127
> I tried to make sense of this property but I don't understand it yet
> (even after reading the second patch in this series).
> A "FIFO" (in my own words) is some physical property of the IR
> transmitter in these Amlogic SoCs.
> So for one specific SoC there can only be one FIFO size, not a range (0..127).
> 
> What about a value of 0: my understanding is that this means that
> there's no FIFO. Will this hardware still work in that case?
> 
>  From reading the driver code it seems to me that the FIFO size is 128.
> The driver can use fewer FIFO entries if it wants, but this must not
> affect the dt-bindings (as these describe the hardware - they don't
> "configure" the driver).
> If you look at arch/arm64/boot/dts/amlogic/meson-g12.dtsi you'll find
> toddr_a, toddr_b and toddr_c there:
> All three of them use identical circuitry internally, except that
> toddr_a has a bigger FIFO size than the other two. Using a FIFO size
> of 256 for toddr_a is not correct as it's an improper description of
> the toddr_a hardware (that said, the driver can still decide that it
> only wants to use 256 FIFO entries).

In general, a FIFO threshold is not about how much of the FIFO you use 
overall, but how often and/or urgently you tend to it. If the only thing 
that matters is minimising CPU overhead then the optimum choice is to 
wait until the FIFO is entirely full/empty before taking action to 
drain/refill it. However, that necessarily creates a pause in 
reception/transmission for the time it takes to respond to the 
empty/full interrupt, hence why many FIFOs also implement a threshold 
interrupt for cases when uninterrupted communication is more desirable 
than absolutely minimising interrupts. Typically those are set to fire 
at some point shortly *before* the FIFO becomes completely full/empty, 
to leave enough remaining buffer for communication to continue during 
that time window until the ISR actually gets to respond.

That said, I'm also doubtful about this particular case. If the physical 
FIFO depth does actually vary between SoCs, that should be known by the 
driver and implicit in the compatible string, definitely not hidden in a 
tangential property. Otherwise, it's not apparent how this makes sense 
to configure statically on a per-SoC or per-board basis. If anything it 
would depend on the transmission rate of whatever IR protocol the user 
wishes to use at any given time AFAICS. If it's not sufficient for the 
driver to simply assume, say, an 80% threshold as "good enough", then 
presumably it has enough information about the clock rate and/or the 
parameters of the given Tx request to implement a slightly cleverer 
heuristic. If it's desirable to tweak the specific driver behaviour in 
cases where the user does know better, then by all means make that a 
module parameter, but it's not something which belongs in DT.

Cheers,
Robin.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
