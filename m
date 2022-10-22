Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389DBC04A95
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvwcKxM2gtu6UdH/1LB5Nb6UKdogIcfhWCgmoDXECtc=; b=MT4oou5oVxV3GW
	SYVVvBr5rbC42YP3sqsiQn41VMzF4/TFEhScdgAuKvej3VDptFk2fpZujCU1n4QdBbREJONwabAqD
	pLgo9QUPk2DH2uFKJqwCPTgwei7XgAw/zqcsCK7D+5smZKpMOQkYZNeBpLGYqCQ0E2lOpCdm33QWk
	3U/ZkS7xBcEVqByl9nI9UhTf9PopUecFMDmD2RbcCvRtaRrkZuTPm5nc/E9S5RNPQMfe/0x+rGXfY
	qWvOOEjuKbdtyxxLqd0V0kTLUVV2iky11EDbUEu86ADBuYnNgvxQdosfI5SxmYh8rf40S8flCNQ/y
	oP9kSxU33iXfMPEq2LZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBWM-00C8eK-St; Sat, 22 Oct 2022 10:14:26 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBWK-00C8cQ-HF; Sat, 22 Oct 2022 10:14:25 +0000
Received: by mail-ed1-x52c.google.com with SMTP id l22so14454802edj.5;
        Sat, 22 Oct 2022 03:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QU5eKnCMasT6Q9fSCMOcqpffbD8d615reCYXwSO/gf4=;
        b=hGU6dc6xbDgw8swPGkLy3Yorq+CrOuuW/m//YQGpQSrTiLpoecj4A5xKOXogY7torv
         aNY/+de9gUXI2qoFVounok6PizOkGfHz29Mav3d6j0MajPeZuK6EhwcCadyETjDlMwV4
         LeHUwBwLqbrrsbQhlAslMjZXx/g68JIjtjF+CTFsyyaUX/aSr66Agqtkzgkrs5aM9kl4
         L0WkXZU+l+/TSMZrRQNr27oQ/fEOW+9E7N6jw+rgH7fL+Y/YYexvdaLYVrySPrDslQ/j
         /0/Gx/vALPRnTNtiVGn8tQDa29CKOozeeaiXRvoa+obLxRtAqWJ8rDbiiuJfdUTJhgDe
         k8gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU5eKnCMasT6Q9fSCMOcqpffbD8d615reCYXwSO/gf4=;
        b=JJ3tfGDdTNDi4qeHWZ78lOHzXXVq/xniMaeoLIFwPKKQtRJO5KLOEupswcFBzZRPog
         s3FU/bhBrYZwrYbf4Td0WDuttwkERW2Pye9QKYsHNokP/BtTF4Esfv5P54ulUkdUN8MM
         6PKjVZzSY1hDUUsYsrjNOxcBXCU9+leo69DIn2bcZ6t84dtzo9aK0Ehav0N6qMK2DjVo
         n1ZLMkUAgyzaX/ngEzDUoe0c+CiAkrYIcW+HDC0pIpFSJuJ8olXJlYLGpqKYJjKcDWNY
         EvXbjWDRv79WhrmKBogka9IgCahKIR6GVaP6lto3KT7bSyoCL7t8Dich6smN48QX7wFE
         w9LA==
X-Gm-Message-State: ACrzQf1W14aCowP2sFCUQBkOmhOA+K0Lupwxo7WX5F+EJp5wVoftRLpD
	nNIp4nWrcJyh0W1MQhds2UGJfRxwHePBmEF+Mhs=
X-Google-Smtp-Source: AMsMyM5pa070Y9cycfmF7F9UaRmgJ8sMMr0dewTd+9nBguRc1O4LCWhsfWTjqaFi9UqVjZl0uRdKCF+KcsOb793/C1g=
X-Received: by 2002:a17:907:3c81:b0:77a:327a:815f with SMTP id
 gl1-20020a1709073c8100b0077a327a815fmr19824207ejc.422.1666433660962; Sat, 22
 Oct 2022 03:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221004-up-aml-fix-spi-v4-0-0342d8e10c49@baylibre.com> <20221004-up-aml-fix-spi-v4-3-0342d8e10c49@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v4-3-0342d8e10c49@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Oct 2022 12:14:09 +0200
Message-ID: <CAFBinCBwBz6AmxDDJPuww=WRG7Pc0xUWeH+DRXM6WcyctouFhw@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] arm64: dts: meson-gxl: add SPI pinctrl nodes for CLK
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mark Brown <broonie@kernel.org>, 
	linux-amlogic@lists.infradead.org, Da Xue <da@libre.computer>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_031424_591563_F989F6BD 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Oct 21, 2022 at 3:31 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
>
> Add SPICC Controller pin nodes for CLK line when idle for Amlogic GXL
> SoCs.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
