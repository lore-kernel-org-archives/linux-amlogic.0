Return-Path: <SRS0=Pllw=CH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885F2C433E6
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 19:56:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5FF20776
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Aug 2020 19:56:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JCgUjeKA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="t5ZCDcA1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5FF20776
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DhSiVypB4qa3Wc0ce98CF0dyVQALAmpNsIWlU8RF53c=; b=JCgUjeKAn33z1zgWtg5ZPljyt
	UtWdhgVIbOHxf3eBvq6e5Kb1nZxuQQlOqjMXouRChw/N0U+BEQZIMgWeEBvA6K8UN/22Pv4ZIN/6L
	mRituIgit5y4oyg1rMVaI+I0ZQZA780UcDGUkXGTteIfu4aa0JDdQiZ1plGbMNJufDEwmwIq6MO1p
	6A710nYFQXjlBtLHxv2spUC1TdCFQz8VYBBKexAODex1e+e9LqS3vF+xicM0c7N8zOgWYBs4zYGVm
	sqPIB6crrk7R29721Qba8pfrnkkJw+qfIjbphzvRn51XHUI+K/+f0JSiOeEZ6Ej0LpDGTCQ0/+QZa
	weOTfKl4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kC6xv-0003Y2-Ib; Sat, 29 Aug 2020 19:56:43 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kC6xr-0003U3-5k; Sat, 29 Aug 2020 19:56:40 +0000
Received: by mail-ed1-x543.google.com with SMTP id ba12so2086598edb.2;
 Sat, 29 Aug 2020 12:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hS82gtSU74N51St4WJZJCm2YeYvE2fwgxXoJTtDqHK0=;
 b=t5ZCDcA1+op0bSc6ISVEnhiucQl+pLFcfA1CKUb1cw41VbjOvpuQzmPhYSHs6XYSrA
 kaKjUY1XlqMqoaqzXFfirCnKk5HgJ/GfxWOyrKy1LWr9b7s2/zynqcJ7iMsVhxfkTh/J
 blBnGZ8nBj9UKeDW9r+qxiX1bHMa7RoQ91INIuFjxjxYBMr3tWYBX6OsUsYaI1+xFkKC
 BSPxgPEjecZYV4DsJJSWEetCKVpVBv5BG86Sqag4Xk2bdXvRQnTT/UeZTvCZjQk+4Mlk
 sIA4B1Hs1P6fe0znv9CyB9aI51zmkWV6+sr2UTIS2wMdRV/HV6oQnZwmS5xU9EthA5hj
 kdBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hS82gtSU74N51St4WJZJCm2YeYvE2fwgxXoJTtDqHK0=;
 b=gkrf8Td6N8Sc6gIAFebgogQ7vL1y8bGuOMhkhMCmMR32rsPxQVGgGrS6tciMLX6xcf
 JlcMc3AfDdv0l9tDb0vmFhxe1iG5XSCdReRH87xHLIeyHi/rMPid5Lt5vEEXf7EyI1B8
 BQ928MOp7nOKKV+aVBIYMEqTjLfmkXFhxfhpzLstG9ygj8WJr5+CayIPBxva/xwNEbzL
 qWsI8CKKQRM9HStgCmy8iHseZUn74iVO05DR2erTJLIkKG5W5U0I2Kmyf/fhYtZJ9GuN
 E4eF9ArQZ9SOy6PVfu9jjcWsxsJsdD2M7fxrrNrRftwYFNmSmnMtS7ZD3v9kopRkNv5g
 mbqQ==
X-Gm-Message-State: AOAM5303fBUGOIZE4bl7fkIVIKfGUPwtMXDTSczH562tzXBF0s5srrln
 VF+BV+iL4d/FJX8MSZL10mzVMQcpI0pSDUvRuCk=
X-Google-Smtp-Source: ABdhPJykbW3aRLfm36R75esNYyv4HCTY6wsWHSwILu8lvVGZ/d7SktNUWbCljnAFCgBro8I9Z5/Okj7tNME68q85bmI=
X-Received: by 2002:aa7:cf08:: with SMTP id a8mr4583047edy.98.1598730997785;
 Sat, 29 Aug 2020 12:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200820121323.564-1-linux.amoon@gmail.com>
 <20200820121323.564-2-linux.amoon@gmail.com>
 <7hlfi9xgch.fsf@baylibre.com>
 <CANAwSgTZ23jFPAO46vRg1Dx_Bzi=4Bg6KHE0ozLQGky4p_fgKQ@mail.gmail.com>
 <CANAwSgQLnqDnuQvLv4cvaeTPeBW=H_g5F2aaNue_hb4nKLdovg@mail.gmail.com>
 <f7e6ce5f-02b0-065b-ffcf-2826159f926a@baylibre.com>
 <1j7dto3ylq.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgQ1Miu73hfdK+cgL3howpekn2xj_5qwGasQZwtQpSGj5Q@mail.gmail.com>
 <1j4koq4x38.fsf@starbuckisacylon.baylibre.com>
 <CANAwSgTWnHXRFRUrbdCph+eBxL2PNXe6Q4aTXxEU32i7dGS=dw@mail.gmail.com>
 <CANAwSgQV7_4VdGRMgJDMjPFvOS3Nabkqbf2ucE5vqo6zrhxPDw@mail.gmail.com>
In-Reply-To: <CANAwSgQV7_4VdGRMgJDMjPFvOS3Nabkqbf2ucE5vqo6zrhxPDw@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 29 Aug 2020 21:56:26 +0200
Message-ID: <CAFBinCCEJJT_kfJ4qfTEz0R7Mo3ciCGDSw_MJYi_5PyNJA6x5w@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: meson-g12b-odroid-n2: Enable RTC
 controller node
To: Anand Moon <linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_155639_300216_4F4B213F 
X-CRM114-Status: GOOD (  13.25  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Anand

(I haven't re-read all of this discussion, so apologies if something
in my reply doesn't make sense)

On Sat, Aug 29, 2020 at 6:31 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> Just want to clear my confusion on RTC INT gpio setting is not needed.
> I did not find any other example to support this changes.
> So I have enable the debug logs on rtc-pcf8563.c with this current
> patch at my end.
my understanding is that your testing procedure is to simply use your
original patch and see if rtc wake-up is working.
since GPIOAO_7 is not explicitly mentioned in your testing procedure
I'm assuming that you're not configuring it anywhere.
Kevin's concern is what happens when that GPIO is configured
incorrectly (for example by some u-boot bug, firmware issue, ...). for
example: have you tried to configure GPIOAO_7 in u-boot as output low
pin and see if rtc wake-up is still working?

In your previous replies you mentioned various pin mux settings
related to TSIN_A_DIN0 //  TDMB_FS // TDMB_SLV_FS
I don't know how those are related to the RTC
My suggestion is to look at
arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi - it has a
eth_phy_irq_pins definition and apply something similar on Odroid-N2


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
