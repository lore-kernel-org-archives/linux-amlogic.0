Return-Path: <SRS0=AlqK=2A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940A8C43603
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:41:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 665972073B
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Dec 2019 20:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yfh/NLDX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="bvvbWxH6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 665972073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bra/5hBeqouRxVC8dCj6fPBxtEQNDYvS7paiAeOwiKM=; b=Yfh/NLDX47P5gM
	8gU8uMY5RX2cpwiaaStW93eKZ+iDqR+yHKCY9HXtVJLZjeXsTCfyGXT1cxFdsAt4eT/XQ9dopgurP
	XjEODnFLUj0CyM8/lzWSjX10qNslABuUhl/wotW7FSfK2+1Cgv2D/hQ8U30dEWMV1ibWRV2CvLGiE
	Bxo/cx73GD3t48MrnG1o3v7tSJrzFmW3q1vP71alQjFcAnuy+M7deMd6aw5E19JAMdjjNxcVwfphs
	sowKVdjyP5cnulPekOSDHxUB7T5mDH02oGvNM4SHMGtR/T4D4NWyY3t/+bQGKhOoKCTSWZJonYAKx
	91tyog126QDM48aJygig==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iemKB-0007Go-55; Tue, 10 Dec 2019 20:41:39 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iemK8-0007Fy-Pe; Tue, 10 Dec 2019 20:41:38 +0000
Received: by mail-ot1-x344.google.com with SMTP id d17so16820800otc.0;
 Tue, 10 Dec 2019 12:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M6hdh3Yasu69i9dWWMioWcRGOBc9Yi+2xpwtcGer3X8=;
 b=bvvbWxH6cM1+GBdK66ZeOEclRZ+hs5dAr5g57Qtv+PidTPCCFpmLBzNDOyubU/tZtU
 pMp1R/p4kq7XXYVPTyouGb6uKLph86sAvsJhS2blwcY45LMVyF7NXREAUwiYDsa+MLLI
 fCgSGUolyjBRMO3sT67pWEcsU/LctDd/qNv1rLmIAiR+G3JRDPb8yi1XjOMIrN1V0eFK
 CQ9zSthXI/LYvo8KxfQR2zq14AbEJ96UR0MdbuEVrWQtxtgvVaPfX4EKMTBfQDvXOAzi
 1OArGY1aso91OqOqVrquwLr2p3nr+mXp1Hz0J6rOtgBR937RVdzBLhRfq1LGQv+PoRG6
 tbHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M6hdh3Yasu69i9dWWMioWcRGOBc9Yi+2xpwtcGer3X8=;
 b=YPFL+Oqisjw0x80P3J6vDcEJMLhqnPdVNVuph69lZMTnr4Uleyb4Vr/3yy2xX7iJ1R
 NgMrGi4Y7M5wa8LAhEFChVstZzdH2d1F0Nb6Yw75mk/fyqjo9t5Dp4v7THrMl3jOT+Af
 3Kek2WVHJWeU9A/njX1pl8VLE7pMfVs4BSi9+r00re4JNatBW80Nh89e+n92fwjg0GL5
 rXgst3iNb9mynuKzh2xHwmfjBs4cZhP15Kcp0EOE5lxHGLevGNl4dkekpkLPPCQSn7i9
 tsEhzfi9qOQUnO2ONETp9cDcCIXvSojrDd5nBwn8lav4qVwb4rygSmWKD2JTfKKWZnZY
 rTtQ==
X-Gm-Message-State: APjAAAUlv8QnkxgLrlnrCr+iNpRcg/cWVJaMFTTTWCc+FdjhRA3aaNh5
 kcJCMK3shtEioWXDuHri1XZfHk080fmMx8rlKlo=
X-Google-Smtp-Source: APXvYqz0tm1N8+ubqYR/OOBcKGeaKmNmUTLZ3Lsf+UNuSurmjY+qD+u50hP0NL/44rNmRakKxqujcYRZann1YBKO4IM=
X-Received: by 2002:a9d:588d:: with SMTP id x13mr26062357otg.6.1576010494766; 
 Tue, 10 Dec 2019 12:41:34 -0800 (PST)
MIME-Version: 1.0
References: <20191210203149.7115-1-tiny.windzz@gmail.com>
 <20191210203149.7115-4-tiny.windzz@gmail.com>
In-Reply-To: <20191210203149.7115-4-tiny.windzz@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 10 Dec 2019 21:41:23 +0100
Message-ID: <CAFBinCDOoe2-mYVf_eD6BAcFyc7GvHH_Sk8te_QKeWON8QUWpg@mail.gmail.com>
Subject: Re: [PATCH 3/5] nvmem: meson-mx-efuse: convert to
 devm_platform_ioremap_resource
To: Yangtao Li <tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_124136_858501_82F9DE5C 
X-CRM114-Status: UNSURE (   6.00  )
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
Cc: treding@nvidia.com, mans@mansr.com, rafael@kernel.org,
 gregkh@linuxfoundation.org, suzuki.poulose@arm.com,
 linux-kernel@vger.kernel.org, mripard@kernel.org, vz@mleia.com,
 bgolaszewski@baylibre.com, wens@csie.org, srinivas.kandagatla@linaro.org,
 khilman@baylibre.com, mchehab+samsung@kernel.org,
 linux-amlogic@lists.infradead.org, tglx@linutronix.de,
 andriy.shevchenko@linux.intel.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 10, 2019 at 9:33 PM Yangtao Li <tiny.windzz@gmail.com> wrote:
>
> Use devm_platform_ioremap_resource() to simplify code.
>
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

thank you for taking care of this!


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
