Return-Path: <SRS0=QuO6=O3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE73C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Oct 2021 23:11:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B89860F22
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Oct 2021 23:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9B89860F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Vey/4h1kI0lP17tkVpB2jz4eDBfJEV5B3dT+0gXlwGk=; b=qKg
	gQH4s6yJnE84U+6bjZqSZI2GQ6xq34czRvDLQIzLbTShzc6dakFkM8m+IXwaJlEotqhWMXlMutKZL
	MTXcLCRCOgBlgO7EM+dybYZlLlNUb83uhX5Q15Yfltd2xxfCNJtf9OLuA9ZeA8gbNFAqtEPFMPoAW
	7MFuXq3xyHXkd2i8V/Pl67ZmE/BvZdsqRurBtiAntVhyM0VZyrTqqjbLoLozxkN9c8ERXukMJQR05
	jJGMhnWecrsYLPX9WfAcbpw7egSR2VWFKgEL7UbsvuqOe3sVB8xO3q4x22wu+o9jkqdqd09dVuz/8
	SFqhNHv4vL5ymJKfodlrqlQzGcSfuLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYcXu-000x2d-A6; Thu, 07 Oct 2021 23:11:26 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYcXr-000x1x-K6; Thu, 07 Oct 2021 23:11:24 +0000
Received: by mail-qk1-x72b.google.com with SMTP id x12so7693390qkf.9;
 Thu, 07 Oct 2021 16:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=qz/GvWMu4xNaZ0py+UnzwizlmTC8i/xol40n0Hfddl4=;
 b=VYoKjfZnghe7QWtefdjA6KHgMUHVwGftHAF+hX7vuLWGUPVrlAl30u/WJG4K0Q6IHl
 4MikPEHPLVT/DOWWdT6OF6X4oKmOTmGIU6p7s/CYOSu/1ici8BUyNzQ3o/U4KbGzjt3V
 5q9r6iTcGPEvNHW7I6EpCayQgSV6nVul3o1NbgGXwkbXrHU8q+Bmi/JJ9wi8glpux+QN
 emLuiMuSZ70b/ajJF7vcTuSIMNCNHkzAv00d/Z8KZcnPHjloycusAG70wDmOK4pD7JxO
 dm9NMinBiSFEF+pIyLlWMPa+izWqi5wbKoxKQEAh6LkjorSocoqPFKEIzANyd7CEQ02h
 cHHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=qz/GvWMu4xNaZ0py+UnzwizlmTC8i/xol40n0Hfddl4=;
 b=6LqXZfa63lPaCn2yp9DJnVeEkJtBnsWdXaVzU/Gt95w8dAVoUKC96jYq5RnEHRqH71
 s243L3sh2XqNifCPwH9cMngs9P/VXgOiJ1CVPC7+7e+Dn4waqV1RXfKEIqWiGCDaDQYP
 4EDnFeFpxGWb9xkVf7FupNWVmbXEHzc1zKW38xZbUALz3Fezf6K0ss2dD6JijeIwn5y9
 sOsUJMQ+6UX76OEsrXemeO+w0/yHTTpOHKnuIRAM+E1Vx0KFKxYQcOkqr9yeNG7BERJp
 riJj8iNsxm5ZLqWlEVhX0EDk1FvK2gtAgb2IzLR/hSPO5bIMdal/N+4L3mEKigylWNAh
 NNVQ==
X-Gm-Message-State: AOAM530TA715BnVD0a7ww4YP6maYp6uaV+DHQOWqRFNG/RskYXfQ4d5P
 9s1WMxCt66zayuhutcchOpjCR3E+8CDYGJASegUgEBLG172iFRJKdA==
X-Google-Smtp-Source: ABdhPJwboMclGhRaE8gg38wr+IYZBo6e3aP+cQrlOMjGfMxPeewgQiTvxfB/BWc84kFMjxTFlR68fhZnELI/8DGFDYg=
X-Received: by 2002:a37:4116:: with SMTP id o22mr88515qka.496.1633648282330;
 Thu, 07 Oct 2021 16:11:22 -0700 (PDT)
MIME-Version: 1.0
From: Ehsan Aghapour <aghapour.ehsan17@gmail.com>
Date: Fri, 8 Oct 2021 02:41:11 +0330
Message-ID: <CAHjmVnroctx00OycHrbEjU51SntkSi9MkmaR9KZnnHkSvxkBHQ@mail.gmail.com>
Subject: Enable "PMU" counters for Khadas VIM3 in the Google AOSP kernel
To: linux-amlogic@lists.infradead.org, mark.rutland@arm.com, maz@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211007_161123_689786_BE1EBAAE 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
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

Hello All,

I am working on Google AOSP kernel and require to enable PMU. PMU is
working well in Khadas kernel for both A53 and A73 cores but it is not
enabled in Google AOSP kernel 5.4. I try adding arm_pmu definition in
device tree at /arch/arm64/boot/dts/amlogic/meson-g12b.dtsi as follow:
arm_pmu {
                compatible = "arm,armv8-pmuv3";
                clusterb-enabled;
                interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
                        <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
                reg = <0x0 0xff634680 0x0 0x4>,
                        <0x0 0xff6347c0 0x0 0x04>;
                cpumasks = <0x3 0x3C>;
                /* default 10ms */
                relax-timer-ns = <10000000>;
                /* default 10000us */
                max-wait-cnt = <10000>;
        };

However in this case I only see A53 performance counters in DS5
Streamline and performance counters of A73 cores are zero yet.

Would you please help me solve the problem? (If device tree need
change or kernel config to enable pmu counters for both CPUs).


This is related kernel log:
"[    1.965309] hw perfevents: no interrupt-affinity property for
/arm_pmu, guessing.
[    1.970821] hw perfevents: enabled with armv8_pmuv3 PMU driver, 7
counters available
...
[    7.131341] ueventd: LoadWithAliases was unable to load
of:Narm_pmuT(null)Carm,armv8-pmuv3"


Best regards,
Ehsan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
