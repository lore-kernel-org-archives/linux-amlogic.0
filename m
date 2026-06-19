Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A532CD98F8
	for <linux-amlogic@archiver.kernel.org>; Fri, 19 Jun 2026 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koH22Vr49Ff//EUf6Uf/ZZOIuBypYUHt9AbXrCn2FNY=; b=yidCIzLbIXK7H3
	S/phFXe4KYjARils9d8RPxoKjG1RWiCcMBVdiq1jKSGnhF+FLk+aVyUiGqqzGqkT1Qp6fOf70gmkX
	3NKw5FxVlTvfJhgUxMIacSM+9fXUhTF520Ugy0El8OxLI8a2H2z4jGytpmIOgobZEWCbwyc0Bm/pI
	gw1kEmgbJqnU42ZxoF4mg8Hdy0LYEhVYd7/14ZmX9VECQGO1+AiOCzXZ74xw3knw2BIxsrz3DZafI
	wh5v5TXgYvrR2WLTvbUzic6/8EdA39/EpwfD0RziJBkDS5XNP6UtCTXXxHhWP1uG6xVIvAc0lMCq+
	zOlbKe1zFj4FLFwIOjZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUHg-0000000295P-2QQR;
	Fri, 19 Jun 2026 08:09:04 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waUHc-0000000294f-49kC
	for linux-amlogic@lists.infradead.org;
	Fri, 19 Jun 2026 08:09:03 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4627adcf4d6so1188373f8f.3
        for <linux-amlogic@lists.infradead.org>; Fri, 19 Jun 2026 01:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781856539; x=1782461339; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I3WNaVa6u6+Nzfb3NV3ypwCQ74H2NIZsFLsn4sFU7yo=;
        b=jv6YVJc4dbr3ewR79vhPJ47FP4vTPNW6Kg31Q8I0p+o1DtiBYBFNR89dK/cZhNTvtB
         mHz0WjPV21CCXwIxtzNko96p9NdQPm1HOatIFbiOu4e7OB1/tXD0Vq+mc1AbCdaISTuK
         aqhQtOQ12T8LBesr1iEGwFv9utAqZCvkg7gRZEKiz6lrBjwNOJsWvg7r7mvNwQJiSKTD
         97hcW9XTYIXzOpm9xIaPRZxzll1VIApjLfWiKLaZyudDOjp7YZocwUpsqMB4eCGY3hsc
         +z6TxhPx6zXrHWJ094z7xjUae+0itz3JDyE74ievl4LdiJI4gXGT1rPGMoGkEIvj3fNU
         QTsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781856539; x=1782461339;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=I3WNaVa6u6+Nzfb3NV3ypwCQ74H2NIZsFLsn4sFU7yo=;
        b=iozWqux4X1NexsCkjGGEb/RFratY+om/ZFs9QyQDLKQc1lD2k5KhIIcDGO6QUUw8dn
         m8iYNk9uXIruyoxe/MFP2tlAz9CVWK6MKVPpRFptR/KEhiJv+YVEkP1DJ/t79l8IVzGI
         B/RNgJVqBHgZZ9VTOh7povdvxZxwWt0p4uHhSNwtnI/Bq2Xq1Z58J5jJkkWNw4lqW+/D
         akOhvhqlT3K/jTIMV+Q/b6ByYsVeUhUFG0wuonNstWWs1xJVDzZVhIkdTlfur5Swo0af
         Sif76vU52xmGD83O5kB6dZgD4/4+keMrSVWpRxGCaJSRrtzwTqcG8LOz13fn6MYoZkfK
         miiw==
X-Forwarded-Encrypted: i=1; AFNElJ9qx/LfpCfpsR0lPLLvlSZU8RwFlNEOWfohEfPLT/8fg61bbEE7dkvPNamWZnugSMRQURgz3JduMb+Wmlnp@lists.infradead.org
X-Gm-Message-State: AOJu0YzSJOKaO/SttqxLwFfnwziZtIyTFB3MJsOxksWmbM0mqR4ldq5y
	t6WX3aN51Q8A3ss4+cRLuHxaAKjjAN0XeK945a1T0mkgBXydO8vjQb2wnODz2mpkWTg=
X-Gm-Gg: AfdE7cljCUvGflyL+mI/n8PL/ViiuU/vl8nH0Sd1NbZir12bJrbkLSf9h/F5l5wYM6P
	Zs6dj2QjfTjMuT+dge8X5DBDUIDG4UsJtq0a/I9lRDvC9F9ss22h9dIb401pajQqoRDGGTWOfPv
	e4OTpGIACDh/5iXWO7OIXE2ZDt3oyDWuT+y2u+ehlUyXH/eAdxMKWg4sD0FGfOiAgPQT1ZaGzDr
	Kn1tQuXsqlc4/g5ufVJn7mRrvISpV8w9DPldEIlebnbmVdrUE4SVEnzJc1LX5DyY0AUHZBY/q8u
	UXhWRNw83y8bcCnnGT8fT7s9AdmTcBlFI8Wu67vgbeVtAU9V0Xuh+zh0ctJ+O79oE22M0BpcNj6
	MrKc8piahCIIUq+GLN3K39WP8Hqm5oCw4fHKVLYsWZI5P9U7EIe6IilzROguNqwyneEjk9EgSv4
	q4cWk9srzwjXXahoef3aOVIw==
X-Received: by 2002:a5d:5342:0:b0:461:946f:9bb4 with SMTP id ffacd0b85a97d-465097867ddmr3541283f8f.23.1781856538850;
        Fri, 19 Jun 2026 01:08:58 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:95ed:eac1:5731:4e21])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4650b67a33csm5299452f8f.17.2026.06.19.01.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 01:08:58 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: jian.hu@amlogic.com,  Neil Armstrong <neil.armstrong@linaro.org>,
  Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd
 <sboyd@kernel.org>,  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Xianwei Zhao
 <xianwei.zhao@amlogic.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
In-Reply-To: <5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com> (Julian Braha's
	message of "Fri, 19 Jun 2026 08:48:49 +0100")
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
	<20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
	<79b1a519-5723-4e0c-904c-b7fdf9564ee1@gmail.com>
	<1jbjd7c7ip.fsf@starbuckisacylon.baylibre.com>
	<5af78bca-7c49-48b1-af8a-cfbe55ae26ba@gmail.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Fri, 19 Jun 2026 10:08:56 +0200
Message-ID: <1jqzm3ar53.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_010901_059855_B8602C8B 
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

On ven. 19 juin 2026 at 08:48, Julian Braha <julianbraha@gmail.com> wrote:

> Hi Jerome,
>
> On 6/19/26 08:29, Jerome Brunet wrote:
>> No, regmap clock are directly used so this is necessary.
>> Relying on other module dependencies is not enough
>
> What do you mean it's "not enough"?
>
> Functionally, any user of COMMON_CLK_MESON_DUALDIV can also use
> COMMON_CLK_MESON_REGMAP.

This driver directly use regmap clocks. This is a direct dependency,
required for the build and stated as such. If the module needs it, it
depends on it, simply.

Relying on indirect dependencies is incorrect and fragile.
If those dependencies ever change, the build breaks for no obvious reason.

>
> Unless you mean for documentation purposes?
>
> - Julian Braha

-- 
Jerome

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
