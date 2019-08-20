Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89287C3A5A0
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 00:06:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE0B2082F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 00:06:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mLYvwRPz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="wGnT9m7b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AE0B2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tb4Kd9r9WW3lukvfwW6R/1VduGa1UNIKprJPUqtIXhg=; b=mLYvwRPzxe/iL/
	wxdnW13ULyb8Dg+G69WMGkVDoX1wUyT4w/xg0koa5RX3gyBhYawJP7L+MNcqT6yLbJCAAqQg29Ax5
	1zWpU1Eo4x2hGwvr6x0vzJc7gEWYoEa4Te8xrBzYTTQKzT3GVw+A5VLiaMljNQg5mEzU/3+36MWxL
	9EAhshLJjf6o7uPo0MgMqaLAYhAVdiIYsIp4pMHUeunvShUtA8y9pjZadpgVOcZnnG1W4PCeJQ8rF
	etgBga/+4n8O6NUcO61mewz/9rStNbbYDUJ4msRB/p44xy7xiwyr+rMk5kGQ+alKfOatb4zopNC5F
	ztYEOhWVSfr32fkvdMXg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hzrfQ-0002mA-Tw; Tue, 20 Aug 2019 00:06:28 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hzrf5-0002ae-5L
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 00:06:09 +0000
Received: by mail-pl1-x643.google.com with SMTP id 4so1755837pld.10
 for <linux-amlogic@lists.infradead.org>; Mon, 19 Aug 2019 17:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=qQOXa0QSQ8+7zZiklPWl3hCCcZsK+hqnhGUid1sWCU8=;
 b=wGnT9m7b9TR7M7i9MBlpKp6tEOWrDHxiWt77j4NAxEsRfJe/itBFxWCAr7XoUItxbK
 zeP9aFQ/wUJgiuSXIObMoXTjG6xFILJo8WmbIVvsE5IjpT1xQJFvDTJZ3z9i/ICG6t8D
 uZaiGVv8m+1cLepmoqsGHfcQsLCUNHsZ9uNwR7v0MTQsEjqeYijC80kN1yZM9T3qTo6B
 rlAISdOA/qwXYZCWu+6AsxlF/iAM/+nKcaZRPxMa9Knikvh7y4CWffTaqOc4tGUB5m74
 7cmuPVfGzBzCBA3wPl/JaYvwFeFl7dIz68XgvMUL4rVTW3O35pUyCwAtKvqFTer9YMkZ
 mGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=qQOXa0QSQ8+7zZiklPWl3hCCcZsK+hqnhGUid1sWCU8=;
 b=LaQ5LZ7sKP1QHVUtxltj1MKXQ/AlbsWeY/fnF8lngArSXzOtCs5yfeykG4zYtVBSeu
 E3V+DvBut1ZwzJEUaFN2AIPXalePExCeXpllWLBi0tlvhzyou12Rg5FBBIaOGAi++6jR
 f/cFU9UTV/cr+VO+jH1YbUoBa0FJIFVg5pK2cVyIIvMEN8e6RFBv9s2V9DkvxxyNuhEd
 tR/aCBGRkDBTq6UbFPdYVocG34Xbck0DVQQEgoemM9Vyu03HPqsE6MRurVPGt8kKMvoq
 2x90Qv2O8sRscmo0eO+31/Qn9a1lwuiz5DbG9vYATzKsy2wqULgHVKudGELKtDMayYxF
 wYFA==
X-Gm-Message-State: APjAAAWX4E+IxewgYEMD+TdEP02yis1P9rEIln0hrz00gv533c+IM/wm
 MTUWK+AOfMSIu/2OpqGJYOr8gA==
X-Google-Smtp-Source: APXvYqxODMOaWdUOfaqCWz58eCyX2XpNVazF2y31NY989nA8wv08oSs0Wv5q/o/p1dAhx7h45OxnQA==
X-Received: by 2002:a17:902:6f10:: with SMTP id
 w16mr2661912plk.143.1566259565283; 
 Mon, 19 Aug 2019 17:06:05 -0700 (PDT)
