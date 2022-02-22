Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50932C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Feb 2022 08:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KpqU7Pe5PGVePOrW9oVyXnD64NlOIu2+3qmlKKo1OtQ=; b=q9JDg/nEtIAnR7
	5oRiWbEJXzKo/Kav4hOUYvg6drzWk+13PWjR4due1TrTsnMI2hJAEiBfVreykoALXNy3ORIHpYmhK
	eFtNp1cFAzSpumBm6hl/qyp3XNSA1/GNQKJPNyGfgFcDuvH/j9idyWzKIPu6SXzyGyn3gFc2Qf8Km
	o+NZkqNVuRuzPtcdcUPBxRwRn4FS7+8OR2Cqv7/z01SHJTC6iiBu/5sS+mdQw0pzpEG/Fy4yztNOZ
	ptBsZ7ypCd+2Db2Bpb3yo0rvl3h8Dy0mbbyHyxjOYEItc2exwBou0d0ZwS9qXaEUxzZfemDVd4ytU
	jufrez5xM4QfJAk0FDBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMQQK-008V0J-NA; Tue, 22 Feb 2022 08:21:28 +0000
Received: from mail-vk1-f180.google.com ([209.85.221.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMQQ0-008UtD-8d; Tue, 22 Feb 2022 08:21:10 +0000
Received: by mail-vk1-f180.google.com with SMTP id j17so9591496vkd.12;
 Tue, 22 Feb 2022 00:21:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Iibz2Vns+LJDKpZPsrx7qvXHxNx3zZSDgqwS8dqEaL8=;
 b=q63+b4oj3fZiEQR6l1dbfMqNKIwGs/A7jUpLsbbdCUda/QuRcPsAkhHhsZlPOlHlDU
 aHFBJZE6tdl4iqZe+KhbOetTe7UFDkZI1KhCoZnGPhKBmW7ulq0sjXmvqmPZcpOPYaL7
 UJH6gMSsI4NDrwhiUgdCIuNj4Fy6xq9eyNRqfEutIkcjhz8GAMSK41TawcmhUzVoJKoM
 lN6tmlWjYO+/EL/n7URdhwRqWdYJYuFDobRF5LnaWdXkIPUzdaSt40qb5vOinz77pkhg
 FBHMnGrR4Ktyc8EuRgt5gINH9+wSvgHGPc/aKY6bFJskrQujKaKrw3sTItUqbWlv8xUe
 4qhg==
X-Gm-Message-State: AOAM532Q36UgDZA87FxYnCNNqv0YM2WIpiccIS/7qEu48sj6mzSgdLTD
 EcYj9u7l335TJgyytkehrZBkQHZUH5w9aw==
X-Google-Smtp-Source: ABdhPJw/LR3VkmQS1feS+ygMi+rgNN+EcCIiqvMUGJCY0DsaUQBMjhZZXFf+j5JT4JMzr6SOkb4nSw==
X-Received: by 2002:a05:6122:114e:b0:32d:4662:65a8 with SMTP id
 p14-20020a056122114e00b0032d466265a8mr9734634vko.0.1645518066648; 
 Tue, 22 Feb 2022 00:21:06 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id k5sm898938vkb.23.2022.02.22.00.21.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 00:21:06 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id w37so7249637uad.10;
 Tue, 22 Feb 2022 00:21:05 -0800 (PST)
X-Received: by 2002:a9f:360f:0:b0:341:8a12:8218 with SMTP id
 r15-20020a9f360f000000b003418a128218mr7903751uad.14.1645518065535; Tue, 22
 Feb 2022 00:21:05 -0800 (PST)
MIME-Version: 1.0
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
 <94ceeca1-3123-fc4b-8cc9-a86e9ad08863@gmail.com>
In-Reply-To: <94ceeca1-3123-fc4b-8cc9-a86e9ad08863@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Feb 2022 09:20:54 +0100
X-Gmail-Original-Message-ID: <CAMuHMdURgGu8jOHfCSvMHSzPTD26yKnG-=+Jp2yyCH5PyWW-Bw@mail.gmail.com>
Message-ID: <CAMuHMdURgGu8jOHfCSvMHSzPTD26yKnG-=+Jp2yyCH5PyWW-Bw@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] docs: ABI: document tm1628 attribute display-text
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_002108_332383_7FA2193A 
X-CRM114-Status: GOOD (  21.38  )
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

Hi Heiner,

On Mon, Feb 21, 2022 at 9:26 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Document the attribute for reading / writing the text to be displayed on
> the 7 segment display.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-devices-auxdisplay-tm1628
> @@ -0,0 +1,7 @@
> +What:          /sys/devices/.../display-text
> +Date:          February 2022
> +Contact:       Heiner Kallweit <hkallweit1@gmail.com>
> +Description:
> +               The text to be displayed on the 7 segment display.
> +               Any printable character is allowed as input, but some
> +               can not be displayed in a readable way with 7 segments.

Hence you may want to make the mapping configurable, cfr.
MAP_TO_SEG7_SYSFS_FILE in include/uapi/linux/map_to_7segment.h?

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
