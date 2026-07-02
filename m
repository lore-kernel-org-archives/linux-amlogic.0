Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63FC1C43602
	for <linux-amlogic@archiver.kernel.org>; Thu,  2 Jul 2026 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8mhgFDD9MRw+dhjqbhF/90oYtJcniMPyo26f6yp2Oc=; b=wkZUyuA3M1bmKf
	Y7YNbhds14JAGTq+cuK81zBvFf2HUJ4nOWbTtuY4BAvoFArqGHUj/teIPedOrdjGJjD6HX8HjdLJF
	C8DnkxB5KUg3Iif0A7XNs7gJeX04lxaE1/1D7aRIBFBsY+BZCuLXb2DEnzoseJrwZcUWYADDUVTRM
	mePwL8lnNxV5vG4ZhaeC9GHuZ0yVImzAMZ4nY7up3qG78l5j4uZlH2mPSk7czaKbtLzidUW8m1pyO
	tzUfQ5cvzhTiM9cXGm4y+FncFpXLnnNYpAV4wxr89w1OWc7zR8n1zbsx8jBjVb5eYpv2Hp7Et3uua
	kDc5zyHhwnuYBnf07MWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDcY-0000000402j-1Qe7;
	Thu, 02 Jul 2026 09:22:10 +0000
Received: from mail-pl1-f180.google.com ([209.85.214.180])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDcV-0000000400z-1CIJ
	for linux-amlogic@lists.infradead.org;
	Thu, 02 Jul 2026 09:22:08 +0000
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ca1479dfe0so14600365ad.1
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2026 02:22:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984126; x=1783588926;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w3iqz34neGUxAgVEYrpwzzcpe57aRQt9k5cgKzpkuWc=;
        b=i+HOiLrF542NY4c7NtJbfWAFNGpAqs0P/kRXUTrSSATv1OhFqh0z3FvY4AZPWQINe8
         aRtC4boE2uvBYnjCefpN4u3ieFPRZvxPNmSgxYwUOLhNd6aCmUTHgd3JK1vc94mM2UO0
         9GAtcGHZI4Y2TNAssVWdqNwr1VKLrspRUD8VMjlTT6koYv+7hAtxZjMO8hSfn3pmCOKd
         R6PKOm8yuIuAvcXXsybLf9IhIVQLzwFyvKLa+LuUmd15TxzdK0mjKPz2wtq7E96VEkxr
         LFZ19b8Nat/CM9WnHWVQoDID8kZrP6U2R45RtOqfDtRaVcgnC6XJGPuZ9ZWv+3RZtnTM
         TMNA==
X-Forwarded-Encrypted: i=1; AHgh+RqUrV7624OnphjqqpOqPz0V3mRG6rrb5kYfKAOXr5JPCfpWR/S++dJglJtMhVLaIP10Y+D2zcXjwaBQND/P@lists.infradead.org
X-Gm-Message-State: AOJu0YzAL/l+rSRH54a5/IHj9IK+LU7jOT1I092tycdt1nxY3q4WBi0f
	kPyGgPdF4PnpsymPDkHFPU5Ba2MJxfpda5uHp2H1KvfiTMPs5DbVaPjgvbHfwJBf6VQ=
X-Gm-Gg: AfdE7cmPpWPZ8cO9NdmkTDQGYGy/RaLhQrcSSZYOfCfkec58DZPEpFCAsy9ACFKHcIy
	jatIrxm24yji2qQ11QkvKFQ+OGwZ1XWHay6MzTrId+ZtJJ6Tp4syEXA7ca2z/V31WIC+U5LzlAN
	QwdxHcTckoI6kPQpA8dZvb3bFrLAP9Tgh92JsODImIIZaoI1u3eEBm751+wGgofm6F4KRx9VACt
	Wk/QHqiI/x0hdFc3qFPtRNJZ+tkK1xCBdkcPOanOTAH8kR7FR5TssPzHEAx6OFI3bXds2ek21jQ
	721BlQGBGrM1+t5M8QwE2qECM1YTrkXzeOizPqTi5VKwDhk9asyu421sUSF+eYPGNg+kKbHURUV
	wsxf85ARVCvBE+KwtN+s+owJas350GhCbJE+rpQPsQbAMtU8ojrbr3eEB9wOOaIta4uF+D7mt3P
	bNFinMTBuhSblBsjxC9ecnlM7DWhZ4x0hf5gjPdf0Ltwmn6iFB25RpMN8OS/fuWNeC
