Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8C7C02180
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jan 2025 15:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHInbO77Jw+zWkGT8/I8wj7vXc6MAs2QUrjB7EflMUM=; b=i6MdObP4JK9kYL
	D3mJ2M3K0TlAdNL4EmB89OFj4iExj++T3Q3BQbuqpTCFFi7Pcbx62+C2nuZaIkv8TWsrhfDgBkndv
	C1nIXVKW/kylLk01aGNNWWbnAz4wyUj8a2ZrmHsBFs7avUYs25tJsxyoeboP5n1b7AZYmZia0IdzQ
	ZM7yzyDrQj8faoKmpUvRA3xD6f8tx/F5KTXoP1IY6JS3Z/BiV4C9cJgyUkRMFVf9eBnjC4Vy/cHbn
	5URyMAFSTsoc5b2e2stHkfTLhhPcSz4uvDuQE7TNZ3JvvJrmUs44sn4amEnJ0vl59YZTCpLpRvi+a
	T1GEcMnwPCyqMRhyrAgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMUT-00000005fXF-0E3U;
	Mon, 13 Jan 2025 15:36:33 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLot-00000005Ull-0d0b
	for linux-amlogic@lists.infradead.org;
	Mon, 13 Jan 2025 14:53:37 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43618283dedso42074275e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 13 Jan 2025 06:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736780014; x=1737384814; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/0zkVo6BPZJsn/AYAHqf+tAnwEA7SioBWvb7jrwaXQ=;
        b=dVxBnueQtkwIeoeXXPmHAty9gt5HXZKAOss+XYmufM3T/r8dHFT93YHkdwBG/fZnq0
         poiUNdXys0IhN1S2vBkHApQN3XZosap0IX80rgHzgMfs82nRjURLjLdy9WTnj/niBFXE
         7HFPIfr9N9ztoiz5tX6qVs3JNOdmh9tKGsoolHZEF0wEfN8jWopmtvHpllAxol4D/ANN
         imWTG4YkSvbrveM3Vw5yC5pM7KLHyXL6BI5jtYavroLw1muLQxs6HUGRNki/fsoRCS/D
         rUJ3LIocD2chWOauL8lApjgOMP2s+SUjT5UUEWlYQpT8H4es1vbMb3sh40syUJxTGCc7
         vDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780014; x=1737384814;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/0zkVo6BPZJsn/AYAHqf+tAnwEA7SioBWvb7jrwaXQ=;
        b=wgwP7/d/n5zsh0eatXI6+D/OXht6ZvIvRDaEe2vtXYlwVGtWXllSWBEAyR6LMkjHLl
         Vk6cVOYBAygbS82FIrBeAkVRjyAMbLCa1342yXklCsWc8eKP1nzs3FIXanSjzww9xFRW
         GHRmPtTJyi+qXRjPWTBbf24thMq/MhhZ0KQamClRUm3js328jGjrZuNPmKWdKe8IOsRE
         4TKHYvX74pWJGZdsidLkhx45yyy4L+8uoRXhJ5JPyiar5SVfeSU8jrxuor+L36PYXl50
         yCrmjI5dr97zKVGlK6l9ZcgSjuJdLUd+mV9DzAgX7PG0BkJ/WJj+sqw8PlDqs2r/Bb7e
         hY+w==
X-Forwarded-Encrypted: i=1; AJvYcCUBLZHYItzv3ntmjcsPfQm5xi19n1MGupNldOvOhKRdDPWi71lCeLIpAw4NOKAlJuLoyB/GCniiSgT0gO3w@lists.infradead.org
X-Gm-Message-State: AOJu0YzEVBcyM0qHoQwgkS898XlJTjDDZlsc5k2T427A8y99T/Wb1KbM
	6nYoAQuKj88axC4BbcQ1XW7ypw0gIOqwsKvT/3aCtJ5V7qvmqQdgYcht9PXA8FQPyDDVGBrVmBm
	g
