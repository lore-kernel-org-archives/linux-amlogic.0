Return-Path: <SRS0=NecF=3A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB26C282DD
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jan 2020 20:51:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9B320842
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Jan 2020 20:51:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IKIcwnr+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="hJUBjxnQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F9B320842
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DYPT6O3vSyqRGg0Tc+KHoJtP9/4GVp7pLLxbLg+oAss=; b=IKIcwnr+eXsAZZ
	RmxDmLKmoihPq2Ji3UU3yuMuMJcz4/3SixYWuBd8TiWpagn44DSKiEthjb/O8aS00rqvCE0g8vkhG
	L+xprEQOGnKVuXgmGuxp3pHcInUDsttOY/FYgaDd/0QuqhSMH8zQf9+YeMVCYKYGD+61r0F0/vipj
	+nbiiN8ym/IwjL5nUUcFc3uYWN5uJFG+9jl1uZYo2+tC+wir6utKKH1rPnVAh6/dpFmIDIp4ZxAUG
	i/zaVhRIHFUWQT1YKrIux2b7j8QS7EPUAimA/rBZh3Sonm/JS0Pkxt0ECRNWRnFuu1bkeLiMLeSsJ
	XfaQTL+9l555XXBe4p5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqNii-0004jM-7S; Sat, 11 Jan 2020 20:50:56 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqNif-0004ih-6v; Sat, 11 Jan 2020 20:50:54 +0000
Received: by mail-ed1-x544.google.com with SMTP id v28so4998127edw.12;
 Sat, 11 Jan 2020 12:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z1allRQVVIcRb3GsPlExTsGVhorTeSQyvjX+yCE+qh8=;
 b=hJUBjxnQ14Mkg+v0KZ6c/t3nrYWqpGIc4sggWABjJRnGUyE8mJZqSJlWevR+X2pXLM
 LQSpClltwxH4ooVGw4tHTB7JHmbb1UXYc905RnfaGPl+4J7rl3o46naKcJtWdi3V6V56
 /TMMbfEbpBJ01C3LFZPaUGan+dJaiT4c8Pxd94x0Ut8sbRA97vGiBJNbgq7xGxIxQnhp
 Up1nQRDJ9JeBKdnQU4B6yRXhH6N57MPmMCHXeoyAEHpZzEykyCldLD1aQkir+dw1Pn+F
 FBUrNk6ERO1+Vf5Gx12umJkOkHkqBzc16yNhfNr7QJmEIdJfFGeCXpUUCgI4JdMUqm87
 Rpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z1allRQVVIcRb3GsPlExTsGVhorTeSQyvjX+yCE+qh8=;
 b=BPWewb2wXkQ2hSBrEss/1kyJh3jWP5KLwTvMmi/bPoOHJ13/ESou+5qOCk+5tjGUD2
 ozD+zglYNmzRIu3r8Nu8yTfhPEhA+Q7GL1/E281hpTaW1UljdE1fZqvIYhmxdP7A6FO4
 CP2LViVEEsmfFQDuNqmN+TGjd/4ngbAVXhOHzFZmn3D1fCE7yZn3fYpIORECGR0c87Fz
 NXvNEamkqOEfoNY2jxSdlYOzA6MlZf8TFb1amZkrymSIVKVfaO/U+XE27PhWgk5h/jA3
 ArKzQNvF96Gh95FKCo/D35fvL8ZgCAGXjFtwwTe38UFLuzATgTyva2HMxzFr6g3IROPf
 puCA==
X-Gm-Message-State: APjAAAWczVbRBIf4rBxgOdH6jySKa4sPRMvPKWotTxMu2sc/VseVltIG
 Q7RuTRRu1JxwY4lg2btITwH0oSqAsdSHs2n5IYQ=
X-Google-Smtp-Source: APXvYqwtaXUZxukv72KXhDvEgYsMrVJcbOLsej/ezPWjeRTXXD9cuqhLaJNWOoMJYBnJuHEu/7anl+4YWFW8qwXN598=
X-Received: by 2002:a17:906:27cb:: with SMTP id
 k11mr9466692ejc.301.1578775846889; 
 Sat, 11 Jan 2020 12:50:46 -0800 (PST)
MIME-Version: 1.0
References: <1578634957-54826-1-git-send-email-hanjie.lin@amlogic.com>
 <1578634957-54826-3-git-send-email-hanjie.lin@amlogic.com>
In-Reply-To: <1578634957-54826-3-git-send-email-hanjie.lin@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 Jan 2020 21:50:35 +0100
Message-ID: <CAFBinCCZSBWdKQwmcvponuUu_aiTnDCyRiPqKDgqfNkJQoq06w@mail.gmail.com>
Subject: Re: [PATCH v5 2/6] dt-bindings: usb: dwc3: Add the Amlogic A1 Family
 DWC3 Glue Bindings
To: Hanjie Lin <hanjie.lin@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200111_125053_255508_B6B1EEC1 
X-CRM114-Status: UNSURE (   9.25  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Victor Wan <victor.wan@amlogic.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-usb@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, Qiufang Dai <qiufang.dai@amlogic.com>,
 devicetree@vger.kernel.org, Liang Yang <liang.yang@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Carlo Caione <carlo@caione.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Hanjie,

On Fri, Jan 10, 2020 at 6:43 AM Hanjie Lin <hanjie.lin@amlogic.com> wrote:
[...]
> @@ -37,6 +43,11 @@ properties:
>
>    clocks:
>      minItems: 1
> +    maxItems: 4
the driver parses one clock for G12A/G12B/SM1 and three clocks for A1
if there is a fourth clock: do we need to manage it in the driver?
(note: dt-bindings always represent the hardware, so if there's a
fourth clock which the driver doesn't need then it's perfectly valid
to describe it here. a comment which clock this is helps in the
code-review process)

> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
I let Rob comment on this, personally I prefer naming the clocks explicitly
also I think clock-names has to be a mandatory property for A1 (see
Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
for an example which makes properties mandatory depending on the
compatible string)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
