Return-Path: <SRS0=y/h1=BD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4DFC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2020 08:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6262068F
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Jul 2020 08:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJEzWjBy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OkMii34c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6262068F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hW+A0MAmDOlFUWDznKP9mhKeB/sysmyrPf7cyC1kV7c=; b=GJEzWjByfzG5tIsEvaokDLN2l2
	Ww15+21fxQgF62Iy89Hlb4Ax9hetZemGeskYckJqRjJTuLiseIwvxHxEgJRA/kJRPTv122C/yD2DN
	/yzQvE/lGVlk/d2dFCSOzWQKJF0X4A9Ieor01u8uYxGDEOSQT46I+TycLO+XgVCnaCmMgIYZ4I0eq
	CWuVSYOXf0q6LD93AHpVhIDv6/Fdn3Mb7g5+/l5JZtk0q6fA4ysDATL62t6/3JUevA/Blbcgqo7cw
	ltNITJYo4IPztyKLBcRdiQtNvC+Su0+GrkgYybVxY+K94i2AfULaMInjM1AgctlmCFihhEHqkCAUn
	+tBGMojw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jysfv-0003PS-AY; Fri, 24 Jul 2020 08:03:27 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jysfs-0003OD-H9
 for linux-amlogic@lists.infradead.org; Fri, 24 Jul 2020 08:03:25 +0000
Received: by mail-wm1-x343.google.com with SMTP id 184so7428981wmb.0
 for <linux-amlogic@lists.infradead.org>; Fri, 24 Jul 2020 01:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:date:message-id
 :mime-version; bh=FYiTPvCoukbaoOFTOrl0fYrPJFjGy0NfoB1Jha2RLlM=;
 b=OkMii34c/jcIVhqhBl4W39sg7WR9rU+Bb9utghfAXwYg1Tn8IX1vAcF2DjFHOSpI/p
 bN3bJkhXHhTUQ8nrwMdBsFKnalpmG62l3ZOC7Ur2VzqU4LhtcM4pooOsdzC9qHnuo4qU
 /RQYj9icMehbn7ow7MBsWvRNA+/+cWSuKNk458Fz7S0/Hr7Ik8OQmEqBT3QSj/vab96Y
 qii/vqqgY/+y2LjPZgtvRx6uZFnmWJfS7aKgvLI+VyrcErUxY366BVx7blDySXhvQSgL
 nkSl9aH4bSmsICKhmn69lSvXFZMkF0dOI5vi6HsyFPbQ6USBHO8uhYHZCppHsAnpTltp
 ZcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:date:message-id:mime-version;
 bh=FYiTPvCoukbaoOFTOrl0fYrPJFjGy0NfoB1Jha2RLlM=;
 b=hR/gC26MCCAfJ3qGNaKlVm841zeEROUJIJ9p0nkTJkINnSsHnMG2qiiC35kvnmTK/w
 cLftaH4CjkofYeP+ctiytJ/6NzA715e55GEmKYKpCXhEN/RhkgXpGSyJf2XSWDv7DiaE
 7IytKNGXNJbLrYh0qY45tRf0WmRSfJs6L7LFm/TQH3hCRDq/V1mQBmNFhsGD6UgG3I/C
 NSt1yi5vKNFvSAMZcLmK590OsMWo2owq5dw1smpqzJX+8XCXpQQaoEKkg1fXIhi/ueYs
 LqefR+nwIx/RUXr0pg6cMFOocuYUop8XfQxT/8pH+BiIB6SADfW12qkkeY7s1c+TXvzl
 DVzw==
X-Gm-Message-State: AOAM532vhrnvtkY/2fSW43IaAfcQOSX++ISLhAEWxjcbNLDZ06FOhKXR
 EKSdnWnQBgbyYetDXvcYpy5IMA==
X-Google-Smtp-Source: ABdhPJyn/pB/fCAPuj3pGYNWK8VM7JdK1qdI7EHELV4GQ+wKVN+Bgz5vRxb+6s3Q1O6mLyAAwTohpg==
X-Received: by 2002:a1c:c256:: with SMTP id s83mr5140670wmf.17.1595577802102; 
 Fri, 24 Jul 2020 01:03:22 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l1sm432897wrb.12.2020.07.24.01.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2020 01:03:21 -0700 (PDT)
References: <1356858918.38098893.1595529644632.JavaMail.zimbra@mailid.telus.net>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: "honsch\@telus.net" <a6b04393@telus.net>, linux-amlogic@lists.infradead.org
Subject: Re: GPIO Interrupts
In-reply-to: <1356858918.38098893.1595529644632.JavaMail.zimbra@mailid.telus.net>
Date: Fri, 24 Jul 2020 10:03:20 +0200
Message-ID: <1jmu3p8hmf.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200724_040324_709513_9D680E17 
X-CRM114-Status: GOOD (  11.30  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Thu 23 Jul 2020 at 20:40, honsch@telus.net <a6b04393@telus.net> wrote:

> Hi there,
> I've been working on a ODroid C2 project for a while, (meson, gxbb) and I cannot get gpio interrupts working from the devicetree.
>
> I'm trying to hook up the PPS gpio driver as well as some gpio IIO triggers.  I had it all working on a 4.x kernel a couple of years ago but on the 5.7 it's a no-go.
>
> The pinctrl-meson driver is missing the hook for gpiod_to_irq(), and the irq-meson-gpio driver is missing the activate function for platform_get_irq() to function.
>
> Has either of these paths ever been implemented or tested?  Am I missing something simple?

Yes, Look at the eth0_phy0 DT node of your odroid-c2, it does use a gpio interrupt.

> Thanks.
>
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
