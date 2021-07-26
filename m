Return-Path: <SRS0=QpTa=MS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D607EC4338F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:06:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A75F603E9
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Jul 2021 08:06:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A75F603E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6ty9DtczYOavkT1VYCyRzxOtKAncMB4ncK/QH5IjRfI=; b=b5wZ6UeR5zxBsx2adncLC9nspc
	GObK6Z8QxhHSPWFNnGI+TQNrlHhZK/zkGsyEbttTWYiz/eDdwDpH2LAvubIXLS50vdU2WBhZzeJD3
	fmdhmlyjwipicT/RuZmByuRrsicCdV4iwZgDZKglriVnFGPmibXlVJ/ZZal41j6HiSMGivIr2XRpJ
	1xD1Sot781ebdCeeAM8PMGVwLDbrx7RILvRQEAnsm8AOac4iGCA0A1DmucYI8T8o5dOpRRs+2t1bw
	FRy/ggUoKHETdfFoBjnF+K1TzIRo9TDRbNSR4RMJ5I3dBLIwnJ5E7I2uTwrE3mmqklKstDaNRUMji
	+xHTajgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7vcl-00A5Qa-QZ; Mon, 26 Jul 2021 08:06:07 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7vcj-00A5PQ-76
 for linux-amlogic@lists.infradead.org; Mon, 26 Jul 2021 08:06:06 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e2so9955031wrq.6
 for <linux-amlogic@lists.infradead.org>; Mon, 26 Jul 2021 01:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HKcRDyROSUfmhioHNtTU2vbTLt65NepdrupybIKsatE=;
 b=QWtDTo3PH9OIra/tbq5G0k8/bcuONoStvRoeIx6dl2igAeFjuivveZV9iQHyxdCIil
 Yn87o5dx66AOK8DjSJLRYGv8kl/TNDv31M+u2yAeTFX9NTjmAKAlFBdDTA9MsgYVivc9
 IZ6qUhkKEbF9U/2cba3Y5ToX/bdVSJMXaDes/IWeeJ7pgqxPqERJ7P38cZDcbFAXQKkT
 TSVeBIm5MXTamyxlcDLOZd9NFPtfoxJ7wGwLaKEGKTxd0cOagvDZ28ld3FOrBrJzGRsR
 Mzw1gb4HnK0AlAop1zvF3lalWxQrJFgZvRDXpI/CfBxGMV3gFyP6sHADkL7mOhyr+TRS
 1ufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=HKcRDyROSUfmhioHNtTU2vbTLt65NepdrupybIKsatE=;
 b=C/XwRHuK0sOVhSbKfgWtXy59woAyQjLwE4hovol99WYRZRfWvRFPc2GohiWb9bBwrQ
 xP8sKrqt8zS9wBu5noIwFzeUJxBFSUg6HFqMeS4NeovUMLQwZmFeMq5Cb1UGJYT8jt/f
 GG7piCjIHC2UHL8mIRu6IM+SsfktKsXU/eOYCMR6hHfFFyOxnr4yZ+i554p6tjTuFxo0
 b0yq1UPIKTmXjznbPPbNecqaRUYPzJDNz6r1erNFeF6WsvzGGEH1JG2yplYDlQ9a8Xwy
 sDcN2itpHxsBgLSuuHyElbWDMrtxwAR0D5h5MXoZsSkisqQ9dIYK7iPYG/qbwK4B2o8m
 UrMQ==
X-Gm-Message-State: AOAM533zUgldtOMF/X8OHQTrjDo6LuufNKFTDpYPadRUd8OChp3mis2I
 StJd6ADB6I1OmXktdzsXVRgaIw==
X-Google-Smtp-Source: ABdhPJwi40vXErY3FPEwP7VEauGhUJFLjrSL3ftinSAJ2+sp3LZXXwk1xmJgrYPBvmvoSrhtCou9xQ==
X-Received: by 2002:adf:db85:: with SMTP id u5mr17884676wri.167.1627286763668; 
 Mon, 26 Jul 2021 01:06:03 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:32b6:aa71:d2df:4f1d?
 ([2001:861:44c0:66c0:32b6:aa71:d2df:4f1d])
 by smtp.gmail.com with ESMTPSA id d10sm41243990wro.43.2021.07.26.01.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jul 2021 01:06:03 -0700 (PDT)
Subject: Re: [PATCHv2 1/3] ARM: dts: meson8b: odroidc1: Fix the pwm regulator
 supply properties
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 devicetree@vger.kernel.org
References: <20210705112358.3554-1-linux.amoon@gmail.com>
 <20210705112358.3554-2-linux.amoon@gmail.com>
 <CAFBinCDaiu-tuo654_UTmxb0yeqQ8YqxCC7oVxq1EU4AmQRQdA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <f07da67e-3d67-85a5-699d-d528212a867f@baylibre.com>
Date: Mon, 26 Jul 2021 10:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCDaiu-tuo654_UTmxb0yeqQ8YqxCC7oVxq1EU4AmQRQdA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_010605_288696_B2F84D4A 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

On 08/07/2021 14:58, Martin Blumenstingl wrote:
> On Mon, Jul 5, 2021 at 1:25 PM Anand Moon <linux.amoon@gmail.com> wrote:
>>
>> After enabling CONFIG_REGULATOR_DEBUG=y we observer below debug logs.
> I think there's a typo here: observer -> observe
> maybe Kevin or Neil can fix this up (in this and the following two
> patches) while applying the patch so you don't have to re-spin a v3

Fixed while applying !

> 
>> Changes help link VCCK and VDDEE pwm regulator to 5V regulator supply
>> instead of dummy regulator.
>>
>> [    7.117140] pwm-regulator regulator-vcck: Looking up pwm-supply from device tree
>> [    7.117153] pwm-regulator regulator-vcck: Looking up pwm-supply property in node /regulator-vcck failed
>> [    7.117184] VCCK: supplied by regulator-dummy
>> [    7.117194] regulator-dummy: could not add device link regulator.8: -ENOENT
>> [    7.117266] VCCK: 860 <--> 1140 mV at 986 mV, enabled
>> [    7.118498] VDDEE: will resolve supply early: pwm
>> [    7.118515] pwm-regulator regulator-vddee: Looking up pwm-supply from device tree
>> [    7.118526] pwm-regulator regulator-vddee: Looking up pwm-supply property in node /regulator-vddee failed
>> [    7.118553] VDDEE: supplied by regulator-dummy
>> [    7.118563] regulator-dummy: could not add device link regulator.9: -ENOENT
>>
>> Fixes: 524d96083b66 ("ARM: dts: meson8b: odroidc1: add the CPU voltage regulator")
>> Fixes: 8bdf38be712d ("ARM: dts: meson8b: odroidc1: add the VDDEE regulator")
>>
>> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
