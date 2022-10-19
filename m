Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28824C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 20:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FwOyolu9D83Qm20p7UO9qeV1wFRCZtJxOK/8aEZVysQ=; b=pK/0//DbEKRJky
	7rgxD/F7JUxsVvfbhWMweVE/CC0y4GoFd9UvrnN8PzhnQjtNF4YK6mi638jJ86tGkY97gzbQ8Papb
	/FukEZumWaPkF2kMsG7008evByN1spJhpYTEO1Xo3pu4miTXu86F0CY/GzKkqt3l9QgPx90l9CBIe
	Hnof+LqmEYjsvC20KGouT90uGQPWH8J+IZB2NjjSrbt8yHENwqPgFDCmCymmEUBmfOizvEERDdVSF
	MDfY9MBmByLKzDMQv9VMXGa7qotZNbLoBFyjbvtyxT8Mv85R1THBEshSHEvN4he8hAjULTcqXogQK
	ktOL3JZWvnbRCGuxRayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olG29-0058h0-2g; Wed, 19 Oct 2022 20:51:25 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olG1T-0058HM-Fk; Wed, 19 Oct 2022 20:50:45 +0000
Received: by mail-ed1-x530.google.com with SMTP id t16so7781164edd.2;
        Wed, 19 Oct 2022 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=k9Jb/D65Nwg00CddvhyNz1Pxcixmx0unsPQe8+d9sp4=;
        b=fa63IEr9jQKvbBnkDN5zidLJtLtuwez4NKCLptx6HoEnO1qmslQdNwePVxo+j8j6gJ
         CSOAWaJkDuvnh1wfFKZ99frANkEA4eD1QIC/zwJxwGUssFUqpMJR2HPKaBwqI5i35EO0
         33JTLh0XzNYoxV8mHYhujKZezsqZDSbXNYWhQyo2Z1fz//3JYSzQqcRHukFoVylsufnt
         qwNI57GTs468vVKMRDx42UutK9QiLwmfypca+jdxntZCzOHCua633n7YZsx6lil/LCbQ
         B5XOP0ltuncOShhY9+AjxVbSq7c00WUHlTPhpIukN92c1R6mTfW/2P/fzarRKmQgPvO6
         60nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9Jb/D65Nwg00CddvhyNz1Pxcixmx0unsPQe8+d9sp4=;
        b=MZ6KB4m+mgDQpxRU5agxLT5JsGD7X8LPj0p6LprWwAoL/G9HLYy+kSVltM1ugRgv4c
         AGHM732jZCcVDtiOFwCESe4Tq25VgcKA3FrBRqK0I5ziSs+5aK+NWcGLD+JkuakLoXcd
         SJsw9SEa9TveaC29jwR0YvDWJuAI+LT/OP8SPTaaD4BOBkO1J6vK1HZIkoiOQR2kdwDo
         kLw9giIieVjBJfiy30G3iQ8jdtAGhViqcf9PJTUg4j57Velg8mi9KHvDOnl0Mz6LjTAe
         v3Y5rlv2Klzhq+e/aUwSSuYEmKOXhMNhMvAwSR3Ter5t+ynu1VPptSv9ajwWHqbEqoJn
         ZvYA==
X-Gm-Message-State: ACrzQf2GPEknSUDljOXWBaw+nEGeiImrjJH45CAuP+82mzlzwu0bNIt1
	QN9fTOb9cLwN6ralSZp90PiUHdsDyT9IRMOpoKk=
X-Google-Smtp-Source: AMsMyM5WSDH4F3/5sQv3/kCfh6o4ZgGBFVx1bvDggwII+Ekb/WVPf3ARd86uFycXR7ZHWTK4GNRjOWYhMn+7yLUmzC4=
X-Received: by 2002:a05:6402:190e:b0:45c:d10a:4c1a with SMTP id
 e14-20020a056402190e00b0045cd10a4c1amr9266859edz.345.1666212640531; Wed, 19
 Oct 2022 13:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20221004-up-aml-fix-spi-v3-0-89de126fd163@baylibre.com> <20221004-up-aml-fix-spi-v3-2-89de126fd163@baylibre.com>
In-Reply-To: <20221004-up-aml-fix-spi-v3-2-89de126fd163@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 19 Oct 2022 22:50:29 +0200
Message-ID: <CAFBinCAsCg6QQRH3VPY1OKuyfkxY0oCXLhAuMwO6=00gXKqQrQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] spi: meson-spicc: Use pinctrl to drive CLK line
 when idle
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Da Xue <da@libre.computer>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_135043_680518_073E3D20 
X-CRM114-Status: GOOD (  14.49  )
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

Hi Amjad,

On Wed, Oct 19, 2022 at 4:03 PM Amjad Ouled-Ameur
<aouledameur@baylibre.com> wrote:
[...]
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> index c3ac531c4f84..04e9d0f1bde0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
> @@ -429,6 +429,20 @@ mux {
>                         };
>                 };
>
> +               spi_idle_high_pins: spi-idle-high-pins {
> +                       mux {
> +                               groups = "spi_sclk";
> +                               bias-pull-up;
> +                       };
> +               };
> +
> +               spi_idle_low_pins: spi-idle-low-pins {
> +                       mux {
> +                               groups = "spi_sclk";
> +                               bias-pull-down;
> +                       };
> +               };
> +
We typically have the .dts{,i} changes in a separate patch. I suggest
doing the same here.
I also have two questions about this part:
- why are these not referenced by the SPICC controller node?
- is there a particular reason why meson-gxl.dtsi is updated but
meson-gxbb.dtsi is not? (my understanding is that GXBB is also lacking
hardware OEN support)


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
