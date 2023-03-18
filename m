Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2708CC74A5B
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Mar 2023 19:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXEuhiUeKCHZbyqOFA3Wb/D0v81fRyxGviLlbrubR+A=; b=TiQPm/OilrpDQE
	+Hy4U4bhipsbpEEXSvQZaSCIQhSND9pqSZjfq3PBkP9ZYy25QkVQdaSi8kOt6GztcYeDA8i1IZAw8
	tFlpU97jiAnHCzEP6dUZJHpUGmNxtTpydMQXLLtiDlLIiRkK2WKF8yF4ud/4fVOg2ET83HUdX2LV6
	P2YEXSNe+ZhA0WpiZTvtL9Jjoa5x9TsAIPmf8lJ24joob6nEIa1t7AxGr6dgHpYPcZTKwzaOzIZQK
	s+s38pY8RMlvtXE7AVCLrDwz/QYq8Vr3eF9o4efJxJaRvySL+OEL0/OmDsPIlfGwQXkd2VfznEreo
	Oncu+k2bDEKSAgJYt7dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdcdV-005Ig0-27;
	Sat, 18 Mar 2023 19:54:41 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdcdR-005If8-2c;
	Sat, 18 Mar 2023 19:54:39 +0000
Received: by mail-ed1-x52f.google.com with SMTP id z21so32738011edb.4;
        Sat, 18 Mar 2023 12:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679169275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ugNoBavPQKqYB1HpGD6pu+JcOSaSD4asxPZtNzxY838=;
        b=lfElZqLM4ZYUfaVc1XvgNLQZnVPjobasOSFMsbaeXRVLO/DqQFDiIdGTU/0EUHFvch
         E20Su6WSyt69GyuJvoNH35zofm2R8losjP+g5HZcyLE09e/E9DEIVGvwdb6npWlDuxwg
         mkEABynTqlBVbGzzpAKIu1WpxvHErvYt8+2y8b4jmT9KosrZqDLC+72iKlPbLBb0nxYW
         I+VBtp2RLxBqBIAbSj9ywV6bJPj9kIuR2cTpcH0MvQJ1x9LjVfOsVKewLqdnZF2zqjSM
         OCYj/VTifNHmrX4wmKd8Xa9tDiKFLOiGdyZy2hkZklKPS+DvrRoFOABgIuCG2kNW/9pl
         C4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679169275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ugNoBavPQKqYB1HpGD6pu+JcOSaSD4asxPZtNzxY838=;
        b=M0Md//lUdlkKXr4n5WV/dOEVT7t9Jz1GNIv+0v3+DsMzuR4VF3IcIMSaXyOm79WWxM
         NlbufcOyH2vdYP7w0hQokkgX8s2Xp6vOQVb6OSqI/tW0sQ7AjNK/fb/oHW9LTEDNYas6
         TA4We2Skndcd1H/eNpqSrZle+nHrLsPNHOZBnHT2vNteEI4FYM327h8uJc5bJXTm796c
         WDZy/Qmpp6bve01krEwPGku7bvVf0FxKspYdr0EgvVFnrGN5/fBZ8QsFg+s0CdsSSdLq
         JEAJBURNvLA0npwsoBnMmRizSR5blrNZw54ufTac49LFPV+60TwfOXQStRSSrA1YMVIl
         8rNQ==
X-Gm-Message-State: AO0yUKWeJShySOxYTuVH+RJvjtI4QoJVO1vIzOZkKQA1Wx3cTl9YR5b3
	sdfITiCYQzbCp185c0LLyDsVxArbaCwohsQOmRdv51F4tOk=
X-Google-Smtp-Source: AK7set9ZyRM/wwMkZLP9WaXbP7UtPn6zWIvsNCYBVjOGpzy9YpfhDF7ew4lUGdL1/22l9GtLJ/slqv7sFFeF3Vxetm8=
X-Received: by 2002:a50:a44a:0:b0:500:2af4:e3fa with SMTP id
 v10-20020a50a44a000000b005002af4e3famr3863281edb.4.1679169275323; Sat, 18 Mar
 2023 12:54:35 -0700 (PDT)
MIME-Version: 1.0
References: <12428fb9-8a0e-3f3c-ef71-b1edca6d1a8f@gmail.com>
In-Reply-To: <12428fb9-8a0e-3f3c-ef71-b1edca6d1a8f@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Mar 2023 20:54:24 +0100
Message-ID: <CAFBinCChdk0SOQ+UGRFDBj4a8koD6a3rbZKMJx_W77_SsoMMVg@mail.gmail.com>
Subject: Re: [PATCH] reset: meson: simplify meson_reset_probe
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Jerome Brunet <jbrunet@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_125437_869664_A48D44C6 
X-CRM114-Status: UNSURE (   6.28  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgMTYsIDIwMjMgYXQgNzoyNuKAr0FNIEhlaW5lciBLYWxsd2VpdCA8aGthbGx3
ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVXNlIGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZSgpIHRvIHNpbXBsaWZ5IHRoZSBjb2RlIGFuZCByZW1vdmUKPiBub3QgbmVlZGVkIGNhbGwg
dG8gcGxhdGZvcm1fc2V0X2RydmRhdGEuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgo+
Cj4gU2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4K
UmV2aWV3ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29v
Z2xlbWFpbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1hbWxvZ2ljCg==
