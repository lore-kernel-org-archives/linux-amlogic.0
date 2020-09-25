Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7FBC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:41:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45BA220717
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kIc+SJX7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LC+DqmYh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45BA220717
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RX05v8iIP0U8bnKMGDRD1mx4Hwow+en63sb3SlBgRjA=; b=kIc+SJX7831byBt/hyf8xZDRd
	llee3qsXP/N3dzjVsoxEQw3ty1L3x6gzKv9icd4Kf2cG2mRkZOTYQzT8rGQUWZI34LX2iJHHuo+bx
	CxPjmtMv1onm7+erBqm/zNvXUizmC6K3cMvLGwJ2nlU+6pYZpm0YlDRf74C1cy3GZpPOvsegK6bs+
	4Eco/Gcfjxkx3m969XeA3xs0mTdD1V+xWjVqHQ7x6gOlfK14cckSrJnv4EmXSp1tXCw4S1vMd1ZNu
	NlgZMH2Zz8HaWOiCU83f8UxAftLRsfVp1fEYtgc3jD/Om3CGFWSl0SqXLiuOFVh+cRUyUmUSHNaoS
	47TQrM6cw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiMF-0003dG-8J; Fri, 25 Sep 2020 07:41:31 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiMA-0003az-3s; Fri, 25 Sep 2020 07:41:26 +0000
Received: by mail-ed1-x542.google.com with SMTP id t16so1502849edw.7;
 Fri, 25 Sep 2020 00:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7//MFWVMJUmvP+PVK07HNwtudt56GCSnNlal5EEKvv4=;
 b=LC+DqmYh+9LocgEa9+Hnlu9aLgcyNxm0CBK/7ktL/gsbYmMSQEIVcF6ZuT0kVDedr4
 x0S8gBHyMTfyfOiFKT40V3a1k/NBXfwQD3ktPl5K8tiNzv2CosJlDWVHzbO5XJm6U/Ky
 +S3QR3RPJZb8oWvkZpHOWbEv7sU6D7HynabDzE/66eGmWfN4y1oG2MNzKom4vJE3Mqv7
 ebcR+b/JE2QprEcjuYoSzLehhtNOL21e/Qs7NoCMORz81JhFBOkxMl8TD6wieTa37KIt
 rDnN4B9OTux7ODoej6gvJTJ6J9qGweF0JYgfdW0ThZ/qKmJGKxdC9Xidg3VNyeZXKPDU
 eKqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7//MFWVMJUmvP+PVK07HNwtudt56GCSnNlal5EEKvv4=;
 b=nn+lkw5P1ynJzgf1dvPrLkTL+o2RKRVIsDPryTCOA2erAdNNDUk8UlD6meZDwxXxke
 qZojGi1DOJOtPpFnntwTvDRwwsWydVnWtx6MxjDlhshNtxR1RuyEtmm8mngWELoWQyGw
 g2CC9uykW82yeNKqse+ZITHomPxbdIRv4jbthJONV+6PFdC62m0+pJG7HX+zaFzMDuSC
 6WaKXwb8UVjYZn+hswBG93eFH9+7mA6EldRVSPfmset5BAc380hg8dQYSo2CWZxZNT4q
 vrWGKBtMoxj6iisu1eQgOlAa1TyyFWZlmy2EtLlcXlRITAEzF6elqrX8Af7hD9pUHSZV
 5ZWw==
X-Gm-Message-State: AOAM533/sMqgAzdrBSk0NZ2pAXLUbqPvp0DJwNY/sLouYHFj6ygFli/w
 EeRblIEf2NTDcFNtxI6h0JL7d1v2G2u6D5xiCIs=
X-Google-Smtp-Source: ABdhPJwpE+VRluRfBzyvundvooNl3OzUjHscm1P2oCXo5Ps5VEJMO95gpsqAHjdBKNw24HTb7R8Ws/sLt2XgGtrMHxU=
X-Received: by 2002:a05:6402:1356:: with SMTP id
 y22mr2582094edw.110.1601019684702; 
 Fri, 25 Sep 2020 00:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-6-art@khadas.com>
In-Reply-To: <20200925033017.1790973-6-art@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Sep 2020 09:41:13 +0200
Message-ID: <CAFBinCAJ6svwiv9OM6EHz7468D9h+jW_ULiGrorgLetcODsAKQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: meson: remove reset-gpios from ethernet
 node for VIM2 meson-gxm-khadas-vim2
To: Artem Lapkin <email2tema@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_034126_185110_7AB3C36F 
X-CRM114-Status: UNSURE (   9.80  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello Artem,

On Fri, Sep 25, 2020 at 5:31 AM Artem Lapkin <email2tema@gmail.com> wrote:
>
> 1) fix down/up ethernet interface - need remove reset-gpios for ethernet node
>
> `ifconfig eth0 down && ifconfig eth0 up` # didnt works with reset-gpios
what is the problem that you observe here?
did you investigate further why resetting the PHY changes this?

the problem I see with removing the reset-gpios is that we cannot
fully reset the PHY into a defined state
some of the registers are kept with a soft-reset

> 2) add max-speed 1Gbit
my understanding is that max-speed is needed when (in this case) the
PHY advertises a higher speed than the hardware is actually capable of
(for whatever reason)
what is the problem that you have seen when max-speed was not set?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
