Return-Path: <SRS0=ZsgJ=2L=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AE84C2D0D2
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Dec 2019 21:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AF9F206B7
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Dec 2019 21:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M/6vb5xU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AF9F206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sW5MsJK09jALSt4HGrpwerJVtyHM51CS3MoO/Jm3Pn0=; b=M/6vb5xUPAtasFDBJuDXZ2hem
	xudOSWOYhijzG3GOMdOQgN+fVnmZRrm0AlQviA0ngLSODEx2pI6B/w9wt2+6YTWZIGqYIfEHu+wQr
	xTYbpWWXriydTSiYTRmqL8Fvuj+qQ93nzk+/qlvQgn5PTWaeT9MiOYuLbcsWqjBhuaRpq5Qo7FAdy
	kYqyQEZAo/j7Xhk5WlccVgZr+F7j6um0J3SRGnocrBS9DNkQSCZMpSWtAJKmZxeLScAWZF1hmWgwe
	okvYihlG4LPj9W5ZH0mxHOuHAAsFRV5lgjAHdfLUWJbTDM16ttRWJdirQ/Di/5X6seq42oFyVzIc2
	Ed6h2fNCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iilyZ-0006p2-RG; Sat, 21 Dec 2019 21:07:51 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iilyW-0006oV-JQ; Sat, 21 Dec 2019 21:07:50 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2E76FACEC;
 Sat, 21 Dec 2019 21:07:46 +0000 (UTC)
Subject: Re: [RFC 00/25] arm64: realtek: Add Xnano X5 and implement
 TM1628/FD628/AiP1618 LED controllers
To: Pavel Machek <pavel@ucw.cz>
References: <20191212033952.5967-1-afaerber@suse.de>
 <20191221182057.GA32732@amd>
From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Organization: SUSE Software Solutions Germany GmbH
Message-ID: <e26f985b-ceca-ca2c-a709-e7dc40c7fdd1@suse.de>
Date: Sat, 21 Dec 2019 22:07:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191221182057.GA32732@amd>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191221_130748_932632_6511E5DC 
X-CRM114-Status: GOOD (  17.83  )
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
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 linux-realtek-soc@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Dan Murphy <dmurphy@ti.com>,
 linux-amlogic@lists.infradead.org, Rob Herring <robh@kernel.org>,
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Pavel,

[- Roc He, - chipset vendors]

Am 21.12.19 um 19:20 schrieb Pavel Machek:
>> It goes on to add a "text" attribute to the driver that enables DT-confi=
gured
>> seven-segment displays; I was expecting to find precedence in auxdisplay
>> subsystem but came up empty. So my driver currently integrates its own
>> generic (but incomplete) character-to-8-segments mapping, as well as in a
>> second step a combined-characters-to-8-segments mapping, which then gets
>> mapped to the chipset's available output lines. Doing this as sysfs
>> device
> =

> I did not investigate this in great detail; but if it is displaying
> characters, auxdisplay is probably right subsystem to handle that.

ausdisplay does not have any common API AFAICS. Most of them are =

high-level displays with some parallel interface to set text and =

metadata. Half of them hardcode the text to Linux or maybe offer a =

Kconfig option to override it; the other half implements their own =

character device file with ABI specific to that driver.

> I
> guess LEDs can still take the low-level parts...

I'd hope so, but I believe we're missing multiple things there:

1) A bulk-update API for setting multiple LEDs at once. =

.brightness_set[_blocking]() is all we have on the device side, which =

here results in two SPI commands. led_set_brightness[_sync]() is all I =

see on the API side. We'd need an API that takes an array of LEDs and =

brightness values and allows a common driver rather than individual =

devices to update the Display RAM via SPI from an internal buffer.

2) DT is currently limited to one node per LED device. We'd need =

#led-cells, with current LED nodes defaulting to zero. That way we could =

address LEDs from an external, e.g., auxdisplay driver via a two-cell =

index for these LED controllers, without needing to have DT nodes for =

each and every display segment.

3) Better LED device names. More "function" values, or a reversal of the =

label deprecation. Or an alternative API to register LEDs with manual name.

4) LED triggers controlling more than one LED. linux,default-trigger =

seems to assign one per LED, so that two heartbeats are quickly out of =

sync. Doing it from code would probably be simpler than finding a way to =

model this in DT, but I don't yet see how.

Alternatively we could expose those LED output lines as a gpiochip, =

which we can already index in DT, and consider the display GPIO-based, =

but then we're in the situation again that GregKH was telling people to =

either go screw themselves in userspace or move things into leds, which =

now you're against.

Also, if you don't allow displays in leds, then we can't have LED =

triggers for them either.

> =

> Oh, and common dimming for many LEDs is seen on other hardware, too
> (Turris routers). Not sure how to handle that, either :-(.

That part I have indeed successfully solved with a backlight device.

My current problem (WIP blocking a push) is the key input handling - not =

sure how to model both LEDs and keys as DT child nodes - do we need a =

compatible to distinguish between them? Unit addresses and reg values =

would be in different ranges, making this awkward, not to mention the =

problem of naming a compatible, given the incredible diverse chipsets.

Regards,
Andreas

-- =

SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer
HRB 36809 (AG N=FCrnberg)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
