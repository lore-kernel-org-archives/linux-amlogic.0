Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD13CC10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 11:14:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AAF120811
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 11:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CUgr1owg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZ2yKCdN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AAF120811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+lk8IdpgqZcCa0M2NL6xEEHB51Yz+KxPl0n1MStTks=; b=CUgr1owgjYoI6U
	334wBgU7W4VX63B69mcaF9EUgEjHNn92X3XDJuNOgCcGA8+Kp2urxnCKObCStyOFF80iWvoAaR36C
	6e00OYVItrC26ei93CqcPWkcbOrlMumQOaJRkOD5paRmxy5gQ7CoVT9yfbCB2rubzlHZw9cGwKOEZ
	EhishxnpEhXl53kxhTwV5T2OVSKo8covz0C37QIxdy0xtOAPcdLZqQraVmYeksvskWV+T8U/j6DX9
	1bgYj5Wfn7RHSa38NW4gC3C9QHuQPVSumS5EysPXQRnV8xQ0A43Qyvi1zVB4t6weJhhPKIsAZUxe+
	DIIT0fEUgAk0S6fvBXCw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hItNI-0004do-0K; Tue, 23 Apr 2019 11:14:08 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hItNC-0004d5-Ai
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 11:14:06 +0000
Received: by mail-lf1-x142.google.com with SMTP id k18so11392552lfj.13
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 04:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tlMEF9MQs7OyWJDqsLhGSGF7sItRz0kf1tGQxWMnoSs=;
 b=uZ2yKCdNHirYD+0cHuxCoC3PYDShxhWYEGfckjjlUAMEg47nju7HGhrDe3O8Cc/tD1
 y3A5+kOiejDRgM5qgoIeZroidQWc+Qp9/x0z9J9QahsKcPs8Dnd7al4sqg9qEUJTpkrR
 qMf8Ei7klP4vaTdGvI1U7m3bImMCMERy4YUMM1EQNe+JF6hsNX6V+NTc5/KG1VHEyIL6
 uEHukujHU9UJkrjXc3PmorGWcSUWB217NNoEKAAibsbjCEwbZ4U91dyGeW2eBJpq6bgs
 W1vuQV8Jvpq4Vh1HND8jDFQ5FcBCKz6svXSrmhiog2IsaTsKEZiE+gdWazEUf+hy66yy
 Cv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tlMEF9MQs7OyWJDqsLhGSGF7sItRz0kf1tGQxWMnoSs=;
 b=mc9gbg/espFnyZKN8zBC+6r1kjWCyYTncamUKwN/P3ytmopFpjkM7+RVVlBJGlXEsa
 uoOoMLGfT3HkpU9WUln1kHuQuVJbh7oEGb7JHMrk9GcWiv7eyB+y2iAP9AxxaWXFxSsF
 AB3d+P8taGIr3nPH3ueNYiep3G45OGm6SHcJnv+sih9waHBYRtNaYaFN5YbR75sVOP9w
 BJDu+15ECfg+3ekJ4dJH/QiS5gY6K243gz4Zlh30muu80SjDYI8dHSXbCxNG+k4HFkIg
 SL+Zn0leDitHhB9xLHPzAASwMowlU4rSKWR/pZaqyCd1+hNlL+dPKkGZos72V8v2UwOi
 iRPQ==
X-Gm-Message-State: APjAAAUftsdRcgfUYENpWdVMrslPLjRBVlRbJmeZp8b/++7Iv4TV72ud
 5TX6p1eb+o6gZe7o9SFVAjpM5VJL1Ca45cEe50bAzQ==
X-Google-Smtp-Source: APXvYqy5vu/inxm74p9q6PiN4ryoIagxXwiAdCkdwwfXniHrTEUREK3fqDH1kpMlwCUNVNI2zhPoyqDMR8ayEdAQgp8=
X-Received: by 2002:ac2:51a1:: with SMTP id f1mr5733403lfk.129.1556018040632; 
 Tue, 23 Apr 2019 04:14:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190418124758.24022-1-glaroque@baylibre.com>
 <20190418124758.24022-2-glaroque@baylibre.com>
In-Reply-To: <20190418124758.24022-2-glaroque@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 23 Apr 2019 13:13:48 +0200
Message-ID: <CACRpkdZ2dPzrtJQkxmN7V=f6+qYZAvrF+b0J77cN9hoRAgFqrw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: pinctrl: add a 'drive-strength-uA'
 property
To: Guillaume La Roque <glaroque@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_041402_375397_CE3468A6 
X-CRM114-Status: UNSURE (   6.78  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Apr 18, 2019 at 2:48 PM Guillaume La Roque
<glaroque@baylibre.com> wrote:

> This property allow drive-strength parameter in uA instead of mA.
>
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>

I'm fine with this but I need the DT maintainers to ACK it explicitly.

Yours,
Linus Walleij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
