Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69645C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Apr 2022 12:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QiqZ9X48KNVVWXFlLY9259Y4I8x+BLo5vBUbUH647Xg=; b=rlI2qrbgcsXhFX
	j97DNl1MOlvbMUA3wh2a7ZObr+17OacRXFuNHvH6ipKpRtEmdoy5R4IdiSJjDCaIqxzwa4cCsmo+R
	FQfPpR4urhyOMro4LdqxPVtgEhKnYaJ+xYU4eCbaNY5VA5PAodMf/zUABt3LotCWfE5Tz3kkOguVS
	kUZHto62fUZt11V0L4jmbfldrti3g3EFezbZxhX+z18NypDRxfh1vxkOMnhnJrrUk5cvHfjrfiT6L
	PGS8gZRTTvtV6dZXNsfBhl8nNctgi1btPM60cudQb3ZxDZzwmnvBi4mQI8vN8CKq7DMxAYR+8MN0q
	G5IRcaRESm7+d+Tb007w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngQDL-00Gcde-H0; Mon, 18 Apr 2022 12:10:43 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngQD8-00GcYZ-JC; Mon, 18 Apr 2022 12:10:31 +0000
Received: by mail-ej1-x633.google.com with SMTP id y20so6358595eju.7;
 Mon, 18 Apr 2022 05:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JVPSPKy4jcGaphHDpx5hUle8QXu6cx0+LV1j9x5xpfQ=;
 b=oM3cZjIQfJ349ghEoRQ0l6lMtZe9XojDljdUCtZlm8iGM2LRBO3PaQ1pS2NybUGQDK
 ZEUEdWTPeXa1MxFSe1r/zn49QJ4OPeHinB2zgwQS/8d6+PNg8UFrfCRuvfQ5NPzyAMdZ
 WdFK/tjcPgai32HBrmAlUBEaQ1hB5ULWeRr7Z6qeluB4bO1AqBbFTs/YwKqpl9fGjtDn
 BEGlmWd7yKYIXzqK2sBEcvveVXiZW8JuEBwFj8NkAn8rwUyd75AqXJfivFk8Yn7MK061
 a2jv262dWtZuu4X776BS0Zi8v2q2b1M1TIICwDrLDJWhAGwWUN6Fi3GAvd82+OPDwKSS
 XjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JVPSPKy4jcGaphHDpx5hUle8QXu6cx0+LV1j9x5xpfQ=;
 b=BmeY+EAqh2MXkiZy+RPdpAPbQmvZykVqYxQ0ZIz5yKr4umMogZ1u4BP5xMyca5qP5T
 E/armwJ3NlyW2I416oaS0Gadu1ioV6Xj8kHRL2GfTSO0WVvGoHWrlYUT+JOAp6Jt6spn
 KIptmmSjMVz9wi88cYVdNBVmkdh8q7xJKSqfRUjfRYEvmXPe1xV8zdrfS+Ql/G3gOI6B
 PV1c07veiBSpz6PksIDDDKkaMV70FVzw1Y9AkQvI6+5XAuRvv7RC5+nUTDlstIFjtRAc
 AIHFCXQBO70brZByfx0QvStaSAR//kL//wymvYXvjKwRJi9oPIQG8hQsbh7KUxBS+Ki3
 WkdQ==
X-Gm-Message-State: AOAM531rc/HIp60Tutmxv/zBvMYl2ch1GzmbtyWgtMKDkn4jnRadaa2o
 1Xbctl+w/5kPoluiICwealBeGxm7U8GiB/ZaIo4=
X-Google-Smtp-Source: ABdhPJyNNskiSG4Dun0u/29PY0MPfeh8JQN+/nnHN7PsNrhegMi+99MqdnEN+kGgx3gyvXV6NAzYrzmCt56rzAp333Y=
X-Received: by 2002:a17:907:968e:b0:6db:aed5:43c8 with SMTP id
 hd14-20020a170907968e00b006dbaed543c8mr8858684ejc.636.1650283825241; Mon, 18
 Apr 2022 05:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220418053202.24528-1-yu.tu@amlogic.com>
 <20220418053202.24528-2-yu.tu@amlogic.com>
In-Reply-To: <20220418053202.24528-2-yu.tu@amlogic.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Apr 2022 15:09:48 +0300
Message-ID: <CAHp75VeW65dV9jJu8-yUWME+XKnaxZBu5Zv8iEJxP2dizA=HUg@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] tty: serial: meson: Add a 12MHz internal clock
 rate to calculate baud rate in order to meet the baud rate requirements of
 special BT modules
To: Yu Tu <yu.tu@amlogic.com>
Cc: "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220418_051030_693840_DD6710DB 
X-CRM114-Status: GOOD (  10.52  )
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

On Mon, Apr 18, 2022 at 8:50 AM Yu Tu <yu.tu@amlogic.com> wrote:
>
> A /2 divider over XTAL was introduced since G12A, and is preferred
> to be used over the still present /3 divider since it provides much
> closer frequencies vs the request baudrate.Especially the BT module

'e. E' (mind the space)

> uses 3Mhz baud rate. 8Mhz calculations can lead to baud rate bias,
> causing some problems.

...

> +struct meson_uart_data {
> +       bool has_xtal_div2;

I would prefer to see this as an unsigned int and with a less
particular name, e.g. xtal_div would suffice.

> +};

...

> +               unsigned int xtal_div = 3;

> +               if (private_data && private_data->has_xtal_div2) {
> +                       xtal_div = 2;

Better to define privata data always


> +                       val |= AML_UART_BAUD_XTAL_DIV2;
> +               }
> +               val |= DIV_ROUND_CLOSEST(port->uartclk / xtal_div, baud) - 1;


-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
