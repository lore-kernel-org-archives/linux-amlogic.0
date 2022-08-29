Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C38ECAAD4
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Aug 2022 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-reply-to:
	Date:Subject:To:From:References:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozeA6LVAhbvB4dxe7TIRF2DtI1CRnUInijdsopb0ees=; b=PqWZTJ8aFNpex+
	Qsk+m34ahn/zBb6ddHC2iVMXs+9eErVrEhiuLavw2MPfoKScWYOp+KruugTHGE0BQg+Nch5pANfTZ
	KZZ2GiV6ZvGwGFeXrRz4WldfqkeLxkagBYP+KrgdIFjmpCKR9ipsRFRTnpxusv7QbG74d+1VdvGKP
	2mm4WIJIHkO2gMa90Nr3Pvzi+H6Q27kIQwwBVKPjv3mNI0/3+nGBsluvn9BZgJQUKUedctouI1Ga9
	P6x2cqfCBw7/KzTmyudF4R4qU9tpfms7keyYysUo2aY3nz0Xeg/QxPPCndDdv/Qwr5k3GV5GKO2lz
	EzFIXosiCYxlgp1Lwzgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbNR-006vWj-7o; Mon, 29 Aug 2022 09:48:17 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSbNO-006vTT-98
	for linux-amlogic@lists.infradead.org; Mon, 29 Aug 2022 09:48:15 +0000
Received: by mail-wr1-x42d.google.com with SMTP id e20so9414101wri.13
        for <linux-amlogic@lists.infradead.org>; Mon, 29 Aug 2022 02:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:from:to:cc;
        bh=yviMMnGD2NIBrfVD3zjnDAjWREiyBqmeaA8vluhbBlM=;
        b=MYtv7NXErfomVhACj4CvcivN5wiwJFqlN/QkD3Svj6b+WfT5ZQsEZdIQtNq5LdrJFa
         RMPVkYu7i4Ao/HAeEVdQI/hPwa0SOR7tS0YwhsxrvZMUfdd5jz1tEnycF0VAGFJgXxZt
         4r2zyWzIvXrnVb4vivTUZvwWkFML9pIjnCB3FoRM9Y8V3Q4X+hXchhnV8fEF+FRyh9kg
         4sfg6zLbTCqB391xVq4TU4s50ywE5qP/MQb03XMu2ewstmrrh316bKCwTNEJCmLNEYnk
         T0pV9Gz12E8gxs2Whz60vjZwFASEgdbJ+FM+vYHtNiJgXjTwNesDLcFAzehwL4QQyY1v
         sAcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:in-reply-to:date:subject:to:from:user-agent
         :references:x-gm-message-state:from:to:cc;
        bh=yviMMnGD2NIBrfVD3zjnDAjWREiyBqmeaA8vluhbBlM=;
        b=mvfFhUYIVMIC7Y/SUODkRLnD7XlYzL8wm99S9CLXrK3To7SnRllo5SFe+Rwc6UsdpT
         whzhjj0mmxFg+Ge+Lt9YQ+kuAovoFLpblJcfRAXVgHt2104lM21TMCTPLJQ3RuQCLzPi
         xErnqGeUrbAjF+1CG1h1olp1SUvc4XitHNG5KwG3mynsl3RoFSYs4YW+AoqHH+iyb5AM
         hljiK0IiRVv47j9lyd0XXaihkNpdrRsQ1aWmiT8zGzZuyxYcoBLffKg4JsQ7rSk7x/iF
         tAniJvyY49upJO8GTLhzsk7gNZy0UiV1cArAxCBepIpeb0fLQuNpYw1jO3qgaJQ4UZ40
         7LpQ==
X-Gm-Message-State: ACgBeo2jqkX9HemG2DmQKvAwTtl3Z9BUFRqEYmsxT+cQjTLtTcUW/454
	XXG1TaVKEGGYnuJcAPaKpoifGg==
X-Google-Smtp-Source: AA6agR5lYEMVig3bo2NMgSo95EVg/KNxIK82zRJNlw7Kiy2jmOtoTniZzwOoPGDhG5XQe7+GIZSwaA==
X-Received: by 2002:adf:ea91:0:b0:226:dce6:c344 with SMTP id s17-20020adfea91000000b00226dce6c344mr1354957wrm.3.1661766492719;
        Mon, 29 Aug 2022 02:48:12 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id bd22-20020a05600c1f1600b003a8436e2a94sm4385979wmb.16.2022.08.29.02.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:48:12 -0700 (PDT)
References: <20220805085716.5635-1-yu.tu@amlogic.com>
 <20220805085716.5635-4-yu.tu@amlogic.com>
 <1jiln0yzgj.fsf@starbuckisacylon.baylibre.com>
 <ed4038fb-c230-fc27-800c-c99bd1770a1c@amlogic.com>
User-agent: mu4e 1.8.7; emacs 28.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen  Boyd <sboyd@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH V3 3/6] clk: meson: S4: add support for Amlogic S4 SoC
 PLL clock driver
Date: Mon, 29 Aug 2022 11:46:20 +0200
In-reply-to: <ed4038fb-c230-fc27-800c-c99bd1770a1c@amlogic.com>
Message-ID: <1jwnartm78.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_024814_407875_9AF1D34D 
X-CRM114-Status: UNSURE (   9.52  )
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


On Mon 15 Aug 2022 at 14:34, Yu Tu <yu.tu@amlogic.com> wrote:

> Hi Jerome,
>
> On 2022/8/10 21:47, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>> On Fri 05 Aug 2022 at 16:57, Yu Tu <yu.tu@amlogic.com> wrote:
>> */

[... ]

>>> +#define ANACTRL_FIXPLL_CTRL0                       (0x0010 << 2)
>> I already commented on the "<< 2" . Remove them please.
> Sorry, maybe I didn't pay attention to this comment earlier. A little bit
> of a question why is this not okay? I understand isn't it better for the
> compiler to help with this calculation itself?

Because it is aweful to read

Also please trim your replies.
It is a bit annoying to search for your comments in the replies




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
