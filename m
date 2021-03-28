Return-Path: <SRS0=bUf0=I3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3DC6C433DB
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 19:20:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64FEB61919
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Mar 2021 19:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64FEB61919
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Mg3PTKqT/MLWWqL33ZEY7qEGRj6J6VavYPWm3Z/N0s=; b=dEYqJvKE0+hMTTGRF2zs5ov/8
	eu0c9oKO5cPrepcDK/JwOsGkI3W4cVcvo2JsEWPUf2AaXaLf3GeqtfuT0kpPug5myB1FAD9nUxplz
	YH6CWweEfoNoj4ykmMvo7UQeSBWtvXOWjQV3vDIDk0rLKafrZbHjKyVfC31vz34ymmNP/ckEt9Jn5
	a4YxzPBaJ6Cq9gnT6U18S3SNPYxguF3HTlOoclH56ZTqaZPvtgnHTyRqqZ4GFafPsmGIi65mPFEV/
	ZOOyrxO7XhF1HEJJjW6lGh2LAoe7poSI8Ri8hn8fX20CUHddnrHRKfl5OUDDdDPwNXhdGlzDrD4SM
	QqAFVxPSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQxQp-001Dhb-R1; Mon, 29 Mar 2021 19:20:11 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQqAi-000cZX-Bg; Mon, 29 Mar 2021 11:35:06 +0000
Received: by mail-ej1-x636.google.com with SMTP id jy13so18921768ejc.2;
 Mon, 29 Mar 2021 04:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VOOl8ErxBPJ+MgHS2Kc6EjQi+pHkac3A/x3zjS/xmr4=;
 b=J3+NAYWxzl9lECtWZwfBVuMBNSU1YAcpsSqHrUrMzB4Wb4nxPYcGQi5hZDUKfA1ZC5
 KPWS2U7Os0GI29mtjO2+0AjGNbgUfe3xqd4bgA20hJZTsIjILLtElOFhQO07sxoWuhle
 WN0PptMh2cDt6R8QbznycVbe18feuY4WtrGUYkrgdHvorNfw3dGHZume5D8Vihu49/W7
 E8AmPbqDv5OdOJ5dXQYstPXT1+g+RVKKiI2lTKfyy2Ctw1aPt7wjcUuS8G2qrg7zR0tm
 iXNcqr3pKMyeYnYRMEr8AKbgQ6vMlw8L3zxotSQZg15lvljlkFZCGd+qH8jxi4g2hfhP
 YxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VOOl8ErxBPJ+MgHS2Kc6EjQi+pHkac3A/x3zjS/xmr4=;
 b=RPluTSyPDENfirBR8veDK36Hf4bPqbdSGPR13w6TGirYXCKB9qUrJ5vlPCFhyy/XBn
 r1AMSpRggLNcjKgsknwCCjnoQEJ2VXXifiaLE25yHb86/wvUKuCkI7AAkn5/3p6pkyqz
 +QEjRInZP5x+AE9imEOSZH7x36sDmSm/K/yDj3cMw8D06LgYfOq5mQoyBX/hLyv8qxw5
 WZVzB98E1gL4xXo1p0f1W7o/nWe9dwdV8GRa84JgO8tJ+zsUHAMFoMVODz31XwOJ79ux
 s+CbDQtyokZdNK2OtPEOXnPLgMRklZT9xd+yd9lhphd6A2J6n4qS7sq1286gQ6EccbfY
 CAaA==
X-Gm-Message-State: AOAM5332CUbnzs+5WGMpRJz1qG3tNTKnH/8cD2izDX61GMvkzuglEvgC
 MrxO/3n6KEt1Gout5yZkCFCsBayRkS4bzIK/0zkZFetHs0M=
X-Google-Smtp-Source: ABdhPJxlBNQj9N4H3RLgqryBwaxCFGh6FH+L/AHqGXOl8bxIbiyTs/KSqTOor0E2c1ryHt/opy9mPi/6q2NoT2clB1E=
X-Received: by 2002:a17:907:2716:: with SMTP id
 w22mr25634218ejk.328.1616966678759; 
 Sun, 28 Mar 2021 14:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210325152410.1795557-1-narmstrong@baylibre.com>
 <20210325152410.1795557-4-narmstrong@baylibre.com>
In-Reply-To: <20210325152410.1795557-4-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 28 Mar 2021 23:24:28 +0200
Message-ID: <CAFBinCCGUSaFpsey=hux=EkZnKAG4YXUUEt08tBVwrd1NHPHxw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] arm64: dts: meson: set 128bytes FIFO size on uart A
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_123504_545657_4CD2009A 
X-CRM114-Status: UNSURE (   7.63  )
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

On Thu, Mar 25, 2021 at 4:25 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> The first UART controller in "Everything-Else" power domain, usually used
> for Bluetooth HCI has 128bytes FIFO depth.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
