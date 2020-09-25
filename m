Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FC2C4727E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:37:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 891132388E
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 07:37:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2whyIWz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KGNM01PY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 891132388E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9TLBcj0nR5/nKs20fq89pCEvAB7LguRGkaibuJyZ/nA=; b=f2whyIWzuOmtTwhghXddOJdk5
	ZfA/KS5BBhIUOF5/Ji69FdEjccBm4LzOEQ6W4fibzQndmIO2/OMmrNh2+1IeRFMdPb628Cs6OXVxP
	x0cRZ5fkYm5Fs5pyjml6Kesfb+jFYdxIqCOfDSqWm9jTsRfsNQwuDBJO7Rngk9phTIpltU+uyMgsr
	8nq+ilDlOSgiz3DghQnVsEdyGStAXk1kVJSY5SfMA7DI1dv3v6iVOSwBZ4/O89Vo4P2eKilCq39Bv
	Oiv8z+Hon+mQbBwrpARCA2snDZ0fR2FCS1Jg+F3SOeZoq5Z8TsMyQv5zWEc2chgEliW69j6DrU9iL
	3051pv7rA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLiIG-00024R-Bv; Fri, 25 Sep 2020 07:37:24 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLiI9-00020I-Jr; Fri, 25 Sep 2020 07:37:18 +0000
Received: by mail-ej1-x642.google.com with SMTP id e23so2329075eja.3;
 Fri, 25 Sep 2020 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5oO3KK8snieqPMUUKGMVuOjt3ZFHB4wo5QOmyUorjL8=;
 b=KGNM01PYtivbm17hMCFvYLcM6BAQ7qIuWCYCuBpMH0TI0F0lJ7ItFxFr/is4+Q3wkO
 Wg9z66CXh8cZCAchsDLZJwu0CJGnKNlX5Rl8wVVGvJknirFE+jMMW32V16Suc6Ubajfw
 I1og0+Gf930nIqGzd11OYkU9xyIPAqLfDByGBHGcNdbC8whIeNHf7H8uDpAdoqmrMjP3
 XItn7Q+gymZR+sCw096/U750YPsUmhgP0kHM67KBnfH/gFoUW8bLT4ZpGgSN1m8GQ9Dd
 K7nrHRevtkObAoO6IBcWaY6KnQyH51OHG1w6nMVpFExrUtmE/nr0RlF/hkHC/dKjssH+
 vgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5oO3KK8snieqPMUUKGMVuOjt3ZFHB4wo5QOmyUorjL8=;
 b=azBSYtvgTh41Ke63OjDMzHieF6r65QR+mbYqbswyVoL1BPE9BYom/kVoUBuLnU3hk3
 W8DI1rr+j1IMOXCa0xLYfztBRLTXGOrKsEyfrZx97wK9B52a8QemIYOh82HKcDIpChRf
 RQNWt0drl/WbQpkmSA+gg4h9S4ioFRUux5+gOBDPu6M72bDSUdKwHDRI8atkKOvxL5q+
 U+dZ73huWqnzxvv+AX+Oe0sqiLQaNrkdIBsFz52C4QH5RjL9cC/bJKwEDm/s3UFigPaZ
 3CnkftNbPAx4NlPza7ZVjaM22E7Efr9X3XsTFgDw7LqURZWWFc1mWl5S3D8ktqn7jUA/
 yWrg==
X-Gm-Message-State: AOAM532sxUHOJVVHeIJRF9xMfMQE2rn3WSRehi+QClULgCeWrQc5bUsL
 rvuSLrN/WJ69d+x9sq/gFAjbymNqV1LXsUNl49s=
X-Google-Smtp-Source: ABdhPJwKI32Gw0KZUMGXfjdE646zJUv1IDe4mNilpvS4ifoio6qRggDp4Pownpp7NnJe36I/+xa4t0K8VIAy1RJBQ2A=
X-Received: by 2002:a17:906:344e:: with SMTP id
 d14mr1528418ejb.42.1601019436358; 
 Fri, 25 Sep 2020 00:37:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-5-art@khadas.com>
In-Reply-To: <20200925033017.1790973-5-art@khadas.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Sep 2020 09:37:05 +0200
Message-ID: <CAFBinCBtGqDgPH0VhW2awPzYSVFN++HNCA5=L6VVMRW64=AY9A@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: meson: remove fixed memory size for
 Khadas VIM3/VIM3L meson-khadas-vim3
To: Artem Lapkin <email2tema@gmail.com>, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_033717_666809_82D3ABD0 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Artem,

On Fri, Sep 25, 2020 at 5:31 AM Artem Lapkin <email2tema@gmail.com> wrote:
>
> no need force setup memory size!
> VIM3 boards have 2Gb and 4Gb variants
> memory size will be automatically defined
>
> mainline uboot works properly in any case
> but old vendor uboot works not properly for 4Gb variants
can you be more specific with what "does not work properly"? is Linux
then only able to use 2GB or is there any other problem?

overall this sounds like a bug in the vendor u-boot to me
I don't see that we have any other Amlogic .dts which needs this hack,
so I'd like to hear the feedback from the device-tree maintainers (for
example Rob) as well


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