X-Received: by 2002:a17:902:c94d:b0:2ca:bad4:33a2 with SMTP id d9443c01a7336-2cabad44035mr2408645ad.11.1782984126167;
        Thu, 02 Jul 2026 02:22:06 -0700 (PDT)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9a90b01csm10901275ad.26.2026.07.02.02.22.05
        for <linux-amlogic@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:22:05 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-845ea8924fdso1254786b3a.0
        for <linux-amlogic@lists.infradead.org>; Thu, 02 Jul 2026 02:22:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RozU7dumSVDZG7DfUI4V71bMIDOc5LpeXMhQTU6akydLnvpHWA0uMecv95XuQK9nfYl/DW3gbSmT7AAS5H3@lists.infradead.org
X-Received: by 2002:a05:6102:1620:b0:62f:46be:8318 with SMTP id
 ada2fe7eead31-73da7681403mr2525301137.6.1782983793184; Thu, 02 Jul 2026
 02:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260629-qcom-sa8255p-emac-v11-0-1b7fb95b51f9@oss.qualcomm.com>
 <20260629-qcom-sa8255p-emac-v11-1-1b7fb95b51f9@oss.qualcomm.com>
 <CAMuHMdXen+E-Ai51aWBa_KV9W8Fz2cQPpT-FG_kQ7akhrrYa_A@mail.gmail.com>
 <CAMRc=Me3jaZXiXa1sFXr=8Do4sCd+XN1pKTcWC8-0j78SjCkKA@mail.gmail.com>
 <CAMuHMdVUBgG0EFB16OxHisbxx-sBvDKvBPNZdpyDnmBrnX4ptQ@mail.gmail.com>
 <akOZFIowVvprnAMf@vaman> <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
In-Reply-To: <CAMRc=MfBcOhbj=ETxy2Xz9o_nyzykrEhKAc3jYi6V5_jMZEE3Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 2 Jul 2026 11:16:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
X-Gm-Features: AVVi8Cef5-UyxrfN1fWvFDcXcIwIbwhU7f5lsircbKpxY8MZwCT2oXalNKmt_xQ
Message-ID: <CAMuHMdXNG=C=XcioQUEN1M7cQgKhO0AxUyg5X+TWb2rQ3-H3fw@mail.gmail.com>
Subject: Re: [PATCH net-next v11 1/7] dt-bindings: phy: document the serdes
 PHY on sa8255p
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, 
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Radu Rendec <rrendec@redhat.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_022207_328234_D8685017 
X-CRM114-Status: GOOD (  28.67  )
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

Hi Bartosz,

On Thu, 2 Jul 2026 at 11:12, Bartosz Golaszewski <brgl@kernel.org> wrote:
> On Tue, 30 Jun 2026 12:23:16 +0200, Vinod Koul <vkoul@kernel.org> said:
> > On 29-06-26, 16:51, Geert Uytterhoeven wrote:
> >> > Russell King asked me to put the PHY logic for SCMI pm domains into the PHY
> >> > driver instead of the MAC driver where it was previously. Instead of cramming
> >> > both HLOS and firmware handling into the same driver, I figured it makes more
> >> > sense to have a dedicated, cleaner driver as the two share very little code (if
> >> > any).
> >>
> >> I think you are mixing up DT bindings and driver implementation?
> >
> > Should the bindings change if we have different driver and firmware
> > implementations? Isn't binding supposed to be agnostic of
> > implementations..?
>
> I've thought about it some more and I believe this question is philosophical in
> nature.
>
> sa8775p and sa8255p are *the same* hardware. I can flash different firmware on
> the same Lemans Ride board and it becomes one or the other. Yet they are not
> described by the same DTS and the bindings differ as well. I don't see why we
> wouldn't allow the same approach for the this PHY.
>
> We treat it as different HW variant when it's managed by firmware - just like
> we do with the rest of the SoC.

DT describes hardware, not software policy.

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
