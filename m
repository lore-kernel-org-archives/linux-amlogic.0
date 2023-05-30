Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D04C7EE23
	for <linux-amlogic@archiver.kernel.org>; Tue, 30 May 2023 16:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:Cc:To:From:References:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9HZHqugShuoiC1P2yUvBtM90yykduRjY5NtiaUyZwI=; b=zBhDthByzLn5Te
	aNLf451bvIa4xkjdhsBnIMS24yKOYJhxkRuS8lEkpakS3m4K1iqGXwAVgZA0eGZ8wYpn9jBkchBaw
	BUQnu7/4npBwTYYHpE2fLDrbPU02g0x2ANmd/3XQHpKazM+GXRlTf+aVBiHIOgYBYKu/cAFWHH4C3
	PGRh4zD0HCBs9ij5yAPklPnIrgWJO5/IZhzTHJ5ZmR8OvyWlocHCOQSVCjlDiPskAYNJV5/Nzxo4L
	BUP/sd7HCo473suk0cJnKMGyXr/ORE8jhTv9ETdMq37OY6kslCp+hHZ0TjwGwixJCfQJgLxcAWwTM
	h+ckcdxwVn0wu46+dLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q41zV-00EXFG-1D;
	Tue, 30 May 2023 16:14:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q41zS-00EXCp-0D
	for linux-amlogic@lists.infradead.org;
	Tue, 30 May 2023 16:14:32 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f603ff9c02so33218875e9.2
        for <linux-amlogic@lists.infradead.org>; Tue, 30 May 2023 09:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685463268; x=1688055268;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:from:to:cc:subject:date:message-id:reply-to;
        bh=8E/XALJcqXkwZP5gRRQxOrP1E6GYgsvl1mdzFrPwoHs=;
        b=j7m5TLNGHYPks/DB5NwpJEaJxEUZvnwmAKhmJYFtmqFeCgOHe8TS50IiAFQL2HcLgq
         lM7rpvgWzLPAF2PY6LDDwM+Ga+MCp4PWHjlq7IoaCp0mQytpFLLwlWqJW04FEdagUmh1
         5F5WPw8m/NgBWnJ7Nlj+Y6b95Qp2ZvzXWn9jVPme1qcq6vYBxnWUtONnLfZ/2sDty/i2
         lI1Mz/lSVzybNmw7d+ig33KtqN4Tmb7TGgXwql9s0F86XgS906kfLIhMAmD3OiOoOZK4
         9jJb5VblFBNf9mKmyd9FZKKovWKueEBnzstsZUeIWoH9XIp6thMxkGUc7GNJRDbPCIc2
         JlPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685463268; x=1688055268;
        h=mime-version:message-id:in-reply-to:date:subject:cc:to:from
         :user-agent:references:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8E/XALJcqXkwZP5gRRQxOrP1E6GYgsvl1mdzFrPwoHs=;
        b=W9eGyn/6g6tO/oxOipym9HlOhOSKgo7l5TfqjQSeMABQjwy3Cla/izPFQLgWvqkf5C
         aOdxwqDApkC77fbuvTJQzGWjNBtTkME01zZsMxBHvcpvS+c0nlg7w/KnNaEJE6DSbGpC
         pr29bk0c+9UVsf5RApvUO2uZI94Kpx64YnfrLK8lu8Leqri+/oWVnTwS+0Nl5kzyRj2r
         s31K/V9N1rv9qdwdVDkR45JOLeiWrjnfolveE8p5RVtAjezCX9+Mne+Mrvtrd3fr6rhG
         nFnoRbrnUOhTSaYnVPrs66Vw0cYXq8+3Tsx783Ebc19pXqsEaqvSjLqIWfotWw+TNz9a
         jiBw==
X-Gm-Message-State: AC+VfDw6gpqAT/JnZnKO0CNpLqqZEEXQUdxNpHfjsPiiLhmufEUF/8ky
	bgzciAuDIqeGM/GLClgpOcGvug==
