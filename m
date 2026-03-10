Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25938FCC9A5
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2026 01:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1cZvar0NHX2V8IR9CkvR16WyTawWmuNolq/6MaOZdcc=; b=d4fsjtBXlyShiv
	RcqkSOHd9hpl5ucXG4npiLwZdrZYRikrUt0WBghOBtqH7zfMUTTSE7osQTt67j2aKBPH0D8/ahS1+
	c8z7PIoGENwz67dTD1kTPtkwfbUOf4xpvzUKEjg5bee8tB9jUCx8y8WEs4BrKP21i3qREkFuRVYSs
	Oqs33SkENWgZLhvQoSHtuOE7DAx1p8U+KfX8NmUaLkfyJDtmUIhy6vcVKSC5RZ5q9PIR01G1BnRDI
	anxN1ke/Lf9b7/87a+3fKd9oiPsWbaWcq/FNdPx3UC+idA6D6KzP0vxcvQDPZC+zo6t7cyGzXodUc
	CvZFUluqOQeC5aPukzQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlel-00000008RsG-0fnf;
	Tue, 10 Mar 2026 01:13:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzlei-00000008Rra-2vvX
	for linux-amlogic@lists.infradead.org;
	Tue, 10 Mar 2026 01:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773105182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
	b=YKqpgBRqzU6/woYLWvlnaDi48LqZXMvagw3mv3wZaH3qRByYY+qpfCc89h6QrMjttghwEr
	E36QisgUyR+a8xiodFb5SK6LQTRLzfI1N0T2HbTq+yPNKoX7NANAzUXlijCrng0ceKFmrL
	VU3O7BHLMx4IZqdnN/LLK5so2xMlFzs=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-xUHqT2VMN7m9BT_h99LF2w-1; Mon, 09 Mar 2026 21:10:47 -0400
X-MC-Unique: xUHqT2VMN7m9BT_h99LF2w-1
X-Mimecast-MFC-AGG-ID: xUHqT2VMN7m9BT_h99LF2w_1773105047
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a304f24a2so263085646d6.0
        for <linux-amlogic@lists.infradead.org>; Mon, 09 Mar 2026 18:10:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105047; x=1773709847;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTWcRe1uEdBcdV3dSWnFRmmQqhKcuVtF4VSklt2P5Ak=;
        b=r5BTErMuIB0+AqG1j1BP0F5Qw5CfFdQaQ2VmmgGBhq7ee8k0O1MKJGRcZ/toC6lhQT
         dlP/FOLl8P7HOI8Ai3sYu4LtJQ20e7AcFKUdFoQIbFPS6KbNlEwcDIwh6wdQ86Vwqs5v
         2AetMWhA7raO2s05QY/F3eWnY+RHiSetvpozvnTd9t3eaQ/NoGKlwa0CmccQb9xOp5Xh
         /f5o7E8dtCCyzXSuEC7G8hHNF9qpjARwcgNlCgPXz+/VBUXsOYXDlY3Ch3w1s9jPE8jp
         6fscu2qfQA4Zfm1d7lRNyISys46RDeKwfTkeq1lOWvgE10ECx95nKVCOWwfRtP0kzVxP
         LQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCXHc9kP/gCeY1GC/wz5g4BZRcKxeS+RDXYTnQjMa45OsLpKH1zoNor+KbJtDBHj1BaqSAOKfwc940x4D1aQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwWZOhPuExLZ1P6j+MKolZVg30YN0w9fLBRZRBId3V6AUAmO5HN
	FvFUvkC+R6K5KSw15YVhUWCWqShnHOCpMqlFbXwRRNc/zZp7e6cXw/0nRDTsxt7UgRdJ12/jOoZ
	kxyl6NXBp+FUHGEtV/qNO2Teg5QD8Ggbm2Gqwc2FKh0YYRDBHDYZFxARYmfCR85GbJtQlKB4d
