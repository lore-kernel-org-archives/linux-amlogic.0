Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951F1C4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Oct 2022 03:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z1fcEli177CgC7++4G0aXo5bsliQ5TKx0x2jdgn+Ut0=; b=gzq9JkGVFHhIIW
	w9AUci1JbjdRcypJdYYM/jJrn8L2cy9wC+Q3LgTheRlNeWpch0bRUxA/utkEk2dmgVwYGT9MX4i4r
	2xRqYpT3JhUFRDSUs5Q0AuP8Y2GVrCR5uSLyG2tEInWYrF5OXKbi54RRUSRwIe63UeK39113b/B+t
	GbcHqv/MAHWF5KsSvev0bcJlGcfrmeXuIznOfaneaKHDoT1agooNT0RGMsfnuZmq/pKIxGtAb6mJY
	K41Rpu4U09R4HWNZMhewx8+y3czPE0lCiVaA1LuMyz+uwJwDsPSXu1FU9X7pkysx/tGc5F0YJfjOS
	iVTbuoF7Qi8zYqOb9xiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okzPj-00EBrK-Rs; Wed, 19 Oct 2022 03:06:39 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okzPR-00EBlw-4N; Wed, 19 Oct 2022 03:06:29 +0000
Received: by mail-io1-xd2f.google.com with SMTP id n73so13401587iod.13;
        Tue, 18 Oct 2022 20:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gLpWoxnIs3QCcCwsEK0w8ik4TxF86lHHTsF7ICCHXbE=;
        b=N8y4Z/VgLeF6P+ZBFR91IK1W853NSfFaYWVhs2AGD7DhGfnyBw3lIsMgo58S/kdo6I
         5dbQmkJJwnkl1bGbhDEbdrgaQfbRymsZMNyaqo9obJecteJEEMI5wH0xvGCNNsWi80X9
         LXTTCwZJvcrhQASnXpzXzu24z7bh4KekWHcwwHexIVC19tZ5TxXiZwuzz7xxR+XUAPgv
         6e9kwrGTqoYIGzAdYaQSL3LRMnZGZ4n7o2ohSVpnkjfqoW+Q+RuniAIe5OsBFYgpTn3I
         xv4PH4M0g0eC2xEsSUx4LDbGSggxetIgP6wCWBzvlax4Yug3u12OKjNnj6PUEuNNeMlK
         Ucjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gLpWoxnIs3QCcCwsEK0w8ik4TxF86lHHTsF7ICCHXbE=;
        b=LUXLw3E8coGnZ8jMPv8dd3YAkM/fkJYRBueUMqecWpzYAvzSKCTfKdbmiRyZe1l/Q6
         blRMUV4mDiU75jxI6JLcQZwUzOfn2qa0180/574KTv+tozUDFL38VJbzUrYWifdMDhCZ
         xnLVSPaYPWyIYxeNjX8iNinPjqCEngSsmTl46qE0AF1JeyBTUipgbH+gqvaKhZt/G/bU
         6pPe5JAGi/jm2JAgfqcYWAsxnah1jXD9b3JTqKtz0Kst8SzfPm0czcrIDyZkFM5SjEjz
         hf97QONflpKxIZkZlD6LJGhDObHx40z23wU66w1vdqPd/mhnZIcYR4A0Xp+Znhr5lQe/
         wT/w==
X-Gm-Message-State: ACrzQf0CvsoUHFgbvVQs4Z7h+L8fWJ1mJ8z/hKW6Hl0i8qLTxv7PpRXw
	D5Tcz5SipoIkEnKPAvsTKO0HQ8Tmfr3LWAGFxspXmLbXCeQ=
X-Google-Smtp-Source: AMsMyM68IQyMUNC/lASqb+n7vZcxhpU/sQZ8jKo/UDQU9/0P+t9fqHelhgsQ/xEmNLEB9mJEIBmYNu5bnFPYyvApEIs=
X-Received: by 2002:a02:cc90:0:b0:363:c1c2:e957 with SMTP id
 s16-20020a02cc90000000b00363c1c2e957mr4314251jap.277.1666148779932; Tue, 18
 Oct 2022 20:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221018195122.8877-1-linux.amoon@gmail.com> <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
In-Reply-To: <CAFBinCCqXBk9Xq0k=NA3zGi8spwyPQN7dMVWcjE+pXkXYf+FKQ@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 19 Oct 2022 08:36:04 +0530
Message-ID: <CANAwSgSR6jHRQR6QgzUop_B4gcOsQnfc6LoUXrP0CSTasZkVfQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: Enable active coling using gpio-fan on
 Odroid N2/N2+
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_200623_997167_FAB3B818 
X-CRM114-Status: GOOD (  18.69  )
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

Hi Martin,

On Wed, 19 Oct 2022 at 02:46, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hello Anand,
>
> On Tue, Oct 18, 2022 at 9:53 PM Anand Moon <linux.amoon@gmail.com> wrote:
> >
> > Odroid N2/N2+ support active cooling via gpio-fan controller.
> > Add fan controls and tip point for cpu and ddr thermal sensor
> > on this boards.
> In the schematics for board rev 0.6 [0] I cannot find any information
> about a fan connector.
> The schematics for board rev 0.3 [1] on the other hand document a PWM
> based fan connector on page 16.
> So now I am not sure whether your patch only applies to certain board
> revisions, the schematics are incorrect, etc.
>
> Can you please provide some details about the fan connector on
> Odroid-N2/N2+ and which hardware revisions are supported (and which
> aren't) by your patch?
>
>
Ok I got this wrong the schematics below there is pwm controller, not
gpio controller
GPIOAO.BIT10 (PWM)
I will correct the patch sorry for the mistake I did not look more carefully.

> Thank you!
> Martin
>
>
> [0] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.6_20210121.pdf
> [1] https://dn.odroid.com/S922X/ODROID-N2/Schematic/odroid-n2_rev0.3_20190117.pdf
Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
