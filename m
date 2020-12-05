Return-Path: <SRS0=t4U2=FJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A330CC433FE
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:15:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DDC623117
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Dec 2020 13:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DDC623117
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=klez2xofbOF0WUkqKbqA8oL6qvLCB3PQgcWQpD3zVkE=; b=2pXS2H+Jf0DbGV9zLBEk2AHlq
	TV776CJePsISNjOeLJfxKjo1dpoo935ObrWhX4DpNqzd31IbqEL2s39iHSHpLcEGS0igob/m9gAq3
	LGsBJPsCGZjYrLU/M/vc9K5KfNIbzGaRIb9otTrFrIWZQQAGBslgAq561ys086KgyXz2Xs9Ar7d/L
	iOCoCkbQ+tXk40N5V5eCX3/ZFSYaL1hJkENB9xwL9yAhJkTKMRhZtQCR9pR2TY+QEZr/0uaSTRDDr
	aNpU50FRNZWH8bto042uCJP2OicGu2NFRbLJfOdPmNt/SidpGTHrL6+jpYlia5TQg1SIeFLa5B5Xt
	Ri4otmRmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klXOr-0005or-Uq; Sat, 05 Dec 2020 13:14:58 +0000
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klXOl-0005mx-Bb; Sat, 05 Dec 2020 13:14:52 +0000
Received: by mail-ed1-x543.google.com with SMTP id i24so921632edj.8;
 Sat, 05 Dec 2020 05:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KanII/0c4hSypDA+mfldsnoEt0x4vv2WL2F1j4Ep7NM=;
 b=vdhGiWLxytc/tPUD3UFZ//syaVPUpl8uechirE2o1DO7LfwEW9WDQ8yHqrBXxkcPCZ
 vVuq0c2y3WWCrORe4epDzxjcZ8UHaNK2MkjsjIbNw0smBprgyAc0NqqBefKHYx8pLefl
 2Ta3okMaH/vRCBMhu4NOfsd3CspDpm1V7gg0fZS6FQa8uT44EAOdqWYZsWBzuEW+DhQp
 yHAjnE3VawVmbTRao51Vey9WrQ7ZLDS1XSlzoYbXL2dUwstGyWu3j1O8P580hZqpNkg+
 LXb9iSsFR6aNO3Bik4aEGP3fY+z8a7huOuUXX/JakGgdfbAy9utbYaeSr+weXt9PLDf1
 kx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KanII/0c4hSypDA+mfldsnoEt0x4vv2WL2F1j4Ep7NM=;
 b=I6bgVaripiRv7FPOVqPMI69QWw2KMKtkkg+p5LoLa2mprmSUNUCfiNqYGhG/ALKNy1
 ZPkIe/7xbgYwmCuVzU+vx2aZBt1eMckuWY4FMUGMQ99IoBls6HpqiFTA5oHHjkGMFe6J
 B5nvK2a45dGZ2sEeOQPKWF4ku8BQmvgZIYoetJmWfT6ylhUCnBPPt7Sa+20AFgDErtNn
 2H+RDKOIdQ24gtVBVr3pAJn1fGlyP6woMaJamEkMQrwyb41z1yMGDC1gowfOb0FPE6O5
 lyrZfPuSB3snsG6wfoC10/WQYhM6kIWW6vhmOx/lo4Skjx0LnWHdUILiAHvFBWzrIXh4
 51OA==
X-Gm-Message-State: AOAM532coBs0+GXnCslQ0agtrBeYf5stTjvRIUYlJ2vgrRA1Mot/mtYR
 bdPMxjCLgxXKI6YPh5gKK2aeNV5w4T73rTyftpUFRdk9DPE=
X-Google-Smtp-Source: ABdhPJy6nnnEF5KZAZmesZ0lObpz1o2gF6l9j+Xie4EkvTKJLwx/M/Yvhmn1sLMhWT1ZI54reNRgZPc1fDjAv1tbguo=
X-Received: by 2002:aa7:de0f:: with SMTP id h15mr299636edv.110.1607174089920; 
 Sat, 05 Dec 2020 05:14:49 -0800 (PST)
MIME-Version: 1.0
References: <14754fd95378b78eb9a0a3f8b6bab13f7263c7f1.1606828668.git.stefan@agner.ch>
 <83c1a57cb99c04dc31098166f0c26073de5e7709.1606828668.git.stefan@agner.ch>
In-Reply-To: <83c1a57cb99c04dc31098166f0c26073de5e7709.1606828668.git.stefan@agner.ch>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 5 Dec 2020 14:14:39 +0100
Message-ID: <CAFBinCBnqHkpQ79PVfCqJPbC3qj6v6T-HsJehffYzfaDTPxUgw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: meson: g12a: x96-max: fix PHY deassert
 timing requirements
To: Stefan Agner <stefan@agner.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201205_081451_408805_01F8E330 
X-CRM114-Status: UNSURE (   9.68  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 khilman@baylibre.com, christianshewitt@gmail.com, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, jian.hu@amlogic.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, Dec 1, 2020 at 2:21 PM Stefan Agner <stefan@agner.ch> wrote:
>
> According to the datasheet (Rev. 1.9) the RTL8211F requires at least
> 72ms "for internal circuits settling time" before accessing the PHY
> egisters. On similar boards with the same PHY this fixes an issue where
> Ethernet link would not come up when using ip link set down/up.
>
> Fixes: ed5e8f689154 ("arm64: dts: meson: g12a: x96-max: fix the Ethernet PHY reset line")
> Signed-off-by: Stefan Agner <stefan@agner.ch>
with the "registers" typo above fixed:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
