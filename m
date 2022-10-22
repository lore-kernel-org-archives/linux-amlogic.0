Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851AFC04A95
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Oct 2022 10:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eQMGL6RmBcRJu3YoYw/BLJbcfLztlW7VPs7gZdRkZGM=; b=WrXSJgKAHUcSv+
	oNtE8H7c4Gad/oQvo/C0yp3JYGqCptqjkPSdXY9GPBfnx7oRM7paujh/y0nvuCpAlymTTklS7jFsN
	GYoNVwQiAlgId8YoDSQbTDSZ56X4621Wl6EHH6543jQLsgNMwdCYMQVJ1+YbvSja6IxARu6fEjxAe
	5wrvPIoovz++VpX2XwGTukoaL5NS8/GEQ7HBGGCgQ9amHQxwE2aqvRC1I3A5+zoMtr9kp5opO6/p0
	8pw0x/3a8NnT6iIjXFDxPTX+xq1ooHhqX7Og7styVJJ5XwBb5NTzVGtSVICgGz6J9x1dQ5fHjyfec
	WjCkLP+TXTAOFl2sAp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBZu-00CACk-5w; Sat, 22 Oct 2022 10:18:06 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omBZh-00CA7l-MA; Sat, 22 Oct 2022 10:17:54 +0000
Received: by mail-ed1-x530.google.com with SMTP id m16so14357612edc.4;
        Sat, 22 Oct 2022 03:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdufI3Hje46oVXzKveQgMEHAhY/MYqQrs94ILdJz3ZY=;
        b=eUU/j85w3dwp8X3qf7WPl93f2WYeebxlLlOoVDHLru0upvpUCyr3zNuvLppI5kmykg
         sNToyeVPl4CxV90JHZBRA4wrtS2DzsZyOJfQxVcsRrQXgGRqVbe98Blh8wD6Bn8/TkHZ
         2HA5tYLnPBacYbUpaxLKoIWBz2Rpz8cwkpCXUguPmd1jdfKAE2Wxgfdu54cIvARnQboe
         zixa2tKRILmXErh6R3zMa4Yq3Oit0L9MjegqM+NPwQpjFgAMkqWajK++p+G9SPi5PKo6
         LqaeqfEaGjigAd8JfIcWLf1fYGngssZax9f5ajPf2TADkDj5OHYJUNCBB2YYEnO6ataC
         zPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdufI3Hje46oVXzKveQgMEHAhY/MYqQrs94ILdJz3ZY=;
        b=XHhSk+OZHeZMzNljykmLcFBsfVwzKUqtOu1foln+fr/npbItHoZB6okKC1ucCWO3Iv
         Vg4R9ZN/jVtj514h0vq2FdEIHmbKQPVgJzB5NiLX2La7jbqGq3ZKWPlpcNRGhiv6LO3p
         iv1f7Jc1h8vpx9xNLtKP1cKikV//ji745LtrWzaQ6ZVfxicbxEQrgRzGDMsauFAHAz5p
         r4Wu/NGePWNrCSSUXc4e9tGowMOIqZ0m9KWd/vbqWBkp2zSsrORyc2bs5usYzmzPtf4g
         O/RXkntUVfWoC0zIPp15GCKxek8pkp+g0+NCfyM1ZWp6V/eHj7EZ2oG9JJEqgHo+zLzw
         xFvA==
X-Gm-Message-State: ACrzQf15Jv8UXm+wA4rXK2SaOIM67VwE3s/+fr00c38bOZloo2IlfIwZ
	ZqWzyWI3/XZI2JYc7taJT81/EJ5+1n5I+KAb868=
X-Google-Smtp-Source: AMsMyM7gp0sIMAuA7hxNeVlUzuW0+59UJAqTcGRUXxnKjlIGK3qUU6iuED0glB4xpGjPuhGXVt0D9ns+7w3RCqY8KeA=
X-Received: by 2002:a17:907:3c81:b0:77a:327a:815f with SMTP id
 gl1-20020a1709073c8100b0077a327a815fmr19834118ejc.422.1666433872323; Sat, 22
 Oct 2022 03:17:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221022084737.1028-1-linux.amoon@gmail.com>
In-Reply-To: <20221022084737.1028-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 22 Oct 2022 12:17:41 +0200
Message-ID: <CAFBinCBu_-0m9JeAr5kd-v7Z5LTi7w0WmmUYybW_kL4KJXXpOQ@mail.gmail.com>
Subject: Re: [PATCHv3] arm64: dts: meson: Enable active coling using gpio-fan
 on Odroid N2/N2+
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Dan Johansen <strit@manjaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_031753_745937_061C9031 
X-CRM114-Status: UNSURE (   9.76  )
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

Hi Anand,

On Sat, Oct 22, 2022 at 10:48 AM Anand Moon <linux.amoon@gmail.com> wrote:
>
> Odroid N2/N2+ support active cooling via gpio-fan controller.
> Add fan controls and tip point for cpu and ddr thermal sensor
> on this boards. Drop bias-disable from set pwm_ao_d_10 the pin
either use "on these boards" or "on this board"

[...]
> @@ -1982,7 +1982,6 @@ pwm_ao_d_10_pins: pwm-ao-d-10 {
>                                                 mux {
>                                                         groups = "pwm_ao_d_10";
>                                                         function = "pwm_ao_d";
> -                                                       bias-disable;
&pwm_ao_d_10_pins is not referenced anywhere so it seems that this
change has no impact on controlling the fan on Odroid-N2(+).
How did you test this change?


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
