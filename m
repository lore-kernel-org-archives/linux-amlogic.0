Return-Path: <SRS0=97z3=VA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BE1C06511
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 00:01:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EAF321E6B
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jul 2019 00:01:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IJsxGbTq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Lgk8HxN2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EAF321E6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=us+IiZ8UVAkXvDMKS0gWXtAkVfdAcdj0aMy5NymKVyI=; b=IJsxGbTqQxSMSn
	0f+w1uff6rsdHerKuKHYBl60s2xiSox+4RrSJwoCjAOAgfubimcV8jgWRxhM1J0VqP8Vbj3tE9J5H
	iKh5Z2pFRPm/QfEn3bl5CB1r6HZbOWfFTeeAaWBntOzcFqF0GXyYG9A+9I7XobaUqzJQAsrmNPgYh
	f18zH3XSnKs98g6IPgRaUpJ70E+xsL/Hk9Pw89gyviEE9K6/tnDJXW7bTjlUbm8sG93ab1lQII44P
	gQnuTre2wj8yKfhMMEmUVhaJhWqGe0lfd7kSJCeXxZ6+eNK6gAwwqwCScIspG5HOAw1eKUpez9Zvj
	pRTL+LXL3t4aqgKsuLUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiSic-0001yN-Ad; Wed, 03 Jul 2019 00:01:50 +0000
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiSiZ-0001y2-D4; Wed, 03 Jul 2019 00:01:48 +0000
Received: by mail-oi1-x241.google.com with SMTP id v186so513013oie.5;
 Tue, 02 Jul 2019 17:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=obK8pqGpp6ppUzwFxaYhNaIwmhJYhgnzTyLxnEMEbaE=;
 b=Lgk8HxN2TeaySbNH6ob4UW9Y1FU9ezn/XZX87/sUbY5sGJwYYW09z7LGrLbcskZrtF
 h+DBGDabYukmYv22IrZ+49itPNoy9cnyYJwXzXiW6ASg/lvgOvgV9xy8WSmeF0czH39O
 EMhCzMJeDIXushtAdpqBdCjnDi4NMWsS0JZhxKSR2ci7IHbGYrw9WaE3uF7v9RYIQGF8
 ll2bePKQibxC4pnFOZQyZC/NqU6LO7Ln0PNYeNQN9TP1H3SQfRxU8G0AJF4w0TFfuyph
 rybCk3984T+iyvQRkaFh2kGxXryzzYsKtkAkcoIxKP07Jik8Z4QS54FQbbJbr97+pmZH
 aDFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=obK8pqGpp6ppUzwFxaYhNaIwmhJYhgnzTyLxnEMEbaE=;
 b=OTlQYeIAwdgXVKTIEkArDZi5K1JF/XOU3kcTGpAW9E1OoYIfKXX8jhH+b2lJRW2+hc
 bO0f6MVqGaR5pmw8TGs2NjudTJ2lC7KBNSUu0dSCDI9zZaeIX8vOhJ16n1UrQFDQKgjK
 qc8tv3vh/f2u13uMjnPZTkiw7SzrSqZp/X3qIaQuEPjer6uT3PUUfwit7B3hhbQIV3uU
 1TlLJb+UpkaaFw3/lv/e8TI9TB7rWQTlh0oKvD/Bu8khRikr4gbUQM4yrc3ZfOynYhfB
 u4evORWjaA8pXg9d7QC0wNdu2zql6Xkylwn8cg6GdruPRxbiGANbmE+AIsTbcSbRdVBi
 tjNg==
X-Gm-Message-State: APjAAAVWhpZJayq/XKTvH1cTF2Bnm1i1u5yhmiI4/D/+kybMILX0JYb7
 /VekDBiKpYdqM8FFZ8BiEdb8knzIpDXVt9fVCOc=
X-Google-Smtp-Source: APXvYqzsU+VOw/pRzHZkbj7mE4hstsvnVzXhxSZSDwcHEbGK6duR2ysmseQ7VOXaagjXgGDyInbFMOecV+o3mcRZ56Y=
X-Received: by 2002:aca:4306:: with SMTP id q6mr4781191oia.39.1562112106480;
 Tue, 02 Jul 2019 17:01:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-6-narmstrong@baylibre.com>
In-Reply-To: <20190701104705.18271-6-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 02:01:35 +0200
Message-ID: <CAFBinCBTbCf=haP=YmkmtvAxD6hgq32LPMg=OkRF3P_p+okqeQ@mail.gmail.com>
Subject: Re: [RFC 05/11] dt-bindings: soc: amlogic: clk-measure: Add SM1
 compatible
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_170147_440291_6F738992 
X-CRM114-Status: UNSURE (   6.03  )
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
Cc: devicetree@vger.kernel.org, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jul 1, 2019 at 12:49 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the Amlogic SM1 Compatible for the clk-measurer IP.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
