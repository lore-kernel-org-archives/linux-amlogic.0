Return-Path: <SRS0=bxQo=AM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67B61C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 07:29:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3984F206A1
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2020 07:29:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ciJB6liL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=endlessm-com.20150623.gappssmtp.com header.i=@endlessm-com.20150623.gappssmtp.com header.b="mzER7w3c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3984F206A1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=endlessm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XkcPmxLDWDkdMpika/DTYO5qJptGUJwbB2uI2YGJLi0=; b=ciJB6liLmDA9mcTnxpWbXj+SpX
	W1ScL0thBeyMxm8/uAlw3F8Q8PHv7BtiZxJJLXr25PIWsTRqmFQ0bgQeiPIzcOiPdgmwbDhnrPH9a
	xQ5bHNJzlewyboby/E2D1mLMMdikUCRQEDPSbN0/FNOko1V26gMxP8ppbUSbj0ApmO+G3g6NJ44I2
	m1wQg4p/a28eb+PU2SxfPJfI+K1B0RWd3EjWvxNZRwX/K62lMsngF1OevISp2R73Q6E5HnWLBCNKm
	YBXcmizZVFdlzrHhlVwHlum9zf/Mf4ge3BeyG7fFm/lwBxFC+f4cPpwWWN3kj65rxs8xL6guYJ1Ih
	zIIJr+5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqXBU-0006m1-SC; Wed, 01 Jul 2020 07:29:32 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqXBS-0006kr-5r
 for linux-amlogic@lists.infradead.org; Wed, 01 Jul 2020 07:29:31 +0000
Received: by mail-vs1-xe30.google.com with SMTP id o15so12726483vsp.12
 for <linux-amlogic@lists.infradead.org>; Wed, 01 Jul 2020 00:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=endlessm-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rtFHuZESnBTT37t9MdqIuMDCw/zKzyu7M8SCBIHTkPo=;
 b=mzER7w3cjFbsmH1FEODfyGjI8HOb4UXQm/uMOkq/KIm8Vl+bQo8tmRziWKhsLEmuI8
 NypuAFHWxBq6sSuJDXt28rcnZhxxyKGEpSmHs9hTdJV49aLWvo4JytJnZOPbn0AWSk4k
 cFKpKZu3O8QR7C1ce2eomqHUM2wzwyvw3uXPyQpSKn7umVlmDsHMHf5lm3dK+O8VqXI+
 ZCQHRKG1k21htHNIsx7lc3gSNK8BcAVsDFGgjPuV0uxFQNj3VWPPaOvquGpaz6Rxonix
 dUwwHCCnEcttvSpFMFNyZEBRjiHehzo+OB/CjUng2qjW6hPldOZV3rknCcCAGzG3Zoph
 rlIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rtFHuZESnBTT37t9MdqIuMDCw/zKzyu7M8SCBIHTkPo=;
 b=e3vWAG+9cZv9XVJZX8GrhDlA8a+m063bRNeX2EGY3jj+utrQwfLhIw6B2by/HWM2L9
 iCmUP7XJCHPepWiBmgNLv8aPgzMAzWrdFsRYFvXU0lMqpfenRZxcibvdkxhtFFKWmz6U
 WxC2jeX1pLBbw04+aCBqMAS5P6SkGUZvJGRSz94IjUbOTuBL9Hhk6/HDLbza1M1cDjxz
 8kAeZ9wvQ3hzNn9XJe5luh17OCuWKBV98kznXvsD1FXJx2tFjCMQGFHU/mOOu3seV7wS
 wemfxq8XgGQilgUjigrW6ifB0vKlG15TvIwZaOWnFZbinNe59Awyyn6DLM918BafeQ2b
 2CPw==
X-Gm-Message-State: AOAM531ElB3exLDmH+8O1ytrCbNrYzfa5zQ/F2yTbf5C1tq1qcVi0AQt
 Rl5jYgWnlXSeI9gdRnoqwMzJVYj10/MY/fe42zazuQ==
X-Google-Smtp-Source: ABdhPJy6UI3diyHBlrPAXfzmKM2FxMDS/nZ4m5ZH21qsx4FrfaVLTJRjPNyqbs49v2arj4it2gIORZLtgHDcPFoNPLc=
X-Received: by 2002:a67:ec58:: with SMTP id z24mr12831348vso.109.1593588568344; 
 Wed, 01 Jul 2020 00:29:28 -0700 (PDT)
MIME-Version: 1.0
From: Jian-Hong Pan <jian-hong@endlessm.com>
Date: Wed, 1 Jul 2020 15:28:25 +0800
Message-ID: <CAPpJ_edjh-31dPixzvZU+mzvKfOB_g58eJ29EWak+1Ru-A83zw@mail.gmail.com>
Subject: Power-up/reset code for Mali-T820 in Amlogic S912
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_032930_231674_BAAF607B 
X-CRM114-Status: UNSURE (   3.80  )
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
Cc: linux-amlogic@lists.infradead.org,
 Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

Thanks for your information on IRC #Panfrost for Mali-T820 [1]
mentioned in the ticket [2]
If I understand correctly, that means there is still no power-up/reset
code for Mali-T820 in mainline kernel yet, right?
Is there any patch worked in progress for it?  If there is the patch,
we are willing to help to test!

[1]: https://freenode.irclog.whitequark.org/panfrost/2020-06-29#27374880
[2]: https://gitlab.freedesktop.org/mesa/mesa/-/issues/3143

Thanks,
Jian-Hong Pan

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
