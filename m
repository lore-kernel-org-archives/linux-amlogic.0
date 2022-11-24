Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9676C4332F
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Nov 2022 06:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nqwii8LiIJ/jM2Yv7bxPWaprWR3qgcbTN5VY6H4tO5k=; b=1Z+eWNDwWUDxBeEqK7xWWFEoUu
	wQJo8pN/0BTqpaHLlntz98GSHCVKhN/6vTANmS6dNZKJ++e9DgfXHmbnPmnaMKe3l8xrkF+F4tCNQ
	EVporoepWLzGszAJ7u660Mj5o6ZyAu4I2M0t7gGsLrKybF/9mBkkTib9V5zMuWTBJKhjGALXTpAMZ
	n2MtkHiQuWeDNOtp1DhxqZKxKkokRb00TIdzHI1xYtyuZNe4tL2Kd/o/2eWSmg+U7lHimkFD6F900
	HYK+CpdmZgGVZSt5DPndGKwOsI4irpbsuTyJxOmP44j7mWWLlhK58hiSBrAJqHYK6VRAymX+93cgN
	J4PByjnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy5da-005eCA-7H; Thu, 24 Nov 2022 06:23:06 +0000
Received: from mx.msync.work ([185.250.0.168])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy5dW-005e8T-Mg; Thu, 24 Nov 2022 06:23:05 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 647292AB88;
	Thu, 24 Nov 2022 06:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lexina.in; s=dkim;
	t=1669270976; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Jtkb8FsWa/xNXgK1fxfSzbSkqlyxfm+DrIrqY+1P7xA=;
	b=excDdHXccoor+/ly4WQAAdddOMnCppJSjYZ+UA68KkBk4+F+Esr1QzonlhXwo3wqbMPIXM
	GruVSUr6XCcxMvp6Efwj8YRh8iaurZhlF3GgaSCTHF/n7gChplhO3nykIx/s0+5buDsGs+
	F7MARCewOgtRQZerb7SnMwfLfsxYEQKoKfHATh+4f312E6cLn+Xcmyk1HI8dDGnr6Yd4u4
	FZU1D+GKOg+JWS9J0cqkf/qLNUObfdUcIXY5xgHsi0IyQ9drhM1aOsJQLCMaPjHLep+S69
	KLENDe2wfgvLG8MeBRxYY3GsMn6nivs0vSpt19OGGG4chbWUwQxOrGyo5m8QDw==
Message-ID: <c31cc8a3-8adc-3e93-f6fe-73cd7482429d@lexina.in>
Date: Thu, 24 Nov 2022 09:22:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 0/4] arm64: amlogic: mmc: meson-gx: Add core, tx, rx
Content-Language: en-MW
To: Jerome Brunet <jbrunet@baylibre.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
References: <20221110150035.2824580-1-adeep@lexina.in>
 <1jk03y37vs.fsf@starbuckisacylon.baylibre.com>
From: Vyacheslav <adeep@lexina.in>
In-Reply-To: <1jk03y37vs.fsf@starbuckisacylon.baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_222303_406122_6012D4F2 
X-CRM114-Status: GOOD (  36.26  )
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

Hi!
Thanks for reply. Sorry for delay.


13.11.2022 23:06, Jerome Brunet wrote:
> 
> On Thu 10 Nov 2022 at 18:00, Vyacheslav Bocharov <adeep@lexina.in> wrote:
> 
>> The mmc driver use the same phase values (core - 180, tx/rx - 0) for all
>> meson64 platforms. However, some platforms (and even some boards) require
>> different values
> 
> Where does it stops ? Trying to solve the instabilities of this
> IP/driver by tweaking the phase has proven to be dead-end.

As a result, there is now a stalemate and various real-world operating 
system projects use patches to change clock phases.


> 
> Soon, you'll end up tweaking these settings depending on the on
> particular version of the device because it ships with a different eMMC
> manufacturer. Then comes multi sourcing, sdio modules, sdcards ...
> 
>> (axg for example use 270 degree for core clock).
> 
> Where ? Upstream linux does not

Armbian/Home Assistant OS use core phase 270 for axg/g12/sm1 boards 
(patches by Neil). On JetHub devices phase 270 is need with eMMC more 
than 16Gb size.

> 
> u-boot does something of the sort for sm1 and I'm not entirely sure this
> appropriate either.

U-boot in Armbian/HAOS use same phase 270 or/and force low speed mode 
for eMMC (limit clock freq).

> 
> IMO, this setting has more to do with the mode the mmc device is
> operating at - not the platform or board.
> 
> We had some discussions with the HW designers at AML and they recommended
> to keep a phase shift of 180 between the Core and Tx. They also
> recommended to leave Rx alone (actually, starting from the v3, the Rx
> field has no effect. It is not even wired to actual HW)

I do not have access to AML engineers :)
I can only test settings on several different boards. And it seems that 
the phase settings depend not only on the board layout, but also on the 
eMMC chip used. What to do about this (if not to use the magic of the 
driver from AML) other than providing the ability to change the value in 
devicetree for each board I can't think of yet.

> 
> Funnily, that is not what the vendor driver does. It also does A LOT of
> extremely complex and 'debatable' things, which mostly mask how much the
> driver is unstable.

As far as I understand they just go through all possible values until 
the first successful attempt to initialize the device.
What do you think of the idea to implement such a variant for the 
meson-gx driver?

> 
> With the upstream drivers, modes up to SDR50 and HS200 have been stable
> lately. SDR104 and DDR modes (DDR52 or HS400) remains problematic.

I have troubles with HS200, for example:
Card Type [CARD_TYPE: 0x57]
  HS200 Single Data Rate eMMC @200MHz 1.8VI/O
  HS Dual Data Rate eMMC @52MHz 1.8V or 3VI/O
  HS eMMC @52MHz - at rated device voltage(s)
  HS eMMC @26MHz - at rated device voltage(s)

> 
> Changing the settings further would require more discussion with AML.
> Blindly poking these value until you get something stablish for 1
> particular use case is a recipe for disaster.

I assumed the idea that the dts are edited by the maintainers or the 
board developers and will be able to choose the values themselves.


> 
>> This patch
>> transfers the values from the code to the variables in the device-tree files.
>> If not set in dts, use old default values.
> 
> I think going that way is opening a big can of worms.
> I don't think this should be applied
> 
>>
>> Vyacheslav Bocharov (4):
>>    arm64: amlogic: mmc: meson-gx: Add core, tx, rx eMMC/SD/SDIO phase
>>      clock settings from devicetree data
>>    arm64: amlogic: mmc: meson-gx: Add dts binding include for core, tx,
>>      rx eMMC/SD/SDIO phase clock settings from devicetree data
>>    arm64: amlogic: dts: meson: update meson-axg device-tree for new core,
>>      tx, rx phase clock settings.
>>    arm64: dts: docs: Update mmc meson-gx documentation for new config
>>      option amlogic,mmc-phase
>>
>>   .../bindings/mmc/amlogic,meson-gx.txt         |  7 ++++
>>   arch/arm64/boot/dts/amlogic/meson-axg.dtsi    |  3 ++
>>   drivers/mmc/host/meson-gx-mmc.c               | 18 +++++++---
>>   include/dt-bindings/mmc/meson-gx-mmc.h        | 35 +++++++++++++++++++
>>   4 files changed, 58 insertions(+), 5 deletions(-)
>>   create mode 100644 include/dt-bindings/mmc/meson-gx-mmc.h
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Vyacheslav Bocharov

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
