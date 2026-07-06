Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0578DC43458
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jul 2026 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CkZL3BKKl18ND74DczoXpJCNR0r6uy8tYkR6W2j+JY=; b=xXs4SQ0otMaPA/WKmAT17ewoyI
	25cGRExV0angzL6lJPuP6XEysbbS6Xi10qYhqQtiFNQjn0mtTySAXG3QnXUJfLwX58OkL76hVAVkK
	3WTZHxJJFtclKmYP1ikjua6xPSTwOmXiWXa6Mkah/4ULPifhQdIJ8lZLU7Pc0Qc3jpNr5MIh0RZqF
	v8kCnPZmhf1lkGf8WLVIPP1IN/hVgCOZnlPTdql8GbSNDPrqvKvf5aLk0UlrdZGKaB/P6eBiazTaE
	0/OwUYiqpbuXG42+Y0vrve0zkeuQAASjn/cRnT8K83VWKwApQOjw2sYMauyBJqJoiLtZ5hQ8xszvJ
	ZYce+U2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmqC-0000000DALJ-0pT6;
	Mon, 06 Jul 2026 17:10:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmq7-0000000DAId-1Ia2
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jul 2026 17:10:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493bb510ce4so24959325e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jul 2026 10:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1783357837; x=1783962637; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
        b=DwCw4gL9zT7ERB7HBO7vWw8eeSrGbOlZG4qnXQcI970tQ3uU/IPf2zbpjtW7dRnhI1
         NekeT7XWlg2lK+S7uWslb0898BpyNMPsnWnRZj13pvpNVk4L1v3M/ZPgc61fxM//aPz1
         EE8fWLArPpRf1pTDRSdX+p8yrzly2NvubmMev4z8NE1EkbhFNYLPnH7rNjnRKnJ2lDSd
         LylTX6zBhsb9defvLKJzamH1GG3Aq2f3NlVarclmk5gwBFLRlQ7yb5JAA1kT+ooKDgER
         CixQBSFyCxNaEpP1YW5wIPVKGz0HghW7h8RK+NEvC9ePIx90dxgIfvApBWC6dOTZkYGg
         uLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783357837; x=1783962637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YwUdG1I8kJNunEWTpdhFYSiUn8LDq7cMo60LuGY0n18=;
        b=XCgbcfo0bg/mx1B1BzxmonIkINkXkYvhFBifeV6KUV3Pejbn/wFMiPcEhlvxheXL9q
         ucW4FzXx4m+ol2eZSbIUe09OgjySb/BIqIhkhFjErFyAxLPkoT8F0I7JIAyySD/dsvT7
         4m8pVjEzU6Hl0DKS9RFwxczkw8iF9P2D/WrvxWilUqqNI4/S1toqKCIhj6azM5wiL37C
         WRPDFyMMsDccI17G4Kgzsv/UcA8DBv6Y8ADbfFJ/gA12TA9hFCSTmKJymI/WptTEFnyv
         BNDIGJYHZ5tBlP+IX2kl40m1pgDIxeDr07OX4Y6ElXWc74vBJV0vqMNFG1s/Vjm6t57l
         xbnw==
X-Forwarded-Encrypted: i=1; AHgh+RqyBGL3fojeXyN5f0TCcP3wYCJ4aUntKEcmWbS3gSc3EJQ+ZuMjIc3fA3bn+eRr5qLWUXqTmhWJUe0ZPYWy@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6WwoqNuUS6wQGTczfug3M/af182WErI+oBuAKH18FM33ebURf
	ZBjciXBOoHbcT/JpxMDIDbMxjYiNkIkWfJT3CV5x8pmJUsnJUqIYfj3anA3CDhszXFw=
