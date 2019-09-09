Return-Path: <SRS0=Cl/A=XE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED2E0C4740A
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 11:37:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC8B218AF
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Sep 2019 11:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R9jYmkhD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="x5hZJxs3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFC8B218AF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:References:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Vi32Hw8IJZfcMIkc+9Mhwdp5hNaH3i6dNqOfWgZuebc=; b=R9jYmkhDr13Of8nVHZya+SXJMr
	MWj1QiJPSeJ46saA7iflqwYtCN9JWjPNq7ETgsDELeBIsnNOZh/KhFArXRZmrcfIwaZS2NmaD4g3n
	z9/n7urc+XxTYMpFCJsrTIEaSLX7Jmu/fwn/0TovHO3Ctn+JJPIjxNk3gxzfHdToMAcf0luhSjw1A
	fNep3f25A1n98jCe6tY59dyqnCQYfOJjLSMqVIg6Z8jaSlpCj4SKt09mQWyxahpS6sq7A7q8Ry1Cg
	NVmcHbbYtdz7ayWGLVHVEpBlLVOUzXq/fR2yIHC1s+dHPEK78ZVpz2vTjGFryzdy1Y3deDq3VeQmu
	x8/boqCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i7Hyq-00008v-AI; Mon, 09 Sep 2019 11:37:12 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i7Hyh-0008Sb-TH
 for linux-amlogic@lists.infradead.org; Mon, 09 Sep 2019 11:37:05 +0000
Received: by mail-wm1-x341.google.com with SMTP id n10so14264348wmj.0
 for <linux-amlogic@lists.infradead.org>; Mon, 09 Sep 2019 04:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:references:user-agent:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=kZoKalqZhhWKQ6GSRTA3V3x0JaPlgytes3e0+INLRaE=;
 b=x5hZJxs3ph0hf3O+XGKV6xBLU0N2rUiRCdn8ru54+LH6HncjkMPO21ZUiZRvZ+1i5x
 iQqmdXYCwvp9mRdj0ZOHvDON2id86CARAXZuw5S6B5MT9/aWelV6Zf3G+q/peM+AnZb2
 tFP5jlieJSsMcjfRlr0PgevczJM83dePs6LXk89UuQNeXsawQIHoIH5jbIG852/LSAZi
 /2Q+djzKrVvz0yyQ/eFy4UqHPjiITn6kuXKfheMpMTu0jw8GUAy1AIynlCstKd2fcN4h
 txz1c2apTYXSVxwLa3dS2xhLaI31jOElfOl0+oG+kphjJsHBcgmcHOs49nMo9nOUTxaX
 1asg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:references:user-agent:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=kZoKalqZhhWKQ6GSRTA3V3x0JaPlgytes3e0+INLRaE=;
 b=P5k8yc8vLMafnUbHnjO4Ol5bobJdj4eI9HSi9TU5yzbhFMzSBWUOfGQUvFLNLbReEd
 JmLLgt1Tt4jxCx17pw5bN3w5Ls5JEYQRTr0ExAI88vnde8qhDGlS4LhotmbGXoX8eG6G
 /Of5b5oYf9e+3upO3oa4qmuQaMC/hLhzw8x00pOur5JbiDt9cvVdxi3L7U9elXn5vu2r
 /XfMs82bF7axi+9LdnkpyZlesHPp39jLCZxqUdWNiVI3nD2MEmRbYI8yUYVfl4wzCaT0
 ixbGd4KFNuKclzcP5vKbkoLfwQUWEL5y1Ocn47A40YluJ1VihCdglIg4llmrlDXbPwT/
 goYw==
X-Gm-Message-State: APjAAAXN0zITmdh9eJQUrICtE5Ax6ZToKl0mFQAy2VWK31tZbki0qGn9
 w/KrkLKBvQTaDs+VQKQVgoYMhA==
X-Google-Smtp-Source: APXvYqxtjd0hUrVCW+o450nTVfK83QWVgMXod2fEY5tWx4EKzD3PxuBAlvts9NPWeGtD+mt4Pidq+w==
X-Received: by 2002:a1c:2ec6:: with SMTP id u189mr17945437wmu.67.1568029021609; 
 Mon, 09 Sep 2019 04:37:01 -0700 (PDT)
Received: from localhost ([148.69.85.38])
 by smtp.gmail.com with ESMTPSA id g185sm27003700wme.10.2019.09.09.04.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 04:37:01 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
X-Google-Original-From: Jerome Brunet <jbrunet@starbuckisacylon.baylibre.com>
References: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com>
 <1567667251-33466-5-git-send-email-jianxin.pan@amlogic.com>
 <CAFBinCBSmW4y-Dz7EkJMV8HOU4k6Z0G-K6T77XnVrHyubaSsdg@mail.gmail.com>
 <be032a85-b60d-f7f0-8404-b27784d809df@amlogic.com>
 <CAFBinCD7gFzOsmZCB8T1KJKVsgL7WMhoEkj3dRzyqwAnjC0CNA@mail.gmail.com>
User-agent: mu4e 1.3.1; emacs 26.2
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: add support for A1 based Amlogic AD401
In-reply-to: <CAFBinCD7gFzOsmZCB8T1KJKVsgL7WMhoEkj3dRzyqwAnjC0CNA@mail.gmail.com>
Date: Mon, 09 Sep 2019 13:36:59 +0200
Message-ID: <1jv9u1ya3o.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190909_043704_032802_348386CC 
X-CRM114-Status: GOOD (  10.88  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Tao Zeng <tao.zeng@amlogic.com>,
 Qiufang Dai <qiufang.dai@amlogic.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sat 07 Sep 2019 at 17:02, Martin Blumenstingl wrote:

> Hi Jianxin,
>
> On Fri, Sep 6, 2019 at 7:58 AM Jianxin Pan <jianxin.pan@amlogic.com> wrote:
> [...]
>> > also I'm a bit surprised to see no busses (like aobus, cbus, periphs, ...) here
>> > aren't there any busses defined in the A1 SoC implementation or are
>> > were you planning to add them later?
>> Unlike previous series,there is no Cortex-M3 AO CPU in A1, and there is no AO/EE power domain.
>> Most of the registers are on the apb_32b bus.  aobus, cbus and periphs are not used in A1.
> OK, thank you for the explanation
> since you're going to re-send the patch anyways: can you please
> include the apb_32b bus?

unless there is an 64 bits apb bus as well, I suppose 'apb' would be enough ?

> all other upstream Amlogic .dts are using the bus definitions, so that
> will make A1 consistent with the other SoCs
>
>
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
