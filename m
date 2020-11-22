Return-Path: <SRS0=nfxB=E4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A8BC5519F
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 21:55:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B556920888
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Nov 2020 21:55:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0QxiusCn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="uE21F2TZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B556920888
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6a+dhFwS9p05z2lLQM4q8FKpYF6vUYwWPYYIEU+iLQ4=; b=0QxiusCnfkXDfXZBtEdFuPiXM
	tEpfXu8l5fPIQC/aWGQDsaN5HGqANokCSKVeHKsDVhLlPak27E+6fqgZnxXJvrfQ6HDrCkaRKlqX1
	VqFTBDrnrnJCPojHWSC2edIHnZY3cqJlVeMuA28nH80xGeFpI7xBNTG7zkoQIl2HSJwMWC6MsUgRO
	DiPgpNHf9BJbgNNjkzJIkbdVTsPHR+Guyp5P0o7h+zYmkDqmxwZ+fo+iA/ZXJO4iwhqKMhhZv+DPf
	e4wl9L3hheqyI7hgE0scqHapCj9pvG3j3PzC8X0pxHHVRxp7IIt2v/GJ8BbJqwZ3mRe5mBjbZZGV+
	JIbF1FzJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kgxKg-00078z-Kq; Sun, 22 Nov 2020 21:55:42 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kgxKc-00078J-Rw; Sun, 22 Nov 2020 21:55:39 +0000
Received: by mail-ej1-x644.google.com with SMTP id a16so20640554ejj.5;
 Sun, 22 Nov 2020 13:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qqpYjQ+PGcW1Zliu3zVha2yXOh9qnCs6d+1tFYlWvLU=;
 b=uE21F2TZwzmZhDf0EemaAvk72giHQLQxLBtQ2A/hZnlQqR5DMpduIfsviX6XWQVIA5
 U5LSC3z1gM8HZG7xhsix6+fNlUI0bqxysI6jCSI1hpKqwnsTBfl7A3ZGuPCNRgh7EWZe
 6Of91QefiL69x275vggcx92vCTwZRpOlVp3BElKBHbufVQ9/wAkpg0SNYgZO7pHqhlCT
 ywHm/hw7ep5sXEV6SIDtre/iOQIOJoLjw9YFnFDEn89R4x9QOxj5GFMtmI3MvanN61+h
 aQP9wlVxelNJpCuZi3VyRNIjZbB77I7hN7fX+dHNJOiUFGu7VH9ztYddDsMTFu4uadpM
 9ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qqpYjQ+PGcW1Zliu3zVha2yXOh9qnCs6d+1tFYlWvLU=;
 b=n4lFAJCyurgoQ7txp0IYJmsuAL3fsEjLazD5IxDI+nPQJOa9eWjFl8GzdSGi1CkKYU
 uHTbN/V3ehSFozl7xrtZU8YgMa3ek0sd2fW3PYqasJ0d5l/ymy3oDMnTYgUL2lkRLx2+
 UxpsAl4PYCeq4BhV2olLHk20sJjnPYs3YwJ7O8vQSb+TrRAqdFTdpSzW96qPjeR+3PLM
 +o+ZXogv2SsRgfDepIosYrSay6f8hMKF7/nGV0YJnB2mTtINGHW6UhKW0DGWvJvW5+Yx
 AJE8YmpCdjjekX0qyzEowkL2Nagm7oBFFFFQJQ9NtFiB0nV1EO/V6OHCM0MNR/s5Jb+e
 LfAw==
X-Gm-Message-State: AOAM530JU2gEEhaOyvNqoWy1G9f/LWY6id+V7vujNnd8aawDLQ3IDK5C
 0/Xm3g587nWkF1/VC5HcbDLHegPOLRyPfORN1C4=
X-Google-Smtp-Source: ABdhPJy07kQh16653VIqzljjoXbLIp850Rh1tftCY9BRp2/rmpFyyXpHdiUQt6F0suidLiAtWc23f3ZkqdKyNV2NFoQ=
X-Received: by 2002:a17:906:ca93:: with SMTP id
 js19mr43561460ejb.537.1606082136168; 
 Sun, 22 Nov 2020 13:55:36 -0800 (PST)
MIME-Version: 1.0
References: <1605666995-16462-1-git-send-email-yejune.deng@gmail.com>
In-Reply-To: <1605666995-16462-1-git-send-email-yejune.deng@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 22 Nov 2020 22:55:25 +0100
Message-ID: <CAFBinCAoFHknq8guq2JmweBvpeXgFh5dzSOeHBaaCJAD=OODHw@mail.gmail.com>
Subject: Re: [PATCH] phy: amlogic: replace devm_reset_control_array_get()
To: Yejune Deng <yejune.deng@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201122_165538_912215_37A9DF0C 
X-CRM114-Status: UNSURE (   7.09  )
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
Cc: lorenzo.pieralisi@arm.com, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, linux-kernel@vger.kernel.org, kishon@ti.com,
 vkoul@kernel.org, repk@triplefau.lt, p.zabel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Nov 18, 2020 at 3:36 AM Yejune Deng <yejune.deng@gmail.com> wrote:
>
> devm_reset_control_array_get_exclusive() looks more readable
>
> Signed-off-by: Yejune Deng <yejune.deng@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
