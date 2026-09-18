Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93330C982D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Sep 2026 09:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1hR9SdAqX9xaGOx768ZGtxw3o4bo3zkVa4qPh/INAQ=; b=4BsZrZr39cY52F
	A6jn1oeGiEpzTGZvYOzNHHlKyA5Cgexk6Dh0REfwRZwtFOqTVOkNWUt760av/S+b1j3GeZR49OfM6
	E7rbXddkyTXW43SZbOUlBPLiAOrXI2jtJCaGLA7lA8tAqesR9DHB/u1gu9bChwdvy7q5ZJdLOMC0E
	lIPPfo3tRO72ZpRjiHsPvyk4QNdxbnvsSS+Pw9v6w8xFwztHXQbGj7MxmB4Jn73kPUzOElhUPjbGx
	rs5ut44DdOTSq536b+7kz9dLpEfTspu8pl42DCHJ7e+yc4OeMi6edUVKiw/2C363E37rdO30uhC26
	5pLBosJVJrL5iTXUI/oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VKa-0000000E11c-1n0R;
	Fri, 18 Sep 2026 09:56:32 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VKX-0000000E10U-25j2
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Sep 2026 09:56:30 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f635552aso415192f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 18 Sep 2026 02:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789725388; x=1790330188; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pwt6VmdbigODlTJ+4GTZarReJSK6366BuVdXf1H3UUQ=;
        b=nnhNJsdmd6HpG1uPS+ml+BXUJic9xrir2M/yEAG2XiRQvpOQPFTFNcLOvUiSYcW6oI
         0accfQONTmxbzbE49VLjjUOtHek71sBz7l+ny2mic67GFqTYApqmwxn+VjCAbN35bXWu
         DCyHjHceGRgthLLvz13ARu9XIR4TgFF6e+8Elb9h0jc+ahF3hsXDPxtafO8x9C1fFoVC
         jBi763Q3Gpiu9qXwj+KbuxiTHLffhTPLglP0OjilOwU3cUA+b8h54OJrLQwe/k5SGxWm
         bDs2JEm1sEO8xgtuau7b8OqHzK39hfOTIwzo09IYZvluPmokoOTPZ7AyyViy2rrsZpwX
         bKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725388; x=1790330188;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pwt6VmdbigODlTJ+4GTZarReJSK6366BuVdXf1H3UUQ=;
        b=BqWA3FIxGushVwXO76yldCsGBwyht40d76ZWgzsPyuACw7dzaaYjO2gst9HAsSjHmR
         3SzL765+MhxH/EXITWuBsQONNgClIEPid0HN7H9pSTjTIGAWh7enJHu17c+MdfA+yWQk
         rcEKJxrUZC3P/uaT9cQUt6gpYRDsS0qHmEJEZoqYJKiAYd/fClvwOvoRlPx5fCvRU+a2
         VXBsj6MGDTVzP4K3vgrGd6VgWOaeLfJC0wB3PeC0n9/3L8db/sLNzPYqgvuXSnLG7n2s
         HjVdW1hL1Fn41IrBlQCNOKzdc0x3pnhS5Aj+cV0184cnTeFBKpQ4g4+K7VQAG87HJSml
         1Vyw==
X-Forwarded-Encrypted: i=1; AKwUvBw2NE2urBUMDwAO62MA6sLK41ZBVqnxBAc81Ft3mAVTJsXrHvuwkc+ToPg/m+gmWZ3RXQIK3fI0h6IEIUrP@lists.infradead.org
X-Gm-Message-State: AFuF++npJOl962p3iHbuMRtLy4fyGmtw7fwKpydtPgaS8j5UeA/XdS3D
	oc3eP8g1zHRNsPsLJ2RIn3JW/GLrMplWIhP5wbpIWRi257yaeDw1XZeKpxjSnr6KI70=
X-Gm-Gg: AYBFou0NI1iYLwvf2qaTq78Ht/7tZ4k+/tjcq6DSYxZG/Zz8o8eAzKTEfoUVmy9qPTF
	IELzqRnIEbKWSPwmZPditVOy7oac/CfaqErg5P19NWNXvBtSiWLyGQUnBqODOIzUf4337AbpajL
	Rvo1wd7fiY0yresDVN33CujCZTBO+zOj/zLPtA1qenVI6t9DUGY0WunxIrLwktv8GgFOZLfUyw/
	8Zk2NlKgl0NtQVR/W+dW9VXUk1n3OwZnEwD06SdyY0FHDgNpdA+mVignjrxWPsEDCNcfawlk7RA
	uxz28d1G0FwAaO7y4SsuhKSnk0dYTdrgDviDmim3gs+ZAzFtwzqLac/8uk/ErYLbSTp51o3iW6f
	V4oadx94Fx2vGNTNQlZDJrgVWZCcwHyRK0OcZIuTMqH5kE9xYcW2wQ6ns2ytfb4n2DXoMvwXRK2
	ggeSocuIaIa2qzaS+N69pXrj2CV5/Ocq86ujgmUOyymygPmQo0pgKHKvo4y1wM+a6T1e1sljc=
X-Received: by 2002:adf:e011:0:20b0:487:219e:5e20 with SMTP id ffacd0b85a97d-487219e5fe1mr667041f8f.51.1789725387833;
        Fri, 18 Sep 2026 02:56:27 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872008fe3csm2829597f8f.37.2026.09.18.02.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:56:27 -0700 (PDT)
Message-ID: <7da24c37-3f6a-4a85-a06c-3d587f6ed4e5@baylibre.com>
Date: Fri, 18 Sep 2026 11:56:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: meson: aiu: add I2S Capture DAI
Content-Language: en-US
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, linux-amlogic@lists.infradead.org,
 neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
 <20260917-audin-v2-4-38de4bc1de34@baylibre.com>
 <20260917212019.4ECE61F00893@smtp.kernel.org>
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260917212019.4ECE61F00893@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_025629_556598_7F640837 
X-CRM114-Status: GOOD (  10.92  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


> 
> [Severity: High]
> Does adding this capture stream introduce a permanent clock divider leak when
> hw_free is explicitly called?
> 
> Now that both playback and capture streams can be active simultaneously,
> snd_soc_dai_active(dai) can evaluate to 2.
> 
> In sound/soc/meson/aiu-encoder-i2s.c:aiu_encoder_i2s_hw_free():
> 
>      if (snd_soc_dai_active(dai) <= 1)
>          aiu_encoder_i2s_divider_enable(component, 0);
> 
> If a user opens both streams so snd_soc_dai_active(dai) evaluates to 2, and
> explicitly calls SNDRV_PCM_IOCTL_HW_FREE before closing them,
> snd_soc_dai_active(dai) remains 2. This skips disabling the clock divider.
> 
> When the streams are subsequently closed, the ALSA core skips invoking hw_free
> again because the state was already changed to SNDRV_PCM_STATE_OPEN. This
> would leave the clock divider permanently enabled, potentially draining battery
> or blocking system suspend.
> 

Oh, this seems to be a right claim. I can use 'ts->clk_enabled' for this 
and gate the call to 'aiu_encoder_i2s_divider_enable' based on what both 
streams are doing.

Let's wait a bit for other comments (if any) to show up, then I can 
prepare a v3 to fix this.

-- 
Valerio


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
