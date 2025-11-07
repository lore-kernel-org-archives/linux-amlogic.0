Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D78CCFA1A
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Nov 2025 10:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jm8zV2SPi14n8uWUCWkiLyqSDSfa81IUhcyvTBOz+IQ=; b=nwQOz4Kgglo97O
	fNi16npVuZh3Qfnzsz/WLmoyyiedq857BIwy6GqxX/L/PLbv2PMKPAE/MlZTmbwWUZLJ2HqLVI2LD
	f++9Vr0yp9fbISsg0Su143BvsYlnXMWQWm+AVFe7uai+OUeHZaCvEZAzLg9HetsU/6cwRPI7B7/H1
	GRDORzcLzHCVsvmyocYW5qdLN1z0+OL6JkyAKDAVi9GdCEK39eLhLW9hfXPmn2ZszlkmJ+mAdYWMq
	JEvSqKnTmQ6Bt7As7zoKc1DuIvFHq6DVj1mUMwTUHBDNmymp+W1PcTn0FjmC/jgb9du60xS7aj5VO
	F5WvJr2vs2typzPM7qYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJkW-0000000H5qu-21YQ;
	Fri, 07 Nov 2025 10:31:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHJkU-0000000H5oF-1u6Q
	for linux-amlogic@bombadil.infradead.org;
	Fri, 07 Nov 2025 10:31:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=; b=MK0aW/E+lQQrn42CMO+s79mgrb
	s/HmPcvLuJfNg5B7Hjza+NQDwLfhs6fHuw/SE9aYIAy6ZHLt1CeeWeUtMhbmaTKB1J0miueX5rafs
	N8+UZti0joF5sogVH7UGwwYnTDy+azlyVh8d9IJSTwCM2f28Cy8oQQ2pAuNS9p9lxqVCg1snE3rEq
	ytf057uZXQVzRuGfIca1gDOk5QfFyclGBK0sVaHmB8dbhbeYh8Wb0vUQNVRyMzGxHbMHTtqBhFFAf
	d0VVVJF9mLuU1P1T3dgdk8jN9ZWYx/3+j8/4JXoWkrmQEtZQZ4wYN7n+3n0B/4Y+H5x9RD3Ys1jh4
	TUzS9Jjg==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHIsj-00000006BSi-0ctx
	for linux-amlogic@lists.infradead.org;
	Fri, 07 Nov 2025 09:35:47 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-429b9b6ce96so376991f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 07 Nov 2025 02:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762511413; x=1763116213; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
        b=j3wr2N+b6OCN87KSMQJwA/b1tCvTUF8wR270uHyTY1lHoQgsIyGC+IJ4BjEUFBA3vE
         du3rYIIG+ruOw9eAUw4XBn2ul4LGz7LznN2vssaihPQDyBGJWFHx++rF1C1PcMLS5bcV
         gR5T1/Qcp6MCpuV1U5UVc7Dmi1VrUkTnhGaYrlsACLA79Egx5AY9YYCzHbEhYhKRzZM7
         UwCeYgCXbsKDSb9S9MPcL9EV1zdfLxuRH5+HX1af5IhNgZG3RfvCBb8ODzNhOYfUKWg+
         hPwGC6KPt8+4G+iMj839ydGMCFUFtptglKtB8EaI4eQKMmoUHNncu5K95soe5MhGEkb9
         BypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762511413; x=1763116213;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y+bD9XMSY/PxNEVtej7SYELNOHLIlDJsCB53kL01eGk=;
        b=tQRI/CGnWj3gNHm0ydyGMIArzxu2zT1pNIOvCyOxdoJ3URSwBCSxYpAKQNHsrcFsvP
         PcVlUCdqfTTcrBuhGKKkETirpE4QrJjy1LgHAkH4+i6UqdaI8hrlSMSn/mk4W8yyOQzB
         Yxq3mPFGSZ3v+zpi21EQLsaccNnEtocVGx7N2ft4e23goUFj45uNcd++AOm/iaQI1CNE
         1F2qRRX1iphR5bbCZWKhzTzR9sFmFX3f1KhLcQlIvlB3MtTxbAKZk4Asdu9qXvRGJwE1
         JPj8L+Z9tnZdhuwGyeN5xYYvwcdhF9cDP2jumZ0BRPUMd1f/R4RPbzMHLCemHt8h7Phx
         dmNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXho9TKc3NK2xQkNFMua/wLO2i0p/vQP+XG+HX29dc5Rp9317ulh+5hUlhfDrNWF4mo1NwtJBVt4DqNpyqC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/pdkUzN4/Eirt4ytl08K7HeTYMyLUa5phSwrOCfKou10nxUM0
	qF5HhcgXsjDusFPOD9dfXI2ZhXMyE1GReIh+pSGP4/5BT0Gsfb4zaVl6pgtrQDmt5+M=
