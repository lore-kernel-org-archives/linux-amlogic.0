Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0118C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:42:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2F7922DD6
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 20:42:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eezivCcm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="E3ArLV08"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2F7922DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yt1fWFA1k7ToHiChjpullLeASx6ZdUtJz9T82aSYKx4=; b=eezivCcmjqbbCz
	CNPX59SIcLRiQ3dgTieuSpgvBx5CjD11s1JrIqiW5PHH/7DBGlRPhmlVgpKny1hL22ObALxO083l4
	Mv6nrcjM+ohWMNiRwhLYTFi+nFz4ozrfCsjJrS9L9G9dlAaMInUD41+mzVkhe6IuRfe28/IgGbDkR
	DU5HIxfqfnr2GumR7eWbNENLABieXI+tm+tLm+Jm8p4w6LUwXo4G50R4BP/aYcpnr7toORHLIQ0wK
	RtCrLIzu8Vk0z+K81kB6NPel/bWgVPnCxH+mShdXgUP5oj4tPp7AJfWVplqSY+hlSvck8Tgj3lnfH
	kROa2nOkoGNrtmTCSM8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0AxL-00015z-Sk; Tue, 20 Aug 2019 20:42:15 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0AxJ-00015Y-Cm; Tue, 20 Aug 2019 20:42:14 +0000
Received: by mail-oi1-x241.google.com with SMTP id g7so5206659oia.8;
 Tue, 20 Aug 2019 13:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VtWPczm67CwBeu0M0TFGverK4/MDIuIxxwNeQ9S1vic=;
 b=E3ArLV08QNk9L8LKJkIYGZl0DVDrokXHwB0vK/zDj9e6nIVu9k5BFrMf+kqHc8h0Pn
 +lvOjcitC6Kd8udiShWwkBPzaeVjGAGlh5ptJav6c0MfzzkQQjxaTgCYdspnmNEs0W/E
 0rVKb1yrsux6dU602RR/AyuRcq+MtuSzIvYWI7UWscpnspsah1vma5T+cT2i667idEi1
 EI6egM+KNFL4qj4kH/BiK0YAnQAdiiFSV59fNHldRTL47sHlxq82rFyWVSGxEgEkiV64
 OlNoQGdRbLG5MvqoK6H6ROBNqZrwJOxuQWncK1e4VuHo6ZhPKaM5KhcKBqGAb+mHOJO2
 HtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VtWPczm67CwBeu0M0TFGverK4/MDIuIxxwNeQ9S1vic=;
 b=TZJgFQxV95qZGT6+U4oMpLOwYPNYg6a7U94o8LRMh1V/CQXQlS+1HlAE5kmsIUZs3i
 6HCwxz6MNGGRbPhf595fsy5B8eNRwMb1+PeP0PDwX25Y1ZSjQfSKTR7sUp4tNF7+1qWs
 mIH3LirC3ANMLiJ2g+NeIKpJO2MqYYg812OeyBml6lQW6c5dRiu+82GWeIxq8NzO2JnM
 ZfOL0+c4VQtynGGzLmpFPb/BGGbKhH2gk1EVBRG3NCWxu+GykiEhBk9ij9k1qGX4N5oE
 FN7ZDwS02tkZbu74dWmFxC20eS/gLCD60EZWRaye6FFmotvnzy+s/ZdxVIkH7Lv+mMoO
 sXdw==
X-Gm-Message-State: APjAAAW203uUOryd9dSyyo04K2VBgfuEqi80RfZ1VMqE5GKnTFkzrUZw
 s7uKAhzH6akWTrpR6YwTwJrS7ZxloZR/3oivMe8=
X-Google-Smtp-Source: APXvYqzRHZsEZywX6PGgcnI3U8bBt1UQySc3ErcGAntuVNC98xdGIfDMOtYZ9Vh3M4F1lTu7dXuxyT52H7ClOJeIK6I=
X-Received: by 2002:aca:d650:: with SMTP id n77mr1448561oig.129.1566333732518; 
 Tue, 20 Aug 2019 13:42:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190814142918.11636-1-narmstrong@baylibre.com>
 <20190814142918.11636-11-narmstrong@baylibre.com>
In-Reply-To: <20190814142918.11636-11-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 20 Aug 2019 22:42:01 +0200
Message-ID: <CAFBinCB=kMELC94MUQt_n3QagsjNn0YjDfcZ1qk5tghCxjmtJg@mail.gmail.com>
Subject: Re: [PATCH 10/14] arm64: dts: meson-g12a: fix reset controller
 compatible
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_134213_462734_9B33E697 
X-CRM114-Status: UNSURE (   7.45  )
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2019 at 4:32 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> This fixes the following DT schemas check errors:
> meson-g12a-u200.dt.yaml: reset-controller@1004: compatible:0: 'amlogic,meson-g12a-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset']
> meson-g12a-sei510.dt.yaml: reset-controller@1004: compatible:0: 'amlogic,meson-g12a-reset' is not one of ['amlogic,meson8b-reset', 'amlogic,meson-gxbb-reset', 'amlogic,meson-axg-reset']
note to self: reference where the decision against a g12a reset
compatible string was made -> [0]

> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>


[0] https://lkml.org/lkml/2019/2/7/358

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
