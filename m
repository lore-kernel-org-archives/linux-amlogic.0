Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135B0CD98C7
	for <linux-amlogic@archiver.kernel.org>; Thu, 11 Jun 2026 08:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6+sWvUlKrwFelU4FI9WnmCi4QI7NBaMFqYk2SKjiJ4E=; b=x1mrtd5Mq7Y/1q
	MIBdk46dUT6ENS6MhWt+ny+QAcL+q9d4kukCCY6DFuLQK9sZTUZOii4TWyg1b/hxOxte0UcF1GKZ0
	SK56A6jWL6qAGMBr/RliGKc0ALywMxLypFYBEE+bLY2U1ooAZf0nmenu8HChGsnIddjYlA8GtY5QE
	MBlTtwV/zPuGBkAY2EVwCIxuFjzvT62urgGmFdLTIPRkjqN6GnHkyN0PtN44RIaT8jQpeWfJ2zBl4
	LQOc5w0xTs3byQWs5tMxCi59i+YMinIO097D1YqVAkb4mr2OWGxfTx1yf+opRUSR86w6XjRAt5lxu
	2O8+hz3XIgaAjj8o3w6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXama-000000090t3-0uyw;
	Thu, 11 Jun 2026 08:29:00 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXamX-000000090sK-1TQ2
	for linux-amlogic@lists.infradead.org;
	Thu, 11 Jun 2026 08:28:59 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-460166910e6so4048205f8f.2
        for <linux-amlogic@lists.infradead.org>; Thu, 11 Jun 2026 01:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781166535; x=1781771335; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q+GZxQR0zVGYyc7t6dGL8c2RABIohdt9U+GPG+DCKw4=;
        b=Y1Xv+SaJ+nHtHpAVwu9s3AlGb4ludH3gsHZ3LMJzBja8qJGs+m8vXUdR1OZ6+3Pt9e
         7smCMcxXU6gSGNypibXl1yB1jGVswJMSYNIN+aCm/qYjWB1G0jHym/rRxWIiOcQEC4VI
         QpOCYUu4qoVGAbrmMHVx+X8oLDFcnIV/SZoZK69LHoh7aFQHY3llc1Ii2rhj8yWyBThA
         AKrPRkDI1oAvZ53QgVuY+rFZ/VSMtk+XMTTyLiasdiWPStAmcveyCfbFLswlWHMjxBit
         A4FsoIpuvM4scYXYt/HOJrRgcaqb0Fm1P+MH4BgjqSdYCGicOchRsmvyJc6zn0pP1CXw
         xbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781166535; x=1781771335;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=q+GZxQR0zVGYyc7t6dGL8c2RABIohdt9U+GPG+DCKw4=;
        b=U+p2wdMlPdFJ79PPmZWHX/GYJQfRTNyBONcK/Ti/AOcAsnhlJghDgM8Y8kN06La22N
         IanHZA9s0j8aLvC3NiGwL/jRT0BvmeABT9pbCOGgwn1C322WnuTawSTbZ19R9kwRm+Pd
         uxkEj9PT3trxLOfBtBvB1HDl9/cWQdVUNd49G+aSbhOcltOFGbUdkUYXEYmyMRcwLIki
         nOmIMElgTk/T4y17VIfFmzz18W04OY3pADB6hc+TQI23RoEASyu0PFtPKdOlNY3xiV2J
         otyKXxl7GsTtLuTpGLt3iEmxs3ALIQ9WzGDhcndO4JV7AhJSjUbMIznFQZLRyVbTnOQ+
         i9kw==
X-Forwarded-Encrypted: i=1; AFNElJ/8AutnQt5e/WisqueJbudbhnN/TAAPqfqNxr4QWtMTxyVie8FLNw8RU9FZuGYoeNWT09twR3Ox2l+PJIGi@lists.infradead.org
X-Gm-Message-State: AOJu0YxFjjLQ1YVHQuqme56ylU2dBpJQNMDuHE5IIkoLyFsGOes1VzeM
	/WOZHjJnX+qNlMv1dil53LCW86W6AQX1w/bFtpt/iHFal55uBePZlsZr20Ttar3pEVg=
X-Gm-Gg: Acq92OG5Ze+M0U8nYTWnMk+yv7iQXs5JZyr2jmeiic/1IHxs9p0JXFxLhclhzeG9aea
	5zrLwu1QgDEfphadxleOCXIj9eiVNjluif1cLuQzasQsNIh+ihmVflfkQSZJ7NPanRKQDgp5/uP
	MPAWhxCqcNQpbZzX6zAHdkvjOop8nJsRVXOyn3mrvQVE4f4wqg+eYC8+KbnALu8zLaS0hFjE5Gd
	BZUvf2+leZwLiZosD2TmfZWfuXn30kH/jH0Yb7aC3xcyaY6b7TevqJXqPC9PVAUSel0k2CPApWs
	jNp72LrXOYNy9G0UhmVSvRACzf9/L75VFebIpDzU3gDNU7JhabC25dbl/i8ytA/7tZElv9Fd3FF
	3R2o/uIdjf0DjFeseOUhGSs3G2cMmQsPh0Dc5fewW8g7w8+mE4W1WQhieZd1ql1F5u+/GoReSEA
	3Y60/vAl5y33YyO5B69C+CrwCTY7z/gKll
