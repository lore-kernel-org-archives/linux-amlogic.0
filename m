Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D49CC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jan 2022 21:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkdFQUalLfzurr6CzowVzfCxMXg/LcS8UrS+zgb+t0U=; b=2Ssts6FNs/paLS
	Szsteqm/CGvcbl1eD3RO101f6eyrxAz+XmbvltZegUPHkcOyh+SIlJ44VGlEz3xRZAEmqmZZGEjvx
	fhVOWHh+PphzvdCC7MwtusO3aiZ+3iv6qWissaOrDy4tcrzRofaa58IdNbv0RngWprC2idKOoJYrz
	KWbiDZAiS5IhsEAWEFMnjmnXyhZY8zYKIby8MNtObL45R3ukfiVfomCNCqcmW9lJr3Q/IcEI7rVor
	Jk2REibpAECY1lIC/EoTsIQXVOjy/Cur0L2mdnKxOjXHmYu8a1c4pxIH9FfQbhcfLwetO53CxD7qK
	JhSrroOjWbBXRsJ9ophw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5xEe-005JsX-4f; Fri, 07 Jan 2022 21:57:20 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5xEb-005Jqr-RW; Fri, 07 Jan 2022 21:57:19 +0000
Received: by mail-ed1-x536.google.com with SMTP id m21so27332475edc.0;
 Fri, 07 Jan 2022 13:57:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zBbZze+NTTaBtTNLSE49NYeYh1zKdJL76JcqKt2vsow=;
 b=H+A56YS7PpylJuLmsS39JH+eKUswGIj6b2xPbkNczasqwK1hrv5hlKX6YWq2LvIp1g
 WP9lnZlusrLbw4vkfooQ7rFH46XZh7r9LvC/sMAU0g9wtSUZ/oVQawWWKL1oVSDbkEIa
 mevCYT66ePU0FyiunrSDGCloRonG49Ovvg/jCdJd5MuuGo8cX1s5B5JtT4ESVGFuq9P9
 8jEStG0jFRa8AD2PU9gYBE3KIWI76gdLFoGUozm9iwotN5svCZo1924sQPPq/MuxJoJO
 BIkRM8LUr0jVdUEfat2GSiNcEis18IKZ0eWpfUyHV7Bal1WugqbKMheVQ9r5XNJWQBqN
 mxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zBbZze+NTTaBtTNLSE49NYeYh1zKdJL76JcqKt2vsow=;
 b=CZ+F7wmM8Y1EewntBh2HXuG1IPjVo/fj7gXpwXmJRnzEpv58bD6uHT5rwzfaJ1BS4J
 R1NpVe2JqkLJ9uCei9zPeRu578fuokY1qfkAmXKjQ96jaGQC7k0x2P35sW7gNTsHrP4w
 kyxvNz7cimxXE9aKykb8CEzTU/LFS1EpHtTdBobMcy8Mnx9rXFmTt4gRmcppdcDGFm/B
 wduj0hrHCX7UTry/+09a3MctR70YlZGO1YLGfqXOzCYJqqiarKk/nTyuOxF4HEy4W0Gc
 gQTvbvYu0SmMwwYxN4pM3thYBdOWw6odV7VBzZdYHsDXYjzxBd3A9hWeBy0rz7VhDNgC
 Sj3A==
X-Gm-Message-State: AOAM531IFFgZaQGsmEcpKJXhT2nG0y7pIszihZ/9Xbq9c75vRb9e23Br
 y5w6wAXfKII4CWGJAcfzTeXKjaSRJuQLp+Nmtx8=
X-Google-Smtp-Source: ABdhPJzDby9D34unJG2ZB7reqzlxkBNe6PlR2WAX+belp4ijR7LhFKbQC64JKiJQkLGSMKKILBVf19WnTTSJny1l0Jk=
X-Received: by 2002:a17:906:f46:: with SMTP id
 h6mr22250197ejj.281.1641592636234; 
 Fri, 07 Jan 2022 13:57:16 -0800 (PST)
MIME-Version: 1.0
References: <20220107023931.13251-1-zelong.dong@amlogic.com>
 <20220107023931.13251-3-zelong.dong@amlogic.com>
In-Reply-To: <20220107023931.13251-3-zelong.dong@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jan 2022 22:57:05 +0100
Message-ID: <CAFBinCCmTwPcmuMAFP-rgu_v5NR0Z3B5bp-WTEvnaf+UMY5MRA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: reset: add bindings for the Meson-S4 SoC
 Reset Controller
To: Zelong Dong <zelong.dong@amlogic.com>
Cc: p.zabel@pengutronix.de, robh+dt@kernel.org, khilman@baylibre.com, 
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 jbrunet@baylibre.com, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_135717_952081_F8B24CBD 
X-CRM114-Status: UNSURE (   6.44  )
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

On Fri, Jan 7, 2022 at 3:40 AM Zelong Dong <zelong.dong@amlogic.com> wrote:
>
> Add DT bindings for the Meson-S4 SoC Reset Controller include file.
>
> Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