X-Gm-Gg: ATEYQzwYe6YaVw6O96I8018aboEkf87m+rQsQiNr1QHaf9RdtNCkhqRaoVLd3i8x6AI
	RcszoQJpMy8bgosYyrgv4BwAnhDgnb5OI3VYcxwu7C7GtXl9W9FHbotyuOAhbmbhvKty66F+emA
	jiF0TBLRFOMB7nN9BE0KbRyEFna4Evnxp0tb111KEuugxtpiA7jv1wqHDDPYIGP/czrAmj0pVCQ
	3GEBpw6kOq4++aya6LA81N4cshc/LjKXmXccLsPkUhrEOsWeFuD50ZEtEMCguqy0nmpfZt4LkUD
	+kG6i8R/Mf5DKd41B5FeRXrawYMF7w/2+00OijcEEAbrK7o6XAxZ5+QwHwh/quY4GKPBgd5i7mn
	4jHnlBR/Buf7IdEYp59VWYzy0LD7VZAsJeNqKUvP7eUOLg3ID9GAU31izEO1u7prMNU8VIfEhAn
	A6RYgl3TSkgcoLYg==
X-Received: by 2002:a05:6214:d8b:b0:89a:258:c1d1 with SMTP id 6a1803df08f44-89a30ad1c78mr197365086d6.42.1773105047101;
        Mon, 09 Mar 2026 18:10:47 -0700 (PDT)
X-Received: by 2002:a05:6214:d8b:b0:89a:258:c1d1 with SMTP id 6a1803df08f44-89a30ad1c78mr197364236d6.42.1773105046575;
        Mon, 09 Mar 2026 18:10:46 -0700 (PDT)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a18252sm10681656d6.10.2026.03.09.18.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:10:45 -0700 (PDT)
Message-ID: <4728554b256f016d9a5f3e019ed831387b0f059b.camel@redhat.com>
Subject: Re: [PATCH net-next v7 0/7] net: stmmac: qcom-ethqos: add support
 for SCMI power domains
From: Radu Rendec <rrendec@redhat.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn
 Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Richard Cochran	
 <richardcochran@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue	
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, Giuseppe
 Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>,
 Chen-Yu Tsai <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Matthew Gerlach	
 <matthew.gerlach@altera.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl	 <martin.blumenstingl@googlemail.com>, Keguang Zhang
 <keguang.zhang@gmail.com>,  Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team	 <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous	 <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois	 <romain.gantois@bootlin.com>, Lad Prabhakar	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner
 <heiko@sntech.de>,  Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Emil Renner Berthing	 <kernel@esmil.dk>, Minda Chen
 <minda.chen@starfivetech.com>, Drew Fustini	 <fustini@kernel.org>, Guo Ren
 <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Nobuhiro Iwamatsu
 <nobuhiro.iwamatsu.x90@mail.toshiba>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm	 <magnus.damm@gmail.com>, Maxime
 Ripard <mripard@kernel.org>, Shuang Liang	
 <liangshuang@eswincomputing.com>, Zhi Li <lizhi2@eswincomputing.com>, 
 Shangjuan Wei <weishangjuan@eswincomputing.com>, "G. Jaya Kumaran"
 <vineetha.g.jaya.kumaran@intel.com>,  Clark Wang <xiaoning.wang@nxp.com>,
 Linux Team <linux-imx@nxp.com>, Frank Li <Frank.Li@nxp.com>, David Wu	
 <david.wu@rock-chips.com>, Samin Guo <samin.guo@starfivetech.com>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, Swathi K S
 <swathi.ks@samsung.com>, Bartosz Golaszewski	 <brgl@kernel.org>, Mohd Ayaan
 Anwar <mohd.anwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, 	linux-mips@vger.kernel.org,
 imx@lists.linux.dev, 	linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org, Bartosz Golaszewski	
 <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski	
 <krzysztof.kozlowski@oss.qualcomm.com>, Konrad Dybcio	
 <konrad.dybcio@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 21:10:41 -0400
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d3GlJWR7QzNpwr4cod6IbldNvEsWebLMP47OiO75uuA_1773105047
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_181304_800578_B21AA6AD 
X-CRM114-Status: GOOD (  13.70  )
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

On Fri, 2026-03-06 at 16:46 +0100, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.

As Jakub pointed out, it conflicts with the latest net-next, but does
apply cleanly on the latest mainline, so I tested there (on a SA8775P
board running the SCMI firmware).

The two NICs come up as expected. Basic iperf3 throughput and jitter
tests look good. I would offer a Tested-by tag and a summary of the
test results, but I think it's a moot point because you'll have to
submit a new version anyway.

I will wait for you to rebase, then test again and come back with the
results.

-- 
Best regards,
Radu


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
