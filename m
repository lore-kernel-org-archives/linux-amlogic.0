Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B91C43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:21:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E4E72133F
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 00:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jrpWZhJ3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GSnRMTVE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E4E72133F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AQj28KFyahry4sw3FG+e4uUIke4YQnnWOh5fDgRQOlI=; b=jrpWZhJ3vipOkE
	SF9IpvXJsseYYlehfIKwonMk7RaMBBoIgaPKPKozbnPFmFGIeVDem8zbAReh55vrWEoc3uBCVL5uu
	VPb1/PEmRV9Vk8ccLtyibJe+rLm4eTWj74XEiywU1Nid5gMKNtG2TU6sQOEzoqmNJd9wl+8g8mJr4
	RC4x+lmnH20xwEh7s5lMbLIINUESACo+rrNhh8a7iVbyETfROosFkeEpuI71mF87wKv8Ld7K8gSkD
	HrPFEx979cTxr5xHTsgha/bcS3hGylwA+dIAt4UbuzRpxP0edLVazo/6dpPr1hB2sMBHcMA7GaqWQ
	xHgCofW3tEkfD/ZGBvhg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ghkZb-0001sv-WB; Fri, 11 Jan 2019 00:21:20 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ghkZY-0001sD-5C
 for linux-amlogic@lists.infradead.org; Fri, 11 Jan 2019 00:21:17 +0000
Received: by mail-pl1-x644.google.com with SMTP id w4so5920621plz.1
 for <linux-amlogic@lists.infradead.org>; Thu, 10 Jan 2019 16:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=U5ied4IpUVo0pHUmsHibr0IXWO/yNrasETY2g43N018=;
 b=GSnRMTVEQIOAn5/ac55f+bPtbB0vLJc5Q5RLD2gZ1eVov4WuW4XdmZRXjYkL3uBITz
 MBP5SSQbJO42xGViJbJRRbBH2wlHpRyFsGvVCzVlvMJYys0XgHHHVDi6PNyxX/9iDIzX
 pJWDvlAJ1GHRwErhfE6PEEPJSFJDzjj99SvoS7wTNgV57GuloN5FzV60L9ztphtjjtQx
 rv9/SjAw3sQGbB6lnIS0fdGnYJ6coQp0dEf+wUzVxoOFbEwJ5yjhpsUprLTNkp8oh47W
 DVM8Z8iSC9wu7lJg2AsBg1D4P4yfinK8zM8i/KaX3Z5ckU9xeUD7iwBs++LicSZEAWYp
 lcEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=U5ied4IpUVo0pHUmsHibr0IXWO/yNrasETY2g43N018=;
 b=YSvN63q+4qEuAE2MMC0Yk9M6ap0NSGebJXntqzvHa0b8fX9tNTRHt/qSoS2So7Tas0
 3Ga0wMT3Q3jVP+AazOFbk1ZtnCEe0bqM/KC/FxzMeUm91Wu9cyXrTYyiLT//U2UgYBuE
 u7MMgKTqOQfpweFh19TNFgrdjLQ/78vL/FOWhWnpC+TRWvDBnYK64jiBWfXSmLVtIzn0
 60Ks1VNZXuMcBGqo2aApKKSVJLXu3we6XIP2j/E4CKiDk/JqkFJvoQccsVC1rb9oXf3e
 YQSRKssHf46SZ1rMgsQ+4yRtVrNGQk9plsKP+k9kuBf4+2KO/gzeG2xPX4YvsvQd0tTH
 0ilg==
X-Gm-Message-State: AJcUuke5GsbkGRp4NTa8WkuFS4CGG1LqTfleX++vf/pgVJB/+dZkRqJq
 XuG6xbyKiIsYSgt8CELQ8jfgDg==
X-Google-Smtp-Source: ALg8bN5uPOktJrpj7ce1wLi9pSB5u80P34ytQ6EYAHFCV2NXGoFCHVzYDGrv5Dvdnbht11jwx/hcHw==
X-Received: by 2002:a17:902:8ec8:: with SMTP id
 x8mr12542185plo.210.1547166075478; 
 Thu, 10 Jan 2019 16:21:15 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 b68sm115136686pfg.160.2019.01.10.16.21.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 10 Jan 2019 16:21:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Carlo Caione <ccaione@baylibre.com>
Subject: Re: [PATCH v2 2/2] arm: dts: meson: Fix IRQ trigger type for macirq
In-Reply-To: <CAFBinCAbOdPnsH4TLLBmMnR5tS+jHfHagWudVLjaH6X89vtgDQ@mail.gmail.com>
References: <20181207105231.25593-1-ccaione@baylibre.com>
 <20181207105231.25593-3-ccaione@baylibre.com>
 <CAFBinCAbOdPnsH4TLLBmMnR5tS+jHfHagWudVLjaH6X89vtgDQ@mail.gmail.com>
Date: Thu, 10 Jan 2019 16:21:14 -0800
Message-ID: <7hpnt4qc1x.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190110_162116_197204_E536D6B2 
X-CRM114-Status: GOOD (  13.72  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 ingrassia@epigenesys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Carlo,
>
> On Fri, Dec 7, 2018 at 11:52 AM Carlo Caione <ccaione@baylibre.com> wrote:
>>
>> A long running stress test on a custom board shipping an AXG SoCs and a
>> Realtek RTL8211F PHY revealed that after a few hours the connection
>> speed would drop drastically, from ~1000Mbps to ~3Mbps. At the same time
>> the 'macirq' (eth0) IRQ would stop being triggered at all and as
>> consequence the GMAC IRQs never ACKed.
>>
>> After a painful investigation the problem seemed to be due to a wrong
>> defined IRQ type for the GMAC IRQ that should be LEVEL_HIGH instead of
>> EDGE_RISING.
>>
>> The change in the macirq IRQ type also solved another long standing
>> issue affecting this SoC/PHY where EEE was causing the network
>> connection to die after stressing it with iperf3 (even though much
>> sooner). It's now possible to remove the 'eee-broken-1000t' quirk as
>> well.
> (disclaimer: I was not able to reproduce this bug without your
> patches, but I didn't run iperf3 for more than a couple of minutes)
> I did test your patch with and without my "Meson8b RGMII Ethernet pin
> cleanup" from [0] which shows that there's another performance related
> problem:
> 1) before and after your patch receive speeds were fine (above
> 700Mbit/s and no transmit errors / retries in iperf3) but the transmit
> speed was bad (<200Mbit/s and >1500 retries in perf3)
> 2) transmit errors (when Odroid-C1 is sending) are not occurring
> anymore after my patch from [0]
>
> thus I believe your patch is fine, especially since we already have
> IRQ_TYPE_LEVEL_HIGH for the dwc2 controllers
>
>> Fixes: 9c15795a4f96 ("ARM: dts: meson8b-odroidc1: ethernet support")
>> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> I wonder if Kevin can send this as a fix for v4.20

Queued as a fix for v5.0-rc

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