X-Received: by 2002:a05:600d:8450:10b0:48e:6db3:ff2e with SMTP id 5b1f17b1804b1-490e55dd891mr14395135e9.15.1781166535248;
        Thu, 11 Jun 2026 01:28:55 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:1d1b:88ba:5161:3581])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4601f35133csm75931032f8f.25.2026.06.11.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 01:28:54 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
  Jaroslav Kysela <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-sound@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 0/4] ASoC: meson: aiu: align I2S design to the AXG one
In-Reply-To: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
	(Valerio Setti's message of "Wed, 10 Jun 2026 23:29:24 +0200")
References: <20260610-reshape-aiu-as-axg-v2-0-cac3663a8b51@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 11 Jun 2026 10:28:53 +0200
Message-ID: <1jcxxxeb0a.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_012857_432661_B93B86B0 
X-CRM114-Status: GOOD (  20.44  )
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

On mer. 10 juin 2026 at 23:29, Valerio Setti <vsetti@baylibre.com> wrote:

> The goal of this series is to reshape Amlogic GX's AIU implementation for
> I2S to let it follow the same design as in AXG's TDM. Keeping the same
> design allows for unifying the two platform implementations in the future
> and it also allows for an easy addition of I2S input.
>
> The first commit introduces gx-formatter as the basic block which takes
> care of properly formatting audio data. Formatters are DAPM widgets
> (c.f. axg-tdm-formatter in AXG) which are dynamically attached/detached
> to the streams when the latters starts/stop, respectively.
> aiu-formatter-i2s is introduced as formatter implementation for the i2s
> output.
>
> By the end aiu-encoder-i2s will only need to handle interface clocks and
> enforce interface wide rate symmetry (c.f axg-tdm-interface on the AXG
> platform). Right now rate symmetry is not relevant because only i2s output
> is supported, but it will become useful when following patch series will
> introduce the i2s input part.
>
> This series was tested on an OdroidC2 board (Amlogic S905 SOC) both with
> HDMI output and with NXP SGTL5000 codec connected to the I2S pins.
> This series was also verified using "pcm-test" test tool and all tests
> are passing.
>
> Changes in v2:
> - Fixed most of the weaknesses found by Sashiko review tool [1].
> - Resolved testing failures with "pcm-test" as reported by Mark Brown
>   (thanks for the heads up!). I left a comment in
>   "aiu_encoder_i2s_startup" to explain the fix.
>
> Link to v1: https://lore.kernel.org/r/20260515-reshape-aiu-as-axg-v1-0-53b457784ff3@baylibre.com
>
> [1]: https://sashiko.dev/#/patchset/20260515-reshape-aiu-as-axg-v1-0-53b457784ff3%40baylibre.com
>
> Signed-off-by: Valerio Setti <vsetti@baylibre.com>

Nice work. Thanks for taking the time to understand the existing drivers
and build upon them !

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

Feel free to add yourself as maintainer of the Amlogic audio drivers, if
you fancy doing so ;)

> ---
> Valerio Setti (4):
>       ASoC: meson: gx: add gx-formatter and gx-interface
>       ASoC: meson: aiu-encoder-i2s: prepare for multiple streams
>       ASoC: meson: aiu: introduce I2S output formatter
>       ASoC: meson: aiu: use aiu-formatter-i2s to format I2S output data
>
>  sound/soc/meson/Makefile            |   2 +
>  sound/soc/meson/aiu-encoder-i2s.c   | 281 +++++++++++++++++++++++++----------
>  sound/soc/meson/aiu-formatter-i2s.c | 104 +++++++++++++
>  sound/soc/meson/aiu.c               |  32 +++-
>  sound/soc/meson/aiu.h               |   4 +
>  sound/soc/meson/gx-formatter.c      | 282 ++++++++++++++++++++++++++++++++++++
>  sound/soc/meson/gx-formatter.h      |  56 +++++++
>  sound/soc/meson/gx-interface.h      |  48 ++++++
>  8 files changed, 731 insertions(+), 78 deletions(-)
> ---
> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
> change-id: 20260515-reshape-aiu-as-axg-1dac9037cad3
>
> Best regards,

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
