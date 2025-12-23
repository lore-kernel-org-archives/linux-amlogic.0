Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5EFE6F079
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Dec 2025 11:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uzDrEsVhKgW8qw38RjLNi+bGYbw1tU22n7zWDNO6wu0=; b=idWN3s7yZ2N67l
	wpxS6u4Y0OtjQ5xcRKCibOw59nX7DCxdRZ9Ba+degtBR6CfrRNYNU6AH7zuxL3plPqCk3aCiSF2PI
	LawXa9GLQv1CCQRAWIjxQMZp/qB1VC0Zc6FWhqA6CyTUsfm1ExloRYlEg77VwPZzXOwaJmuC+hdta
	69L0yfgxCw42iKzFc8/r/2BtHEQ+gaN/eiSSzc9dOwX8q1rLkDmua2HYPpT7EA0IJScLDaWpr6rHz
	6Q5CWeKWQ4WCM3k2GHK8M2g91Cwr02aGL9lZuXy46usX3+Ce1VX4xXNMOvayaS55pwdsmiyXFHSHx
	NExyPcNDt5K1MTBuo+kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0m2-0000000Exqt-0E8F;
	Tue, 23 Dec 2025 11:41:54 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0ly-0000000ExpH-43Ny
	for linux-amlogic@lists.infradead.org;
	Tue, 23 Dec 2025 11:41:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766490109;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6sLHyZjdhjDBt6Tlyx92GjgIeB1OFSYRftB7W+PXVHI=;
	b=h1rQc7Pplv9q5iItizuIk6J+84wY2O997HU4JYrlk8B9zAlYneXcMFqFaYxytGUY/ABEn7
	mIH2jDM4AwTP5qqSYo/A671D+kLV5wKuCxbIjJe0YKlcOm2tlrj9N04ogtRWKKeI7MDHTX
	0o8hdHPrwpDxmN4lbV25LIEJCtFWoVA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-357-QB7JxZ7xOKuXcTC8_FjaMg-1; Tue, 23 Dec 2025 06:41:47 -0500
X-MC-Unique: QB7JxZ7xOKuXcTC8_FjaMg-1
X-Mimecast-MFC-AGG-ID: QB7JxZ7xOKuXcTC8_FjaMg_1766490107
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-4325b182e3cso1423010f8f.2
        for <linux-amlogic@lists.infradead.org>; Tue, 23 Dec 2025 03:41:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766490106; x=1767094906;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sLHyZjdhjDBt6Tlyx92GjgIeB1OFSYRftB7W+PXVHI=;
        b=QSon76XpPIqTWE6Qt2TPQYLas2kBACA9FQaEgbzbNyukl4sviTjqKjrfKTvyayXWU4
         KAOzUuZz9JK8faLyzDynYXii47euZU/2bawrgTua/SYYVO+cecAn+cFjuknU1o2b7s2G
         eNMut3aE98egT5jeJ32l7p75p1VAUICEE25ZHVmrfQJ3axp6sQ+d2Bp8Vnbc+YtUpgr4
         I4mtrFtg6eS3zuFfUiCY4OoYfXlUWCsa1wuZDV+eVnltJ9HRvo8V55E4jT/nTZ+SIq9t
         XtErwz8xWj3v7GQfb9qIYxn0piUvVggaO9Fu++b0c41Ewbiqi4FnCRoa/OXc+KwQqhWV
         bQew==
X-Forwarded-Encrypted: i=1; AJvYcCXx226ECzdeRMghDt3tssJPLO/Lrxi+1OhqOBHvka/7eh/DCqjQsOhOiiMzuMXmCaXlZ6/19O0noJAW0140@lists.infradead.org
X-Gm-Message-State: AOJu0Yzorjmt0zeIKkvduI6RHkbnHs1hOA/c8rCEu17nFAYgfbUtCaIV
	uu8oqsn4stFBkb2XmFgQREx7T0zyx5tVSk2lsDYsAGuGWwE7d5v45CV0sUseNQfMg3JjvMbhVWs
	RZkDECNWk33x0W8MGgVf1yVEqpAqQcmL9MZsqlBXUe2YagRSSJBmW3nkRbSvMzP0D7GgseU7U
