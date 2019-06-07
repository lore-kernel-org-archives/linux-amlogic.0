Return-Path: <SRS0=bWzJ=UG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00FA3C468BD
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 20:28:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9B5C20868
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jun 2019 20:28:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uNpbOQdJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="q6Cb4yG5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9B5C20868
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pnJEs+Ru4D6rJagPuIWz69chRwytRoRqXeqJQ8CXGw8=; b=uNpbOQdJP/4OIo
	3TKBOOxj4ZU1lr5LmsI18Bu+QI88JNVqR9rba/9nCVgVTmw1P/q8jOwDXZZzt6gyZlhqY6Jxy5mSi
	EOrfwLDjMpY0VmmEfYbui5SKwDyYICP3g48D7QZ38jxgnG19UmlmNqC3qCjSDRQmrJk5R77xQ/ZWG
	lRcN7KrfPURx6C0UvgnJ9zdqL8H1VMY2U1O22Yiy3NZlkYofEFCHMaGvMGzaY0ZsMFbNz97yB3CAn
	G3EYm+FcFnInrnD3YAbg4n8OkSprnS/MBsgMoj7Bblbb7CJvAVDRQVZJrZBlN9iALGjkSHmgOE7L7
	McsMzWTJgR8i7rOLmrdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZLSz-00006m-B6; Fri, 07 Jun 2019 20:28:01 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZLSx-00006J-2w
 for linux-amlogic@lists.infradead.org; Fri, 07 Jun 2019 20:28:00 +0000
Received: by mail-ot1-x341.google.com with SMTP id z24so3058795oto.1
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Jun 2019 13:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rKRrV5I8VjyJvam3bB7neEdoqv5gjI88+1EhoJXrUzw=;
 b=q6Cb4yG5ehoiqZVyjYv2fFh51psnKm6V3rOQGhXrMDaSMNHiBGLc1EeikHt3KuHjK7
 3ygXxVTXQ+5mlxKAq1ThX8xsl1mDZ7mB0z0ML0VuwQc/Y9pqjJYGw7mo9IvbUq/WXswa
 j64OJFrXcLZPS0kTCupD+K5hFUXC3k3b+O4OGvI0k2SSYUiuORs4WJtYHjW1woV0E0Gq
 DMiaBvd9K0cuBMWs0Jwe9TxLggRC4M+OdkJui1rLL/P4XpnJjvH8lfAxIwrl3ykaT8e2
 QOEPxbGp03oA+6pnk7V4kJU+LieSZQ5sBcVGQ9WvtNYId6jc2T/ihuyw3cQ05k3uF2ZO
 3wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rKRrV5I8VjyJvam3bB7neEdoqv5gjI88+1EhoJXrUzw=;
 b=ngfvS/dqQ8XZnnUdsCXggapQepeiHEVD6Qh6o6FjJRrKQ5oGDT4ZkOWNurcJIk4tvS
 bd/VTYFWa6YVJHsW9Anj/Y+arE98pjXGUbgtmgPBZRNdBmrrwudX85xPP1bmN+RHGPYG
 R3fhQ/fFXzEqLTSt/Nd6naPh5ml7O/6poeDhhHTbo7hKYKkcyT6F8lr9jtnR9xaxCNHg
 SNrzSJhFLv6Bwc87O71J6DdDclOS9rbVBf0L3dmb7dm2w2fFk01sRqt9CVpDCFQItklj
 SEM5gau5KnKmoD4xCwVT3FV556WO2WwcQZXIHLjhWcll4opD9v3EDQtJoupbNdE3IH1/
 dyUA==
X-Gm-Message-State: APjAAAXEldHSfPhmwodZBSu1TbNqI62ZAq/wqNmpTu49Id+yc/bGBgKW
 QUaXSy4h/sHqQO9X0TgvekbljzcpdPaRGA40M7U=
X-Google-Smtp-Source: APXvYqzLVE4+OIY23DLobobDWO7B21k1vW/vxjpOeH7f8rjTU08f7GPmOeTc9E0c9jJDaMl/5Wig8HrSjydoAOCshlE=
X-Received: by 2002:a9d:14a:: with SMTP id 68mr1633949otu.96.1559939278412;
 Fri, 07 Jun 2019 13:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
In-Reply-To: <20190606132439.25182-1-krzysztof.michonski@digitalstrom.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 7 Jun 2019 22:27:47 +0200
Message-ID: <CAFBinCDKPTBwhG-PGFoz25iDq5-DfMT3y3b=k1VJ7MFPnwezFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] meson_sm: Extend meson_sm driver to be compatible
 with gxl chip
To: Krzysztof Michonski <michonskikrzysztof@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190607_132759_128333_8310037D 
X-CRM114-Status: UNSURE (   7.00  )
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
Cc: khilman@baylibre.com, devicetree@vger.kernel.org, afenkart@gmail.com,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

On Thu, Jun 6, 2019 at 3:24 PM Krzysztof Michonski
<michonskikrzysztof@gmail.com> wrote:
[...]
> +struct meson_sm_chip gxl_chip = {
> +       .shmem_size             = SZ_4K,
> +       .cmd_shmem_in_base      = 0x82000023,
> +       .cmd_shmem_out_base     = 0x82000024,
where did you get these values from and/or what issues did you see
with the values from GXBB?

I checked Amlogic's buildroot kernel whether they are doing something similar:
$ grep in_base_func
buildroot-openlinux-A113-201901/kernel/aml-4.9/arch/arm64/boot/dts/amlogic/mesong*.dtsi
| cut -d':' -f2 | sort -u
                in_base_func = <0x82000020>;
that includes GXL, GXM, G12A and G12B. however, I admit that I didn't
have time to test your patch yet (so it may be just fine and the
vendor kernel is buggy)


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
