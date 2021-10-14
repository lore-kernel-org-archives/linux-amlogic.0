Return-Path: <SRS0=MFto=PC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D76AEC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 10:54:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A32D260FE8
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Oct 2021 10:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A32D260FE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n/l6T0CZ/8tDmiG5305d+EeDV95R7FawD/ECAlUQmmQ=; b=U3fhITQUCXNjTxKJ8vf7CktUxd
	fkwWBPcYSHdmcBmQlRdBxhcQs3hgu36rVmfJRgupLOjkZyVwDsC4WSrI1tyELZtkBu3pkYY4WMK12
	3tGd7y2/eIB9GD6/f2IKJw+2QKwil9oeU0Ebf7UDFRK3MDbXTIe9s7eJ8q5/CNr/5zs9LhAnG40Xz
	7ysHR7tA3Ut+Gwiq1qOX7OkCl/Fn1jrwtRGyNWGX26hY64rnFFQgH3ydKEiLMRlF9/4Dx3nrbwWum
	rQHJRZhCILT0LdQ1WD7BPcbEth6UaVav1DqwyDznisHDiAwfoOWztbriI9ujTE1Xrsdu7+V/TKMW7
	rqqJJLlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mayN5-002i4a-4e; Thu, 14 Oct 2021 10:53:59 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mayMx-002i2P-K3; Thu, 14 Oct 2021 10:53:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A004D6E;
 Thu, 14 Oct 2021 03:53:49 -0700 (PDT)
Received: from [10.57.95.157] (unknown [10.57.95.157])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A56223F66F;
 Thu, 14 Oct 2021 03:53:48 -0700 (PDT)
Subject: Re: Enable "PMU" counters for Khadas VIM3 in the Google AOSP kernel
To: Ehsan Aghapour <aghapour.ehsan17@gmail.com>,
 linux-amlogic@lists.infradead.org, mark.rutland@arm.com, maz@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <CAHjmVnroctx00OycHrbEjU51SntkSi9MkmaR9KZnnHkSvxkBHQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <83c45a95-d13b-0255-4bec-e52b2e7d5dd1@arm.com>
Date: Thu, 14 Oct 2021 11:53:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAHjmVnroctx00OycHrbEjU51SntkSi9MkmaR9KZnnHkSvxkBHQ@mail.gmail.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_035351_781556_47E16CDC 
X-CRM114-Status: GOOD (  20.43  )
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

Hi Ehsan,

On 2021-10-08 00:11, Ehsan Aghapour wrote:
> Hello All,
> 
> I am working on Google AOSP kernel and require to enable PMU. PMU is
> working well in Khadas kernel for both A53 and A73 cores but it is not
> enabled in Google AOSP kernel 5.4. I try adding arm_pmu definition in
> device tree at /arch/arm64/boot/dts/amlogic/meson-g12b.dtsi as follow:
> arm_pmu {
>                  compatible = "arm,armv8-pmuv3";
>                  clusterb-enabled;
>                  interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
>                          <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
>                  reg = <0x0 0xff634680 0x0 0x4>,
>                          <0x0 0xff6347c0 0x0 0x04>;
>                  cpumasks = <0x3 0x3C>;
>                  /* default 10ms */
>                  relax-timer-ns = <10000000>;
>                  /* default 10000us */
>                  max-wait-cnt = <10000>;
>          };

Note that pretty much none of that is valid per the PMU binding[1].

> However in this case I only see A53 performance counters in DS5
> Streamline and performance counters of A73 cores are zero yet.
> 
> Would you please help me solve the problem? (If device tree need
> change or kernel config to enable pmu counters for both CPUs).

You should have two nodes describing the A53 and A73 PMUs distinctly. If 
the interrupts are SPIs you need the appropriate property describing 
which interrupt belongs to which CPU - see [2] for an example. Note that 
if you really do only have 2 interrupts for 6 CPUs (implying maybe 
they're combined together per cluster?) then unfortunately it's never 
going to work - the upstream PMU driver does not support shared 
interrupts (it used to attempt to, but it's impractically complicated 
and gives poor-quality results at best).

Robin.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/arm/pmu.yaml
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/arm/juno.dts#n209

> This is related kernel log:
> "[    1.965309] hw perfevents: no interrupt-affinity property for
> /arm_pmu, guessing.
> [    1.970821] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
> counters available
> ...
> [    7.131341] ueventd: LoadWithAliases was unable to load
> of:Narm_pmuT(null)Carm,armv8-pmuv3"
> 
> 
> Best regards,
> Ehsan
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
