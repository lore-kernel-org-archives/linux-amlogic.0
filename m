Return-Path: <SRS0=7yak=FG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7ECC71156
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 15:51:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D0CD217A0
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 15:51:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D0CD217A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:Date:Message-ID:In-reply-to:Subject:To:From:References:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jy9epmHc8p0uaBSXEiZYzNAimicZW6hXBYkNLDJnHM0=; b=ZpOD3LcfXmgCCI+MGHF2SrH29E
	6p9dV5wFWrKtz/zDWfSNwqBj4LSNqLoQvavZmfOm0qvxeTQoerQG8WmFdZ6d3u5RFshmYkIEYYtec
	7sEPUEeW7a4ekRLeG+XZPPc3CzeMXPkVTf5fxq5Yb5NMO4H4xVN2ajMfLKiT7nwiFyvP3bn0X9EWz
	jTpMbA1rKYOaIg8+tFLbUcsQCLxyJQUZqrr+zjx/9v87KU0jUQE5N+tQhPrMyRg5wqBKxFF96ptIX
	P51HFgg873uJNjcyfjP+fUzi/IEt7Fek1fq6Ubq5nrugFbYKWk6udG/SKV8i7EaRlTtxeS4l1Rbal
	Cum7xlZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkUPF-0005Qh-8s; Wed, 02 Dec 2020 15:51:01 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkUPB-0005PT-Jb
 for linux-amlogic@lists.infradead.org; Wed, 02 Dec 2020 15:50:58 +0000
Received: by mail-wr1-x441.google.com with SMTP id z7so4543244wrn.3
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Dec 2020 07:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:subject:in-reply-to:message-id:date
 :mime-version; bh=RcBu922o3tVfyKdxDqhV9UdiHRuQsNmPY+MJCHp8CME=;
 b=zwaeYdccAYw13BmDlDmIMQlp3V5gQjWiEy5VGIZcFy//rbw4zSPXfmVDW0OZYrTeZU
 ShSnbyXslsbm5piPRTfE465wFxkZ8iwlEMwuQPTuXnYZdDzknC6Ksy2dk8PFdJM4hFN1
 NGtROkkRajRrOHLBJsEGC/3CA3p1T5+cmDCOYKPzEqaNma2U+1y+gt/yVv4DhGieiBp/
 fhOA9+JPwmcHw7UBB51VYUzhiUXZfHEUWJ+IO7YPEcfKTZCDqY19nygHzUgs0L02RheX
 Spe4674ENOdTBcvsqIrLsi9okBQwE0mH3XIbLnOVyxjS0h9Rc43UzKkRUbPfKiAV5HTy
 CO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:subject
 :in-reply-to:message-id:date:mime-version;
 bh=RcBu922o3tVfyKdxDqhV9UdiHRuQsNmPY+MJCHp8CME=;
 b=fP8VwGaohAWadsq8z+JdcRiGCE3uvVjSH/L/iodBZQ1elKSg1dfdmhLhbvh+7vm/ra
 xIGu/sJZue011d6S9ufARuZWJN9kv4S+F/+IHN86UCFZkoxmTLIS/4yROLf8K0D1ZnUi
 rXqYdR9QGsRVtTZziAlQq1hOVfDJp9GFi+S/vKkKuTqZk71vQkKY5/Yx8cuJNK+/2sCF
 b1xsKroxPmoTuV9+Lx9YJEaa0PCwOscgfDRfgebl3kFnzxIrafAlOHxnepsgi32Bknwa
 jZGM92qM3SnFF63aISjNcI49OOy/UxoepJhx+LkxHGwOb2N/5Cx57ouNhGgfbBtgh6Hu
 iyiQ==
X-Gm-Message-State: AOAM532yPxB9SMoxpCy4isTwTBB/0o64tt+M7+wxv0t2rnKN5PkkdXZA
 s9u6Z7FLnc2xA32QTH6W8647ag==
X-Google-Smtp-Source: ABdhPJzT4JpcLXQ7BXUtHnOTWmGyrjUJjn3zD+bcX4wh7YDQSdAAMxZscMCQU7d6nB3SoGCefWAcpg==
X-Received: by 2002:adf:ea45:: with SMTP id j5mr4267671wrn.171.1606924256465; 
 Wed, 02 Dec 2020 07:50:56 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id u66sm2557125wmg.2.2020.12.02.07.50.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 07:50:55 -0800 (PST)
References: <20201116062031.11233-1-christianshewitt@gmail.com>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kevin Hilman
 <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] arm64: dts: meson: add more GX soundcards
In-reply-to: <20201116062031.11233-1-christianshewitt@gmail.com>
Message-ID: <1jh7p4p5pe.fsf@starbuckisacylon.baylibre.com>
Date: Wed, 02 Dec 2020 16:50:53 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_105057_681148_CA047E23 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Mon 16 Nov 2020 at 07:20, Christian Hewitt <christianshewitt@gmail.com> wrote:

> This series adds basic support for LPCM audio over HDMI and S/PDIF
> to GXBB/GXL/GXM devices that I own and have tested with. Audio can
> be extended in the future (some devices have DACs and headphone
> hardware to connect) but this gets the basics working.
>
> Changes from v2
> - Drop p200/p201/p212-s905x/vega-s95 changes
> - Add khadas-vim(1)
>
> Changes from v1
> - Drop nexbox-a1 and rbox-pro 
>
> Christian Hewitt (7):
>   arm64: dts: meson: add audio playback to a95x
>   arm64: dts: meson: add audio playback to khadas-vim
>   arm64: dts: meson: add audio playback to khadas-vim2
>   arm64: dts: meson: add audio playback to nanopi-k2
>   arm64: dts: meson: add audio playback to odroid-c2
>   arm64: dts: meson: add audio playback to wetek-hub
>   arm64: dts: meson: add audio playback to wetek-play2
>
>  .../boot/dts/amlogic/meson-gxbb-nanopi-k2.dts | 40 ++++++++++++
>  .../dts/amlogic/meson-gxbb-nexbox-a95x.dts    | 40 ++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-odroidc2.dts  | 40 ++++++++++++
>  .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 ++++++++++++
>  .../dts/amlogic/meson-gxbb-wetek-play2.dts    | 61 +++++++++++++++++++
>  .../amlogic/meson-gxl-s905x-khadas-vim.dts    | 43 ++++++++++++-
>  .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 44 ++++++++++++-
>  7 files changed, 303 insertions(+), 5 deletions(-)

Minor comment on patch 3
Minus that:

Acked-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
