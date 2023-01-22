Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB784C38142
	for <linux-amlogic@archiver.kernel.org>; Sun, 22 Jan 2023 16:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yy5+GgQ9MqzOlJRlxXR/QBeEeJpvsS01yIydZovJVz4=; b=w8wSQR7agwaNcT
	+jDs2j190vcjPpLh3b0cOu/UDSSoUmLLEmTZYlTs4KW7r+p8njpzsmaVcdNLdQOIjfgj5n56ETDZK
	zsfS5pSjdo/BbYASzwq9q4Ib/LrXVS1NMo44Ux35qCDy9wK/8no5PKEp1lRW9iHc3jYVMj5SDEhWl
	yrOuHLZZ12jSY7VTKd6MMVVwZgeWlmlKd1pZeX1V0Plr8P1zpqTVhqgf5iYCGRsWMXTtCjjMbj5l/
	nI+hKimZujq4Kz1ijR0YMnyAQJyBe80IQEbOA2YHtC6IyEp5GKFJPJpIp1Bmx2tCMOkKZ6SV2KL8D
	W+XgqoiHwrfIRxjCT+nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJdN7-00FY10-2E; Sun, 22 Jan 2023 16:39:09 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJdN4-00FY08-Rv
	for linux-amlogic@lists.infradead.org; Sun, 22 Jan 2023 16:39:08 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id l125so10619842vsc.2
        for <linux-amlogic@lists.infradead.org>; Sun, 22 Jan 2023 08:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qACnEDq7CQssFw5cLANDAZIL8Q9CdsrvgqR6kIK4R8c=;
        b=jJdJqLIc+y4MZw9WOKgOIdA8RdCtfAyAC4ly6O+FiaPwA6i9Vkj6mOnl7k0Nid0rin
         vUWH1uUMl96R8SgK/deZTF8bEAmms9Nlqbdz/TqRNyH/n8LkH0+FUYwEqxlIEhBl2UaO
         e3C4TFeYyqsO46rVZHVBRMjOJeJQ7Ces6Woo+UX2sZJG7T3RmJ+erLJK5cdvVFz9qcLq
         TjvZVcQEhCXfFKSNPapz+4oBkNleg/HQVrykDvKhs0V1kciTCYEsLoe9n86Vm3UqjEgn
         bApLH9Pjo2Jj82mMMZm1CfXu9qfcTDbem4SSaMcmxZzZOQ/uIp0lXWdwvusE3CcjAraJ
         l9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qACnEDq7CQssFw5cLANDAZIL8Q9CdsrvgqR6kIK4R8c=;
        b=6OXxlOmZyyEcTqJYpHNWwuyHJ7r9D9220OYyyF+y1usfH1j3jAGd/8TLE3atXh+4nH
         5iuM31IU40hFb4r2kN6uSQ7LgO7Svhd2x+x4VkWs6r1Ha5MtNX2hJD7rN8wbuW9V/t43
         Cc5iCFG/DIvHl9uaZQMtrQFREIysERT+M1oyU7cnof/hiv93vxd3Cg7MqApIJAHZzXsW
         uyFZFvxayV7vmawJLvXOH1I1e3+0I2G5zRY+B5Sw67I7XehJny9o6aPz+HakGfB/aMro
         PgSSQWt3e2acgEf5oaA9JGlwgbnF0h/WO7fqmRRBgkGHboR52ZDNNNlddQbP+jFQsYgc
         KpWw==
X-Gm-Message-State: AFqh2krHx6cE+B/1P5Ie1pjPiZ6ZGvzXjndX/SoSMLE1zbbk3bRwWwQz
	i1UtEFGI72sE9yD9LYlh5TAmgYjc9mb4aYTND2g=
X-Google-Smtp-Source: AMrXdXsCmLpwa6AXzrh9D8riQ0Uxyadw4wR/THSg7SpKGBjdHUSxiY3O2+LwgCKTZeAjUn4YRFUUtNU3XJBaid5WnCg=
X-Received: by 2002:a67:d097:0:b0:3d0:cb3d:ad47 with SMTP id
 s23-20020a67d097000000b003d0cb3dad47mr3416403vsi.76.1674405542264; Sun, 22
 Jan 2023 08:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20230121175639.12818-1-linux.amoon@gmail.com> <20230121175639.12818-6-linux.amoon@gmail.com>
 <d0bdc8f9-5ea8-5c77-3193-a2932c87156a@linaro.org> <CANAwSgT4P544a2MeybV_hXkDfc_HXiO4Rnxt4qG3RM1-X-KCEQ@mail.gmail.com>
 <07ce1655-d84b-e4f1-02d4-b69568830175@linaro.org>
In-Reply-To: <07ce1655-d84b-e4f1-02d4-b69568830175@linaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 22 Jan 2023 22:08:47 +0530
Message-ID: <CANAwSgSxasuEsqvwE-DLzjh8wBt3cRuWkHQv6aaWeXEgrvkRjQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] vendor-prefixes: Add VIA Labs, Inc.
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	Matthias Kaehlcke <mka@chromium.org>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_083906_938183_EDD723BD 
X-CRM114-Status: GOOD (  17.38  )
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

Hi Krzysztof,

On Sun, 22 Jan 2023 at 15:06, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 22/01/2023 08:04, Anand Moon wrote:
> > Hi Krzysztof,
> >
> > On Sun, 22 Jan 2023 at 00:21, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 21/01/2023 18:56, Anand Moon wrote:
> >>> Add the vendor prefix for VIA Labs, Inc. (VLI) is a supplier
> >>> of USB and USB Power Delivery controllers for multi-functional devices
> >>> and platforms.
> >>>
> >>> Website: https://www.via-labs.com/
> >>>
> >>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> >>> ---
> >>> v3: - None
> >>> V2: - drop Drop marketing, so without "leading".
> >>
> >> Wasn't this merged? Didn't you get email?
> >>
> >
> > Yes, it was merged into USB testing branch.
> > I have rebased it on Linux master 6.2-rc5,
> > I hope this series picks up again.
>
> No, that's not how it works. If patch was picked up, you must drop it.
> Otherwise you might mislead maintainers (e.g. other maintainer) to pick
> it up again.
>

Ok I will keep this in my mind for the future.

>
> Best regards,
> Krzysztof
>
Thanks
-Anand

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
