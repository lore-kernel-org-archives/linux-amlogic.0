Return-Path: <SRS0=UIdE=WR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2206C3A59E
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 21:30:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B651B2332A
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Aug 2019 21:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t8w9imAF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="iMJnFRHD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B651B2332A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HODFjCCfS3ANUJOAGbz/KijumngAPa08iUKIeGnaNIM=; b=t8w9imAFytxBOX
	VK/zRes107lxcVeDqP7klA634OsAB71w2JWnN/745X2oyAAbaFxS2uR+4VRa+IO+iDdxDWz9v3LOX
	3L0vlkt65eBEqLL/cXLs7pPuAy60g+i2p/+RFwJgqr+Hd2w6ngzb/7nKNlkoWBJh0n1MkRmPfalP2
	b0ajZyUEg2LlD7Sac0XBh1PJsLjmVxfb0uDj9aje+o+OC539nhZ64ftB4kGqGGmz1ptd63TXMHJYW
	9aaEGYsNUnHXrzgDWtCUHFDSrjRoQLcsVRY9QDGufKQBLW45WisQvxQ2TfiaE51uEoWIJlG0U2jWG
	SA1qYRY3IRodhOpqUdpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0YBZ-0005p6-FR; Wed, 21 Aug 2019 21:30:29 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0YBP-0005gk-Fe
 for linux-amlogic@lists.infradead.org; Wed, 21 Aug 2019 21:30:21 +0000
Received: by mail-pg1-x544.google.com with SMTP id m3so2071843pgv.13
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Aug 2019 14:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JamKzvdT5n0JRFMyDQS1FT/k6bVQThWvvzDjprEJ6CY=;
 b=iMJnFRHDKKfY2TVix6Kg7QyOZkDIj5MTwOzwwrn9Yh0Quv6TKjoaBAZkhZHd1kOHee
 LXYDawRhFHEgBNVxflMeMS/vKJFbK02GEskP/b6ppziRxRi71zF0RENhjAVb7LQCWOtV
 CHhrElk4aIvJMy7kf/RDsJ3S7caNHIVvHYd+xe2R1sU6oYZpkGVwZCAfBXtXXFTrXwvg
 AVFLU7xkUCQi9Uk9PR83GQaRgRbRYRgV+B9KFifQie13IcraLry4MNr3OCU0avrjxreC
 K2PcHaPYxhKddpS94bCbVgYQ2dv1df8KAJmlVi0wYxdGfp48vGlzZyybK6pyDqhS7qmA
 HZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JamKzvdT5n0JRFMyDQS1FT/k6bVQThWvvzDjprEJ6CY=;
 b=eET591Oo7IgWHjv5UUXRQaBt0seb6FbkZ+lFWtpKmIXt++/ai+i9VtvqUMDj76FWBr
 /Fux+aKAUVwE6mWTsDsXf1S2XyWfNRUjT0zu9sY5k0J0hLEW0KiTnbD1i5HcrfvCcfJx
 KosaltUkL/v54dfqAJJXoIBIETzBWoH2+fYTpU3ngz8fOKTIrUbQEwpW4vXsW2sc4Z2R
 /Q6j9tleLGASGzkfg+c9L48FaEwOx5YcreBBesaSqZRqQJGwsH6Zz7OtjDQFh9ZY46xX
 iUUYSBIAx83A2lbDH/mGFHCoSSOpKeyZXIXBIukkqUWlpePIr3Tj1T0NOHWnAWXgFnca
 Y3zg==
X-Gm-Message-State: APjAAAW7Aa1xKreEStGUlPVtqU4F6IW9FkRpIQleH3BGV3l+GO6N8H4I
 4u92w+qY+4d6Bb6PV9k53Tehew==
X-Google-Smtp-Source: APXvYqxJgS3AGYB65QX2eSGKbfHabg/mZAuaZCmr2wu/yKCdqUmPctixFz2Q12im4wy2hl85+1FtNA==
X-Received: by 2002:a63:5a4d:: with SMTP id k13mr30104074pgm.174.1566423018409; 
 Wed, 21 Aug 2019 14:30:18 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id a128sm24706235pfb.185.2019.08.21.14.30.17
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 21 Aug 2019 14:30:17 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Guillaume La Roque <glaroque@baylibre.com>, daniel.lezcano@linaro.org
Subject: Re: [PATCH v3 0/6] Add support of New Amlogic temperature sensor for
 G12 SoCs
In-Reply-To: <7hd0hd3mme.fsf@baylibre.com>
References: <20190806130506.8753-1-glaroque@baylibre.com>
 <7hd0hd3mme.fsf@baylibre.com>
Date: Wed, 21 Aug 2019 14:30:17 -0700
Message-ID: <7himqq9pg6.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190821_143019_530095_65CC676E 
X-CRM114-Status: GOOD (  13.17  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Guillaume La Roque <glaroque@baylibre.com> writes:
>
>> This patchs series add support of New Amlogic temperature sensor and minimal
>> thermal zone for SEI510 and ODROID-N2 boards.
>>
>> First implementation was doing on IIO[1] but after comments i move on thermal framework.
>> Formulas and calibration values come from amlogic.
>>
>> Changes since v2:
>>   - fix yaml documention 
>>   - remove unneeded status variable for temperature-sensor node
>>   - rework driver after Martin review
>>   - add some information in commit message
>>
>> Changes since v1:
>>   - fix enum vs const in documentation
>>   - fix error with thermal-sensor-cells value set to 1 instead of 0
>>   - add some dependencies needed to add cooling-maps
>>
>> Dependencies :
>> - patch 3,4 & 5: depends on Neil's patch and series :
>>               - missing dwc2 phy-names[2]
>>               - patchsets to add DVFS on G12a[3] which have deps on [4] and [5]
>>
>> [1] https://lore.kernel.org/linux-amlogic/20190604144714.2009-1-glaroque@baylibre.com/
>> [2] https://lore.kernel.org/linux-amlogic/20190625123647.26117-1-narmstrong@baylibre.com/
>> [3] https://lore.kernel.org/linux-amlogic/20190729132622.7566-1-narmstrong@baylibre.com/
>> [4] https://lore.kernel.org/linux-amlogic/20190731084019.8451-5-narmstrong@baylibre.com/
>> [5] https://lore.kernel.org/linux-amlogic/20190729132622.7566-3-narmstrong@baylibre.com/
>
> Thank you for the detailed list of dependencies!  Much appreciated.
>
> With all the deps, I tested this on sei510 and odroid-n2, and basic
> functionality seems to work.
>
> As discussed off-list: it would be nice to have an example of how
> cpufreq could be used as a cooling device for hot temperatures.  The
> vendor kernel has some trip points that could be included as examples,
> or even included as extra patches.
>
> Also the driver patch is missing the two main thermal maintainers, so
> please resend at least the driver and bindings including them.

Forgot to add...

Tested-by: Kevin Hilman <khilman@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
