Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A07C5B57D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:55:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C83A021C38
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:55:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L7/OdY2V";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lmvTjVwx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C83A021C38
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1RXksfTCmjuq+c3u6l3Vs1FC2LgVGA8swu7ojnphjs=; b=L7/OdY2VcUkAI+
	+pH3BY2FqGbCDH8+4wlk426lYUpkWGqXYkgm/Mc1KFC7+sPR5kyf8hak0jWMdC1HFzWj4OKtTR30J
	HNR64et20zpglT7iHhs7TSL4y5PQXkl5WF+H5MPIVVl0u01QQi55vnbuYo+3N30sgVhytZ+hQNsoi
	R9/2vECsrgImOjJpFkZPb4ijEzWbzVkHxTA89lV7kqRaJaIPbq31TA6l3ji898U6kE++pX4R2Bip9
	I++nnDqwqPm0pSSecWTkTURJgINjbTTRIUy4sTMMKFq21floZFAt7rIEqVBthKghTXPkbbtAz5i80
	IctOr5gT4EEFUxHJP6lg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiSbx-0007KA-8M; Tue, 02 Jul 2019 23:54:57 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiSbj-00078i-Az; Tue, 02 Jul 2019 23:54:44 +0000
Received: by mail-oi1-x243.google.com with SMTP id a127so516923oii.2;
 Tue, 02 Jul 2019 16:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=shrSfUwHshC6sDZVTcq5ngfnPqY1USStRpRTR6d5/f4=;
 b=lmvTjVwxjRh4Poos3bVw/z29gyQ1LGWYW0KqBZyVQvzT1PBsRnK0gmc9Zw/FBp3J/z
 gG598+ah1lKIeOfGbKJRPIBTXmnJQ3wIxESOvWVHkDzesEaRCYDWTbQ6lzUbTE9j1IJk
 gqn4Y0DmySt7CS16WjFn4VmuamxVoDZhZ1PacqijL6nhTRujhRYeVWgyKNkrGobDiW6N
 +cCTPD4P34GuKqScCOsy6Ogm9IwWX+KgPxPuKfLXjZUmfJ36lDupDavpFSHgz+LAAYre
 zgN8hVD9NU38Q071uVi4UmGwyz2urWqeFiunyhsfh9OiicQBezQxKjuioROMMbXuydE8
 BSgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=shrSfUwHshC6sDZVTcq5ngfnPqY1USStRpRTR6d5/f4=;
 b=es8mSQLj19iQQ7bXIkLXu553CR2hVVKmXeuIhAJpb4CWfYaZDcS7646eyqJZA59Aql
 1/8WKMVATOoJy5wXosVutUgJEEzqOwSMpVU3LJpblHm8opSmZMsl/UNbWALPvPA1LKYo
 2ds0BnETm/KD0HTHMwhLOdSEiVP7du6PDUPn19Xff/s4vIOHtdIBQuBrjHMbBbY81CE1
 UoMZoAveQMfeSQ9Au5RHGy/ylj0fqQXAWpfrjdMnjKmAjR5CQGUhZOgCSplt4RLDbutz
 d+MyMp2Vj+0V0OeAizSpmRAambxnfhilC5PsFdpLRu0B/kvrkYJHJZXtrB9XZuSDKCKg
 cpOA==
X-Gm-Message-State: APjAAAUTvMim18igW1vjZBu1RDeKYgVy1VgF/gmvAf1fP9MDaG2FNdFr
 aK+Z/VpykX7PXIg2KK3sQ/9Kr/awoL16jFk/XZ3iDw==
X-Google-Smtp-Source: APXvYqxgfcCHQv29gahaHjuPAS935zYySIUIEmD84h/Qr8o2D6W2Oc0WdHuOFDE2zlTwLAMbXKovNv8vmOyrgdfawlI=
X-Received: by 2002:a05:6808:3d6:: with SMTP id
 o22mr4652939oie.140.1562111682243; 
 Tue, 02 Jul 2019 16:54:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com>
 <20190701091258.3870-10-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-10-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 01:54:31 +0200
Message-ID: <CAFBinCA537EV9kzz+5syaF1Q-stTJ4no+NBdcYD3QL-FJSoWfQ@mail.gmail.com>
Subject: Re: [RFC/RFT v3 09/14] arm64: dts: move common G12A & G12B modes to
 meson-g12-common.dtsi
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_165443_376576_6F8F1DE9 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: khilman@baylibre.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Neil,

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> To simplify the representation of differences betweem the G12A and G12B
> SoCs, move the common nodes into a meson-g12-common.dtsi file and
> express the CPU nodes and differences in meson-g12a.dtsi and meson-g12b.dtsi.
>
> This separation will help for DVFS and future Amlogic SM1 Family support.
>
> The sd_emmc_a quirk is added in the g12a/g12b since since it's already
> known the sd_emmc_a controller is fixed in the next SM1 SoC family.
too bad they named the upcoming SoC family SM1

does it make sense to name this file "meson-g12a-g12b-sm1-common.dtsi" instead?
do you know whether there will be a successor to G12B and what it's
code-name will be?


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
