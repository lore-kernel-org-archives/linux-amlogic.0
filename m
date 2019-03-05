Return-Path: <SRS0=O/xb=RI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F226C43381
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:10:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F27552082C
	for <linux-amlogic@archiver.kernel.org>; Tue,  5 Mar 2019 21:10:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DhgjkRDd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="j1x8CTF8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F27552082C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggygG/iG+khGX3zdTdAXYQJJPZAo9LjUxxv0csAhbag=; b=DhgjkRDd9BHsXM
	6ytOt18P9XMajr9AZ2vDHqilNE4Jb5i3TBWIFELEGtun6q5cslGVG9QV9WZlDVWqjvOJGwwi0et5V
	1Vmy5ZcrxUXVn4DTbLGnhp+ktISYUFN/sEkn6tLJxYHfgg+8Pq1HCyv2OQWYyM5DXfR+8Ww5n0UIs
	mT+Mz2MLurJ3CR4VSuVZr4cW8K3Fhwct3xrGRxrKLayvBHKnWvs7JToR6vL1w2kSqW61qWQjI6cZd
	xj25yp43jvpRVRx4QV+/rerdRH+GPvI+ZkrhBfFcNjAiy67KlF2RED/z/W3CXcmBZRVRzVODkS1xu
	Yemb45NEVQ1aRbuLmdPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h1HKR-00061a-PT; Tue, 05 Mar 2019 21:10:23 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h1HKO-000617-L0; Tue, 05 Mar 2019 21:10:22 +0000
Received: by mail-oi1-x243.google.com with SMTP id u128so8041453oie.2;
 Tue, 05 Mar 2019 13:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eK7b1ysZ5RYfu11FRazX4UI1S6Ih8JesHu0IF5iHaA8=;
 b=j1x8CTF89Qs41ZyHYjesb8CIgIIirRbLLbb74rWFRAebVHldQBlD5QT67h0Mm9Z240
 KVz22+PcxuhvZOwORvRobXSh8gSNmMp6Vnfugst5/J856M6jIxk8j8+oK2GrD2h8kDzN
 csbWJ8ZN2qxzvT8N8v6CLuxR6iE33EsdeX5I/QZ2B6FCbJyBCfRYt/jIQGipH9MSk95o
 QUknPxRMrdFmREuHUd6CaGmuP6jc2SyaFj1DsLv+x063A6viqMOWqKzdK11PrDM1MkFu
 u8cGl5dMijZQdfd6inLK9WSYtVKn4B+rec1VT8BSMDsINYoWTieh7cMaAhgF8XdsqYvs
 vSiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eK7b1ysZ5RYfu11FRazX4UI1S6Ih8JesHu0IF5iHaA8=;
 b=kWAFXJm60kkx3gE4A7mMsv69ilD/bhmnDP30UuyjBtQTVkMp0KD8GQ429NnRHm4gri
 Zcgh2TpbuneZDuXKyxHAePgnSkM5yTYGIcNhbj9D6MME3l31S28VURzbjAhxtVi17qTO
 HZ4eSerHXD9rHt1fybsHv3vpdkT8rQpY9CCpKpushBV1uxYt8xJ3NNdiTNYzwNaMdJvc
 mWghnIaCCHtxVl+GPFEOrR+teilS4BxInEqEMGqyhzZ9JEoAlCUmq8/H7Y+IvZiSGgtj
 riUIPs1RlBrRy+GPhMmwvMtYnNJx2SldFjgZSDyfkClGfGxNHTzV2jzo8WFctQQX0Z0g
 DU1w==
X-Gm-Message-State: APjAAAVLtfndvcnG7fIub8xf+X1Ep6MaGP79OhK3SUMtVQAZnzmcTvUS
 DKg73gtEGGxIPuxLASFr3/qPuWGmcFKbi71xvZ0=
X-Google-Smtp-Source: APXvYqzNLUVc4KWV8pZ6sWH20srMIwANXU8OP6BAlUdcDbU5dWTNHrF5O5cGb48Aw1nFP7347/B/cSjSO2p09s+kWkw=
X-Received: by 2002:aca:4205:: with SMTP id p5mr309442oia.15.1551820219243;
 Tue, 05 Mar 2019 13:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20190304131129.7762-1-narmstrong@baylibre.com>
 <20190304131129.7762-3-narmstrong@baylibre.com>
In-Reply-To: <20190304131129.7762-3-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 5 Mar 2019 22:10:08 +0100
Message-ID: <CAFBinCAax7=dbLxTNtSrJJthuFb02+7YMyGwpie28F1bnr0qRw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: meson: g12a: add cpu clocks
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190305_131020_743113_4AEE6450 
X-CRM114-Status: GOOD (  14.57  )
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
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 4, 2019 at 2:12 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the Amlogic G12A Family CPU Clock tree in read/only for now.
>
> The CPU clock can either use the SYS_PLL for > 1GHz frequencies or
> use a couple of div+mux from 1GHz/667MHz/24MHz source with 2 non-glitch
> muxes.
>
> Proper DVFS support will come in a second time.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

in my previous review I criticized that the post-dividers are not
mentioned in the description.
it's not part of v2 but after having a closer look again I think it's
not a big issue:
these CPU post-dividers are all marked as read-only and have a comment
that "ROM monitor code" manages them.

disclaimer for my "reviewed-by":
- I don't have access to the datasheet so I can't verify if the clock
tree from this patch is correct
- the latest buildroot code with G12A support
(buildroot_openlinux_kernel_4.9_fbdev_20180706) doesn't have proper
names for all clocks
- this review is based on my experience with Meson8* (where Linux also
manages the CPU clock, unlike on the GX SoCs where it's managed in
firmware)


Regards
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