X-Gm-Gg: AfdE7cmNtjnliiPntxadOzKtTKqumQV00FxTKh8Hbk5vGDV/IMkfw1fxSulqCeHjg8z
	Zf2omJ+cqp2sswlwin9z4CS0smJEiOKgtHwXzoNBDDBA5vDWrrKw68nce8ZrInhE+HxOln5ktbu
	pIuNzDn4AwxM5ZqkqVQ+IdJ8K4ppK3xIOXTnwh4dN8tBuVUwGvKDEprEXDZ5C2cDUKWfbpWrnjr
	FYYTMz7Ebeak4ZkbJkEoZ20aeJhbQkiVgT3+I4+z4+gKMIiVO9loisrnOL79nlgLluI8PWOKQPI
	fLdO7c1ZZvsRswbB8oHrYpR3DCwxEuCBcEibwU0jVkgb6hJcFYCkUa/Gfbu8W3F0etgaLJ5A9/A
	kk9LKkxzzfTJcdTGehTW1e3ryPUc6lo/YAFm+e9nRb4P3lYVGel2KLZi4/4OUwBPiE/F6K/3f1I
	Bf4GfuHrTSsyYe17Esn1wmP3OSQLvE6pu3KBnTEFiAwgKLiqO3KJgZiWBH3px4ytyNbPe4EdYoK
	s4=
X-Received: by 2002:a05:600c:548d:b0:493:c478:8744 with SMTP id 5b1f17b1804b1-493df0644a7mr17176475e9.18.1783357837297;
        Mon, 06 Jul 2026 10:10:37 -0700 (PDT)
Received: from localhost (p200300f65f47db0404eb41111570ffdc.dip0.t-ipconnect.de. [2003:f6:5f47:db04:4eb:4111:1570:ffdc])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-493df703391sm6037585e9.0.2026.07.06.10.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 10:10:36 -0700 (PDT)
Date: Mon, 6 Jul 2026 19:10:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
	Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com, Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>, 
	Romain Gantois <romain.gantois@bootlin.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Radu Rendec <rrendec@redhat.com>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, Drew Fustini <dfustini@tenstorrent.com>, 
	linux-sunxi@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
Message-ID: <akvhUwQ_FFSJYICA@monoceros>
References: <20260706-qcom-sa8255p-emac-v12-0-e3ab1ecf2901@oss.qualcomm.com>
 <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
MIME-Version: 1.0
In-Reply-To: <20260706-qcom-sa8255p-emac-v12-2-e3ab1ecf2901@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_101039_366512_50B8D736 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============6645209435553183906=="
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


--===============6645209435553183906==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hya7dxqb4rmwvjro"
Content-Disposition: inline


--hya7dxqb4rmwvjro
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH net-next v12 2/7] phy: qcom: add the SGMII SerDes PHY
 driver for SCMI systems
MIME-Version: 1.0

On Mon, Jul 06, 2026 at 03:20:17PM +0200, Bartosz Golaszewski wrote:
> +#include <linux/mod_devicetable.h>

Please only include those <linux/device-id/*.h> that you actually need.
I'm actively working on deprecating <linux/mod_devicetable.h>.

Thanks
Uwe

--hya7dxqb4rmwvjro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpL4YcACgkQj4D7WH0S
/k57CAf/UgOJNneAcYY3lQuZ+RhwSluKHlS9kU+LP6KfWURj/Pj78uMbougI/MWm
NOPHFAV0gOZPyox4TK4XImoVNCHq9wWJVtMM0UMCguoEBhrqgoeV/Esik9YncvIc
INlZjmDSd0r0OJd9oMZmIM7O1eIZxLQugbLTCT2WK9eW0OCT+20CmmtgHzGHZ7eU
krIfDqpfq0wJOa70OZmh/lowgwbJIjabcxyyCGiY0Scvf4F31ClocQmot5e6gabR
OcwHOulxqkUKBtOVZtPrt5lRsawYjY+ZslpAnnZvlrbrqmj2M9IuVyQGMqEW6kkC
CFP1TQBoEVajey5oRSMzdQ2ZlvM/wA==
=Sskc
-----END PGP SIGNATURE-----

--hya7dxqb4rmwvjro--


--===============6645209435553183906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

--===============6645209435553183906==--

