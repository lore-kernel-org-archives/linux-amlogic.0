Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0167AC433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 17:08:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lExs3EY3CZvEnrB5PzYaZX+/mRX41toRrofQzdSBMO8=; b=SxcurMQiTLn63h
	Mv9AeSBenDT4zgvnHJ6Hce4CYb4OlV/BxF3d/56n5qHKadi8a8Ra0aCOkI00OFY59W9+O2W2JZKZv
	nWHpR0tNOVMOSxMNdZ6KK+TIPsoqPVdghWaE86v0/LtqMT9ANsB1uiXESkYVFq2dljwDx4+JK90lB
	/W0bmJX2zbCUZCbFc011eJ8p8md6bf9Al/WSzP7t+rqMRHpMkS2jiZU/WpmxiF+fP7F1yyBpvngL6
	J+rkc+cOp3v8x9gwqS12Wtn4NB0cn3o+78nY6S8n/5TV2clt/O70oUWRYfJQ56feqsGguSdNkBrHk
	s9w8RmojqUK7WH/8k35Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1tUM-00H6iA-Ks; Mon, 27 Dec 2021 17:08:46 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1tU9-00H6fW-W5; Mon, 27 Dec 2021 17:08:35 +0000
Received: by mail-ed1-x529.google.com with SMTP id z29so63954707edl.7;
 Mon, 27 Dec 2021 09:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CP3XLT+70/9TbwzYF+eOW8bBY3OtuRCt28EaG1yMPjI=;
 b=ZnWgZ0/0+2JOJyXbSy/uJJqVU9N3F81fLwani2ZdxqnjQ6ee+RKGAnTIPGF3VTsQrv
 cGkJvJlXYxfFRcESX6Pep4WvIMU+U37QjIhQcz5I+XGEZD41vGYKR/lsod8ChOEXq0C3
 FWPM+c6olxDPS4EQOmijx/UDUr2z/aOQ3jOzwm1hYnW9+sh6pm+DgaRPFojfC74wJ2c8
 GI25ZBCRQc+WVcoslQOmdszG+hppBi2CMx5b+JBy+o2QGToU8BXiJWZGWxGlt3/FiklY
 KABhbwkW7OWX7FrWeDr1J5qUIgX6fM53zrs8wMnuV+nQOzmKxfbIv/DWK2iXaq5k2dMU
 r13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CP3XLT+70/9TbwzYF+eOW8bBY3OtuRCt28EaG1yMPjI=;
 b=FptbufWOirqyjcIHk1hgxA0FAwbvlZ4lhj6ZjIEgSH68zmHeaXSFWn1WdbmwYr27bU
 GFSkyz3T4hEQiic58zHKgfcjejEHkxFF58RXyGYXdwREuq/R7Mnkk+yTxib7OJZfyp0x
 wQrGM2oRDyXJU+EPMhnUkg9S37i/MZ/PelhZS5QW1joWzOWXhHPtkwaWTHqwaZchK5Ou
 3eVuVbSzfkDiZsDKBBEA7AK6bs9D9d9Km9YRJF2Giq1pt8Ed64gmfnDOlLFUXjzUCSEz
 SiAdzQGrFR/yWK89IyRZg+/3pNIr21fSXOX+7fEBOtLGgyatHUx7Su0MHu+A+q//Of1v
 qGPg==
X-Gm-Message-State: AOAM531kThVRRtMRq8ZZEPC339OtOJV/Qpa2Isy1PsLqTl1l/HzzFAOK
 MRQRqMQ07GqTeXrMz28zTkcUKUtLYDpZWoj9rwo=
X-Google-Smtp-Source: ABdhPJwpCEJ3+l77fWb2qzfj5ZSxrhjxVBVPcL+FNzq7vm4rd82I+aiVNvv5fk2DIsZzjCAxljBFKp/Di6bSsbjLSo8=
X-Received: by 2002:a05:6402:1c08:: with SMTP id
 ck8mr17033688edb.32.1640624911401; 
 Mon, 27 Dec 2021 09:08:31 -0800 (PST)
MIME-Version: 1.0
References: <20211227054529.30586-1-xianwei.zhao@amlogic.com>
 <1640619206.696540.519387.nullmailer@robh.at.kernel.org>
In-Reply-To: <1640619206.696540.519387.nullmailer@robh.at.kernel.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Dec 2021 18:08:20 +0100
Message-ID: <CAFBinCAhbJUevamYqmzrFsVcXoK8Wcntem9VmYUpBL8ktEsVAA@mail.gmail.com>
Subject: Re: [PATCH V3] dt-bindings: serial: amlogic, meson-uart: support S4
To: Rob Herring <robh@kernel.org>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org, 
 Rob Herring <robh+dt@kernel.org>, kelvin.zhang@amlogic.com,
 devicetree@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, 
 linux-serial@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_090834_076040_2F0A56C8 
X-CRM114-Status: UNSURE (   7.79  )
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

On Mon, Dec 27, 2021 at 4:33 PM Rob Herring <robh@kernel.org> wrote:
[...]
> serial@84dc: compatible: 'oneOf' conditional failed, one must be fixed:
>         arch/arm/boot/dts/meson6-atv1200.dt.yaml
>         arch/arm/boot/dts/meson8b-ec100.dt.yaml
>         arch/arm/boot/dts/meson8b-mxq.dt.yaml
>         arch/arm/boot/dts/meson8b-odroidc1.dt.yaml
>         arch/arm/boot/dts/meson8m2-mxiii-plus.dt.yaml
>         arch/arm/boot/dts/meson8-minix-neo-x8.dt.yaml
The warnings from this section (affecting arch/arm/boot/dts/meson*)
have been there before this patch already.
I am going to send a patch to clean them up so it doesn't cause
further confusion in the future.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
