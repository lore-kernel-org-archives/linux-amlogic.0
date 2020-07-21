Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B29CCC433E5
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 01:39:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FDB12077D
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 01:39:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u4Qk8g+Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMBHYcII"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FDB12077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z0rB5SwJLrZ0t/nyvyLGZjcCW+NUXm3WzJhQTmMCLIU=; b=u4Qk8g+QfmyJYuuocF3A+3V8X
	gPc0vVZBMQjKRdvMoEN/cqbrquZfIm7MDPVQeGEPhO+7CcaywarIjQa2G7DyVuauogYhzdIN3InE4
	Ld5524480wveErVao7o0XfZF0PCOb+7cobq21sk9c8mmkfxlFsnmvqCm19D8aR/b//4MLQM/Z0vYf
	PjgYVlJtgmBOe9LubLFsSFeC2ZvpqdpMPqx1WPBP5R1b0BlzfNYnZAOJL7mB6sfR24afNZ1p4t/o3
	I7AVCkmp661MdwpXpmYymVp1tau52OPaRglAZ5Z74o1GBsUcn70NsW4vjh0+UZBtaMi6rQ/Vw1BXN
	TjS020piQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxhFg-0004nP-SU; Tue, 21 Jul 2020 01:39:28 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxhFc-0004m8-TT; Tue, 21 Jul 2020 01:39:25 +0000
Received: by mail-wm1-x344.google.com with SMTP id w3so1252160wmi.4;
 Mon, 20 Jul 2020 18:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Nrug+AWSzjZGrBINnJb7jz7fHx/HXVjSPsVyZ+aIDeo=;
 b=RMBHYcII3aAfMtjYSyy48tK+c1/Q/zQkwkMYYl6or0ZK12+W75rcPJDNBupa/yyNyU
 2A6PieyzOXLHlZF54nE+H+5XjALkG3sFaOXW3kagnM8kxto3jv3AFJ7mkmk67pfVqHj6
 mRyLT/wGHzIH26vwiZNlzp2gMgiJEnnjtd+MONCTj8Pi/+dw2yIsIjwd6om1i2v8E74I
 dTFPO/QsXpURRPqKvF87bxcZzUclFKimx0SqaO27BKW8Cm8D9gwUjn5FSt62gsUSYp4Z
 UscD5srtkjOsI7BU2TmSI2d4HP5s6/H5QAxL56S9eaQ8tMjTUje8TqBf0e0DW5SD5gYR
 VnCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Nrug+AWSzjZGrBINnJb7jz7fHx/HXVjSPsVyZ+aIDeo=;
 b=gLlcUrjIj82gxduq4JZtntQIP2cYkclU5t9i6ZiR/w1gqyZEZmuMAZrhTPXKtZ0Vum
 HTKJ+4VpPu4WHfjm8iZ/6dEDKVvBOWW40eniP5T5oPCfXXC5biutrrTAka2VPATh+LwE
 WvX/wTCDy5JZpd5WeDwZoh4ljYPXB7EgF/rEUjihjZUq8TKXIWuo7iWfB3YjMAw/ocjX
 vvDBKGsblY2sH1JLVhpxRJEmTEPO+YiNFLWmOXzGbIZ5Sz6ZyolkircHN49eBZ2MO3eC
 n7F6pV4pbOt/P2EKdeePj1TlldHvnhguC/lIi59DwHCQDQyJG1ZA+qrWrLo/Ed6nwK1j
 dXMQ==
X-Gm-Message-State: AOAM531uoEqCHa4jNp4XgA0av+EPuvaG2DmQYwClVMYoBOY47frfEIMK
 M9kLbGihgpcYAWuEgDjLCQA=
X-Google-Smtp-Source: ABdhPJxEWy8mHaI1ZwdniVdsbDPS6hEK7Mlb0/0gXb3tSP5J/MILa3B1gJ74K7YR5WVFNdJeUDADJA==
X-Received: by 2002:a1c:ba0b:: with SMTP id k11mr1677645wmf.140.1595295562280; 
 Mon, 20 Jul 2020 18:39:22 -0700 (PDT)
Received: from [172.16.20.20] ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id z10sm35619627wrm.21.2020.07.20.18.39.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Jul 2020 18:39:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: Re: [PATCH] arm64: dts: meson: misc fixups for w400 dtsi
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <7hd04pakqm.fsf@baylibre.com>
Date: Tue, 21 Jul 2020 05:39:18 +0400
Message-Id: <2A03FA86-D190-4DD1-95EE-AA0E5618DACE@gmail.com>
References: <20200718052950.3707-1-christianshewitt@gmail.com>
 <7hd04pakqm.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
X-Mailer: Apple Mail (2.3445.104.14)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_213924_971214_6AE3D496 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


> On 21 Jul 2020, at 2:24 am, Kevin Hilman <khilman@baylibre.com> wrote:
> 
> Christian Hewitt <christianshewitt@gmail.com> writes:
> 
>> Current devices using the W400 dtsi show mmc tuning errors:
>> 
>> [12483.917391] mmc0: tuning execution failed: -5
>> [30535.551221] mmc0: tuning execution failed: -5
>> [35359.953671] mmc0: tuning execution failed: -5
>> [35561.875332] mmc0: tuning execution failed: -5
>> [61733.348709] mmc0: tuning execution failed: -5
>> 
>> Removing "sd-uhs-sdr50" from the SDIO node prevents this. We also add
>> keep-power-in-suspend to the SDIO node and fix an indentation.
>> 
>> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> 
> This could use a Fixes tag so it can be backported to stable
> 
> Kevin

Okay, I will send v2 with a fixes tag.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
