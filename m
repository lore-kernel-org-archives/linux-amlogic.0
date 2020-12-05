Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51363C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 12:01:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F96723102
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 12:01:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F96723102
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZIY6qiaDYFhgn2LKqFpGnpljfqRzWvJqs2T3FUCe3Hk=; b=VRy96HY9/Ptbkou+/vAJvT/RZ
	C3ZoKktnIxmG9w4l4bLsfJ8v2Y1JOkdCoSa7rbNwKFAoRHdDt9KrOAV/aPacwmmrAZVysfGUOu9t5
	tqc8yvxRUIf3/w+yHyBETMbBiG3lwh9m3OlTek1y6+cRVpG36l0PVZSFtiJFdWa9hRUjcBY7leufJ
	6tc4hQ4uHOd/VP29MtuyzyMLIoJ0s3pdGP3A3k4Haf9gT9HaFBiAQ296v9uUYA+7eKH31s1XXevy+
	itGi9G0aCC5RYrj/lld6aV6LRWFUwp22R0VfwQoAhIJxVt83a2V+sw63+R6g6q0vcEAy/VzZq8wtV
	Vp7P7+Oxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klWFN-0000B4-Tb; Sat, 05 Dec 2020 12:01:05 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klWF5-0008TX-4s; Sat, 05 Dec 2020 12:00:48 +0000
Received: by mail-ej1-x644.google.com with SMTP id d17so12572429ejy.9;
 Sat, 05 Dec 2020 04:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EWSMmsvdVxKuhpolz3WcT+qZQ+fgvXEXAvPTAffLCug=;
 b=JGTwmA59uEWRI9bUaJeGOFF+xIu95XoNUPVI/CLOTHAYfP1PlV2PcstarnBgaw+uqq
 0BFRwsas+fer8FycAZykr/aPOLgwXk7o7EPyl/MIzK79L6h2rzmK9bu38Fz58FbUO/fp
 p+PyeH8eEewFfQST55Vi/wcHH7WVCRb4x7Xnik4gZED+pVgjKAzjCuy6w6s8nqAYihcU
 bHZrdqeJYRmqINi+tf947SaiT7mW9PZO5wbtZer9kbznpSNZ0M/QGmMZwjaUd+/BFpuF
 ckwwqgGRs8XFHrp0/kHZy4Su22zDpzBDzs0QKqAmHPnxQcsfJ65xNKtHhhnsWVzI4KuR
 dWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EWSMmsvdVxKuhpolz3WcT+qZQ+fgvXEXAvPTAffLCug=;
 b=pO/ZCR7k36O3lAvvH3UBzvo6CXaQnBO0155gSJ2Gdw7cliaNfgWgmk/AFd+n0lfJfk
 rmbB/Bycw9nk8oFkHhyAirNXd7b8V4Wnse0qUFk3Fr0BLhsBZcoIGBdvFM3ghqp+U/Ro
 ggHXdjnw5Y6Er+7aulf7PdANJSgLoQv6lgnYQlxsN7FTJTuDufTD8bU6/AWKMfvkpcgc
 6bOkaQWnim0JYGmWoIFj4hbUvquTMt26OOhkuXAa9jA67FjkoFlN1s3BVU0jac/gwPWr
 amtNUVxfVMtKnaJNKEloJcv2MDbp6HueLyZw4uR3ZkcEA6k4ViFW4VYLdbbpN1mrs4I6
 QK8Q==
X-Gm-Message-State: AOAM531KSzQczARmglAA8pfYOUH346tHscvityIOaQs1Ax8tLKOAeJ+H
 52Pe1fEoXXeR54v5ZwXRPwhpcjWLFEEylO7ZDZ4=
X-Google-Smtp-Source: ABdhPJzi9TxnxflMPPIdMv5ysTacLOy22Wk29jrF7FMrEzCTyuy6RWv3UxhJOkFjmXv+gVQ1YbCviUMBuPaxRPujetg=
X-Received: by 2002:a17:906:a415:: with SMTP id
 l21mr11055133ejz.2.1607169645914; 
 Sat, 05 Dec 2020 04:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20201130060320.GA30098@anyang-linuxfactory-or-kr>
In-Reply-To: <20201130060320.GA30098@anyang-linuxfactory-or-kr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 13:00:35 +0100
Message-ID: <CAFBinCA=A+M0dgebTRF3y6chd205HN5ORgqBxw1gpu++7QC8Rw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: meson-sm1: fix typo in opp table
To: Dongjin Kim <tobetter@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_070047_284451_8D319921 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: devicetree@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Nov 30, 2020 at 7:04 AM Dongjin Kim <tobetter@gmail.com> wrote:
>
> The freqency 1512000000 should be 1500000000.
there's a typo in "frequency". I hope that Kevin can fix this up while
applying the patch

>
> Signed-off-by: Dongjin Kim <tobetter@gmail.com>
apart from the typo above:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
(while reviewing I noticed that we generally use 0.3V less for each
OPP table step than the downstream kvim3l.dts - that's a discussion we
need to have elsewhere though)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