Received: from localhost ([2601:602:9200:a1a5:35:cf9b:bad:702c])
 by smtp.gmail.com with ESMTPSA id e129sm6062949pfa.92.2019.08.19.17.06.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 19 Aug 2019 17:06:04 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [RFC 02/11] dt-bindings: power: amlogic,
 meson-gx-pwrc: Add SM1 bindings
In-Reply-To: <CAFBinCAT1JaK6ksD9OzCK_wEEWJdaZL2vLzGeCzVVbz9V67btQ@mail.gmail.com>
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-3-narmstrong@baylibre.com>
 <CAFBinCAT1JaK6ksD9OzCK_wEEWJdaZL2vLzGeCzVVbz9V67btQ@mail.gmail.com>
Date: Mon, 19 Aug 2019 17:05:56 -0700
Message-ID: <7h1rxgvgyj.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190819_170608_035288_DC54C8E6 
X-CRM114-Status: GOOD (  14.15  )
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
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> Hi Neil,
>
> On Mon, Jul 1, 2019 at 12:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
> [...]
>> +General Purpose Power Controller
>> +--------------------------------
>>
>> +The Amlogic SM1 SoCs embeds a General Purpose Power Controller used
>> +to control the power domain for, at least, the USB PHYs and PCIe
>> +peripherals.
> AFAIK each binding document should only describe one IP block.
> this one seems to be new / different
>
> should it get it's own file?
> also should it be a .yaml binding?

I don't think this is a new IP block.  Comparing across the various
(64-bit) SoCs, it seems to be very similar across all SoCs.

>> +
>> +Device Tree Bindings:
>> +---------------------
>> +
>> +Required properties:
>> +- compatible: should be one of the following :
>> +       - "amlogic,meson-sm1-pwrc" for the Meson SM1 SoCs
>> +- #power-domain-cells: should be 0
>> +- amlogic,hhi-sysctrl: phandle to the HHI sysctrl node
>> +
>> +Parent node should have the following properties :
>> +- compatible: "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd"
>> +- reg: base address and size of the AO system control register space.
>> +
>> +
>> +Example:
>> +-------
>> +
>> +ao_sysctrl: sys-ctrl@0 {
>> +       compatible = "amlogic,meson-gx-ao-sysctrl", "syscon", "simple-mfd";
>> +       reg =  <0x0 0x0 0x0 0x100>;
>> +
>> +       pwrc: power-controller {
>> +               compatible = "amlogic,meson-sm1-pwrc";
>> +               #power-domain-cells = <1>;
>> +               amlogic,hhi-sysctrl = <&hhi>;
>> +       };
>> +};
>
> I'm not sure that we want to mix HHI and AO power domains in one driver again

We're not mixing here. These are all EE domains.  They just have some
control registers in the AO memory region.

> back in March I asked a few questions about modelling the power
> domains and Kevin explained that we can implement them hierarchical:
> [0]
> unfortunately I didn't have the time to work on this - however, now
> that we implement a new driver: should we follow this hierarchical
> approach?

The more I look at this, I don't think we have a commpelling need to
model them hierarchically.  The main reason being is that of the 3
top-level domains I listed[0], we can only managing the EE domains in the
kernel.  It doesn't make sense to model/manage AO domains because, well,
they are always-on (AO).  The CPU domains are managed my the PSCI
firmware, and we don't/won't have any control over that.

For that reason, I think it makes the most sense to have a generic
driver that handles all the EE domains.

IMO, the SM1 driver that Neil wrote in patch 4 of this series is 80%
there.  If we generalize that little more, it can be quite easily used
for all the EE domains.

Kevin

[0] http://lists.infradead.org/pipermail/linux-amlogic/2019-March/010512.html


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
