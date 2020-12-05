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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82235C433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 11:52:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89C3022D6F
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 11:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89C3022D6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=abBt98/7uS6rIpsHkV6HhzNiDaVXO8ozTKxEGLrHkr0=; b=g3CECY+2B3JbE5UzM25JQAWP/
	bSkVevEZr2WcQyQeMX7gPtkKW0o39chcEukL439Cv7b6x9DGbb0psB5zCk8bIwhnJ0U5T3XjoAjzU
	eRUQ+3CFWHbXmB9+t6qmHce9oaN9xI5dl6+Y9hDmt6oVZyZSzAtbZuxQDAAcQdDkvUh/GRd8dXVFY
	xwUsKFh/yP3msurAjXqW1fonPvc6mBfvzm6tKSOy+rujmTBfgsjKI3jZwqbc8Og5IgYaXLGg3W+cG
	NufLikgsb7xZ1aVCiCORfDqZO8RdN2IL3yJMh4mX3tUtCQcIT0uO11W4gubgqAx71NrTbS/3Gf207
	qagUUWNlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klW6R-0007al-46; Sat, 05 Dec 2020 11:51:51 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klW6N-0007a9-6f; Sat, 05 Dec 2020 11:51:48 +0000
Received: by mail-ed1-x542.google.com with SMTP id u19so8647735edx.2;
 Sat, 05 Dec 2020 03:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9hd3HS1nRGiOdMm5T7QTs9bBnrJ+T0eTd0OHKFt9TJM=;
 b=OQYNEf2uJdfHMQnh+CsubPaAu5uKQx4mJCqeL4MCG4CUH8i1yrmV0z6Be7aYVqBOHT
 63m+s4TsGqrrLl0xK0yoOmLqIzkrubm22Lj2NxzlpB+WrY6uXT9d/frREYJX8ZdMrDPC
 zWQ3dbYiLDoOnKkHh3DvLHteJEhV+PP6s7qSS8mGAImzxqchIEuwE7cmxEXEiINZdQDx
 sCZXMoivvH0VqZKWWgU5C8neJ09AU3ICwf/y2mXGe31fsI1KKCzDqrrxdMTRYQwfoHb0
 U1saovH2q/Zinm5jumRt10HNk7zj40nPWYhyi14EStWuQy+PCyusQZzkMSb3QWth9uAO
 UJHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9hd3HS1nRGiOdMm5T7QTs9bBnrJ+T0eTd0OHKFt9TJM=;
 b=mIvZH76aNxcbpSIz/0NsAh3hklWzlc29V6giTCtJrihutsy8MOJ94D/LHxUZhJVu2A
 zxVJvu6BbaNicmAqLd7m2eqP34MwbprQmEpqFIq5hgOPnUg16axvldGe8A44Bks3nrq6
 3UbIwYTfsMMHdwyP6xRgwmZFjtyY3Re82GB8guxcAtYyncmezlR1bH6jLnYK8c2gsM1B
 HqUktWCiza1z6xxeN/uj/aPj66835BjAJ5GuaUJO4K25K0yjIzU483P9OrJ4ucoRAWCp
 DPqXCMyY66+mHgNZzKV8auAw6HJovbXPsYqjPxww+y6hOUWcTuyx256HGCRTlZnztRE5
 vGHw==
X-Gm-Message-State: AOAM531REp9PmsGpKs7tUg3E0NYdVfgtIQlaNau5XaoZqmFdL45pVz0a
 8UBIHkv1e4BsBGksLgOZH3CiXhWe4HvkWQ9s7JE=
X-Google-Smtp-Source: ABdhPJyTmxH/J6AxpvkQV8Zl0g2e2O5aFVksrEY/jFlL2+JuuumDaJabPFMHoTqSD0/L1it3ad9vJWHnKSwlWMxNXGs=
X-Received: by 2002:a05:6402:949:: with SMTP id
 h9mr11596537edz.301.1607169103997; 
 Sat, 05 Dec 2020 03:51:43 -0800 (PST)
MIME-Version: 1.0
References: <20201126050440.6273-1-christianshewitt@gmail.com>
In-Reply-To: <20201126050440.6273-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 12:51:33 +0100
Message-ID: <CAFBinCAUede5uaqnkSHqmwmMuTnZpdhbJAUE11q32y60SW0D2Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: add KHAMSIN IR remote node to SML5442TW
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_065147_290945_6DF3895B 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Nov 26, 2020 at 6:05 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Set the IR keymap to the KHAMSIN remote shipped with the SML5442TW.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
