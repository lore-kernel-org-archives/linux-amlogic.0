Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C66C369B4
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Apr 2025 13:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2VrrmJbMWhl0bGmj1Mj3LXr5Lhhtuvn7RBEgcvnR8kQ=; b=ZU0l0tR7HLthvz
	YEqdKlIxb7EdG8GxtYW2EhaWJ41nFgX8G+wehiCDsHoHE2eLXdeZkXOd9ZdxAdhDhLzbHh/7tr4+b
	zQZJr2QD0JmDtsi/yLJFDHmRQnDBBXjYnZdyBjejEULgSu46NCkyFyDbZpha6yd9bn2aU7Pc/x6f8
	NGAzYh6yCCdgrlKt92voNqrBcFC9nZxw6nTzT8qmja8STx4bcPQ8acef83bYpXuENdeabi6CHuh/0
	k72WsUSkNI9Qeh0LTpURMOUZ0toqbYEnkXOgN6+UCO6H+ZM9SapWKC6JRQ+aRpU+5g9rFQ8Y4JZir
	Yupk3w+zS5eScQsER4Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gJ4-00000005u4y-3x9E;
	Tue, 15 Apr 2025 13:26:30 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4g3m-00000005rX7-0iZl
	for linux-amlogic@lists.infradead.org;
	Tue, 15 Apr 2025 13:10:44 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43690d4605dso43617275e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 15 Apr 2025 06:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744722640; x=1745327440; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=aMLmdqIdfnd6nx5FuiFJ0BZVXHf1CO7exna9eCpGv2tTHWIptuMdv2bCilyKE5fmUB
         as8PIS/LfncKZmaXgRZX4Hft9SU78HMW8uZyFgKX1OvwqU2VSE5znUtZzFn4nAc7vOht
         uBbmp60pcoIqsusq16i5te8KyfhinBvVNfpdzmVH/lkGo99czicskWg8YChYEIaus1cZ
         majZaXPg2CiwxaYJKZtuJ1X/Ub1i3zodQh0QllfZegYU+EtkiPtQMkfzxfEi2a2C4zDB
         GHB9wS/0V4VKP4qMx1kF8DSYRq/yoCnF98/9gm0bFM2RW3bRRN682UBBI+uziZEXfeyg
         LtKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744722640; x=1745327440;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zs7KnnfZKLyJy3tHcV0Bgj/q4jqUjfal2AfLl4HBPO0=;
        b=kHyTS0WA1rGRM2MKMXh3FbTyQr8QocLoHfO/vqETqbJXa1TPoaeMuLh7BaOde6lDl1
         YGKWWUjJtFVhMnjBoZTmAq2wPR48AE+4IBlntRx/5TwgKArAI3e9Vpbdbmm2foc3YTsQ
         ff+z1RIoZBCBYS/SnuhB+eVbXP4J/Uaw0gq1YV80dN/Ph+9zD66/pV2Apzh7J4F3WDtR
         k9DNhyZtINUeHLX9jh+6NOj2gMWGy/d/hlLcJ9llkIF+QZxtPM1fUvzr1vjoH9EAtQJj
         2T9cCgtJjfX7MdcamdFOHLMFU1Sv7Kr5juzdvdJuW1O6h5YsPdC/msvivTNdMawpMp6t
         Ecug==
X-Forwarded-Encrypted: i=1; AJvYcCUjQTcMqaJ6rspKPOKO15X+rFGWOxi7fFG7OJ3561Ljl0dW/+s0x1v9+3cO9FRCeu4E+XRxC1/IkgvZEIjL@lists.infradead.org
X-Gm-Message-State: AOJu0YytbgtL8bb+qBX5JtLEeVNVUVW4m7ut5giUtjikDiPl5ms+D535
	AQTTLbjQjValn+v9y18F3VL7+VINBuhsmNwsSUe6xHUiMthpq0AW75DA3oFHOcw=
X-Gm-Gg: ASbGnct5YnR6MElwddGd3ExfQ6O0QtjntGBcVNfmEznLg/T49tXr6rSDg5K3qm82q0P
	4sq02PuBpV/zWX8miUxXSvQHTpZvvZ1zvoJS6siCoG8vUfRJe/oKWhFOivOUJuURwaNkOtkoNeG
	NjThrGm8rqpJiHbrZHYsL+ypU2gcLDrmbZb9IUldXAvWaUigygTLawzEv4aZUobzztONce2XVGa
	+1vDA/IucuLruz6I6G9OwGIy72igzEs5aCxURERyT8wQ7Ne9X+9HyeC22xSm31RTvRowdIg2W6v
	EVgBFlfLc3tSkvIr6/faTPLuoYyYecAiiwFCHiI=
X-Google-Smtp-Source: AGHT+IGLzdEuk1QDPXYsF98Ye9BX9xDuqaq1bbiDW34OCl+7dp6Go4ivXszBVPBh1MuXNgGiw13DfA==
X-Received: by 2002:a7b:ce16:0:b0:43c:fabf:9146 with SMTP id 5b1f17b1804b1-43f4aafa80dmr77256645e9.17.1744722640535;
        Tue, 15 Apr 2025 06:10:40 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:357f:4855:d5d:eccb])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f233a2c46sm208119145e9.13.2025.04.15.06.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:10:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/8] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025041508-remix-plasma-cd47@gregkh> (Greg Kroah-Hartman's
	message of "Tue, 15 Apr 2025 14:59:30 +0200")
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
	<20250218-aux-device-create-helper-v4-1-c3d7dfdea2e6@baylibre.com>
	<2025021938-swan-facedown-e96a@gregkh>
	<1jecxtwpr4.fsf@starbuckisacylon.baylibre.com>
	<2025041508-remix-plasma-cd47@gregkh>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Apr 2025 15:10:38 +0200
Message-ID: <1j8qo1woxd.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_061042_213124_3BC02EF7 
X-CRM114-Status: GOOD (  18.24  )
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

On Tue 15 Apr 2025 at 14:59, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Apr 15, 2025 at 02:52:47PM +0200, Jerome Brunet wrote:
>> On Wed 19 Feb 2025 at 15:20, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
>> 
>> > On Tue, Feb 18, 2025 at 08:29:46PM +0100, Jerome Brunet wrote:
>> >> Add helper functions to create a device on the auxiliary bus.
>> >> 
>> >> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> >> the same code repeated in the different drivers.
>> >> 
>> >> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> >> Cc: Arnd Bergmann <arnd@arndb.de>
>> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> >
>> > Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> 
>> Hey Greg,
>> 
>> Do you need me to do something else on this topic ?
>
> I don't know what tree it is going through, do you?  If you want me to
> take in the driver-core tree, just let me know.

For patch #1, I think driver-core would be appropriate, unless there is
something more specific for the auxiliary device support ?

I'll wait for this sink into an rc1, then resubmit the different driver
changes to the appropriate tree, no rush.

>
> thanks,
>
> greg k-h

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
