Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7282C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Dec 2021 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPvZ2k2VzfAkqdvqIw0ZDau6bXnTDdJFCSST6Wbwf04=; b=mw0/Z097awMdaS
	3jQU+Wpzp8mvY1SxPsYpAqlF5IqEXLvX9BxuB1UxzGO40ducSBjzWKOhDYK93uNWdCignnqEP6fYH
	NKqBNZkJWfy4zgwv39VYECi/BieH8/SZ0WgXaJyICfemCCu3wb8rHxBqWW1h5z9+3QkvzL9/egZ8l
	aE4c3NY06bOBd84frTW8M8lE+UZIhd9GHufFay3iXpNwGvSOGqGuvgHq2wn9a3HFfRkCYthFl0iB/
	nuczpqw6qd1oGVttLJ8GYE2KimJX+ea6ttSv2pmFCx7tPcSgURZDwgX7OA/EKCpyOi/TS7/m3WtVY
	bKqMwmSBO0XKeOY0KOrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwgGh-008CVd-FS; Mon, 13 Dec 2021 08:01:07 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwgG5-008CNM-H8; Mon, 13 Dec 2021 08:00:31 +0000
Received: by mail-ed1-x532.google.com with SMTP id x15so49980782edv.1;
 Mon, 13 Dec 2021 00:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r6FKk19wLg5/5DanNVy/BnJQBLp86OcclKvVLtQ50Cg=;
 b=WuJro8kofehX89Gb5M3Dh7ue6WjBYH9KUzFFWSMHP6V02Lh0bcQN+0utDoA1tAgG9T
 om/TU37/M9erhiuC5C1hLymKoIj4pP2qbtwi6ku8ujJBu/rlEhnPUPmtqRuYsqS230Qe
 Mp87IN/ni1Flmkw6ErLxYTcanG0/gvVma5IaEeiXOcjxnAnqQA3mXJv/TGciUOR7b+cE
 8hGCJMZQyEMU4HLab1d45eerHsoU62jPS/882nfAc9FDT0GgkKd052EAlgu2IioHMcSU
 TnHAY9XVhZUsf2zG6tiKRXHTHkmHEh+z/dPBpbSDcxJSwMqzhSWl0eqRs1d9z4sDnA9O
 H8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r6FKk19wLg5/5DanNVy/BnJQBLp86OcclKvVLtQ50Cg=;
 b=bkdqBtIKKxKNn/c63/r1a0Tez9bBeS6DsIOAcx1z/uEcmSMokhe1M1W92W9Soqa3f+
 UsLCehisOzieQjsMx6Gj6FYpbwoJ2XNTaHMXh+1nSBFI07yZ+AXENajQCbNBcovPu5lB
 sSzILz7dpTm0dNTVCe/W4/Mmd9MuSOfG1FfX08hEOA1Sa52adeGeY6SmC27r4hPeiZcs
 BR9XV3CMXAb3WC6XYG+FeFZiEdajauvFBBRE12NGMtzc547WvaA/9DYrz9/AgfDu+LB2
 7txhhwQ50Sfhkt+7+QkBi1ehYK4H2UWeQXzuD9iBDQrCANbL3eS0JdN3a8OMvzcvoIL9
 Q9vg==
X-Gm-Message-State: AOAM533g/GC0DA8xkfnAIwS2m62GAEOQm0ajmpWwDQUbkfnLJCzsj/0M
 ymThb07A2nj5WdA3Ak0BTH1hYj5MyAxXLnudloU=
X-Google-Smtp-Source: ABdhPJzyAV6hcirGTfopAi5t2oKVXclfJJBFKcRP9UOMftdSaUhg/5nzA/QIbd585iWLWgHLkbqFFf05XXoGq67+v3s=
X-Received: by 2002:aa7:c915:: with SMTP id b21mr61063698edt.195.1639382427393; 
 Mon, 13 Dec 2021 00:00:27 -0800 (PST)
MIME-Version: 1.0
References: <20211213070330.3351505-1-rong.chen@amlogic.com>
In-Reply-To: <20211213070330.3351505-1-rong.chen@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 13 Dec 2021 09:00:16 +0100
Message-ID: <CAFBinCCr9RQReHOJbb=spcVRxM0aRo=Z3YMz_zxA_qiFBDzwWA@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson: initial ocr available by default value
To: Rong Chen <rong.chen@amlogic.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 --to=1131046452@qq.com, 45581586@qq.com, linux-mmc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_000029_653974_A08CEC9D 
X-CRM114-Status: GOOD (  11.03  )
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

Hello,

On Mon, Dec 13, 2021 at 8:03 AM Rong Chen <rong.chen@amlogic.com> wrote:
>
> The patch will add a value of ocr supported by the controller,
> to specify some of voltage values are supported.
Can you please share some details on this topic?

We already have many boards upstreamed which work fine without
manually setting ocr_avail in the driver.
In general there's two types of boards:
1) boards where the regulator can switch between different voltages.
One example is the Odroid-C2, see meson-gxbb-odroidc2.dts [0]
Here we specify:
  vmmc-supply = <&tflash_vdd>;
  vqmmc-supply = <&tf_io>;
&tflash_vdd is either turned off or at 3.3V when turned on.
&tf_io can be either turned off, 1.8V or 3.3V.

2) boards where the voltages are fixed.
One example is Radxa Zero, see meson-g12a-radxa-zero.dts [1]
For the SD card the board uses:
  vmmc-supply = <&vddao_3v3>;
  vqmmc-supply = <&vddao_3v3>;
(meaning fixed 3.3V always-on power source for both VMMC and VQMMC)
and for eMMC the board uses:
  vmmc-supply = <&vcc_3v3>;
  vqmmc-supply = <&vcc_1v8>;
(meaning: 3.3V always-on power source for vmmc and 1.8V always-on
power source for VQMMC)

With the information from the regulators the MMC core will
automatically detect ocr_avail in Linux.
Or in other words: your .dts may be missing the link between regulator
and MMC controller vmmc/vqmmc.
Can you please double-check this?


Best regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts?id=2585cf9dfaaddf00b069673f27bb3f8530e2039c#n354
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts?id=2585cf9dfaaddf00b069673f27bb3f8530e2039c#n333

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