X-Gm-Gg: ASbGncvp3Qd+EDSYfA1H/0ZgmI5dzynezjVDJlLeyJY6VTvWR6CBjHmSQ+pZfpvgVu8
	ZO9TW5flnOzWp2+axrRv3pCJGtMNaEaXOL6iKaX4kkZ2xabDo6Tmqik7K+9503Chs/Sa9pjRWC8
	4s666JsArotYICBxKDMHwZIDjHAocnHmcAwfa8bcLjw6LVe2sDlImS0IBAMzpSpoVjRvLSptyj1
	vh+Yig+G+j8KxzyFChjBECpl8FTb71yHdtkQ+93JpN6ZXh/OlY8ozQS
X-Google-Smtp-Source: AGHT+IEJCTsIQ3wdP93WTDTAocTSHQepImiqan0vvXGCfqItYdd81SmU4Jd+TPG29liWrOItMHz9kg==
X-Received: by 2002:a05:600c:5ca:b0:436:ed38:5c7f with SMTP id 5b1f17b1804b1-436ed385da5mr144999725e9.12.1736780013786;
        Mon, 13 Jan 2025 06:53:33 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:9d2d:28cc:aafd:8429])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2da6271sm179682235e9.9.2025.01.13.06.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:53:33 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-sound@vger.kernel.org,  linux-amlogic@lists.infradead.org,
  s.nawrocki@samsung.com,  lgirdwood@gmail.com,  broonie@kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 0/2] ASoC: prepare streams on codec-to-codec links
In-Reply-To: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
	(Martin Blumenstingl's message of "Fri, 10 Jan 2025 22:07:28 +0100")
References: <20250110210730.705613-1-martin.blumenstingl@googlemail.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 13 Jan 2025 15:53:32 +0100
Message-ID: <1jfrlm934j.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_065335_187514_E7958912 
X-CRM114-Status: GOOD (  20.28  )
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

On Fri 10 Jan 2025 at 22:07, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Hello,
>
> the DRM subsystem has recently gained a HDMI audio codec framework [0].
> This is already queued for Linux 6.14.
>
> I want to implement a HDMI controller driver for the Amlogic
> Meson8/8b/8m2 SoCs using the DRM HDMI audio codec framework. Internally
> the DRM HDMI audio codec framework relies on hdmi-codec's .prepare
> callback to be called. This unfortunately is not happening on Amlogic
> Meson8/8b/8m2 platforms [1].
>
> Jerome suggested that this may be because of the codec-to-codec link on
> our Amlogic AIU audio driver [2]. He encouraged me to send this series
> to allow hdmi-codec's .prepare() callback to be called - even on
> platforms that connect it via a codec-to-codec link.
>
> The reason why this series is marked as RFC is that I'm not familiar
> with the ASoC subsystem and lot of the functionality and terminology
> is new to me.
>
> Also I Cc'ed Sylwester Nawrocki (Samsung maintainer) as codec-to-codec
> links seem to be most heavily used on Samsung and Amlogic platforms.
>
> Changes since v1 at [3]:
> - updated patch #2 to also prepare the source side of the link for
>   consistency reasons (as suggested by Jerome and Mark)
>
>
> [0] https://lore.kernel.org/dri-devel/20241224-drm-bridge-hdmi-connector-v10-0-dc89577cd438@linaro.org/
> [1] https://lore.kernel.org/linux-amlogic/CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com/
> [2] https://lore.kernel.org/linux-amlogic/1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com/
> [3] https://lore.kernel.org/linux-sound/20250106141316.375984-1-martin.blumenstingl@googlemail.com/
>
>
> Martin Blumenstingl (2):
>   ASoC: soc-dai: add snd_soc_dai_prepare() and use it internally
>   ASoC: dapm: add support for preparing streams

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Not sure the RFC tag was necessary, this could go in as it is I suppose.
Thanks Martin !

>
>  include/sound/soc-dai.h |  3 +++
>  sound/soc/soc-dai.c     | 27 +++++++++++++++++++--------
>  sound/soc/soc-dapm.c    | 12 ++++++++++++
>  3 files changed, 34 insertions(+), 8 deletions(-)

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