X-Google-Smtp-Source: ACHHUZ6WWApvC/NMBiE72EVqrmA/84lk/cV8yiAqD8+jVocG4E4+KuL2cR+91Sc1Wzm58YlqYiG3DQ==
X-Received: by 2002:a05:600c:2214:b0:3f6:2d8:4823 with SMTP id z20-20020a05600c221400b003f602d84823mr2080466wml.3.1685463268024;
        Tue, 30 May 2023 09:14:28 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 8-20020a05600c024800b003f4e8530696sm17729719wmj.46.2023.05.30.09.14.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 09:14:27 -0700 (PDT)
References: <20230517133309.9874-1-ddrokosov@sberdevices.ru>
User-agent: mu4e 1.8.13; emacs 28.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, neil.armstrong@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: jian.hu@amlogic.com, kernel@sberdevices.ru, rockosov@gmail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v15 0/6] add Amlogic A1 clock controller drivers
Date: Tue, 30 May 2023 18:14:01 +0200
In-reply-to: <20230517133309.9874-1-ddrokosov@sberdevices.ru>
Message-ID: <1jilc94x0d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_091430_319549_60141259 
X-CRM114-Status: GOOD (  15.75  )
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


On Wed 17 May 2023 at 16:33, Dmitry Rokosov <ddrokosov@sberdevices.ru> wrote:

> A1 SoC has four clock controllers on the board: PLL, Peripherals, CPU,
> and Audio. The audio clock controller is different from others, but the
> rest are very similar from a functional and regmap point of view.
> This patch series add support for Amlogic A1 PLL and Peripherals clock
> drivers.
> It blocks all A1 peripherals mainline support and a couple of patch series,
> which were already reviewed and acked, but weren't merged due to pending
> clock controller drivers series, e.g.
> https://lore.kernel.org/all/20230418111612.19479-1-ddrokosov@sberdevices.ru/
>
> TODO: CPU and Audio clock controllers are not included in this patch
> series, it will be sent later. The following clks from these controllers
> are not supported for now:
> * Audio clks - vad, mclk_vad, mclk_d, resample_a, locker_in, mclk_b,
>    pdmdclk, pdmsysclk, eqdrc, spdifin, mclk_a, audio2_toaudiotop,
>    audio2_tovad, audio2_toddr_vad, audio2_tdmin_vad, audio2_pdm,
>    audio2_ddr_arb, audio_audiolocker, audio_eqdrc, audio_resamplea,
>    audio_spdifin, audio_toddrb, audio_toddra, audio_frddrb, audio_frddra,
>    audio_tdmoutb, audio_tdmouta, audio_loopbacka, audio_tdminlb,
>    audio_tdminb, audio_tdmina, audio_ddr_arb, mclk_c
>
> * CPU clks: cpu_fixed_source_sel0, cpu_fixed_source_div0,
>             cpu_fixed_source_sel1, cpu_fixed_source_div1, cpu_clk
>
> Validation:
> * to double check all clk flags run below helper script:
>     pushd /sys/kernel/debug/clk
>     for f in *; do
>         if [[ -f "$f/clk_flags" ]]; then
>             flags="$(cat $f/clk_flags | awk '{$1=$1};1' | sed ':a;N;$!ba;s/\n/ | /g')"
>             echo -e "$f: $flags"
>         fi
>     done
>     popd
>
> * to trace current clks state use '/sys/kernel/debug/clk/clk_dump' node
>   with jq post-processing:
>     $ cat /sys/kernel/debug/clk/clk_dump | jq '.' > clk_dump.json
>
> * to debug clk rate propagation, compile kernel with the following
>   definition:
>     $ sed -i "s/undef CLOCK_ALLOW_WRITE_DEBUGFS/define CLOCK_ALLOW_WRITE_DEBUGFS/g" drivers/clk/clk.c
>   after that, clk_rate debug node for each clock will be available for
>   write operation
>

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
