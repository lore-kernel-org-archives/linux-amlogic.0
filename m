Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A41F3C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:04:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E5D422DFA
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E5D422DFA
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w1KDuXK5XG5bgJW2WQ7Pkx3gmvWzBrcTvP0qFq+9sj4=; b=o8IvF+CgcqyFmHmZAoJPgiQwP
	Pvq5Thv1LnHIGCoa/zSss9r/Czd+zRzFqWKS7Hb+G+8hFOjbBM60sVUpEiaxnljIP/hjVLirCdPtu
	exM1Xs5StIOMWBy+pzdMKnA5Q0DdmrfGrf3qzpHx9vFghHixIqR9UHwqHW36ApTC9TOUwu5e+6vBj
	ps92O+YH+KpF/5PC0/3CNybsNg8hutdmAzi4SWupm135XmyrY/T02gHSL7ZqTlV8fRFgEFQ9Jr3TD
	/vgBlmVD5wkJtz/+xPnOWAchhosnbPwCK4CzQYdsoZEeQRxKHpgI45dVjJHWGLFGAeZ6fl0LegLOF
	DsV1Y0IaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klXEm-0005K1-CS; Sat, 05 Dec 2020 13:04:32 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klXEh-0005JU-1U; Sat, 05 Dec 2020 13:04:27 +0000
Received: by mail-ed1-x541.google.com with SMTP id k4so8791664edl.0;
 Sat, 05 Dec 2020 05:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C0+StnkqPn0FaAVFCZ/bxC2Ra36MF1dYPlwQRpPH+bg=;
 b=CLthCZ+pBvNWkqEvKMCfFA5VvP7eqiRCZ/KPvbXYyk5Z8sqHZ1gvoybUnysll0JMkE
 upGyKe5ML91Y9fIgQliof/bk6nwo2H3Z8Z6B8iI2i0LhENGog3W6IJ0mxoAJMHEYOFWx
 8XNgrTTIPebZD8RRBeh4dRvd/+YOaHzXRt3Q5OdpZ1+4rri/XegtkeDjZG04BSk0TMJ8
 kPOtfYiibQxG5E3M2bI6UV4v+p5StlEWUxr9QEquuX0rw05znX+u7pIICqrLIrqNLJIC
 +P2rbBV4WEWEFE0fBrq0/QYPU2qkooWR5dJptaYoC1W4jhoTwvpOiluteQ02s/xBtz/s
 tOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C0+StnkqPn0FaAVFCZ/bxC2Ra36MF1dYPlwQRpPH+bg=;
 b=YEIyeVyyA0EIFh9e3Ov8ErKjuhwFBYMDYdobuNX0PLKB/hqk8TEqKH+VhouWdBFyRT
 Hj2jWYXWU9Pv3s+mx5eeqRjjEsu0lbKVVtk7wfEdeBx1fHGaUtf32tYBMVb+oNLzLBga
 bW5jmIEMSw4RB0xrz6us7lFDz2wXF8jRrT2EteX+VUGWpfHGj+gvEW4Fpl0KaXN+dgxr
 7NZ0tRB5dqZGKuf1e2Nz/RfRii55aFcaxzWFKoooq3Q5Z8brEE8081J9fJkx/yYV3fgn
 Mrni3qi31v8opjYhFM3n8euoI1smJZCPMZ5v9xwGwuFAd+SsU8STha9zVc+uqgAi0Hx1
 utog==
X-Gm-Message-State: AOAM530JzgjKzeaaxGz7hspDsj5GRwqlaHmW64PQoZO/236C76Zi99hM
 IKJxKsrIva/gp9bOoMUfTBa1ULUuyDz1DtFgJ4A=
X-Google-Smtp-Source: ABdhPJwg/aVelRzEkx8ct1h8p95ANrqs0EaGaYdA0P0CRPct189vE0MddExzvw8TCa/hBR2COLD3V7MnfUUo7l13fuA=
X-Received: by 2002:aa7:cdc3:: with SMTP id h3mr5747824edw.52.1607173464726;
 Sat, 05 Dec 2020 05:04:24 -0800 (PST)
MIME-Version: 1.0
References: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
 <6bfe17d86ead62c20d236e2ebbc7b7fe3354829d.1606828668.git.stefan@agner.ch>
In-Reply-To: <6bfe17d86ead62c20d236e2ebbc7b7fe3354829d.1606828668.git.stefan@agner.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 14:04:13 +0100
Message-ID: <CAFBinCA_eaJHv7e+8ZM=z=zUZ9uQY_JZ=618=LwJYM-Gi+OO+g@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: meson: fix PHY deassert timing
 requirements
To: Stefan Agner <stefan@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_080427_135573_4F24CA8B 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jian.hu@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Stefan,

On Tue, Dec 1, 2020 at 2:21 PM Stefan Agner <stefan@agner.ch> wrote:
>
> According to the datasheet (Rev. 1.9) the RTL8211F requires at least
> 72ms "for internal circuits settling time" before accessing the PHY
> egisters. On similar boards with the same PHY this fixes an issue where
there's a typo here: it should be "registers"
this is the same for the other four patches also

> Ethernet link would not come up when using ip link set down/up.
I have never experienced that myself but gotten a few reports about this.
thank you very much for coming up with info from the datasheet!

the following stmmac patch [0] has been added recently which may - or
may not - have any impact also.

> Fixes: a2c6e82e5341 ("ARM: dts: meson: switch to the generic Ethernet PHY reset bindings")
> Signed-off-by: Stefan Agner <stefan@agner.ch>
with above typo fixed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
and also:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> #
on Odroid-C1+


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/net/ethernet/stmicro/stmmac?id=56311a315da7ebc668dbcc2f1c99689cc10796c4

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
