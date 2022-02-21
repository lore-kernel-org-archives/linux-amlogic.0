Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60919C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 22:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l2uS8yDh4dBgP51DmKnM4zuLtVTpWqWDpOjkma2HaF8=; b=DESRa6gu1SAg8P
	67/gE67dyctCBXb2NiEZUe0+vh1fBMW4jHft62PTvgx7YJ15wKLWfSAHBTjH7XI94eQPbdyjB7m4D
	2OfTN0Z0jchN58sprjI1Q5Uv5DwFug87+F3AGvSlBSNW4/D7jOvkY1G5Yp4bsTPZcTqJI7F48xyJZ
	tlsz/jawmFH+0+K3Z45Cbh5wo2230wU6SvUeBy5s/OP8g152grjpRUN+AYfFjjZ08kJD7CX4nxHuM
	E57UvpPmnWvIoLNgNxTzqydSHIILzK6ijcZ1BOEvxnfg0cM4mVkTfokCLsAosswn4spfsdRlo/09i
	rPUHyA/eVjAL2ts4/Xbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMHcb-007PnR-4N; Mon, 21 Feb 2022 22:57:33 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMHcP-007PkQ-5Y; Mon, 21 Feb 2022 22:57:22 +0000
Received: by mail-ej1-x632.google.com with SMTP id r13so13928445ejd.5;
 Mon, 21 Feb 2022 14:57:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=E05PBM3g71A4k7E9vGw3giTSxbO/J+/4n8YQAkXE/j4=;
 b=nnx0lWuKB7+M55EH4gjB6puSSMr7Vw+kyqifIywADnDKB3+xO/NVwpdqIrAvzbd8Af
 bWaIaqI6K3BXoFGo1osFrUJ2B9feX+a+tYo2/avFZTiOnfBq/RsLfnvqjmL+IZjhMeq9
 EYL2fQjw45ewUs/4Qpa4WXFdUsOMU5XiiZwN/eeBbXS//tGp7LJigArOHxku2Ch+xUQ8
 a0jfgN03LqpBNcvScqWtkK8NtSaUeuvw/PKtTofU+lkHskflH0aZRSuw7f8eVeqDIwKs
 Q9cCoCHrrk2imEdVAVoO0sKJQA/6L/HbyQ7nGBUfi7JUCONVcbiQ+3Nf0U8IkE2hCJ+7
 EgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E05PBM3g71A4k7E9vGw3giTSxbO/J+/4n8YQAkXE/j4=;
 b=LAkUWDxGRllmIQKspzX8owujtPc+Dy94V9OVIAYH22fzRdzfNLUOgYLYlViPBe/iVR
 e1MWjo83FXEUOgTu6bD3IOh3f9YHXe4wnRSfZ5RsTK5/xxCC4QbnrYRC4YEjmYcfOiQg
 w+UurwX1aRYWfZ2O09dh4HBQptFw6DxZm5GHcfh1b91pStbEeTLV2/zILBqJm1wt7bgK
 25afbi2BusZb5jlr6LD9G0TS0FaMGuAvDIqK/gwSZyIuM/9SOpdMS8w8N5Ze1VXMORE3
 9QxkXNuoozYwSVz1YfJ9vTlPM/SNvhbkHNDY6Kt66qCXRIUFiVaZHopV8swMJD3ZevN8
 BkFQ==
X-Gm-Message-State: AOAM530/TdiC9wcp07qegDnHkHodDkoTLCfvlHaM0yOKfsBN5JwL1Oy/
 8+bfO7ITFj7aZe5k2MufPjw=
X-Google-Smtp-Source: ABdhPJxkvRMSBgdvJ+9bT568jE+xIiQCMw90veoAJuQKf4gx9NP9cAIeKBPl1NME0MaxbW8TQa9/fQ==
X-Received: by 2002:a17:906:b348:b0:6cf:8cfe:d729 with SMTP id
 cd8-20020a170906b34800b006cf8cfed729mr17748990ejb.622.1645484238806; 
 Mon, 21 Feb 2022 14:57:18 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:f82b:ace:7fd9:1c1d?
 (p200300ea8f4d2b00f82b0ace7fd91c1d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:f82b:ace:7fd9:1c1d])
 by smtp.googlemail.com with ESMTPSA id b3sm5580023ejl.67.2022.02.21.14.57.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 14:57:18 -0800 (PST)
Message-ID: <d8baa907-a8c8-17d3-e724-df490a0fff83@gmail.com>
Date: Mon, 21 Feb 2022 23:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 0/6] auxdisplay: Add support for the Titanmec TM1628 7
 segment display controller
Content-Language: en-US
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
 <CANiq72ko6=dYBvbRc5T7Qq_2mxRtq1NpvcV_saMbTDfz0PK1aw@mail.gmail.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <CANiq72ko6=dYBvbRc5T7Qq_2mxRtq1NpvcV_saMbTDfz0PK1aw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_145721_259447_72073D5A 
X-CRM114-Status: GOOD (  11.43  )
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

On 21.02.2022 23:10, Miguel Ojeda wrote:
> On Mon, Feb 21, 2022 at 9:19 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>
>> v2:
>> - (re-)add Andreas' SoB to two patches
> 
> But those were also developed by you too, right? i.e. it should have a
> Co-developed-by too, otherwise it looks like you only handled the
> patch:
> 

Right, about half of the original code was reworked. Let's see whether and
which feedback comes for v2. If a v3 should be needed, I'll follow your
suggestion.

> ```
> Example of a patch submitted by the From: author::
> 
>         <changelog>
> 
>         Co-developed-by: First Co-Author <first@coauthor.example.org>
>         Signed-off-by: First Co-Author <first@coauthor.example.org>
>         Co-developed-by: Second Co-Author <second@coauthor.example.org>
>         Signed-off-by: Second Co-Author <second@coauthor.example.org>
>         Signed-off-by: From Author <from@author.example.org>
> ```
> 
> Cheers,
> Miguel

Heiner

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
