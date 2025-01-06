Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE03E77188
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SIEijzjRVG6tGB+UC5XenI86gAUEa2QkGVrfTRZ/1D8=; b=ZuHZ/rM0kwO0QX
	yfsZa+Cxi1qhBSG1gwpigbIoklxufECc3VwYTD8akpl4uUq3oLOIeIVxkY8wNaUAB9rIVhOH0Si+L
	uElB+m7VJPYP9FswQqDC975Nal9lAt9/foSNUI5EvVEQ+wxx6mx2nr4JR+kxCdzT4Oa1JMUCjzGsw
	BYCBvQJHcfykMDSP+/5eBKQyjzDyI4XtIJu2zjicYUfgmbYN/g9HvMYWo8hdMI/0lbq4IeJlB6DH+
	ULBu4ZeYwaoIfSCR8JFLvoxtjmrCePCNOO3pKoxFd4w02rmRT0/IxzKDpT3EgC+D7KE6+hFNGCC/Z
	Q04ON18lP3o4pMF4gVdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoM3-00000001cnW-3JHT;
	Mon, 06 Jan 2025 14:45:19 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo5u-00000001Zfb-1hrw
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 14:28:40 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3862d16b4f5so8918757f8f.0
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 06:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736173717; x=1736778517; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c91yJOlrCLVePlwLxdpALuqEbbz5CUd+3wU+nXgA/qk=;
        b=gr5NGmX1ncAPGeFoSqctm7Ygg2Q8c2BB2ktZLXKyUI2vwoIuIBuF4qGhE1cc4mWz7z
         7Ly0elXGQnr8yO1txEfRRiZ35T5H8YRu6Caawcn1jgnDux2ZkEzZBOeoU9O6df8bs+V2
         41i5vMWTuTtsnuTKYA73GTda/j69akupakT36FLmB64Md2FofLCmUJuFjT3mWBZk11nd
         Owxaqm5TIRvucuuaEbyWSK7XXxsazWfw5HJhAHUhxdcvLhXO68HreHMj1EA7LN2c6sSC
         +1PnwvJEWhQlOmDuHXhyzM96vJrWJ1Lp6g0Dn3fmzZCTRV0TZTWAUYwbWmv9b8i57itb
         Xdhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173717; x=1736778517;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c91yJOlrCLVePlwLxdpALuqEbbz5CUd+3wU+nXgA/qk=;
        b=qQoIBlqwD49FnPowoMN2QHm/VZAtX26ENmZGVQISIfNlMF4W/6Nbx5+H2ykVfEb5Vx
         giyK3iSt+d2da90FHjQRMazmYqn06cqgEnRg5ztPncaDaV0xVReZLW1DYVyRtoEshdVm
         bDzFBbeviCOcEhGuSvMAHktdyu21SxaFmnFDMkkHVcgGt0Qdlz7iQOzlJ/2ojoQWKJNM
         hAKtDNxAev8sTH3fk+RiqIyNj4SQynUbw7zcWVOLXPYRl8NKdP424OAL3a4kQZ0AYRVH
         8pKhh/c/8OnWJ3GvrXS9CWjeNel90/UakzX7DtPld3iYIS785x0fTWcDxt+EK4+6Sibr
         1GzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVic532gB+p9aQyMY78Xyxax5gg4TY0IzNhMs4qNh1EBB2TRT7K9QQyExF/mK22i3TwWasAYrMYTfXGZhh7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyukj/hSugsDczq6lNQfRlMkgVUl7Z5KCWtB7tzzqkhlwgSDCvj
	AD6FsDDt8poWh5kWt80Lr/ekysg1JZUqE4A8dQHpUroptnn/hqxs5kilCTHjkco=
X-Gm-Gg: ASbGncsK2Nasrue/rlDHYVIZsddDy13G6G1Fodx0agCf/CZiO2ZF+Tyt6turbxcuxHe
	llGg8u8QhcDtmGMZfR3aZ5mV9TtXwyt+uICpPovJ0NkAfC2P8EBLBmkB+oKa/QDGeXpdW64m4Cb
	3wD3xgmro3Zs9Dv+30DeCxbjuQSsQUsfyjnh5Ml3krcRuEY1PlPKk3/ZaOicUlfBR7xe08XJOM8
	vrhjb+np0fywtt3Eye5ijDZU/9M0f+++yJGDl2mKSnlbR2oW/O3xyDA
X-Google-Smtp-Source: AGHT+IEmhPoHQlfS8R2V6q1qOrsCqIouaOZwP7XgeuLkAOs1MO2g84lb5Tcu2XuCg1CN2bad/NfJPA==
X-Received: by 2002:a5d:6d0f:0:b0:385:faec:d945 with SMTP id ffacd0b85a97d-38a22a117c4mr45665927f8f.9.1736173716705;
        Mon, 06 Jan 2025 06:28:36 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:2a4a:e041:e2ff:6b41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1fa2bdfbsm47230712f8f.102.2025.01.06.06.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:28:36 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  s.nawrocki@samsung.com,  lgirdwood@gmail.com,  broonie@kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
In-Reply-To: <20250106141316.375984-3-martin.blumenstingl@googlemail.com>
	(Martin Blumenstingl's message of "Mon, 6 Jan 2025 15:13:16 +0100")
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
	<20250106141316.375984-3-martin.blumenstingl@googlemail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 06 Jan 2025 15:28:35 +0100
Message-ID: <1jy0zo9fu4.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_062838_706405_C2A2D21D 
X-CRM114-Status: GOOD (  20.57  )
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

On Mon 06 Jan 2025 at 15:13, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Codec driver can implement .hw_params and/or .prepare from struct
> snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
> callback has been called.
>
> On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
> (sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
> codec output because further digital routing is required after the
> backend. The new DRM HDMI (audio) codec framework (which internally
> uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
> of the hdmi-codec to be called. Implement a call to
> snd_soc_dai_prepare() so the .prepare callback of the hdmi-codec is
> called on those platforms.
>
> For platforms or sound cards without a codec-to-codec link with
> additional parameters (which applies to most hardware) this changes
> nothing as the .prepare callback is already called via
> snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
> dpcm_be_dai_prepare()) on those.
>
> Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for working on this. Overall it looks good.

Not sure if the call the .prepare() should go at the beginning of
POST_PMU, as done here, or at the end of PRE_PMU ? 

> ---
>  sound/soc/soc-dapm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 99521c784a9b..ac8eef217dc4 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -4013,6 +4013,13 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
>  		break;
>  
>  	case SND_SOC_DAPM_POST_PMU:
> +		snd_soc_dapm_widget_for_each_sink_path(w, path) {
> +			sink = path->sink->priv;
> +
> +			snd_soc_dai_prepare(sink, substream);
> +			ret = 0;
> +		}
> +
>  		snd_soc_dapm_widget_for_each_sink_path(w, path) {
>  			sink = path->sink->priv;

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
