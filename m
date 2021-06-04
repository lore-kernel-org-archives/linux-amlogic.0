Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE2F4C07E94
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 10:38:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF07A613B4
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 10:38:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF07A613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nrysabcy6V8dFWN/C/GlkTEPZHjUnzfBJ1DPHOuUQIM=; b=p7v20EoHTQu2Al
	utbzuRebi4Vzj9sgCPxKul+TxX/4v837C4DcBcVtkokSMZxqnDpN3caecaaH2m0H7thYdg0aJbOlk
	f9UVq8F1bIggZzwagcl0TEQFCn7MOGKU9Xd9A7e1HglcU5zCbdjPw4TykiCUQ9EJTJo1XlTF/tQqw
	n/sNSjt8xMJTp0F4xExCb+TbeQEWIvguITS3aFg3EOFaytJQvaq7xsi1h4fKzMhZqrxwiRRLZrQe0
	82/xUt8XNsxIaM0Kibl0PmarZd798+aJEbOD4shexvmKNv6bdjIe82mfa3nGtSINe6THVtVPlD4Nd
	NFgHi3PncGzBU/NFQVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp7Dn-00D0jT-5o; Fri, 04 Jun 2021 10:38:35 +0000
Received: from mail-ed1-f54.google.com ([209.85.208.54])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6qg-00CsdI-IH; Fri, 04 Jun 2021 10:14:46 +0000
Received: by mail-ed1-f54.google.com with SMTP id dj8so10507186edb.6;
 Fri, 04 Jun 2021 03:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EB54r1V/q9zaUM9NCE4utN55uwjXUtblCYI3g2TbvbU=;
 b=Vyw818AXHPpKdqs8+MaL+/QEyb12dBdnoGlHzHizRS4xah+v4HsS2iOoL3LCt69yeZ
 4vwe9cTEdUv8/6y2l2x5PdBUNgneltjhZ0HkIQUOvWJgXHAOu78fhCfhMMuaCE33ywO0
 E9zvrXVQE86nXtkJExOWWux3cob42HR+IP/E6leFA75b6vTHKYRck6xs79dRRf+1Xfo0
 w0fjbVHWgoQSolsGhecVLpvOPgMW8GPt5qY9MLadhJHcZPMEi81iHoHxcEt/BwGB+Lso
 8Ws9IIJEqn+5u5ji7yuCoe0JUpOnGwrrYYSgc4TQ+k7B83k2Nu51PtbtwnJSs+XPqVmR
 8O/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EB54r1V/q9zaUM9NCE4utN55uwjXUtblCYI3g2TbvbU=;
 b=hQBe39MpYRu1m7j11Y7Og4iOfzo2IIQsfXkvblSe39DwsLTtV8nX3RDE1C95kMOZKf
 s1nBjp+c738+bQX2H+Sk8ofWt2pl59r/b3xyB6PqQyLiM2pFmXmOXibkEmxwO0KdX1SK
 iNkDpuenbu1BUv0tW2h5kmqO/L7CIERj5iW9wFDFmj5iWOkFkAbtBIF6TIe1XQbAlwDz
 xEwFyABb5vV4j+RGa2B+dOoeS/3YUba8WCcNbiEQTDIqLhGk5rx/BN7P3FXErhcnJEhD
 udPsPATAUf3Ygla12O44MVJdGYL1Afooq/eC4Oul6NZgJ1ZOpIQ4gSTkaXEGDO6Di2OE
 IyIw==
X-Gm-Message-State: AOAM531lAzI+mPKHugbrvkYeD/eu4xgSuVSL0xkItsqwp1D7WjMoKhkl
 6GBEVwPzZtsvm5LhEXvwAvZaTLIcZsRSMWzOmdWUewxBB2g=
X-Google-Smtp-Source: ABdhPJxcc5NQiqlUzhlIKHRb4AethxYoWgauUWCwx+PMU+e3Kee73mAWY6Wb9cGuHb3UO/ZRq6cSFnBxn3xeTItob7k=
X-Received: by 2002:aa7:cfc7:: with SMTP id r7mr648821edy.13.1622801621239;
 Fri, 04 Jun 2021 03:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090140.261768-1-narmstrong@baylibre.com>
 <20210601090140.261768-4-narmstrong@baylibre.com>
 <CAFBinCB+SyCmxrjJLcuy=mLsChPZ9i_1TsaWkL3kuhPO1wGwWw@mail.gmail.com>
 <802340ba-edd1-d148-4c6b-e2eae9c2a096@baylibre.com>
In-Reply-To: <802340ba-edd1-d148-4c6b-e2eae9c2a096@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 4 Jun 2021 12:13:30 +0200
Message-ID: <CAFBinCAVeEVWVmpn11RWxuvYBpAVUj37R=U7ykv+YPUNYYTLMA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: meson-sm1-odroid-c4: fix hub_5v regulator
 gpio
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tobetter@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_031442_661413_3549E7EA 
X-CRM114-Status: GOOD (  10.06  )
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

Hi Neil,

On Fri, Jun 4, 2021 at 11:43 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
[...]
> So I'll add:
> +&vcc_5v {
> +       gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
> +       enable-active-high;
> +};
>
> in odroid.dtsi instead in this patch.
that sounds good to me

> Not sure what to do about the regulator-hub_5v.
maybe dropping this regulator overall? we're using gpio-hogs elsewhere
for the USB hub's reset line
or dropping the gpio-hog and keeping this regulator to manage GPIOH_4


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
