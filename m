Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46636C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Mar 2022 20:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMLyljh8zaIqJFzXhCTFqFHsqfZLEr+3Qv1OImYikyc=; b=GEUWvoxop795e2
	OxZbTQ1kTMv/K/0zJbxsFVjiCDix0nRnVy8uJNOJKunxQe4musf+I9jCHsv4ADPXKyuIk7OrmGZId
	EHkjtO//LpEPjAk3U2w9VvvLkKYPq+u9b4OHVB7HyGeehn3hLuiSe4zWIGUfCsoOiSP53aMIR9Ab2
	kGzRwgESiU0QLuq4XL9LMS1wcSuZ6RUjugkhnVbQmlm+WEYvZRvYzxL5X+BY5Du+LGO3m7ga26tpo
	3V015i5bgMMnN5+ePngppnJRYYpUJLzzfff1irgbO2bVXhVM1DaPlljwQx7haaoH7G0ydO2WQCX9Z
	nULAQmj4S13IqpJ1gWEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRgXf-006A4O-UX; Tue, 08 Mar 2022 20:34:47 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRgXd-006A3N-92; Tue, 08 Mar 2022 20:34:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA74E1650;
 Tue,  8 Mar 2022 12:34:43 -0800 (PST)
Received: from [10.57.41.254] (unknown [10.57.41.254])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C27093FA20;
 Tue,  8 Mar 2022 12:34:42 -0800 (PST)
Message-ID: <7eec71da-e4b4-eac3-a29c-4244c28f2875@arm.com>
Date: Tue, 8 Mar 2022 20:34:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: Missing mali regulator in Amlogic dts
Content-Language: en-GB
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Christian Hewitt <christianshewitt@gmail.com>
References: <13ecb1a6-6ae6-2815-7ff8-58f661c14b2d@gmail.com>
 <CAFBinCB700+g_fDmC5dXbNONLyESghp+RmZ+1myvhPbseXpY4A@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAFBinCB700+g_fDmC5dXbNONLyESghp+RmZ+1myvhPbseXpY4A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_123445_399772_20722F5B 
X-CRM114-Status: GOOD (  14.89  )
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

On 2022-03-08 19:29, Martin Blumenstingl wrote:
> Hi Heiner,
> 
> On Tue, Mar 8, 2022 at 7:24 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> I get following error on a  S905W-based system.
>> lima d00c0000.gpu: dev_pm_opp_set_regulators: no regulator (mali) found: -19
> This warning is harmless (see below)
> 
>> I see mali-supply in the DTS of few other vendors, but in no Amlogic DTS.
>> Is it missing, or are Amlogic SoCs different here?
> As far as I understand, on GXBB and GXL SoCs the VDDEE regulator is
> managed by the firmware (which is unfortunately closed-source).
> IIRC on the hardware side VDDEE is just another PWM regulator, just
> like with the 32-bit SoCs or with G12A (and later) SoCs.
> 
>> In the latter case supposedly drivers/gpu/drm/lima/lima_devfreq.c would
>> have to be changed to check for the optional regulator and not call
>> devm_pm_opp_set_regulators() if it's missing.
> I think I just copied the logic from panfrost
> (drivers/gpu/drm/panfrost/panfrost_devfreq.c) to lima.
> So GXM boards (using panfrost) will probably report a similar warning.
> That said, I don't know enough to judge whether your approach makes sense.

As a quality-of-life thing, it might make the most sense to refactor the 
API a bit so that it can offer a dedicated helper for setting optional 
regulators - possibly specifically a single optional regulator, since 
it's not necessarily clear how optionality should scale to a set of 
multiple items.

FWIW I do indeed see the same thing with panfrost, on an Arm Juno board 
where OPPs are completely abstracted behind the arm_scmi DVFS "clock".

Robin.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
