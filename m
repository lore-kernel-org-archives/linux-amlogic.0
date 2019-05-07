Return-Path: <SRS0=hY+l=TH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86467C004C9
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 18:10:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D147208C4
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2019 18:10:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eW95DKIt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="t55CWEr4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D147208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JAGWYUs1aXvqayYR2++ImnK0hh0Y6D6kM2eDeD+75LY=; b=eW95DKIteke0Lj
	kwWPZIRzWF2R1S2cJc3AhWY2K3fQSL1JBg9jY+DmTcsI28EPHdrmBoYVYgWuKe5zZ2DNZnlN3zzFu
	yJhArd6D4OLzYoMs3jnj/ZaCAOybS1J0pfA5r00oHtLv54UXw2oTqJpFOWm+h4wnsNOwR1pseiRbY
	uhP3Gs/FkNRrXFW8KVdwd3/Ct7Zbrnq1DQBNFt79bxhibVRGK6Nad5YdCInGzmvRSb/vhud2PAAWK
	5joR2H7OSz0sW+QJOq8Ev+Zc25qjoXyPD7ix6jITUCSZmcGmoNBdFuPdhZfo+djCBT3cyPzQ6wUBk
	CvmDNndE7FBKq0+SxMtA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hO4XQ-0006AO-5z; Tue, 07 May 2019 18:10:00 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hO4XM-00069g-Qh
 for linux-amlogic@lists.infradead.org; Tue, 07 May 2019 18:09:58 +0000
Received: by mail-ot1-x342.google.com with SMTP id d10so10745831otp.11
 for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2019 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/BwTINmche9opIL7zBMQCWsHXeqw7MIVdob3Aj0xWt0=;
 b=t55CWEr4h6A7mXHO1OW3wPHGDHGzFqHvqr5sHDoAUiOUiSX+ahQ5fAC8TI8UfMPI7I
 pzT2ccK7qShUInrcOamnCaoAYy/T0/W16dOR/+y8M6v9WTYe9TSstQzhmGVLclfTqCtS
 y5gkDnHVg9zi/a8t+MdCiDPrCnLg9xYz64p9GxplUFOeib6yZytHYAz5TCO4xkMb4ww3
 xOmvXR0vILSsj2ybPGtll/F0vR8XjLUqZi7uHlitQSy58sigey0kW8bmrRh/uW0VenQv
 KlzpuUD5QuLSfBXnKwe7Cz3dRVMKfdIvHCdYh+spHjB6+czHiISxZIt/CMQP3d+iy+b8
 Gagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/BwTINmche9opIL7zBMQCWsHXeqw7MIVdob3Aj0xWt0=;
 b=fzQGO8F3GclU8K3tk6Jrkiy87XlSQy0ZBD4xDUITG9KyGzVjXCFdh35ck+qkgotZOL
 Ng9FIU/hEYtj3YQwJ+BHbYZMkmvhT1mtgDYjCMBgm4VUZna8F/ICRMJHMh60kQBZ2uc/
 PK0dqdywp9IgwI+sq43mOmlspNwmD5syKAmkXMH62mNzGwQ3/jejg//XImPaZyYxcnXO
 yZ2iie1M2zuzhMHkUsNBf7nu0A3mETwGvvBAqYdEeESFTrATbY1xy2pGo6L/0xqSefsZ
 Dd3+nVjCrWK5L/anNcPhODtemSopWJs7oiItpXa6/g1k1peh/qQk0pwSAzZ+h3ZR5t17
 Y0jA==
X-Gm-Message-State: APjAAAVUmvKVVoea3oYWGLB4xPZ5r075OWjbhN7+fGjFXQaT89ON5XP8
 wyaAq8CbcwJRncsFyi++VekF8wsHdvObw8qTqEBnNAsC9lA=
X-Google-Smtp-Source: APXvYqzELThOf7KH9K8tpNNay5dDVj9jJZ6jAC1S8J91wpjoKFub/ufgDELBpw8Sh342/HXwunD2TiuIwbnflCFwBDU=
X-Received: by 2002:a9d:4e97:: with SMTP id v23mr22116360otk.148.1557252595581; 
 Tue, 07 May 2019 11:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190507115726.23714-1-glaroque@baylibre.com>
 <20190507115726.23714-7-glaroque@baylibre.com>
In-Reply-To: <20190507115726.23714-7-glaroque@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 May 2019 20:09:44 +0200
Message-ID: <CAFBinCB6beHBKLcmXa-gwiyUrAD1z4tD92RDs9Rnjp=hArKbHw@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] pinctrl: meson: g12a: add DS bank value
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_110956_907739_8F30A88C 
X-CRM114-Status: UNSURE (   7.18  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, khilman@baylibre.com,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, May 7, 2019 at 1:57 PM Guillaume La Roque <glaroque@baylibre.com> wrote:
>
> add drive-strength bank register and bit value for G12A SoC
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[...]
> +       /* name  first  last  irq  pullen  pull  dir  out  in  ds */
> +       BANK_DS("Z",    GPIOZ_0,    GPIOZ_15, 12, 27,
> +               4,  0,  4,  0,  12,  0,  13, 0,  14, 0, 5, 0),
> +       BANK_DS("H",    GPIOH_0,    GPIOH_8, 28, 36,
> +               3,  0,  3,  0,  9,  0,  10,  0,  11,  0, 4, 0),
a note for myself (because I keep forgetting this)
"5, 0" stands for:
- the register PAD_DS_REG5A as seen in the public S922X datasheet from
Hardkernel on page 224
- starting at bit 0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