X-Gm-Gg: AY/fxX56Fl/gBaJ3HM74nGYlWuNIxH+vcxSL2QuMU9UWeurU06l7+FKurnml7w1zF51
	iI5SaqzFAJUfzEnLnhd09ayIPZb6kWnlxZQVr+znBiTECA5FmWeFCTwNnGHupr+etW+ddhPYinN
	kx6H7WnSpjBr+KO83DrwQ2sxhlfUGvc7HYmNCXGedDkpM7ZNqxPYUI+LKK3CNdVX7dHa+20o8+F
	hWT6jWTGscNulHhY0aRSos5V7mCpTZdd31b9aSyBvlr0cGSW3XnbTm44MDRKEEEFwSJPWsGNiUK
	R4rp0Tb3pZHIPTXi9KUQWZI/121sjitHy1T/1XzEgbQDTzTUae65abznD4GBpVNBstYJBBozFfH
	/2qgZEDIBCdpN
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-4324e501629mr16143536f8f.41.1766490106529;
        Tue, 23 Dec 2025 03:41:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPhaXEvdC/d9UBYntc4O15i4YttaJ4C4olbdEgTOb9sXo4XaU7wPfNoTNX8sKpU6s3I2QtjQ==
X-Received: by 2002:a05:6000:2886:b0:42b:4247:b077 with SMTP id ffacd0b85a97d-4324e501629mr16143448f8f.41.1766490105967;
        Tue, 23 Dec 2025 03:41:45 -0800 (PST)
Received: from [192.168.88.32] ([216.128.11.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea227casm27605658f8f.15.2025.12.23.03.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Dec 2025 03:41:45 -0800 (PST)
Message-ID: <51c7048a-52dc-47e1-97c3-2aa0d6555643@redhat.com>
Date: Tue, 23 Dec 2025 12:41:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] net: stmmac: qcom-ethqos: add support for SCMI
 power domains
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Richard Cochran <richardcochran@gmail.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vinod Koul <vkoul@kernel.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Matthew Gerlach <matthew.gerlach@altera.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Keguang Zhang <keguang.zhang@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 s32@nxp.com, Romain Gantois <romain.gantois@bootlin.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto <inochiama@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>,
 Minda Chen <minda.chen@starfivetech.com>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Shuang Liang <liangshuang@eswincomputing.com>,
 Zhi Li <lizhi2@eswincomputing.com>,
 Shangjuan Wei <weishangjuan@eswincomputing.com>,
 "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
 Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
 Samin Guo <samin.guo@starfivetech.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
 linux-riscv@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20251219-qcom-sa8255p-emac-v6-0-487f1082461e@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: fcfmJUEW4MIqFhdtZ4VX9MgjumYuzLORYyx0wXQAJZI_1766490107
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_034151_093218_A742474E 
X-CRM114-Status: GOOD (  15.50  )
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

On 12/19/25 12:42 PM, Bartosz Golaszewski wrote:
> Add support for the firmware-managed variant of the DesignWare MAC on
> the sa8255p platform. This series contains new DT bindings and driver
> changes required to support the MAC in the STMMAC driver.
> 
> It also reorganizes the ethqos code quite a bit to make the introduction
> of power domains into the driver a bit easier on the eye.
> 
> The DTS changes will go in separately.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Quite unusual SoB chain... I think it would be better if you could stick
to one or the other; also the subj prefix should include the target tree
(net-next in this case); finally...

## Form letter - net-next-closed

The net-next tree is closed for new drivers, features, code refactoring
and optimizations due to the merge window and the winter break. We are
currently accepting bug fixes only.

Please repost when net-next reopens after Jan 2nd.

RFC patches sent for review only are obviously welcome at any time.


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
