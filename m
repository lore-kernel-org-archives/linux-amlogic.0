Return-Path: <SRS0=rMmM=SB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F37C43381
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 15:58:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4491E206B6
	for <linux-amlogic@archiver.kernel.org>; Sat, 30 Mar 2019 15:58:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BpWEZb1W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="qv4roUBN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4491E206B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I3dRnyXo7EG3mrKSR2Pn7U8WIc3whOJZnnynrGPI7EY=; b=BpWEZb1W+9AnM6
	0M/iwX7BuRDAxBBlxCQV8MJJ2cmbuf5TaUEZF9H5AlPweorLG8XteNWRcGNyzy9G/e4qT+Edl1Zzu
	5gZW/J5J1ymkhJtWM6zJGT/USl7HPhkhzHu5QwlMyp6Irt4XyZnMvoxxd+fcKJDh3VulYQaap+HRd
	3gjA3TcVsUtm78PoBJirvJEkqOe3Nseb8xxCG0jq+/3ND/V3m1Xmfl/fTTlYGtuUfsAsIZBbrt5ci
	/Sek2l4PF62A+roYSkqxV2MLDXeyiSQ2RLUauCa0+FqLixLKIqmnOHzxzu/2AAOg2WciZCYO0CoVM
	XVPv8OKdSkd+A+bE9jtw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAGNg-0005gB-MT; Sat, 30 Mar 2019 15:58:52 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAGNd-0005fM-EA
 for linux-amlogic@lists.infradead.org; Sat, 30 Mar 2019 15:58:50 +0000
Received: by mail-ot1-x342.google.com with SMTP id m10so4880607otp.2
 for <linux-amlogic@lists.infradead.org>; Sat, 30 Mar 2019 08:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=icdDINxkywQPrZTrei3utV7AEuRr9+VkHAS8J37vk+c=;
 b=qv4roUBNNllkZ8xzNjVC4gFOt5jIhVUe2cubAl/0X+iCt3Hhzc/Y7my51pOs+qrYvf
 Hax4EKtIIrX8bB1jpUUq3hMmsjFg9d7tRVsRxZ/hLEphVRih1z9q6sC0oQxSXgf3rm6j
 V88hw26bwCkfSCBBfA+zAGXYdbz5LPgOP3cRtLWS7aGk9r/a/Kq06aqbxCqlyf0yRb7V
 6g58BVEfCTN//A1YXWsVBwvIgkxnezOoMcXItT9JbJyCTexT97x/EcMu+BhMUWKhT4fY
 E04iJZg9R9FKGeFb8//8L1hAqBw5wp0PlDN58h2LG+imxaOrwEEuSriwF3qjwDz9p4Vn
 yy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=icdDINxkywQPrZTrei3utV7AEuRr9+VkHAS8J37vk+c=;
 b=h50XuB08//QwzW9ycEHC5RSvil7Edao6u5ZBocKf2M5YA699VJigHtiRAybEfIEV5F
 awD9+z6TyLRa5UkagoXlpcNXdE/AiTPLljLvD1MfCTt8+rPNHk1thEr971U3rbHyFcsq
 t4ZvFN4lrMm7xs39hkqvtfS3via4i4kAdDcBvMedP8mLqiidWCQ62HZMGY6mHug96EFR
 vehFYY0Isw1LPyfr3BdwsuuwtJz1sdFoU5l7mEv8+FiAJf9zZV3DbLXMgGJKW8D5Zcnx
 wRTvjitYInvwStcs5umBIrut/PanqDM6npnhfWlfL77DsHP6Nab2Zqn3DRhqjEXMJ3gf
 MCdg==
X-Gm-Message-State: APjAAAWjVLvXJ69bU+d34QMU+mmf5FNZzYac/GuashwyxSmr1qiG6/dS
 zdglrVJZRA1ftx7o0kDpVuXfjuTz4TfBxugLmYE=
X-Google-Smtp-Source: APXvYqwgl3qdsTEWAbkRDqwhNNgxmXKj9oqE3rFmiWYnyHHctUjmrAOdzXaoHtUV1jsQG+HZnlNGdk52INg5JTkbSWI=
X-Received: by 2002:a9d:3db4:: with SMTP id l49mr18214023otc.131.1553961528442; 
 Sat, 30 Mar 2019 08:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190329153325.23869-1-jbrunet@baylibre.com>
In-Reply-To: <20190329153325.23869-1-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 30 Mar 2019 16:58:37 +0100
Message-ID: <CAFBinCCSoJYnSt5L07aK4+wmU54soFxRODuHbxaAqcJpmOL+fg@mail.gmail.com>
Subject: Re: [PATCH 0/3] clk: meson: fix mpll jitter
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190330_085849_477844_6486FD85 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Mar 29, 2019 at 4:34 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
>
> As reported on this [0] mpll series, We are observing a lot of jitter
> on the MPLL outputs of the g12a. No such jitter is seen on gx family.
> On the axg family, only MPLL2 seems affected.
>
> The jitter can be as high as +/- 4%.
>
> This is a problem for audio application. This may cause distortion on
> i2s and completely break SPDIF.
>
> After exchanging with Amlogic, it seems he have activated (by mistake)
> the 'spread spectrum' feature.
>
> This patchset properly set the bit responsible for the spread spectrum
> in the mpll driver and add the required correction in the related clock
> controllers.
>
> Jerome Brunet (3):
>   clk: meson: mpll: properly handle spread spectrum
this depends on a patch from your other series "clk: meson: fixup g12a
mpll": [0]
personally I would base the other series on this one because this one
contains a "Fixes" that (meaning that the patch will get backported
and that's easier if there aren't any conflicts)


Regards
Martin


[0] https://patchwork.kernel.org/patch/10868837/

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
