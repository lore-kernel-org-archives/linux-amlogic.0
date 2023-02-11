Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F106C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Feb 2023 20:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hd/ez7JxWNZ4wgYxj1awSD9tE8rCgFM5TzrHEDv3hKE=; b=UhQPZiNkyHxLxr
	05yx1FmC+5q9chGw3d5Ely6vaYrNOKnq+tmRm2U6zPnaNCEVmKRxcq1HzvpuZG4zXhohJCvHenMtr
	toFB6t82lWFQW/uhYL/EA5bit89JwiLorZR184O70iNhl6TkFBtDIlo2rH2RF4pVzGw4hrBdJu6Ud
	jEmjMpLJ9q6hghIElD8mwkD1mK9erBaMRW/MEtb+cLbNS64I6Y7KxOdnt8LgIpUFzGwPviO20/sto
	bg+TYjXO2i/s6wchwL4c7//kz+8/6qciaLSa45qfseQ+PTYKk0qL7SYgtg2WeVbctvCW4MPxR3neI
	80yfQRq2zeSEyqsX0Q+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQwAG-00AHIp-SM; Sat, 11 Feb 2023 20:08:05 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQw9t-00AH61-OI; Sat, 11 Feb 2023 20:07:43 +0000
Received: by mail-ej1-x634.google.com with SMTP id c26so18561238ejz.10;
        Sat, 11 Feb 2023 12:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dOVQ/VbadOXgUJH1nohNnu6m/RvPVCPSLlnbgGu0n8o=;
        b=Wf77x5+sAbv7Cl63hpElfT3+4AdGMY7/cUE6sA63jD61eYYRug0piD6AVRfRhyDeLS
         lJPuFoCwQkruPPvHHC1wFfZkY9AtBtqK1a7CijHHqJGGtinXVip10S21tcVDaXWhOHKo
         7SmGiF7JA6Gwa83wRzcM9cuaVZgMzcLHKwBvROcToZVrV1NY+ymVNxAf799JcYfo9l8o
         BNsmUiTopW1OxzOyPPHsFzn02htzVRob5X938MBjCetmXOueLzcMEhmDTla2GFvn1iAy
         Z0/2OQt24u5VMh96oSWWQHX3hgB5PPWO9j9DIB8aRn8FhsnlH/QJXpfDKFLS4S1vcILM
         E7Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOVQ/VbadOXgUJH1nohNnu6m/RvPVCPSLlnbgGu0n8o=;
        b=XCynJcObl8J45dB9O+1zN191ytRWTKuT8kMHxqQKXERtFOjg9+xCG0j2nYDdppzJAT
         Yt1JLTNO07HkP3CIT9wiI2kp4O2t5H9GgJ+/Liw5DKmVkZX+DAD93nSLmE+4gdxHwUkV
         DE30JD7lmNlMIoHvsNA9dLj6IKp0RFsRqemDSaahJeHRSlRGXjliCC/7+FvQ6eUdctfg
         gER/NaY1hHyiZFaTDKtRowBOoQ+iYu1uC11PO1iOWbL115a3nCU7t1ZcVBSPxQfk5tCk
         fAeyVcrZs/b0SYg4hPAf81FCvtbAZqpT8uE59ZbQ76B+vTFUdl/EKsL4+Dp47j7jrsZe
         ZJjQ==
X-Gm-Message-State: AO0yUKXRxkSDxqR9d5eojhSaN2MmMX3+B0U30nHdcK5JG4qvvivj6Pcm
	NXs170aicyFh4PFvbYI2wz0LGz0F7keo0/GnKZA=
X-Google-Smtp-Source: AK7set95wE6VpXCrAxJckx6+6bpsqZnVA4wUtVBvyrjj34YQLUEEKat7VLo6AGZgSMe7R9uPBD/KeGnl6Pz53R72Izs=
X-Received: by 2002:a17:906:241a:b0:877:a0e4:4cce with SMTP id
 z26-20020a170906241a00b00877a0e44ccemr2619690eja.4.1676146060547; Sat, 11 Feb
 2023 12:07:40 -0800 (PST)
MIME-Version: 1.0
References: <20230210170721.1285914-1-christianshewitt@gmail.com> <20230210170721.1285914-3-christianshewitt@gmail.com>
In-Reply-To: <20230210170721.1285914-3-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Feb 2023 21:07:29 +0100
Message-ID: <CAFBinCDO6-UF0e556iLJ4Jr0h7DHcgeOFg5pOxfdb2TEh=iXgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: meson: gxbb-kii-pro: complete the
 bluetooth node
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, 
	Ferass El Hafidi <vitali64pmemail@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230211_120742_013821_5217D750 
X-CRM114-Status: UNSURE (   7.47  )
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

On Fri, Feb 10, 2023 at 6:07 PM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Add missing content to the bluetooth node to align it with the content
> used in (all) other GXBB dts files.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Tested-by: Ferass El Hafidi <vitali64pmemail@protonmail.com>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
