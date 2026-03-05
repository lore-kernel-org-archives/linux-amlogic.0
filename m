Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB56F30924
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Mar 2026 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KlI/QzEEjJMGopXNU/K86Gd1g23DRxIkDoxl2ibWYHg=; b=23a+ZVCtJvMvCi
	kTMKJE08KO5QVl1Odd/UsyDXn0hq5jtRTPICvbJaQtf6DtdjviRtbF/gyI1ZOWeiDuh+sInkyXl0r
	4z2PYokyl7EqrEnxTs0wNYe5HhNtP9SptBDoRLZf4nQqqkbU0t+FkFfUC6e8sHRN/KrWG9Uw3zmKY
	ccBSurLL4GkA+eLjqEHmifSd/iNs90d6tpHTbir701ucEBysBe90TpSuxtPJL3UQ6US1vl4pxBsQx
	NEP/Yn3rBJe6+JtUVIX22Br7XZ+AG03IHQghmSjHnpwFNacUQ65TKg1naHvhYmpcyrNBImrIbGDrG
	6SgsBME1YkHtZ+0tmSaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5R2-00000001TZ6-3M85;
	Thu, 05 Mar 2026 09:56:00 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy5R0-00000001TY0-271m
	for linux-amlogic@lists.infradead.org;
	Thu, 05 Mar 2026 09:55:59 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-56a8a20e6e6so3486927e0c.0
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 01:55:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704557; x=1773309357;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cg9EXYcydfZ+ulIjzuaopPgTp0XFzaHPOEgk/rgt7WQ=;
        b=AyOO8NUth4+e1UxJDepKyme656NJKyW7HXbdhZKexhmT9n7wWEWXMFQt4ls2YKAlMo
         kBW5kkmyWG2oN2Zm/DKpzTHGx/lM+kL6uczW9VLDyi39P4+VzUk4B96g7cI8dpsis4+o
         /7NM4qOshzV+y0fvGQ1zGm4k/nW+cxpDpv022WCgrY0H3HaqmsHuyZU0C3T3iGu/mu/V
         gLzUPc5Sk1KaoVoMi1ts2Gua1HjUspob9ODJlUAE8NTtR0jsFeDyzAFx0V5azGNWRi5/
         NZ8McR0rZbofQeyQZ+irv0Cqw+q4GNmBXb9ZUvgxRkl8iP5eSaI2kTORN47EFRKMv0MF
         4FeA==
X-Forwarded-Encrypted: i=1; AJvYcCXZJwbDJyioev2hyHpSnCtMyd7KGM7s2JjaJ7qzMp+rIaltuFcxPGn8QpjvpDDHI7xStPnkeJ8fUdT81D4c@lists.infradead.org
X-Gm-Message-State: AOJu0YzhiX8UIFoPrB3LU2PhRdcg4KT5l4tbWvMbibDuUbVsBx0da3qX
	UmyfXi82SMz3+mKK32/auChTGaeDNH1pvKJwPF4x0esaFQMsS+E/xVzcQdhD0kXG
X-Gm-Gg: ATEYQzw+NDb2i6NYMZlTpM9Cv6tTf814/P9l96mQAnmXK/V1INGzEM3CM3mgHJFTgMb
	D8/eStOw1dZgA55Xox2oEv1C6ZkbX7yCIGMOSkFp/seOeN012wz9CqA/QUY4AX2Q1yXCbwjpeQu
	Ea1tERvcOiGYodbL0OQA2n51ZYJeHv/jRz+M6k1wfya5+y5BqSoyeX9xCIMh0vZh29T94J0e7fj
	/RoqXTcJxlXlfRE2NRAzfe4LNGEfe/Xz7sdkVO92hv071ah1u6yDti8Ukyhnm9M6orlHreM71WR
	QYuc1BaLQjgr1twPBj3eEQuamQpVAmrd8wwliN01V74OrRXxCV90l3uQtEzDmzIONK6QTpUNqc9
	l+vLd0DNqkFSvLDDZGPRgJE2cwhwnSwjdNSh+2MNq1Tk1FeFMfiwSErxu4uhyTDHhWJQUZyQdDz
	1R0vQbtvEAkoq+fUdBO8xHR9Ak8hgmLiIei3wK+jvdZRzbn8HzO47uULkv9faZ
X-Received: by 2002:a05:6122:7d3:b0:544:93b6:a096 with SMTP id 71dfb90a1353d-56ae760b4c9mr2242232e0c.8.1772704556992;
        Thu, 05 Mar 2026 01:55:56 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c7ddsm26134748e0c.3.2026.03.05.01.55.54
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:55:55 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94dda16ff9fso2351409241.1
        for <linux-amlogic@lists.infradead.org>; Thu, 05 Mar 2026 01:55:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVpMRecAlP5simfhRf0YuEgVqIEYhMSm3ty7EKCBVFvb1ojuSPGL1H5x/BkJom4n2KQMrpCWLlRWd4hiM9r@lists.infradead.org
X-Received: by 2002:a05:6102:26d6:b0:5fe:c4aa:10d6 with SMTP id
 ada2fe7eead31-5ffaaf7c9f3mr2333684137.34.1772704554695; Thu, 05 Mar 2026
 01:55:54 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772643434.git.geert+renesas@glider.be> <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
In-Reply-To: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 10:55:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
X-Gm-Features: AaiRm50TZMfTdXxkme8-hNv5QLySSNWDLayLbCjX-hPHmdjBiItNwF_qP7aR9JM
Message-ID: <CAMuHMdUCqozRx_WJesymXmP_PYo4Bf=oed=4fXycVOVk5g8D4Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <treding@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_015558_571565_13A6A8EF 
X-CRM114-Status: GOOD (  19.10  )
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

Hi Konrad,

On Thu, 5 Mar 2026 at 10:33, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
> On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> > Unlike older GIC variants, the GICv3 DT bindings do not support
> > specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> > series drop all such masks where they are still present.
>
> I'm having trouble finding where that's used on pre-v3 even.. does
> that actually get processed on the older iterations?

I had noticed the same, and had asked maz on IRC.
His answer:

   "so far, we have never seen a GICv{1,2} system that didn't have all
of its PPIs
    connected to the same set of devices."

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