X-Gm-Gg: ASbGncuGaZCSpeizIcMHgKO3JlFXHgB2qfumj1UU2BAEmWpN3q7cv3/JWxRRgrj9SKO
	reXIE9GrAn0JPDr6ncHPy1bpyuSBUK/klxzM7QLhSKHo23kJ6wzsqklidQCbFMJaCMMx0E61GRb
	YAfMyUB57nWKHwPp9QCfBCdJKLAoMRJlLj5moSUJ6UzJPCsA/RAUX0prX4n8Kygl5n9M6ratlT3
	nITVRf3r5qFs2pnnf8sM7tAV1zd5VH+kxa+f31XjF9UZNA049EUIV6OcHiZoF26CkCbhX9r+yTU
	W/AKVt+Hp558PQepzC5B3uyTE64baw2g7WWXthi0/jwRZ7N9KsGteTeEbEC+BW1cJZ0/2kRaDW4
	PPh4XSYbr9czha8kHSh0W58z0wCvpNbbiufmNWSz3UDA8nQKns8LWQsqqOlWTodJNsmn6PWKzlp
	/DnZc=
X-Google-Smtp-Source: AGHT+IERkMxY/OdgqWfaZ7AT7DwdB4UOki9h9A7muZP3Z616/ajyEOm8UxRI695/XTN9HnuI+cZyWg==
X-Received: by 2002:a05:6000:2012:b0:427:8c85:a4ac with SMTP id ffacd0b85a97d-42aefb43605mr2064791f8f.47.1762511412542;
        Fri, 07 Nov 2025 02:30:12 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fb6d:2ee:af61:f551])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac67920fcsm4414864f8f.39.2025.11.07.02.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 02:30:11 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 07 Nov 2025 11:29:53 +0100
Subject: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
MIME-Version: 1.0
Message-Id: <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Vinod Koul <vkoul@kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
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
 linux-arm-kernel@lists.infradead.org, 
 Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, 
 imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=/4v1a8QAtlU1YFnwlRQMWe0GMJqjCY4EA0FHsr43o1A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBpDconjyIV+fTbtiiEvLmwzz2XANDPioDzvoKtm
 cu4MX5qD8GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaQ3KJwAKCRARpy6gFHHX
 chguD/48PDKdlDmcnZzg7JiW0mzCIguyJgTHeZLzPIFm5p89jeT2Xw9rJg2JOadHllTnAvDXe/U
 rvDQsGndzvsN+xzFpJ61PEzm5YAScMgZDW64C34/Cog5rNgiNs3vkk1gLmgscNeF3Cna5YA+RA5
 BsXoQWCIq5UtEFkXesDvEfFmouRUOeTDINymGLKpCE65eO7kIWIQCZpYBDo6AnW06NlTq2DlOKQ
 Fdp3E4YMrkhab74JdTcn39x/INJvXk9K5y23XTeiGCMlvPmiqtmboUlQPDXdOIU3C8lUqWRkUTT
 7xxipK88IcZ8YiSyegvj+0NLjo7dDc8AMkfyOkibQMiUh/K2t0tz7bIjKXZlNxdWPVJhkqswNyW
 R0evKvs6IKV+2Q71flHCD3rcRH0yK0gW7fA59gChceGBjLKGchAkERDHwwqrOpUqNy0WePVlsn8
 rAUWS+/a13WqCZG7ZoL926vFHV/gx8tYhJhWbKsM+aXcbTkr7WgNPhL6O6LPGZg6LIPL3+052yp
 Eld9SE0yD3WZLc0ux9XwhoD9yRGy+e1dAMCzD8+Ghg/k5pxeRe7x5u5SfcOx2RTT0x4yr6yuL5d
 fGW0aKXSXdHWQw7ECZ/W67Bn6p5RJUhQVVzQNg5VS3/UwDyQK9uldBujAYSXuMLCQV77tfpiZfF
 FazfeeIRG8/+w/g==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_093545_480551_75E20EB4 
X-CRM114-Status: GOOD (  10.58  )
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

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

It's bad practice to just directly pass void pointers to functions which
expect concrete types. Make it more clear what type ethqos_clks_config()
expects.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
 
 static void ethqos_clks_disable(void *data)
 {
-	ethqos_clks_config(data, false);
+	struct qcom_ethqos *ethqos = data;
+
+	ethqos_clks_config(ethqos, false);
 }
 
 static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)

-- 
2.51.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
