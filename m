Return-Path: <SRS0=/4qX=OK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 613BFC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 20:13:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E0F660F24
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Sep 2021 20:13:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E0F660F24
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qLR0SCk1KDhJAGxJoGYj9HQM1DIMgAbbmXSswW3+k9Q=; b=mDD2pnNI5kA5UU
	e1JMA1Qqj+A6TKTvKh26d1BcEnpibAgM+eALeONuQFHXPNYJo1+L9tC3cdi01rDvPqL8T6rOl5woy
	+qieqqA5B6KMmIQ9FJCIWAM3Lyrv0NWJlxR0t/+e4vP1YKOzHWkSA45odb0JU0Vzt5qgjXHPMCuxB
	YjBnCRL7vDUti9dBhHTEu39mtdcjtLOp0GRpnxYVwdRjyFxH1H77JkF7xTHYCd2TR1eMWLeTXZ+uS
	aGZwOYFGFMWdLHknsrprv6/Wk0kZDrN/AKNa0vvZnA+H2A5k+p+D7zXUYeI3GUW3VTZhQ4TyqMbJC
	GR77UoWcsm/NppKdBVAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSPfX-0031O9-7a; Mon, 20 Sep 2021 20:13:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSPfL-0031Lr-Fd; Mon, 20 Sep 2021 20:13:28 +0000
Received: by mail-ed1-x531.google.com with SMTP id v24so65884175eda.3;
 Mon, 20 Sep 2021 13:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dR4/lhVHAxdBMrf2l8iqTQvZFTrPiPlWzRgao8asiJ0=;
 b=RTssrEulh4vN7Uct44nzZvDjnp0xgzT9LiRMxxKpbK5bDd1uBUKow+korSVQRu4jNV
 noiDkfqXgjpyHIemo0OeI4whzF5kenaHEt9ke/Gi5FUhpKcJ0YKKuBoz4VkpcclXXUDF
 oHsJWrj653aPWopqk4YJUPOlPPFoLhon41Maj6CaJ1/f7aibreShTOPPlgzr0f4q8cuc
 iP3P0F9dUuH/Mp8X+kpGGban5CBBaqtMcnZb0BD3aNu3A872lrraE64jqRWEi/kZWpMC
 Ge2epQ6EYQVICq58kQboozGnS4ZHy2/KA3cgDZ8Jui7tLv3l0GeHTTBZPDaZB/9uju8o
 2zGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dR4/lhVHAxdBMrf2l8iqTQvZFTrPiPlWzRgao8asiJ0=;
 b=eaVVrzRZ7PFS0TWRZp0G0lXPSZJ9eFOQ/HA9wd/mkY3nBUFtizoHG7WeBpXPwWH8fI
 NXoxkEknY+ARdtATTsn5eo8JgAhT60YIA+LUJ886A5hLun1B8aCowqgXsVOeQQTyucFM
 ogV8zQu0a0GIy7OaUYJBiEf2T49pU0kPhpbJsAUN2cvMpffv8wAKRSkRZHxamwyHpvVd
 1wVtmHfKNh6UVipDjwKSbu8RZ0RoxZd8L7QJPK6sovqHHhxhs5HlWWPpzZR9sQsIdWaz
 4/PLCW1k02KWKuKzE3xgfheva5tzE65c79xta8jXnVL2M2CMWnxBVQ6AhGGjNiVi2Ap6
 Nv4g==
X-Gm-Message-State: AOAM531S34EuqkSyPTDP0DO6qO33ePYw9k+fexgUiykBDcpZooapUiRi
 RFJmtjNTwPH/Gu2/b5H2j3MITabUPL9zQqwWn4U=
X-Google-Smtp-Source: ABdhPJykha88lAtEjDw4utgviMlQGet3s/RO4J57yPvYMCAZsM5108Hbq4yQWIlsQ1UQbrh9tNMJyBUyADjZ5mhbIoU=
X-Received: by 2002:aa7:c78f:: with SMTP id n15mr31252504eds.338.1632168804644; 
 Mon, 20 Sep 2021 13:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210919202918.3556-1-linux.amoon@gmail.com>
In-Reply-To: <20210919202918.3556-1-linux.amoon@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 20 Sep 2021 22:13:13 +0200
Message-ID: <CAFBinCBK02mnf6nEGFi+ZLUX4irAHL720ujms8NJxRe_NZC6PQ@mail.gmail.com>
Subject: Re: [PATCHv2 0/3] Fix the pwm regulator supply properties
To: Anand Moon <linux.amoon@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>,
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_131327_576946_3029969E 
X-CRM114-Status: GOOD (  10.23  )
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

On Sun, Sep 19, 2021 at 10:29 PM Anand Moon <linux.amoon@gmail.com> wrote:
[...]
> Anand Moon (3):
>   arm64: dts: meson-g12a: Fix the pwm regulator supply properties
>   arm64: dts: meson-g12b: Fix the pwm regulator supply properties
>   arm64: dts: meson-sm1: Fix the pwm regulator supply properties
all three get my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for working on this!
I haven't runtime tested the patches but I expect that they will work
in the same way that the Meson8/8b/8m2 patches with the same change
did.

Neil, some of these boards are covered by Kernel CI.
I suggest queueing the patches in v5.16/dt64 and then seeing if
there's any feedback from the auto-builders.


Best regards,
Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
