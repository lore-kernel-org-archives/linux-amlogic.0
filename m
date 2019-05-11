Return-Path: <SRS0=6y+j=TL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63A2EC04AB1
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 16:20:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 341A52184B
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 May 2019 16:20:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aoa4XHCw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="LX/bJj4V"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 341A52184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVX353QD9VyigoJMS3sXEdesG9YlqqSDn1f3JIV5vMk=; b=aoa4XHCwQqVso1
	wUrURNc8+N8KyzBN9btR7VUq/ty3eWCthVv1UJsNCWFw/AcdG2e+7kOmITWlsojWtqTzTZ5uO+1mO
	uJCHV8Bzh65lTbf7OrxaMmfeS6GpnmcLgk1zXnw1UZ5bcEvX2X3CCtgm3oMYZKC/7IXmYswQXe9o0
	hlnx8Ma4AxkAuQiWZZjSY94X+ZQAcgo00uruUhc/QK+nCwHtnjONe2iI/aneENbRcw8ebm+sv0/If
	5f0GuJbVmHtSGA8T6G3eclF9Ra9a18QL89zwoiAwZfM1WwoBjXBgLfPZmP8xV5ApNhVTkfT337TFX
	tWdxMBoPLlGoje2exIzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hPUje-0000P1-Sf; Sat, 11 May 2019 16:20:30 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hPUjc-0000Nx-B6
 for linux-amlogic@lists.infradead.org; Sat, 11 May 2019 16:20:29 +0000
Received: by mail-oi1-x244.google.com with SMTP id y10so6601328oia.8
 for <linux-amlogic@lists.infradead.org>; Sat, 11 May 2019 09:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=77CnbYxcDFDt6bYRAhtojcl8kTQMoV7pXqntwyNSY8Q=;
 b=LX/bJj4VhID9kspbovV0ckc2zTzKOogN2Wq84i8iW7Gh0BJqQj5pA/XFAykeaoQ6f+
 JzVMTu6EeJskGmnotL4uCE8PmOgItqy8+XAp6pZf23R05gMxxYPWSJPeLIZgU9o/aQ73
 qYJkbOyS2HxE4TBGu1oK0NCDF+zAeq+kFpOhJUJKvsatPpt7F/WauhqsTHZsvBhc2KOX
 dwTO25cgHSlJ6gicdUniZFxMDv94AbekXoIA/d7OqNiGbl/xw8lu8vQiWO5G66uAmHIM
 7iIaDknjhuSzLq7uIDciUvDKVgYi6PCfq1AoYlrKgzhZliH9VEy98UHsmInLliDHuG6+
 PQoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=77CnbYxcDFDt6bYRAhtojcl8kTQMoV7pXqntwyNSY8Q=;
 b=cl76bQ5mjszGNgsH58nhIFQjcq9qO4sCCv9qLNLG9WUIVuV193Ij5AQaHHBlVsdo1o
 Z/AcO5h8CFf+QYbSDhKu2RQRu+i7S61U+m0IprrERb++BYv012GuGTT03aFcUzcEMmbE
 dwkHKWcGaacLVzvcXpQjUBHY5Lxs/sbTM65GzELIofkocFcEkawQWjs6N920hwwfcA7S
 9HEgWpSunt4IuqwabYSr2wdofJnJ+My3WoofWcWdn/m7Lhf8GY018Sg8T+3NTvThK4lq
 tNEhPtBs4yM2fa/WDiHWY463qOrFmYYDoOvWsXxWhh2BqdlZKlttHtaiG541NJuzf+DM
 6kkQ==
X-Gm-Message-State: APjAAAXyJFAUoTnSDpk31hsFy/50y/2lw2VEAvww/L9l6QSRFpI8cJFa
 vNWA884UG8tj4ThGnL3TF6k3UYjK3cro9LlIXRY=
X-Google-Smtp-Source: APXvYqwq6IAPj/JGv5ZFn3C1jYA11WmZc9wcN5hpth+sOAk6/MejXQM5XnnRLBnSjbK3kiARzzTrXwXvp3HnndUUjqA=
X-Received: by 2002:aca:5b06:: with SMTP id p6mr9037315oib.129.1557591625391; 
 Sat, 11 May 2019 09:20:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190510082324.21181-1-glaroque@baylibre.com>
 <20190510082324.21181-2-glaroque@baylibre.com>
In-Reply-To: <20190510082324.21181-2-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 11 May 2019 18:20:14 +0200
Message-ID: <CAFBinCA9N=e_u0Vo-hVJDav2CZfaUOD3X6xqrVWtMx+e93sxLA@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: pinctrl: add a
 'drive-strength-microamp' property
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190511_092028_407106_CF11C16C 
X-CRM114-Status: UNSURE (   5.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, khilman@baylibre.com, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, May 10, 2019 at 10:23 AM Guillaume La Roque
<glaroque@baylibre.com> wrote:
>
> This property allow drive-strength parameter in uA instead of mA.
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl<martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
