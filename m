Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014A5C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Dec 2021 21:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TtnPSfgSO+tNRX6TZAJ+K8+8gWfvUSZE3o2MejQml6Y=; b=pG90XhH9KTSMAo
	wzrsX/hwcGUPCOxdC+3ZNUyoSnAm8p9W8bcVSZ1hplTwhBwIUOg/x6i9TLmsR/H+gtlebONO9mwTo
	F2RnUcp2xHZnUYCpKuLGsemPxDQpZzmdZRArIzOrTX3XZ3ZV/eoLqTM6y7ROfaX6EIPHF26/Mf9zD
	CIsqG9ueSkt8c5SEyLqCJbpoEMC9w9ZRs438Rcwq+4VrWgYbcXnjbDQD4beeHX+gJ8wOzlRHRXouR
	0g9yOog3WKiK2BwApTCO3/V1Ut3LCchASBfJnMndrJq+eyA8OlDEf2tDkKUXMojnKKwMAnq15z/5x
	VCFuPf+98bwL4cYduniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muLgd-005wiN-7u; Mon, 06 Dec 2021 21:38:15 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muLdE-005vXM-RV; Mon, 06 Dec 2021 21:34:46 +0000
Received: by mail-ed1-x52b.google.com with SMTP id y13so48473311edd.13;
 Mon, 06 Dec 2021 13:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=quIKySIUpr5MTJfpnarHC6Utt3+7Kapj52Q68fqD7/c=;
 b=RcG0NpN/CiGr6OfnnUTL7idQLJ4zDE6Vh6ZzmoVGdQ0VISX0i/Mnpa8FVE9p7jYqDF
 CEhjqGX5EdNwxzPT4HXdLGZAhAEDyVs7l6gMHigwRzQBU03QxVUAaYJ0vIn4d+ED5fLo
 9iX5JN2N7eCSK652vAV9ynOYdBGY85GqZGwQO8WTD8JCrgna4E9a1AYryFJjqt6RWvKP
 KxctAxHgfBXHzI/1Ycp4WnalCxt4sG7YzJl3FfNYZndIJrEc+ZQmtrlyx8gZw8Lzc1H8
 jXDlGLZhoZCLKW27JPI/bPkmIylXbSiht4PDhjW4ToHlHKTJ0inXBnIYPoV2HdWOX3ie
 femw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=quIKySIUpr5MTJfpnarHC6Utt3+7Kapj52Q68fqD7/c=;
 b=INy/jxlXSXzb7ojSXkibtexNo01TM4czp+dEG2HoowQTzaUoZ+vdpikanB3iYEQLxH
 UZOvxTl8e+Sksuk91jo8+9dTusg+CputNSJTdevUg3osyIeLzI5GzOtGgpyCwxoi9dDB
 fbMCxV0UA6xyCLolOLeE2FU0xsQdThd0sfQK2dzD1fYRTtMGfKm47FRcVZSNEczh1HOT
 dvStfy6Ur0lY7plEtcw3GOum17YYJhjgjsfbdnYToYj53HlSSPe9n7BgNpsI75fnIEwl
 T1INWq2v2aAumGHRaf667o+1wyAqeugeGhd30ZyuSAfrEFtNzrkZIneEUMzb5IsTTpw6
 TfxA==
X-Gm-Message-State: AOAM5304RmRd8nL5eT+MQDB6JpbACkoCJANRc0rJNBne7A29UgZX7441
 sdlP6/PvSKLaszTMDwbpDVVydMpBNtpMnn04X3Y=
X-Google-Smtp-Source: ABdhPJxKk5osnLLPa52HV3kvZMqV602+8tKH5puSMUMGuE3sqVSWJLfZFzzabDosBRZ+x/7gc1KN1GjOwLmcYYHtOy4=
X-Received: by 2002:a17:906:37d2:: with SMTP id
 o18mr48850450ejc.278.1638826483479; 
 Mon, 06 Dec 2021 13:34:43 -0800 (PST)
MIME-Version: 1.0
References: <20211130060523.19161-1-christianshewitt@gmail.com>
 <20211130060523.19161-2-christianshewitt@gmail.com>
In-Reply-To: <20211130060523.19161-2-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Dec 2021 22:34:32 +0100
Message-ID: <CAFBinCAkz2f7480+qnicM9Bm5r58_+=V4a_BvRduORRvyHS89A@mail.gmail.com>
Subject: Re: [RFC PATCH 1/9] arm64: dts: meson: add common SM1 ac2xx dtsi
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Benoit Masson <yahoo@perenite.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_133444_934689_823C7E87 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Nov 30, 2021 at 7:06 AM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Add a common dtsi for Android STB devices based on the Amlogic S905X3
> (AC213/AC214) and S905D3 (AC201/AC202) reference designs. The dtsi is
> loosely based on the existing SEI610 device-tree.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com> #
X96-Air with Gbit/s PHY

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
